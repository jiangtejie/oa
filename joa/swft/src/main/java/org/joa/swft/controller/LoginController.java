package org.joa.swft.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author JiangTeJie
 * @since 2020/3/13 21:11
 */

@RestController
public class LoginController extends BaseController{

    @GetMapping("test")
    public String test(){
        return "hello world";
    }
}
