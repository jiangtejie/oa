import request from '@/utils/request'

export function getOffWorkList(userId) {
  return request({
    url: '/offWork',
    method: 'get',
    params: {userId}
  })
}
