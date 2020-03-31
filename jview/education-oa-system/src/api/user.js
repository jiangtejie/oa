import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/user/login',
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return request({
    url: '/user/info',
    method: 'get',
    params: { token }
  })
}

export function getUserList(listQuery) {
  return request({
    url: `/user/page`,
    method: 'get',
    params: listQuery
  })
}

export function logout() {
  return request({
    url: '/user/logout',
    method: 'get'
  })
}
