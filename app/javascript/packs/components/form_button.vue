<template>
  <input type="button" class="btn" v-bind:class="buttonClass()" v-bind:value="labelName()" v-on:click="click()" />
</template>

<script>
export default {
  props: {
    type: {
      type: String,
      validator(val) {
        return ["send", "create", "update", "destroy"];
      },
      required: true,
      default: "send",
    },
    label: {
      type: String,
    },
  },
  methods: {
    click: function() {
      $emit("form-click");
    },
    labelName: function() {
      if (this.label) {
        return label;
      }
      return this.$i18n.t(`helpers.submit.${this.type}`);
    },
    buttonClass: function() {
      switch (this.type) {
        case "send":
        case "create":
        case "update":
          return "btn-success";
        case "destroy":
          return "btn-danger";
      }
    },
  },
};
</script>

<style scoped></style>
