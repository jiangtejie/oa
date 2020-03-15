import router from './router'
import store from './store'
import { Message } from 'element-ui'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css' // progress bar style
import { getToken } from '@/utils/auth' // get token from cookie
import getPageTitle from '@/utils/get-page-title'

NProgress.configure({ showSpinner: false }) // 进度条组件配置
const whiteList = ['/login'] // no redirect whitelist

router.beforeEach(async(to, from, next) => {
  // 进度条
  NProgress.start()

  // 设置页面标题
  document.title = getPageTitle(to.meta.title)

  // 是否已经获取了token，用来判断是否已经登录了
  const hasToken = getToken()

  if (hasToken) {
    if (to.path === '/login') {
      // 如果登录了且当前是登录页面的话，跳转到首页
      next({ path: '/' })
      NProgress.done()
    } else {
      // 如果是已经登录进了首页，判断当前是否获取了用户的相关信息
      const hasGetUserInfo = store.getters.name
      if (hasGetUserInfo) {
        // 如果获取了放行
        next()
      } else {
        // 没有获取的话，重新获取一遍
        try {
          // get user info
          await store.dispatch('user/getInfo')
          /**
           *  const { roles,routelist } = await store.dispatch('user/getInfo')
            //routelist 是后端返回的上面的数据
            // generate accessible routes map based on roles
            const accessRoutes = await store.dispatch('permission/generateRoutes1', routelist)
            router.addRoutes(accessRoutes)
           */
          // 放行
          next()
        } catch (error) {
          // 获取出错，去掉本地的token，提示错误
          await store.dispatch('user/resetToken')
          Message.error(error || 'Has Error')
          next(`/login?redirect=${to.path}`)
          // 进度条完毕
          NProgress.done()
        }
      }
    }
  } else {
    /* 如果没有token*/
    // 白名单是否存在这个页面路由
    if (whiteList.indexOf(to.path) !== -1) {
      // 免登录方式
      next()
    } else {
      // 没有权限访问的页面，访问会重定向到登录页面
      next(`/login?redirect=${to.path}`)
      // 关闭进度条组件
      NProgress.done()
    }
  }
})

router.afterEach(() => {
  // 当路由完成时候，关闭进度条组件
  NProgress.done()
})
