package org.joa.swft.service.impl;

import com.alibaba.fastjson.JSONObject;
import io.minio.MinioClient;
import io.minio.ObjectWriteResponse;
import io.minio.PutObjectArgs;
import io.minio.errors.*;
import io.minio.messages.Bucket;
import lombok.extern.slf4j.Slf4j;
import org.joa.swft.service.MinioService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: JTJ
 * @Date: 2020/08/20 上午 10:47
 * @Description: 分布式文件存储
 */
@Slf4j
@Service
public class MinioServiceImpl implements MinioService {

    private final MinioClient minioClient = MinioClient.builder().endpoint("http://127.0.0.1:9000").credentials("minioadmin", "minioadmin").build();

    @Override
    public List<JSONObject> ListBucket() {
        List<JSONObject> jsonObjects = new ArrayList<>();
        try {
            List<Bucket> buckets = minioClient.listBuckets();
            if (buckets.size() > 0) {
                buckets.forEach(bucket -> {
                    JSONObject object = new JSONObject();
                    object.put("name", bucket.name());
                    object.put("createTime", bucket.creationDate().plusHours(8L));
                    jsonObjects.add(object);
                });
            }
        } catch (ErrorResponseException e) {
            e.printStackTrace();
        } catch (InsufficientDataException e) {
            e.printStackTrace();
        } catch (InternalException e) {
            e.printStackTrace();
        } catch (InvalidBucketNameException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (InvalidResponseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (XmlParserException e) {
            e.printStackTrace();
        }
        return jsonObjects;
    }

    @Override
    public String makeBucket() {
        return null;
    }

    @Override
    public String removeBucket() {
        return null;
    }

    @Override
    public Boolean putObject(MultipartFile file) {
        ObjectWriteResponse objectWriteResponse = null;
        try {
            objectWriteResponse = minioClient.putObject(PutObjectArgs.builder().bucket("images").object("headImg/"+file.getOriginalFilename()).stream(
                    file.getInputStream(), file.getSize(), -1)
                    .contentType(file.getContentType())
                    .build());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(objectWriteResponse == null){
            return false;
        }
        return true;
    }
}
