package org.joa.swft.util;

import org.json.JSONObject;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.UUID;
import org.apache.commons.codec.binary.Base64;


public class ZegouUtils {

    public static void main(String[] args) {
        String appid = "0000000000";  //即构分配的appId
        String appSign = "0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00";  //即构分配的appSign
        String idName = "xxxxxxx"; //这里的idname需要和小程序sdk前端传入的idname一致，
        //否则校验失败(因为这里的idname是为了校验和前端传进来的idname是否一致)。
        String Token = getZeGouToken(appid,appSign,idName);
        System.out.println("--Token--:"+Token);
    }

    /**
     * 拉流端获取登录token
     * @param appId  即构分配的appId
     * @param appSign 即构分配的appSign
     * @param idName //这里的idname需要和小程序sdk前端传入的idname一致，
    //否则校验失败(因为这里的idname是为了校验和前端传进来的idname是否一致)。
     * @return
     */
    public static String getZeGouToken(String appId,String appSign,String idName){

        String nonce= UUID.randomUUID().toString().replaceAll("-", "");
        long time = System.currentTimeMillis()/1000+30*60;
        String appSign32=new String(appSign.replace("0x", "").replace(",", "").substring(0, 32));
        System.out.println("appSign:"+time+"    "+appSign32+"    "+nonce);

        if(appSign32.length()<32){
            System.out.println("private sign erro!!!!");
            return null;
        }

        String sourece= getPwd(appId+appSign32+idName+nonce+time);
        System.out.println("hash:"+sourece);

        JSONObject json=new JSONObject();
        json.put("ver", 1);
        json.put("hash", sourece);
        json.put("nonce", nonce);
        json.put("expired",time); //unix时间戳，单位为秒
        org.apache.commons.codec.binary.Base64 base64 = new org.apache.commons.codec.binary.Base64();
        System.out.println("json"+json.toString());
        return base64.encodeAsString(json.toString().getBytes());
    }


    /**
     * 获取MD5加密
     * @param pwd 需要加密的字符串
     * @return String字符串 加密后的字符串
     */
    public static String getPwd(String pwd) {
        try {
            // 创建加密对象
            MessageDigest digest = MessageDigest.getInstance("md5");

            // 调用加密对象的方法，加密的动作已经完成
            byte[] bs = digest.digest(pwd.getBytes());
            // 接下来，我们要对加密后的结果，进行优化，按照mysql的优化思路走
            // mysql的优化思路：
            // 第一步，将数据全部转换成正数：
            String hexString = "";
            for (byte b : bs) {
                // 第一步，将数据全部转换成正数：
                int temp = b & 255;
                // 第二步，将所有的数据转换成16进制的形式
                // 注意：转换的时候注意if正数>=0&&<16，那么如果使用Integer.toHexString()，可能会造成缺少位数
                // 因此，需要对temp进行判断
                if (temp < 16 && temp >= 0) {
                    // 手动补上一个“0”
                    hexString = hexString + "0" + Integer.toHexString(temp);
                } else {
                    hexString = hexString + Integer.toHexString(temp);
                }
            }
            return hexString;
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }

}