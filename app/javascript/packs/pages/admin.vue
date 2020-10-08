<template>
  <div id="admin">
    <nav>
      <router-link to="/admin/categories" class="nav-link">{{ $t("admin.categories") }}</router-link>
    </nav>
    <h1>{{ $t("admin.title") }}</h1>
    <router-view />
  </div>
</template>

<script>
import request from "../utils/requests";

export default {
  name: "Admin",
};
</script>

<style scoped></style>
