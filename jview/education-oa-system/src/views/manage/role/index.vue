<template>
  <div class="role-manage" style="margin: 1em 1em 1em 1em">
    <div v-for="(item,idx) in roleInfoList" :key="idx" class="role-card">
      <el-card v-loading="loading" class="box-card">
        <div slot="header" class="clearfix">
          <span><b>{{ item.roleZhName }}</b></span>
          <el-switch
            v-model="item.roleEnable"
            active-text="已开启"
            inactive-text="已冻结"
            active-color="#13ce66"
            inactive-color="#ff4949"
            style="float:right"
            @change="changeRoleStatus()"
          />
        </div>
        <div class="role-desc">
          <p><b>英文：</b>{{ item.roleEnName }}</p>
          <p><b>权限描述：</b>{{ item.roleDesc }}</p>
          <p><b>创建时间：</b>{{ item.createTime }}</p>
          <p><b>上次更改时间：</b>{{ item.updateTime }}</p>
          <p>
            <el-row style="display: flex;justify-content: flex-start ">
              <el-button type="info" plain>权限设置</el-button>
              <el-button type="danger" plain @click="deleteRole(item.id)">删除</el-button>
            </el-row>
          </p>
        </div>
      </el-card>
    </div>

    <div class="role-card">
      <el-card v-loading="loading" class="box-card">
        <div slot="header" class="clearfix" style="display:flex;justify-content:center">
          <span><b>新增角色</b></span>
        </div>
        <div class="role-desc">
          <div style="width:100%;height:100%;display:flex;align-items:center;justify-content:center">
            <el-button class="role-add-svg" type="info" icon="el-icon-plus" circle @click="roleFormVisible = true" />
          </div>
        </div>
      </el-card>
    </div>

    <!-- 表单嵌套开发 -->
    <el-dialog title="新建角色" :visible.sync="roleFormVisible" center :close-on-click-modal="false">
      <el-form :model="role">
        <el-form-item label="中文名">
          <el-input v-model="role.roleZhName" autocomplete="off" />
        </el-form-item>
        <el-form-item label="字符代码">
          <el-input v-model="role.roleEnName" autocomplete="off" />
        </el-form-item>
        <el-form-item label="角色描述">
          <el-input v-model="role.roleDesc" autocomplete="off" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="roleFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="addRole">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getRoleList, updateRoleStatus, addRole, deleteRoleById } from '@/api/role'

export default {
  components: {

  },
  data() {
    return {
      loading: true,
      roleInfoList: [],
      roleFormVisible: false,
      role: {
        roleZhName: '',
        roleEnName: '',
        roleDesc: ''
      }
    }
  },

  created() {
    this.getRoleList()
  },

  methods: {
    async getRoleList() {
      this.loading = true
      const { data } = await getRoleList()
      this.roleInfoList = data
      this.loading = false
    },

    changeRoleStatus() {
      updateRoleStatus()
    },

    async addRole() {
      this.roleFormVisible = false
      await addRole(this.role)
      this.getRoleList()
    },

    async deleteRole(id) {
      await this.$confirm('删除角色,该角色下的用户不再拥有其功能, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteRoleById(id)
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        })
      })
      this.getRoleList()
    }
  }
}
</script>

<style scoped>
  .text {
    font-size: 14px;
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
    height: 300px;
  }

  .role-card{
    display: inline-block;
    margin-left: 1em;
    vertical-align: top;
  }

  .role-desc{
    min-height: 200px;
  }
  .role-add-svg{
    font-size: 150px;
  }
</style>
