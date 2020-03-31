<template>
  <div class="department-container">
    <div class="department">
      <vue2-org-tree
        :data="data"
        :horizontal="horizontal"
        :collapsable="collapsable"
        :label-class-name="labelClassName"
        :render-content="renderContent"
        @on-expand="onExpand"
        @on-node-click="onNodeClick"
        @on-node-mouseover="onMouseover"
        @on-node-mouseout="onMouseout"
      />
    </div>

    <!-- 创建浮窗盒子 -->
    <div v-show="BasicSwich" class="floating">
      <p>ID:{{ BasicInfo.id }}</p>
      <p>Name:{{ BasicInfo.label }}</p>
    </div>
  </div>
</template>

<script>
export default {
  components: {

  },
  data() {
    return {
      BasicSwich: false,
      BasicInfo: { id: null, label: null },
      data: {
        id: 0,
        label: '重庆科技有限公司',
        children: [{
          id: 2,
          label: '产品研发部',
          children: [{
            id: 5,
            label: '研发-前端'
          }, {
            id: 6,
            label: '研发-后端'
          }, {
            id: 9,
            label: 'UI设计'
          }, {
            id: 10,
            label: '产品经理'
          }]
        }, {
          id: 3,
          label: '销售部',
          children: [{
            id: 7,
            label: '销售一部'
          }, {
            id: 8,
            label: '销售二部'
          }]
        }, {
          id: 4,
          label: '财务部'
        }, {
          id: 9,
          label: 'HR人事'
        }]
      },
      // 是否水平展示
      horizontal: false,
      // 可折叠的子节点
      collapsable: true,
      // 展开全部
      expandAll: true,
      labelClassName: 'bg-white'
    }
  },

  created() {

  },

  mounted() {
    // 页面加载完就配置
    this.expandChange()
  },

  methods: {
    renderContent: function(h, data) {
      return data.label
    },
    // 展开节点
    onExpand: function(e, data) {
      if ('expand' in data) {
        data.expand = !data.expand
        if (!data.expand && data.children) {
          this.collapse(data.children)
        }
      } else {
        this.$set(data, 'expand', true)
      }
    },
    collapse: function(list) {
      var _this = this
      list.forEach(function(child) {
        if (child.expand) {
          child.expand = false
        }

        child.children && _this.collapse(child.children)
      })
    },
    // 在点击节点标签时调用
    onNodeClick: function(e, data) {
      console.log(e)
      // e 为 event
      console.log(data)
      // 当前项的所有详情 如：id label children
    },

    expandChange: function() {
      this.toggleExpand(this.data, this.expandAll)
    },

    toggleExpand: function(data, val) {
      var _this = this
      if (Array.isArray(data)) {
        data.forEach(function(item) {
          _this.$set(item, 'expand', val)
          if (item.children) {
            _this.toggleExpand(item.children, val)
          }
        })
      } else {
        this.$set(data, 'expand', val)
        if (data.children) {
          _this.toggleExpand(data.children, val)
        }
      }
    },

    // 移入移出
    onMouseout(e, data) {
      this.BasicSwich = false
    },
    onMouseover(e, data) {
      this.BasicInfo = data
      this.BasicSwich = true
      var floating = document.getElementsByClassName('floating')[0]
      floating.style.left = e.clientX + 'px'
      floating.style.top = e.clientY + 'px'
    }
  }
}
</script>

<style scoped>
  .text {
    font-size: 14px;
  }

  .department-container{
    display: flex;
    justify-content: center;
    padding: 1em 1em 1em 1em;
  }

  /* 盒子css */
  .floating{
      background: rgba(0, 0, 0, 0.7);
      width: 160px;
      height: 100px;
      position: absolute;
      color: #fff;
      padding-top: 15px;
      border-radius: 15px;
      padding-left: 15px;
      box-sizing: border-box;
      left:0;
      top: 0;
      transition: all 0.3s;
      z-index: 999;
      text-align: left;
      font-size: 12px;
  }
</style>
