import axios from 'axios'

const serviceInstance = axios.create({
  baseURL: `${process.env.API_CATEGORIES_URL}`
})

export default {
  get: async () => {
    return serviceInstance.get()
  }
}
