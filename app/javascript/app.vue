<template>
  <div id="app">
    <Header></Header>
    <router-view />
  </div>
</template>

<script>
import Header from "./packs/components/header";
export default {
  components: { Header },
};
</script>

<style scoped></style>
