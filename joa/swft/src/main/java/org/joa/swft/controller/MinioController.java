package org.joa.swft.controller;

import com.alibaba.fastjson.JSONObject;
import org.joa.swft.service.MinioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Author: JTJ
 * @Date: 2020/08/20 上午 10:51
 * @Description: 文件仓库管理
 */
@RestController
@RequestMapping("repository")
public class MinioController {

    @Autowired
    private MinioService minioService;

    @GetMapping
    public List<JSONObject> listBucket(){
        return minioService.ListBucket();
    }

    @PostMapping
    public Boolean upload(MultipartFile file){
        return minioService.putObject(file);
    }
}
