export default {
  namespaced: true,
  state: {
    content: "",
    active: false,
    optionClass: "notice",
  },
  mutations: {
    setContent(state, { content, timeout, optionClass }) {
      state.content = content;
      state.active = true;
      if (typeof optionClass === "undefined") {
        state.optionClass = "notice";
      } else {
        state.optionClass = optionClass;
      }
      if (typeof timeout === "undefined") {
        timeout = 3000;
      }

      setTimeout(() => (state.active = false), timeout);
    },
  },
};
