<template>
  <div id="categories">
    <div  v-if="errors.length">
      <ul class="alert alert-warning">
        <li v-for="error in errors" :key="error">
          {{ error }}
        </li>
      </ul>
    </div>
    <h1>{{ $t("categories.title") }}</h1>
    <form>
      <input type="text" v-model="category.name" required="required" />
      <div class="btn btn-success" v-on:click="createCategory">
        登録
      </div>
    </form>
  </div>
</template>

<script>
import request from "../utils/requests";
export default {
  name: "NewCategories",
  data: function() {
    return {
      category: {
        name: "",
      },
      errors: [],
    };
  },
  methods: {
    createCategory: function() {
      request.post("/api/v1/categories", { params: { category: this.category } }).then(
        (response) => {
          this.$router.push({ path: "/admin/categories" });
        },
        (error) => {
          console.log(error);
          console.log(error.response.data);
          this.errors = error.response.data;
        }
      );
    },
  },
};
</script>

<style scoped></style>
