<template>
  <transition>
    <div class="flash-message" v-show="isActive" v-bind:class="optionClass">
      {{ flash_message }}
    </div>
  </transition>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "FlashMessage",
  computed: {
    ...mapState({
      flash_message: (state) => state.flash_message.content,
      isActive: (state) => state.flash_message.active,
      optionClass: (state) => state.flash_message.optionClass,
    }),
  },
};
</script>

<style scoped>
.flash-message {
  position: absolute;
  font-size: 1.1em;
  padding: 0.8em;
  width: 100%;
  box-shadow: 0 0 5px 1.5px #a9a9a9;
}
.notice {
  background-color: #dcffff;
}
.danger {
  background-color: #fa8072;
  color: #ffffff;
}
.v-enter-active,
.v-leave-active {
  transition: opacity 500ms;
}

.v-enter {
  opacity: 0;
}
.v-enter-to {
  opacity: 1;
}
.v-leave {
  opacity: 1;
}
.v-leave-to {
  opacity: 0;
}
</style>
