import Vue from "vue";
import Router from "./router/router";
import App from "../app";
import i18n from "./i18n/i18n";
import store from "./store/store";

Vue.mixin({
  created: function() {
    $store.dispatch("setCurrentUser");
  },
});

window.addEventListener("DOMContentLoaded", () => {
  new Vue({
    store,
    router: Router,
    el: "#app",
    i18n,
    render: (h) => h(App),
  });
});
