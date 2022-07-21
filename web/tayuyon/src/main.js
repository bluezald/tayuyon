import { createApp } from 'vue'
import { createRouter } from './router/index.js'
import App from './App.vue'

import './../node_modules/bulma/css/bulma.css'

const router = createRouter()

const app = createApp(App)
  .use(router)
  
app.mount('#app')
