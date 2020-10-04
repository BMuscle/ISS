import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
// コンポーネントのインポート
import Home from '../pages/home'
import User from '../pages/user'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', name: 'home', component: Home },
    { path: '/users/:nickname', name: 'user', component: User },
  ],
})
