import request from '@/utils/request'
import user from '@/store/modules/user'

export function getNoticeList(userId) {
  return request({
    url: '/notice',
    method: 'get',
    params: {userId}
  })
}
