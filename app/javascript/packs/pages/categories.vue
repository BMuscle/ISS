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
            <div class="btn btn-danger" v-on:click="destroyCategory(category.id)">{{ $t("link.destroy") }}</div>
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
    this.setCategories();
  },
  methods: {
    setCategories: function() {
      request.get("/api/v1/categories").then((response) => {
        this.categories = response.data;
      });
    },
    destroyCategory: function(id) {
      request.delete(`/api/v1/admin/categories/${id}`).then((response) => {
        this.$store.commit("flash_message/setContent", { content: "カテゴリーの削除に成功しました" });
        this.setCategories();
      },
      (error) => {
        this.$store.commit("flash_message/setContent", { content: "カテゴリーの削除に失敗しました", optionClass: "danger" });
      });
    },
  },
};
</script>

<style scoped>
.category-create {
  padding: 5px;
}
</style>
