import axios from 'axios'

const serviceInstance = axios.create({
  baseURL: `${import.meta.env.VITE_API_CATEGORIES_URL}`
})

export default {
  get: async () => {
    return serviceInstance.get()
  }
}
