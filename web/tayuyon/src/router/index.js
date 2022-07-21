import { createRouter as _createRouter, createWebHistory } from 'vue-router'

import LoginView from '@/pages/LoginView.vue'

export function createRouter() {
  return _createRouter({
    history: createWebHistory(),
    scrollBehavior: () => ({ top: 0 }),
    routes: [
      {
        path: '/login',
        name: 'LoginView',
        component: LoginView
      }
    ]
  })
}
