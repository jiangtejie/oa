<template>
  <div class="dashboard-container">
    <div class="chart-container">
      <chart height="100%" width="100%" />
    </div>
  </div>
</template>

<script>
import Chart from '@/components/Charts/LineMarker'
import { mapGetters } from 'vuex'

export default {
  name: 'Check',
  components: { Chart },
  data() {
    return {

    }
  },
  computed: {
    ...mapGetters([
      'name'
    ])
  },
  created() {

  },
  mounted() {

  }
}
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

.chart-container{
  position: relative;
  width: 100%;
  height: calc(100vh - 84px);
}
</style>
