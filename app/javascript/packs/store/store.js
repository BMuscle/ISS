import Vue from "vue";
import Vuex from "vuex";
import request from "../utils/requests";
import flash_message from './flash.message'

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    current_user: {},
  },
  mutations: {
    setCurrentUser(state, current_user) {
      state.current_user = current_user;
    },
  },
  actions: {
    setCurrentUser(context) {
      request.get("/api/v1/users/current_user").then((response) => context.commit("setCurrentUser", response.data));
    },
  },
  getters: {
    admin: (state) => {
      return state.current_user.admin;
    },
    current_user: (state) => {
      return state.current_user;
    },
  },
  modules: {
    flash_message
  }
});
