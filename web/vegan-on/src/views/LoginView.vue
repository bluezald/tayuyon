<template>
  <div>
    <section class="section card">
        <div class="container">
          <div class="columns is-vcentered">
            <div class="column"><img src="https://bulma.dev/placeholder/pictures/bg_16-9.svg?primary=00d1b2" alt=""></div>
            <div class="column">
              <div class="hero-body">
                <div class="container has-text-centered">
                  <div class="column is-4 is-offset-4">
                    <div>
                      <figure class="avatar">
                        <img :src="logo">
                      </figure>
                      <form>
                        <div class="field">
                          <div class="control">
                            <input class="input" type="email" placeholder="Your Email" autofocus="">
                          </div>
                        </div>

                        <div class="field">
                          <div class="control">
                            <input class="input" type="password" placeholder="Your Password">
                          </div>
                        </div>
                        <div class="field">
                          <label class="checkbox">
                            <input type="checkbox">
                            Remember me
                          </label>
                        </div>
                        <button class="button is-block is-success is-fullwidth">Login <i class="fa fa-sign-in"
                            aria-hidden="true"></i></button>
                      </form>
                    </div>
                    <p class="has-text-grey">
                      <a href="../">Sign Up</a> &nbsp;·&nbsp;
                      <a href="../">Forgot Password</a> &nbsp;·&nbsp;
                      <a href="../">Need Help?</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
  </div>
</template>

<script>
import logo from '@/assets/logo-sm.png'
export default {
  name: 'LoginView',
  components: {},
  data() {
    return {
      logo: logo
    }
  }
}
</script>
