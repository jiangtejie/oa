<template>
  <div class="role-manage" style="margin: 1em 1em 1em 1em">
    <div v-for="(item,idx) in roleInfoList" :key="idx" class="role-card">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span><b>{{ item.roleZhName }}</b></span>
          <el-switch
            v-model="item.roleEnable"
            active-text="已开启"
            inactive-text="已冻结"
            active-color="#13ce66"
            inactive-color="#ff4949"
            style="float:right"
            @change="changeRoleStatus"
          />
        </div>
        <div class="role-desc">
          <p><b>英文：</b>{{ item.roleEnName }}</p>
          <p><b>父角色：</b>{{ item.parentRole }}</p>
          <p><b>权限描述：</b>{{ item.permDesc }}</p>
          <p><b>创建时间：</b>{{ item.createTime }}</p>
          <p><b>上次更改时间：</b>{{ item.updateTime }}</p>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      roleInfoList: [
        {
          id: 1,
          roleZhName: '超级管理员',
          roleEnName: 'admin',
          roleEnable: true,
          parentRole: '',
          permDesc: '负责系统的一切管理操作',
          createTime: '2020-3-15 14:00',
          updateTime: '2020-3-17 8:32'
        },
        {
          id: 2,
          roleZhName: '普通用户',
          roleEnName: 'user',
          roleEnable: true,
          parentRole: '',
          permDesc: '拥有基本的增删改查操作',
          createTime: '2020-3-15 14:10',
          updateTime: '2020-3-17 8:39'
        }
      ]
    }
  },
  methods: {
    changeRoleStatus() {
      alert(1)
    }
  }
}
</script>

<style>
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
    width: 400px;
  }

  .role-card{
    display: inline-block;
    margin-left: 1em;
  }
</style>
