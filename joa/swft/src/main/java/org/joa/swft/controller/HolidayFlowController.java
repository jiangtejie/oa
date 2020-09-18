package org.joa.swft.controller;

import org.flowable.engine.ProcessEngine;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.joa.swft.pojo.dto.HolidayInfoDto;
import org.joa.swft.pojo.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: JTJ
 * @Date: 2020/09/18 下午 02:56
 * @Description: 请假流程
 */
@RestController
@RequestMapping("holiday")
public class HolidayFlowController {

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private RepositoryService repositoryService;

    @Qualifier("processEngine")
    @Autowired
    private ProcessEngine processEngine;

    /**
     * @Author: JTJ
     * @Date: 2020/09/18 下午 02:57
     * @Description: 发起请假流程
     */
    @PostMapping("")
    public ResultVO newHolidayFlow(HolidayInfoDto holidayInfoDto){
        return ResultVO.success();
    }
}
