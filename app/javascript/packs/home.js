import Vue from "vue";
import router from "./router/router";
import App from "../app";
import i18n from "./i18n/i18n";
import store from "./store/store";
import { sync } from "vuex-router-sync";

Vue.mixin({
  created: function() {
    store.dispatch("setCurrentUser");
  },
});

sync(store, router);

window.addEventListener("DOMContentLoaded", () => {
  new Vue({
    store,
    router: router,
    el: "#app",
    i18n,
    render: (h) => h(App),
  });
});
