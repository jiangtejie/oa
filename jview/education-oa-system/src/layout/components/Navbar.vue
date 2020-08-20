<!--
    这个文件负责编写页面顶部的内容
-->
<template>
  <div class="navbar">
    <hamburger
      :is-active="sidebar.opened"
      class="hamburger-container"
      @toggleClick="toggleSideBar"
    />

    <!-- 面包屑组件 -->
    <breadcrumb class="breadcrumb-container" />

    <!-- 顶部右侧菜单 -->
    <div class="right-menu">
      <el-dropdown class="avatar-container">
        <!-- 头像 -->
        <div class="avatar-wrapper">
          <el-badge is-dot class="item">
            <img :src="avatar+'?imageView2/1/w/80/h/80'" class="user-avatar" />
          </el-badge>
          <i class="el-icon-arrow-down el-icon--right" />
        </div>
        <!-- 下拉框 -->
        <el-dropdown-menu slot="dropdown" class="user-dropdown">
          <el-dropdown-item class="clearfix">
            <router-link to="/">我的工作</router-link>
          </el-dropdown-item>
          <el-dropdown-item>
            <span style="display:block;">个人中心</span>
          </el-dropdown-item>
          <el-dropdown-item class="clearfix">
            <router-link to="/">
              系统消息
            </router-link>
            {{unreadMsgNum==0? '' : unreadMsgNum}}
          </el-dropdown-item>
          <el-dropdown-item divided>
            <span style="display:block;" @click="logout">退出登录</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import Breadcrumb from "@/components/Breadcrumb";
import Hamburger from "@/components/Hamburger";

export default {
  components: {
    Breadcrumb,
    Hamburger,
  },
  data() {
    return {
      unreadMsgNum: 0,
    };
  },
  computed: {
    ...mapGetters(["sidebar", "avatar", "websocket"]),
  },
  created() {},
  mounted() {
    this.$store.dispatch("ws/init");
    this.websocket.onmessage = function (event) {
      var unreadMsg = JSON.parse(event.data);
      if (unreadMsg!=null &&　unreadMsg.type === 3) {
        this.unreadMsgNum = unreadMsg.num;
      }
    };
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch("app/toggleSideBar");
    },
    async logout() {
      await this.$store.dispatch("user/logout");
      this.$router.push(`/login?redirect=${this.$route.fullPath}`);
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then((_) => {
          done();
        })
        .catch((_) => {});
    },
  },
};
</script>

<style lang="scss" scoped>
.navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: background 0.3s;
    -webkit-tap-highlight-color: transparent;

    &:hover {
      background: rgba(0, 0, 0, 0.025);
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background 0.3s;

        &:hover {
          background: rgba(0, 0, 0, 0.025);
        }
      }
    }

    .avatar-container {
      margin-right: 30px;

      .avatar-wrapper {
        margin-top: 5px;
        position: relative;

        .user-avatar {
          cursor: pointer;
          width: 40px;
          height: 40px;
          border-radius: 10px;
        }

        .el-icon-caret-bottom {
          cursor: pointer;
          position: absolute;
          right: -20px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
}

.user-dropdown {
  margin-top: 0px;
}
</style>
