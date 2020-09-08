<template>
  <div class="dashboard-container">
    <div id="cloud_container" class="chart-container"></div>
  </div>
</template>

<script>
import { WordCloud } from "@antv/g2plot";
export default {
  data() {
    return {};
  },
  computed: {},
  created() {},
  mounted() {
    let cloud_data = [
      {
        id: 1,
        weight: 12,
        word: "G2Plot",
      },
      {
        id: 2,
        weight: 9,
        word: "AntV",
      },
      {
        id: 3,
        weight: 8,
        word: "F2",
      },
    ];
    const wordCloud = new WordCloud(
      document.getElementById("cloud_container"),
      {
        cloud_data,
        wordStyle: {
          fontSize: [20, 60],
        },
      }
    );

    wordCloud.render();
  },
};
</script>

<style lang="scss" scoped>
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 20px;
    line-height: 46px;
  }
}

.chart-container {
  position: relative;
  width: 100%;
  height: calc(100vh - 84px);
}
</style>
