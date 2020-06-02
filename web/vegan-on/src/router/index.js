import Vue from 'vue'
import VueRouter from 'vue-router'

import AdminDashboard from '@/views/AdminDashboard'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'LoginView',
    component: () => import('@/views/LoginView.vue')
  },
  {
    path: '/',
    name: 'AdminDashboard',
    component: AdminDashboard
  },
  // Default route
  {
    path: '*',
    redirect: '/'
  }
]

const router = new VueRouter({
  routes: routes
})

// router.beforeEach(async (to, from, next) => {
//   store.dispatch('setAccessToken')
//   if (!sessionStorage.getItem('accessToken')) {
//     await nttService.getToken()
//   }
//   next()
// })

export default router
