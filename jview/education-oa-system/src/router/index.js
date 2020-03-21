import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

/**
 * constantRoutes
 * 基本页面,拥有不需要任何权限的菜单
 * 菜单都可以被访问
 */
export const constantRoutes = [

  // 登录
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  // 404
  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  // 首页
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '首页', icon: 'index' }
    }]
  },

  // 系统管理
  {
    path: '/manage',
    component: Layout,
    redirect: '/manage/user',
    meta: {
      title: '系统管理',
      icon: 'manage2',
      roles: ['admin']
    },
    children: [{
      path: 'user',
      name: 'user',
      component: () => import('@/views/manage/user/index'),
      meta: { title: '用户管理', icon: 'manage3' }
    },
    {
      path: 'role',
      name: 'role',
      component: () => import('@/views/manage/role/index'),
      meta: { title: '角色管理', icon: 'role' }
    },
    {
      path: 'perm',
      name: 'perm',
      component: () => import('@/views/manage/perm/index'),
      meta: { title: '权限管理', icon: 'perm' }
    },
    {
      path: 'check',
      name: 'check',
      component: () => import('@/views/manage/check/index'),
      meta: { title: '系统分析', icon: 'check-2' }
    }]
  },

  // 404 页面必须放在最后 !!!
  { path: '*', redirect: '/404', hidden: true }
]

// 根据权限动态加载的路由集合
export const asyncRoutes = [

]

// 将路由集合传入 Router对象中
const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
