<template>
  <div id="categories">
    <div v-if="errors.length">
      <ul class="alert alert-warning">
        <li v-for="error in errors" :key="error">
          {{ error }}
        </li>
      </ul>
    </div>
    <h1>{{ $t("new_categories.title") }}</h1>
    <div class="category_form">
      <form>
        <div class="form-group">
          <label for="category_name">{{ $t("new_categories.name") }}</label>
          <input type="text" id="category_name" class="form-control" v-model="category.name" required="required" />
        </div>
        <div class="form-group">
          <FormButton type="create" v-on:form-click="createCategory" />
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import request from "../utils/requests";
import FormButton from "../components/form_button";

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
          this.errors = error.response.data;
        }
      );
    },
  },
  components: {
    FormButton,
  },
};
</script>

<style scoped>
.category_form {
  width: 300px;
  padding: 40px;
}
</style>
