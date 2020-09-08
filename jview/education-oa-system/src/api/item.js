import request from '@/utils/request'

export function getItemList(userId) {
  return request({
    url: '/item',
    method: 'get',
    params: {userId}
  })
}
