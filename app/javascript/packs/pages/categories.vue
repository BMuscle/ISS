<template>
  <div id="categories">
    <h1>{{ $t("categories.title") }}</h1>
    <router-link to="/admin/categories/new" class="nav-link">{{ $t("helpers.submit.create") }}</router-link>
    {{ categories }}
  </div>
</template>

<script>
import request from "../utils/requests";
export default {
  name: "Categories",
  data: function() {
    return {
      categories: [],
    };
  },
  mounted: function() {
    request.get("/api/v1/categories").then((response) => {
      this.categories = response.data;
    });
  },
};
</script>

<style scoped></style>
