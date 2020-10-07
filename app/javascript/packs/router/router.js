import Vue from "vue/dist/vue.esm.js";
import VueRouter from "vue-router";
// コンポーネントのインポート
import Home from "../pages/home";
import User from "../pages/user";
import Categories from "../pages/categories";
import Admin from "../pages/admin";

Vue.use(VueRouter);

export default new VueRouter({
  mode: "history",
  routes: [
    { path: "/", name: "home", component: Home },
    { path: "/users/:nickname", name: "user", component: User },
    { path: "/admin", name: "admin", component: Admin },
    { path: "/admin/categories", name: "categories", component: Categories },
  ],
});
