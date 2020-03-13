<template>
  <div class="dashboard-container">
    <!-- 首页欢迎消息 -->
    <el-alert
      :title="topTip"
      type="success"
    />
    <!-- 主体内容 -->
    <el-row :gutter="20">
      <el-col :span="12"><el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>我的待办</span>
          <el-button style="float: right; padding: 3px 0" type="text">全部工作</el-button>
        </div>
        <div v-for="o in 4" :key="o" class="text item">
          {{ '测试待办 ' + o }}
        </div>
      </el-card></el-col>
      <el-col :span="12">
        <trend
          :data="[0, 2, 5, 9, 5, 10, 3, 5, 0, 0, 1, 8, 2, 9, 0]"
          :gradient="['#6fa8dc', '#42b983', '#2c3e50']"
          auto-draw
          smooth
        />
      </el-col>

    </el-row>

  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Dashboard',
  data() {
    return {
      topTip: null,
      data: [{
        name: 'Some Data', chartType: 'bar',
        values: [25, 40, 30, 35, 8, 52, 17, -4]
      },
      {
        name: 'Another Set', chartType: 'bar',
        values: [25, 50, -10, 15, 18, 32, 27, 14]
      },
      {
        name: 'Yet Another', chartType: 'line',
        values: [15, 20, -3, -15, 58, 12, -17, 37]
      }]
    }
  },
  computed: {
    ...mapGetters([
      'name'
    ])
  },
  created() {
    this.topTip = 'welcome！ ' + this.name
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
.text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
    margin-top: 1em;
  }
</style>
