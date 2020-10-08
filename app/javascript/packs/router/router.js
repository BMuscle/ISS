import Vue from "vue/dist/vue.esm.js";
import VueRouter from "vue-router";
// コンポーネントのインポート
import Home from "../pages/home";
import User from "../pages/user";
import Categories from "../pages/categories";
import Admin from "../pages/admin";

import store from "../store/store";

Vue.use(VueRouter);

const adminGuard = (to, from, next) => {
  if (store.getters.admin) {
    next();
  } else {
    next(false);
  }
};

export default new VueRouter({
  mode: "history",
  routes: [
    { path: "/", name: "home", component: Home },
    { path: "/users/:nickname", name: "user", component: User },
    { path: "/admin", name: "admin", component: Admin, beforeEnter: adminGuard, children: [{ path: "categories", component: Categories }] },
  ],
});
