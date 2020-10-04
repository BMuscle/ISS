<template>
  <div id="app">
    <router-link :to="{name: 'home'}">HomeLink</router-link>
    <router-link :to="{name: 'user', params: current_user}">UserLink</router-link>
    <router-view/>
  </div>
</template>

<script>
export default {
}
</script>

<style scoped>
</style>
