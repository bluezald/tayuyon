<template>
  <div class="container has-text-centered">
    <div class="column is-8 is-offset-2">
      <div>
        <figure class="avatar">
          <img :src="logo" />
        </figure>
        <form>
          <div class="field">
            <div class="control">
              <input
                class="input"
                type="email"
                placeholder="Your Email"
                autofocus=""
              />
            </div>
          </div>

          <div class="field">
            <div class="control">
              <input
                class="input"
                type="password"
                placeholder="Your Password"
              />
            </div>
          </div>
          <div class="field">
            <label class="checkbox">
              <input type="checkbox" />
              Remember me
            </label>
          </div>
          <button class="button is-block is-success is-fullwidth" @click="login">
            Login <i class="fa fa-sign-in" aria-hidden="true"></i>
          </button>
        </form>
      </div>
      <p class="has-text-grey">
        <a href="../">Sign Up</a> &nbsp;·&nbsp;
        <a href="../">Forgot Password</a> &nbsp;·&nbsp;
        <a href="../">Need Help?</a>
      </p>
    </div>
  </div>
</template>

<script>
import logo from "@/assets/logo-tayuyon.png"
export default {
  name: "LoginForm",
  data() {
    return {
      logo: logo,
    }
  },
  methods: {
    login() {
      this.$router.push({ path: '/home' })
    }
  }
}
</script>
