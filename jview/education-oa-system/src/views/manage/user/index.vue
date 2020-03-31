<template>
  <div class="user-container" style="margin: 1em 1em 1em 1em">
    <el-card class="user-box-card">
      <div slot="header" class="clearfix">
        <span style="line-">员工管理列表</span>
        <el-button style="float: right;" type="primary" icon="el-icon-edit" round @click="showAddUserWindow">添加员工</el-button>
      </div>

      <template>
        <div>
          <el-input
            v-model="keyword"
            placeholder="请输入关键字过滤"
            prefix-icon="el-icon-search"
          />
          <p />
          <el-table
            v-loading="loading"
            :data="userListData"
            border
            stripe
            max-height="800"
            style="width: 100%"
            @sort-change="sortChange"
          >
            <el-table-column
              fixed
              sortable
              prop="number"
              label="工号"
              width="400"
            />
            <el-table-column
              prop="realName"
              sortable
              label="名称"
              width="300"
            />
            <el-table-column
              sortable
              prop="gender"
              label="性别"
              width="150"
            />
            <el-table-column
              sortable
              prop="age"
              label="年龄"
              width="150"
            />
            <el-table-column
              sortable
              prop="address"
              label="地址"
            />

            <el-table-column
              fixed="right"
              label="操作"
              width="100"
            >
              <template slot-scope="scope">
                <el-button type="text" size="small" @click="handleClick(scope.row)">查看</el-button>
                <el-button type="text" size="small" @click="deleteConfig(scope.row)"><i class="el-icon-delete" /></el-button>
              </template>
            </el-table-column>
          </el-table>

          <div class="pagination">
            <el-pagination
              hide-on-single-page="true"
              background
              :page-size="listQuery.pageSize"
              layout="prev, pager, next"
              :total="totalPageSize"
              style="text-align: center; "
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
            />
          </div>
          <div class="addUserWindow">
            <el-dialog title="新增用户" :visible.sync="dialogFormVisible" center>
              <el-form ref="userForm" :model="userForm" label-width="80px">
                <el-form-item label="账号">
                  <el-input v-model="userForm.username" />
                </el-form-item>
                <el-form-item label="密码">
                  <el-input v-model="userForm.password" />
                </el-form-item>
                <el-form-item label="所属部门">
                  <el-select placeholder="请选择所在岗位">
                    <el-option v-for="(item,idx) in departmentList" :key="idx" label="销售部" value="shanghai" />
                  </el-select>
                </el-form-item>

                <el-form-item>
                  <el-button type="primary" @click="addUser">立即创建</el-button>
                  <el-button @click="dialogFormVisible = false">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog>
          </div>
        </div>
      </template>
    </el-card>
  </div>
</template>

<script>
import { getUserList } from '@/api/user'

export default {
  components: {

  },
  data() {
    return {
      keyword: '',
      sort: {},
      loading: true,
      listQuery: {
        currentPage: 1,
        pageSize: 10
      },
      totalPageSize: 1,
      userListData: [],
      dialogFormVisible: false,
      userForm: {
        username: '',
        password: ''
      },
      departmentList: []
    }
  },
  created() {
    this.getUserPage()
  },
  mounted() {

  },
  methods: {
    showAddUserWindow() {
      this.dialogFormVisible = true
    },
    // 获取用户数据
    async getUserPage() {
      this.loading = true
      const { data } = await getUserList(this.listQuery)
      this.userListData = data.data
      this.totalPageSize = data.total
      this.loading = false
    },
    handleSizeChange(val) {
      this.listQuery.pageSize = val
    },
    handleCurrentChange(val) {
      this.listQuery.currentPage = val
    },
    // 查看用户详细信息
    handleClick(row) {
      console.log(row)
    },
    // 分类
    sortChange({ column, prop, order }) {
      this.sort = { prop, order }
    },
    // 删除用户
    deleteConfig(row) {

    },
    // 刷新表格数据
    refreshConfig() {
      this.$refs.page1.reload()
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

  .clearfix{
    line-height: 40px;
  }
  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }

  .user-box-card {
    width: 100%;
  }

  .pagination{
    margin-top: 1vw;
    position:relative;
  }
</style>
