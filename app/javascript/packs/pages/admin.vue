<template>
  <div id="admin">
    <h1>{{ $t("admin.title") }}</h1>
    <router-link :to="{ name: 'categories' }" class="nav-link">{{ $t("admin.categories") }}</router-link>
  </div>
</template>

<script>
import request from "../utils/requests";
export default {
  name: "Admin",
};
</script>

<style scoped></style>
