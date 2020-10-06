import Vue from "vue";
import VueI18n from "vue-i18n";
import ja from "./locales/ja";

Vue.use(VueI18n);

const messages = {
  ja: ja,
};

export default new VueI18n({
  locale: "ja",
  messages,
});
