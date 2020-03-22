import { getRoomToken } from '@/api/room'

const state = {

}

// 同步操作的事件，直接操作state里面的数据
const mutations = {

}

// 一些具有异步操作的逻辑放在action里面，action里面commit的是 mutations里面的事件，而不是直接操作state里面的数据
const actions = {
  // 获取房间token
  getToken({ commit, state }) {
    return new Promise((resolve, reject) => {
      getRoomToken().then(response => {
        const { data } = response
        if (!data) {
          reject('验证失败，请重新登录！')
        }
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
