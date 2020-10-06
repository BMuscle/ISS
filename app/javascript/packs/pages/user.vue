<template>
  <div id="user">
    <h1>{{ $t("user.title") }}</h1>
    {{ current_user }}
  </div>
</template>

<script>
export default {
  name: "User",
};
</script>

<style scoped></style>
