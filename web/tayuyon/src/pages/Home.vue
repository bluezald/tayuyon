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
        <p>
          <input class="input is-rounded" type="text" placeholder="Rounded input" />
        </p>
      </div>
    </section>
  </div>
</template>

<script>
import NavBar from '@/components/NavBar.vue'

export default {
  name: 'Home',
  components: {
    NavBar
  },
  data() {
    return {
    }
  }
}
</script>

<style scoped>
</style>
