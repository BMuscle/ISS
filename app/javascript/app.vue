<template>
  <div id="app">
    <Header />
    <FlashMessage />
    <router-view />
  </div>
</template>

<script>
import FlashMessage from './packs/components/flash_message';
import Header from "./packs/components/header";
export default {
  components: { Header, FlashMessage },
};
</script>

<style scoped></style>
