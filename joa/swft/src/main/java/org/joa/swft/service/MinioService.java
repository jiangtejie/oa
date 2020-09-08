package org.joa.swft.service;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MinioService {

    List<JSONObject> ListBucket();

    String makeBucket();

    String removeBucket();

    Boolean putObject(MultipartFile file);
}
