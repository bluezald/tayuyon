<template>
  <div>
    <NavBar />
    <section class="hero is-medium is-link">
      <div class="hero-body">
        <p class="title">
          Medium hero
        </p>
        <p class="subtitle">
          Medium subtitle
        </p>
        <div>
          <input class="input is-rounded" type="text" placeholder="Rounded input" />
          <div v-if="categories.length" class="select">
            <select v-model="selected.category">
              <option v-for="category in categories" :key="category.id" :value="category.id">{{ category.name }}</option>
            </select>
          </div>
          <div v-if="subCategories.length" class="select">
            <select v-model="selected.subCategory">
              <option v-for="subCategory in subCategories" :key="subCategory.id" :value="subCategory.id">{{ subCategory.name }}</option>
            </select>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import NavBar from '@/components/NavBar.vue'
import categoriesService from '../services/categoriesService'

export default {
  name: 'Home',
  components: {
    NavBar
  },
  data() {
    return {
      categories: [],
      selected: {
        category: 0,
        subCategory: 0
      }
    }
  },
  computed: {
    subCategories() {
      if (this.selected.category) {
        return this.categories[this.selected.category+1].sub_categories
      }
      return []
    }
  },
  async mounted() {
    const response = await categoriesService.get()
    this.categories = response.data
  },
}
</script>

<style scoped>
</style>
