<template>
  <div>
    <section class="section">
      <div class="container">
        <div class="columns is-vcentered">
          <div class="column">
            <div class="hero-body">
              <LoginForm />
            </div>
          </div>
          <div class="column">
            <img
              src="https://images.pexels.com/photos/414807/pexels-photo-414807.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
              alt=""
            />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import LoginForm from "@/components/Login/LoginForm.vue"
export default {
  name: "Login",
  components: {
    LoginForm,
  }
}
</script>
