<template>
  <div id="categories">
    <h1>{{ $t("categories.title") }}</h1>
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
    request.get("/api/v1/categories").then((response) => (this.categories = response.data));
  },
};
</script>

<style scoped></style>
