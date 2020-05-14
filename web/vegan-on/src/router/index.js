import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'LoginView',
    component: () => import('@/views/LoginView.vue')
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
