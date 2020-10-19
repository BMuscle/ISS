<template>
  <div id="edit_category">
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
          <label for="category_name">{{ $t("models.category.name") }}</label>
          <input type="text" id="category_name" class="form-control" v-model="category.name" required="required" />
        </div>
        <div class="form-group">
          <FormButton type="update" v-on:form-click="editCategory" />
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import request from "../utils/requests";
import FormButton from "../components/form_button";
export default {
  name: "EditCategory",
  data: function() {
    return {
      category: {
        name: "",
      },
      errors: [],
    };
  },
  created: function() {
    request.get(`/api/v1/admin/categories/${this.$route.params["id"]}`).then((response) => {
      this.category = response.data;
    });
  },
  methods: {
    editCategory: function() {
      request.patch(`/api/v1/admin/categories/${this.category.id}`, { params: { category: this.category } }).then(
        (response) => {
          this.$store.commit("flash_message/setContent", { content: "カテゴリーの登録に成功しました" });
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

<style></style>
