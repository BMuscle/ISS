import Vue from "vue";
import Router from "./router/router";
import App from "../app";
import request from "./utils/requests";

Vue.mixin({
  data: function() {
    return {
      current_user: {},
    };
  },
  created: function() {
    request.get("/api/v1/users/current_user").then((response) => (this.current_user = response.data));
  },
});
window.addEventListener("DOMContentLoaded", () => {
  new Vue({
    router: Router,
    el: "#app",
    render: (h) => h(App),
  });
});
