import {
  Notification
} from 'element-ui';
import globalConfig from '@/utils/config'

const state = {
  socket: null
}

const mutations = {
  SET_SOCKET: (state, url) => {
    if (!window.WebSocket) {
      window.WebSocket = window.MozWebSocket;
    }
    if (window.WebSocket) {
      state.socket = new WebSocket(url);
    } else {
      alert("您的浏览器不支持WebSocket协议！");
    }
  },
  CLEAR_SOCKET: (state) => {
    state.socket.close()
    state.socket = null
  }
}

const actions = {
  init({
    commit,
    dispatch
  }, url) {
    if (state.socket == null) {
      commit('SET_SOCKET', globalConfig.WEBSOCKET_URL)
    }
    // 在需要的地方去监听
    // state.socket.onmessage = function (event) {
    //   console.info("消息接受:", event.data);
    //   //消息提示
    // };
    state.socket.onopen = function (event) {
      Notification({
        title: '成功',
        message: '已连接上消息服务器',
        type: 'success',
        position: 'bottom-right',
        duration: 2000
      });
    };
    state.socket.onclose = function (event) {
      dispatch('reconnect')
    };
    state.socket.onerror = function (event) {
      dispatch('reconnect')
    };
  },

  reconnect({
    dispatch
  }, url) {
    //登陆页面不需要重连
    if(window.location.href.indexOf('login')!=-1){
        return;
    }
    setTimeout(function () {
      var ws = new WebSocket(globalConfig.WEBSOCKET_URL);
      ws.onclose = function () {
        console.log('关闭重连');
        dispatch('reconnect')
      };
      ws.onerror = function () {
        console.log('错误重连');
        dispatch('reconnect')
      };
    }, 5000);
  },

  /**
   * 关闭连接
   */
  close({
    commit
  }) {
    commit('CLEAR_SOCKET')
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
