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
              <div @click="openRoom">
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
          <vue-seamless-scroll :data="noticeList" style="overflow: hidden; margin-top: -14px;" :class-option="optionSingleHeight">
            <ul class="notice-ul">
              <li v-for="(item,idx) in noticeList" :key="idx">
                <div>
                  <span class="svg-container">
                    <svg-icon icon-class="right" />
                  </span>
                  <span class="title" v-text="item.title" />
                </div>
                <span class="date" v-text="item.date" />
              </li>
            </ul>
          </vue-seamless-scroll>
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
            <!-- 地图 -->
            <el-amap id="mapObj" class="amap-box" :vid="'amap-vue'" :plugin="plugin" />
          </div>
        </el-col>
        <el-col :span="8">
          <el-form :label-position="labelPosition" label-width="80px" :model="clockForm">
            <el-form-item label="打卡人">
              <el-input v-model="clockForm.name" disabled />
            </el-form-item>
            <el-form-item label="当前定位">
              <el-input id="area" v-model="clockForm.region" disabled />
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

    <!-- 视频房间 -->
    <el-dialog
      center
      title="房间id【会议标题】"
      :visible.sync="roomDialog"
      :before-close="handleRoomClose"
      fullscreen
    >
      <div>
        <el-row :gutter="20">
          <el-col :span="16">
            <div class="main-video">
              <video ref="video-desk" controls autoplay playsinline width="100%" height="600px" />
            </div>
          </el-col>
          <el-col :span="8">
            <div class="roomList">
              <!--视频展示-->
              <video ref="video" class="video-room" autoplay />
            </div>
          </el-col>
        </el-row>
      </div>

    </el-dialog>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Dashboard',
  data() {
    const self = this.localtion
    return {
      noticeList: [
        {
          'title': '无缝滚动第一行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第二行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第三行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第四行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第五行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第六行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第七行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第八行',
          'date': '2017-12-16'
        },
        {
          'title': '无缝滚动第九行',
          'date': '2017-12-16'
        }],
      activeName: 'first',
      clockDialog: false,
      roomDialog: false,
      labelPosition: 'top',
      clockForm: {
        name: '',
        region: '无法定位',
        time: ''
      },
      gettime: '',
      // 一些工具插件
      localtion: {
        lng: 0,
        lat: 0,
        center: [121.329402, 31.228667],
        loaded: false
      },
      plugin: [
        {
          enableHighAccuracy: true, // 是否使用高精度定位，默认:true
          maximumAge: 0, // 定位结果缓存0毫秒，默认：0
          convert: true, // 自动偏移坐标，偏移后的坐标为高德坐标，默认：true
          showButton: true, // 显示定位按钮，默认：true
          buttonPosition: 'RB', // 定位按钮停靠位置，默认：'LB'，左下角
          showMarker: true, // 定位成功后在定位到的位置显示点标记，默认：true
          showCircle: true, // 定位成功后用圆圈表示定位精度范围，默认：true
          panToLocation: true, // 定位成功后将定位到的位置作为地图中心点，默认：true
          zoomToAccuracy: true, // 定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：f
          extensions: 'all',
          pName: 'Geolocation',
          events: {
            init(o) {
              o.getCityInfo((status, result) => {
                if (status === 'complete' && result.info === 'SUCCESS') {
                  if (result && result.city && result.province) {
                    var provinceinfo = result.province
                    var cityinfo = result.city
                    document.getElementById('area').value = provinceinfo + '-' + cityinfo
                  } else {
                    document.getElementById('area').value = result.info
                  }
                }
              })
              // o 是高德地图定位插件实例
              o.getCurrentPosition((status, result) => {
                console.log(result)
                if (result && result.position) {
                  self.lng = result.position.lng
                  self.lat = result.position.lat
                  self.center = [self.lng, self.lat]
                  self.loaded = true
                  self.$nextTick()
                }
              })
            }
          }
        }]
    }
  },
  computed: {
    ...mapGetters([
      'name'
    ]),
    optionSingleHeight() {
      return {
        singleHeight: 34
      }
    }
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
    // 关闭打卡页面
    handleClockClose() {
      this.clockDialog = false
    },
    // 关闭视频房间
    handleRoomClose() {
      this.$confirm('此操作将退出该会议室，无法继续观看和分享资源, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.closeCamera()
        this.closeDesktop()
        this.roomDialog = false
        this.$message({
          type: 'success',
          message: '成功退出!'
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消退出'
        })
      })
    },
    // 提交打卡信息
    submitClockForm(clockForm) {
      alert(1)
    },
    // 显示当前时间
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
    },
    // 打开会议
    openRoom() {
      this.$confirm('选择会议室创建类型?', '提示', {
        confirmButtonText: '新建一个会议室',
        cancelButtonText: '加入已有会议室',
        closeOnClickModal: false,
        type: 'warning',
        center: true
      }).then(() => {
        // 初始化
        this.initVideo()
      }).catch(() => {
        // 取消
        alert('取消已有会议室')
      })
    },
    // 初始化视频
    initVideo() {
      this.roomDialog = true
      // 打开摄像头
      this.openCamera()

      // 打开桌面录屏
      this.openDesktop()

      // 获取登录token
      // this.$store.dispatch('room/getToken').then(val => {

      // })
    },
    // 打开摄像头
    openCamera() {
      // H5调用电脑摄像头API
      navigator.mediaDevices.getUserMedia({
        video: true
      }).then(success => {
        // 摄像头开启成功
        this.$refs['video'].srcObject = success
        // 实时拍照效果
        this.$refs['video'].play()
      }).catch(error => {
        console.error('摄像头开启失败，请检查摄像头是否可用！' + error)
      })
    },
    // 打开桌面屏幕
    openDesktop() {
      let displaymediastreamconstraints = {
        video: {
          displaySurface: 'monitor', // monitor, window, application, browser
          logicalSurface: true,
          cursor: 'always' // never, always, motion
        }
      }
      // above constraints are NOT supported YET
      // that's why overridnig them
      displaymediastreamconstraints = {
        video: true
      }
      if (navigator.mediaDevices.getDisplayMedia) {
        navigator.mediaDevices.getDisplayMedia(displaymediastreamconstraints).then(success => {
          // 摄像头开启成功
          this.$refs['video-desk'].srcObject = success
          // 实时拍照效果
          this.$refs['video-desk'].play()
        }).catch(error => {
          console.log(error)
        })
      } else {
        navigator.getDisplayMedia(displaymediastreamconstraints).then(success => {

        }).catch(error => {
          console.log(error)
        })
      }
    },
    // 关闭摄像头
    closeCamera() {
      if (!this.$refs['video'].srcObject) {
        return
      }
      const stream = this.$refs['video'].srcObject
      const tracks = stream.getTracks()
      tracks.forEach(track => {
        track.stop()
      })
      this.$refs['video'].srcObject = null
    },
    // 关闭屏幕录制
    closeDesktop() {
      // 如果当前没有在播放，直接退出
      if (!this.$refs['video-desk'].srcObject) {
        return
      }
      const stream = this.$refs['video-desk'].srcObject
      const tracks = stream.getTracks()
      tracks.forEach(track => {
        track.stop()
      })
      this.$refs['video-desk'].srcObject = null
    }
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
  width: 27vw;
  height: 320px;
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
  margin: 50px 10px 10px 10px;
}

// 打卡页面
.amap-wrapper {
  width: 600px;
  height: 400px;
  border:1px solid #a5b6c8;
  background:#eef3f7
}

//视频会议
.video-room{
  width: 200px;
  height: 200px;
}

.notice-ul{
  list-style: none;
  font-size: 14px;
  padding: 0px;
}

.notice-ul li{
  margin-bottom: 18px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  margin: 0 0 18px 0;
}

.notice-ul li:hover{
  background:#a5b6c8;
  cursor:pointer;
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
