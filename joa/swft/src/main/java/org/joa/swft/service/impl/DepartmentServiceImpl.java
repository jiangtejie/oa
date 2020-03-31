package org.joa.swft.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.joa.swft.dao.DepartmentMapper;
import org.joa.swft.pojo.entity.Department;
import org.joa.swft.service.DepartmentService;
import org.springframework.stereotype.Service;

/**
 * @author JiangTeJie
 * @since 2020/3/31 20:41
 */
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements DepartmentService {

}
