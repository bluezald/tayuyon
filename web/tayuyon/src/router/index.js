import { createRouter as _createRouter, createWebHistory } from 'vue-router'

import Login from '@/pages/Login.vue'
import Dashboard from '@/pages/Dashboard.vue'
import Home from '@/pages/Home.vue'

export function createRouter() {
  return _createRouter({
    history: createWebHistory(),
    scrollBehavior: () => ({ top: 0 }),
    routes: [
      {
        path: '/login',
        name: 'Login',
        component: Login
      },
      {
        path: '/dashboard',
        name: 'Dashboard',
        component: Dashboard
      },
      {
        path: '/home',
        name: 'Home',
        component: Home
      }
    ]
  })
}
