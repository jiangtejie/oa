package org.joa.swft.config;

import com.google.common.collect.Lists;
import io.swagger.annotations.ApiOperation;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author JiangTeJie
 * @since 2020/3/17 13:42
 */
@Configuration
@EnableSwagger2
public class Swagger2Config {

    /**
     * 创建API应用
     * apiInfo() 增加API相关信息
     * 通过select()函数返回一个ApiSelectorBuilder实例,用来控制哪些接口暴露给Swagger来展现，
     * 本例采用指定扫描的包路径来定义指定要建立API的目录。
     *
     * @return
     */
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                //加了ApiOperation注解的类，才生成接口文档
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                //包下的类，才生成接口文档
                //.apis(RequestHandlerSelectors.basePackage("org.joa.swft.controller"))
                .paths(PathSelectors.any())
                .build()
                //支持统一填写一次token
                .securitySchemes(security());
    }

    /**
     * 创建该API的基本信息（这些基本信息会展现在文档页面中）
     * 访问地址：http://项目实际地址/swagger-ui.html
     * @return
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("简单OA系统快速开发平台")
                .description("更多请关注 https://github.com/jiangtejie/oa")
                .contact(new Contact("jiangtejie","https://github.com/jiangtejie","739011252@qq.com"))
                .version("1.0")
                .build();
    }

    private List<ApiKey> security() {
        return Arrays.asList(
                new ApiKey(
                        "Authorization", //自定义token参数头
                        "Authorization", //自定义token参数头
                        "header"  //放在header里面
                )
        );
    }
}
