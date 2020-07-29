<template>
  <!-- 页面主体部分 -->
  <section class="app-main">
    <!-- 主体页面变化的动画 -->
    <transition name="fade-transform" mode="out-in">
      <!-- 页面显示为对应路由绑定的组件的显示 -->
      <router-view :key="key" />
    </transition>
  </section>
</template>

<script>
export default {
  name: "AppMain",
  data(){
    return {

    }
  },
  computed: {
    key() {
      return this.$route.path;
    },
  },
  watch:{

  },
  mounted() {
    this.$store.dispatch("ws/init");
  },
};
</script>

<style scoped>
.app-main {
  /*50 = navbar  */
  min-height: calc(100vh - 50px);
  width: 100%;
  position: relative;
  overflow: hidden;
}
.fixed-header + .app-main {
  padding-top: 50px;
}
</style>

<style lang="scss">
// fix css style bug in open el-dialog
.el-popup-parent--hidden {
  .fixed-header {
    padding-right: 15px;
  }
}
</style>
