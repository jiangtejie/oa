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
            :data="userListData.slice((currentPage - 1) * pageSize, currentPage * pageSize)"
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
              width="150"
            />
            <el-table-column
              prop="realName"
              sortable
              label="名称"
              width="300"
            />
            <el-table-column
              sortable
              prop="value"
              label="取值"
              width="300"
            />
            <el-table-column
              sortable
              prop="description"
              label="描述"
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
              :page-size="pageSize"
              layout="prev, pager, next"
              :total="totalPageSize"
              style="text-align: center; "
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
            />
          </div>

          <div class="addUserWindow">
            <el-dialog title="收货地址" :visible.sync="dialogFormVisible" center>
              <el-form ref="userForm" :model="userForm" label-width="80px">
                <el-form-item label="活动名称">
                  <el-input v-model="userForm.name" />
                </el-form-item>
                <el-form-item label="活动区域">
                  <el-select v-model="userForm.region" placeholder="请选择活动区域">
                    <el-option label="区域一" value="shanghai" />
                    <el-option label="区域二" value="beijing" />
                  </el-select>
                </el-form-item>
                <el-form-item label="活动时间">
                  <el-col :span="11">
                    <el-date-picker v-model="userForm.date1" type="date" placeholder="选择日期" style="width: 100%;" />
                  </el-col>
                  <el-col class="line" :span="2">-</el-col>
                  <el-col :span="11">
                    <el-time-picker v-model="userForm.date2" placeholder="选择时间" style="width: 100%;" />
                  </el-col>
                </el-form-item>
                <el-form-item label="即时配送">
                  <el-switch v-model="userForm.delivery" />
                </el-form-item>
                <el-form-item label="活动性质">
                  <el-checkbox-group v-model="userForm.type">
                    <el-checkbox label="美食/餐厅线上活动" name="type" />
                    <el-checkbox label="地推活动" name="type" />
                    <el-checkbox label="线下主题活动" name="type" />
                    <el-checkbox label="单纯品牌曝光" name="type" />
                  </el-checkbox-group>
                </el-form-item>
                <el-form-item label="特殊资源">
                  <el-radio-group v-model="userForm.resource">
                    <el-radio label="线上品牌商赞助" />
                    <el-radio label="线下场地免费" />
                  </el-radio-group>
                </el-form-item>
                <el-form-item label="活动形式">
                  <el-input v-model="userForm.desc" type="textarea" />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="onSubmit">立即创建</el-button>
                  <el-button @click="dialogFormVisible = false">取消</el-button>
                </el-form-item>
              </el-form>
            </el-dialog></div>
        </div>
      </template>
    </el-card>
  </div>
</template>

<script>

export default {
  components: {

  },
  data() {
    return {
      keyword: '',
      totalPageSize: 7, // 数据总条数
      pageSize: 5, // 每页显示数量
      pageNum: 1, //
      currentPage: 1, // 当前页
      userListData: [
        {
          number: 1,
          realName: '江三'
        }
      ],
      sort: {},
      loading: true,
      dialogFormVisible: false,
      userForm: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      }
    }
  },
  mounted() {
    this.getUserPage()
  },
  methods: {
    showAddUserWindow() {
      this.dialogFormVisible = true
    },
    // 获取用户数据
    getUserPage() {
      this.loading = false
    },
    handleSizeChange(val) {
      this.pageSize = val
    },
    handleCurrentChange(val) {
      this.currentPage = val
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
