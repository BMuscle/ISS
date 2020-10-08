<template>
  <div id="header">
    <nav v-if="$store.getters.current_user" class="navbar navbar-expand-md">
      <ul class="navbar-nav">
        <li class="nav-item">
          <router-link :to="{ name: 'home' }" class="nav-link">{{ $t("header.nav.home") }}</router-link>
        </li>
        <div class="admin-nav">
          <li class="nav-item">
            <router-link :to="{ name: 'admin' }" class="nav-link">{{ $t("header.nav.admin") }}</router-link>
          </li>
        </div>
        <li class="nav-item">
          <router-link :to="{ name: 'user', params: $store.getters.current_user }" class="nav-link">{{ $t("header.nav.user") }}</router-link>
        </li>
        <li class="nav-item">
          <a href="/users/sign_out" data-method="delete" class="nav-link">{{ $t("header.nav.logout") }}</a>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  name: "Header",
};
</script>

<style scoped>
.navbar {
  background-color: #393b44;
}
.nav-link {
  color: #ffffff;
}
.nav-link:hover {
  color: #888888;
}
</style>
