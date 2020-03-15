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
      meta: { title: '首页', icon: 'dashboard' }
    }]
  },

  // 课表模块
  {
    path: '/lessonDegree',
    component: Layout,
    redirect: '/lessonDegree/index',
    meta: { title: '课表安排', icon: 'dashboard' },
    children: [{
      path: 'index',
      name: 'lessonDegree',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '我的课表', icon: 'dashboard' }
    },
    {
      path: 'index2',
      name: 'lessonDegree2',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '课表调休', icon: 'dashboard' }
    }
    ]
  },

  // oa流程模块
  {
    path: '/offWork',
    component: Layout,
    redirect: '/offWork/index',
    meta: {
      title: '流程管理',
      icon: 'dashboard',
      roles: ['admin', 'editor'] // you can set roles in root nav
    },
    children: [{
      path: 'index',
      name: 'offWork',
      component: () => import('@/views/offWork/index'),
      meta: { title: '申请请假', icon: 'dashboard' }
    },
    {
      path: 'index2',
      name: 'todo',
      component: () => import('@/views/offWork/index'),
      meta: { title: '待办流程', icon: 'dashboard' }
    },
    {
      path: 'index3',
      name: 'doing',
      component: () => import('@/views/offWork/index'),
      meta: { title: '在办流程', icon: 'dashboard' }
    },
    {
      path: 'index4',
      name: 'done',
      component: () => import('@/views/offWork/index'),
      meta: { title: '已办流程', icon: 'dashboard' }
    },
    {
      path: 'index5',
      name: 'bussiness',
      component: () => import('@/views/offWork/index'),
      meta: { title: '出差委托', icon: 'dashboard' }
    }
    ]
  },

  // 知识管理模块
  {
    path: '/knowledge',
    component: Layout,
    redirect: '/knowledge/index',
    meta: {
      title: '知识管理',
      icon: 'dashboard',
      roles: ['admin', 'editor'] // you can set roles in root nav
    },
    children: [{
      path: 'index',
      name: 'knowledge',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '课程资料', icon: 'dashboard' }
    },
    {
      path: 'index2',
      name: 'knowledge2',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '资料分类', icon: 'dashboard' }
    }]
  },

  // OA即时通讯模块
  {
    path: '/im',
    component: Layout,
    redirect: '/im/index',
    meta: {
      title: '协作管理',
      icon: 'dashboard',
      roles: ['admin', 'editor'] // you can set roles in root nav
    },
    children: [{
      path: 'index',
      name: 'im',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '同事圈', icon: 'dashboard' }
    },
    {
      path: 'index2',
      name: 'im2',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '工作群', icon: 'dashboard' }
    }]
  },

  // 机构分析
  {
    path: '/system',
    component: Layout,
    redirect: '/system/index',
    meta: {
      title: '机构分析',
      icon: 'dashboard',
      roles: ['admin', 'editor'] // you can set roles in root nav
    },
    children: [{
      path: 'index',
      name: 'system',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '业务分析', icon: 'dashboard' }
    },
    {
      path: 'index2',
      name: 'system2',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '业绩分析', icon: 'dashboard' }
    }]
  },

  // 通知公告
  {
    path: '/notice',
    component: Layout,
    redirect: '/notice/index',
    children: [{
      path: 'index',
      name: 'notice',
      component: () => import('@/views/lessonDegree/index'),
      meta: { title: '通知公告', icon: 'dashboard' }
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