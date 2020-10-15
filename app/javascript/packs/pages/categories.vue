<template>
  <div id="categories">
    <h1>{{ $t("categories.title") }}</h1>
    <div class="category-create">
      <router-link to="/admin/categories/new" class="btn btn-success">{{ $t("link.new") }}</router-link>
    </div>
    <table class="table table-nowrap">
      <thead class="thead-light">
        <tr>
          <th>{{ $t("models.category.name") }}</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="category in categories" v-bind:key="category.id">
          <td>{{ category.name }}</td>
          <td>
            <router-link class="btn btn-outline-dark" :to="{ path: `/admin/categories/${category.id}/edit` }">{{ $t("link.edit") }}</router-link>
          </td>
        </tr>
      </tbody>
    </table>
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
  created: function() {
    request.get("/api/v1/categories").then((response) => {
      this.categories = response.data;
    });
  },
};
</script>

<style scoped>
.category-create {
  padding: 5px;
}
</style>
