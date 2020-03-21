<template>
  <div class="dashboard-container">
    <div class="work-block">
      <el-card class="header-box-card">
        <div slot="header" class="clearfix">
          <svg-icon icon-class="workState" />
          <span><b>工作台</b></span>
        </div>

        <el-tabs v-model="activeName" @tab-click="handleClick">
          <el-tab-pane label="客户服务" name="first">
            <div class="work-list">
              <div @click="enterWork">
                <el-card class="work-module-item" shadow="hover">
                  <svg-icon icon-class="live" class="work-module-item-svg" />
                  <span><b>视频会议</b></span>
                </el-card>
              </div>

              <div @click="clockDialog = true">
                <el-card class="work-module-item" shadow="hover">
                  <svg-icon icon-class="clock" class="work-module-item-svg" />
                  <span><b>打卡</b></span>
                </el-card>
              </div>

              <div @click="enterWork">
                <el-card class="work-module-item" shadow="hover">
                  <svg-icon icon-class="doc" class="work-module-item-svg" />
                  <span><b>DOC助手</b></span>
                </el-card>
              </div>

              <div @click="enterWork">
                <el-card class="work-module-item" shadow="hover">
                  <svg-icon icon-class="add" class="work-module-item-svg" />
                  <span><b>添加常用</b></span>
                </el-card>
              </div>
            </div>
          </el-tab-pane>
          <el-tab-pane label="分析工作" name="second" />
          <el-tab-pane label="沟通协作" name="third" />
        </el-tabs>

      </el-card>
    </div>

    <div class="main-block">
      <!-- 待办事项 -->
      <div class="index-item">
        <el-card class="main-box-card">
          <div slot="header" class="clearfix">
            <span class="svg-container">
              <svg-icon icon-class="todo2" />
            </span>
            <span><b>待办事项</b></span>
            <el-button style="float: right; padding: 3px 0; color:gray" type="text">更多</el-button>
          </div>
          <div v-for="o in 4" :key="o" class="text item">
            <div>
              <span class="svg-container">
                <svg-icon icon-class="right" />
              </span>
              {{ '列表内容 ' + o }}
            </div>
            <div>
              <span class="item-status">
                已办
              </span>
            </div>
          </div>
        </el-card>
      </div>

      <!-- 邮箱 -->
      <div class="index-item">
        <el-card class="main-box-card">
          <div slot="header" class="clearfix">
            <span class="svg-container">
              <svg-icon icon-class="email" />
            </span>
            <span><b>邮箱</b></span>
            <el-button style="float: right; padding: 3px 0; color:gray" type="text">更多</el-button>
          </div>
          <div v-for="o in 4" :key="o" class="text item">
            <div>
              <span class="svg-container">
                <svg-icon icon-class="right" />
              </span>
              {{ '列表内容 ' + o }}
            </div>
            <div>
              <span class="item-status">
                已办
              </span>
            </div>
          </div>
        </el-card>
      </div>

      <!-- 请假信息 -->
      <div class="index-item">
        <el-card class="main-box-card">
          <div slot="header" class="clearfix">
            <span class="svg-container">
              <svg-icon icon-class="holidays2" />
            </span>
            <span><b>请假</b></span>
            <el-button style="float: right; padding: 3px 0; color:gray" type="text">更多</el-button>
          </div>
          <div v-for="o in 4" :key="o" class="text item">
            <div>
              <span class="svg-container">
                <svg-icon icon-class="right" />
              </span>
              {{ '列表内容 ' + o }}
            </div>
            <div>
              <span>
                审核中
              </span>
            </div>
          </div>
        </el-card>
      </div>

      <!-- 通知信息 -->
      <div class="index-item">
        <el-card class="main-box-card">
          <div slot="header" class="clearfix">
            <span class="svg-container">
              <svg-icon icon-class="notice2" />
            </span>
            <span><b>通知</b></span>
            <el-button style="float: right; padding: 3px 0; color:gray" type="text">更多</el-button>
          </div>
          <div v-for="o in 4" :key="o" class="text item">
            <div>
              <span class="svg-container">
                <svg-icon icon-class="right" />
              </span>
              {{ '列表内容 ' + o }}
            </div>
            <div>
              <span>2020-3-20 14:00</span>
            </div>
          </div>
        </el-card>
      </div>
    </div>
    <!-- ======================================================对话框====================================================== -->

    <!-- 打卡 -->
    <el-dialog
      center
      title="打卡"
      :visible.sync="clockDialog"
      :before-close="handleClockClose"
    >
      <el-row :gutter="20">
        <el-col :span="16">
          <div class="amap-wrapper">
            <el-amap class="amap-box" :vid="'amap-vue'" />
          </div>
        </el-col>
        <el-col :span="8">
          <el-form :label-position="labelPosition" label-width="80px" :model="clockForm">
            <el-form-item label="打卡人">
              <el-input v-model="clockForm.name" disabled />
            </el-form-item>
            <el-form-item label="当前定位">
              <el-input v-model="clockForm.region" disabled />
            </el-form-item>
            <el-form-item label="当前时间">
              <el-input v-model="gettime" disabled />
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="submitClockForm('clockForm')">打卡</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </el-dialog>

  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Dashboard',
  data() {
    return {
      activeName: 'first',
      clockDialog: false,
      labelPosition: 'top',
      clockForm: {
        name: '',
        region: '',
        time: ''
      },
      gettime: ''
    }
  },
  computed: {
    ...mapGetters([
      'name'
    ])
  },
  created() {
    this.clockForm.name = this.name
    this.currentTime()
  },
  mounted() {

  },
  methods: {
    enterWork() {
      alert(this.name)
    },
    handleClick(tab, event) {
      console.log(tab, event)
    },
    handleClockClose() {
      this.clockDialog = false
    },
    submitClockForm(clockForm) {
      alert(1)
    },
    // 时间
    currentTime() {
      setInterval(this.getTime, 500)
    },
    getTime() {
      var _this = this
      const yy = new Date().getFullYear()
      const mm = new Date().getMonth() + 1
      const dd = new Date().getDate()
      const hh = new Date().getHours()
      const mf = new Date().getMinutes() < 10 ? '0' + new Date().getMinutes() : new Date().getMinutes()
      const ss = new Date().getSeconds() < 10 ? '0' + new Date().getSeconds() : new Date().getSeconds()
      _this.gettime = yy + '-' + mm + '-' + dd + ' ' + hh + ':' + mf + ':' + ss
    }
    // 定位

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

// 首页界面
.work-block{
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.clearfix:before,
.clearfix:after {
display: table;
  content: "";
}
.clearfix:after {
   clear: both
}

.header-box-card{
  min-height: 500px;
  width: 100%;
}

.work-list{
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
}

.work-module-item{
  width: 160px;
  margin: 2rem 1rem 2rem 1rem;
  height: 80px;
}

.work-module-item-svg {
  width: 40px;
  height: 40px;
}

.main-block{
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

.main-box-card {
  width: 20vw;
  min-height: 200px;
}

.work-module-item:hover{
  cursor: pointer;
  transform: scale(1.1);
  -ms-transform:scale(1.1);     /* IE 9 */
  -moz-transform:scale(1.1);     /* Firefox */
  -webkit-transform:scale(1.1); /* Safari 和 Chrome */
  -o-transform:scale(1.1);
}

.item {
   margin-bottom: 18px;
   display:flex;
   justify-content: space-between;
   flex-wrap: wrap;
}

.index-item{
  margin: 50px 10px 10px 10px
}

// 打卡页面
.amap-wrapper {
  width: 600px;
  height: 400px;
  border:1px solid #a5b6c8;
  background:#eef3f7
}

// ===================================================响应css====================================  //
@media screen and (max-width: 960px){
    .box-card{
        width: 90vw;
        min-height: 250px;
    }
    .index-item{
      margin: 10px 10px 10px 10px
    }
}
</style>
