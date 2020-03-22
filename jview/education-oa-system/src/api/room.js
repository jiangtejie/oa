import request from '@/utils/request'

export function getRoomToken() {
  return request({
    url: '/room/token',
    method: 'get'
  })
}
