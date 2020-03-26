package org.joa.swft.service.impl;

import org.jose4j.json.JsonUtil;
import org.jose4j.jwk.RsaJsonWebKey;
import org.jose4j.jwk.RsaJwkGenerator;
import org.jose4j.jws.AlgorithmIdentifiers;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.NumericDate;
import org.jose4j.jwt.consumer.InvalidJwtException;
import org.jose4j.jwt.consumer.JwtConsumer;
import org.jose4j.jwt.consumer.JwtConsumerBuilder;
import org.jose4j.lang.JoseException;
import org.springframework.stereotype.Service;

import java.security.PrivateKey;
import java.util.UUID;

/**
 * @author JiangTeJie
 * @since 2020/3/25 15:53
 */

@Service
public class TokenAuthorizationService {

    public static void main(String[] args) {
        createKeyPair();
    }

    /**
     * keyId,公钥,私钥 都是用 createKeyPair 方法生成
     */
    private static String keyId = "fa677d525c0e4ee485a61543937794af";
    private static String privateKeyStr = "{\"kty\":\"RSA\",\"kid\":\"fa677d525c0e4ee485a61543937794af\",\"alg\":\"RS256\",\"n\":\"ki6NKW2ow53FBjWf21xNGF0v-Fzv9R4-vu5tz7LHz4vZ7TE2Lp7Xx0N2vFIH-HLZPLfAYW35W5iV29sW_MkbhVlh6f0q4AeCIeYrVjBGbcYTK5g-Sb8i9sO78DkGivryKTU4tUnOjqar2bfobwXScFhAgc4-BjIcvZ9V8LEzcAW76he500-sqekXqvYv7LbxIMlbadGEwbBqjscE83hiYjk1KSFrEeNWKP6E0X_cHVGEEGys8IKlBcfwOOCgaJ0sCFxvN3M54V33jSUknFzHAi1qJRsOI87-Fk1oYS-aniQOTfm5y5x1syTIgWEX9JvXCQgTxjp2kMItuoL2G2faoQ\",\"e\":\"AQAB\",\"d\":\"OmSUCN-AEZv9LwzOrW6CcWAQIHLne4-4WsadYOE2hcaEqAYHcboL0dI2JOXTv0AJXQK9u22VtSwPeMJcvV-MOclJnpF9xf3Z0rbByuz_xSvhToHDJ-xNCCuJ8FynK28wuptC6s_vzfXwIckf9PFrbWsjYXbEOe9cobZ7Ould9boHkEq-x0eKkDFfcQbevuQeM54FCk5FGl_D4wpbuqudZiT8FYCJPO7m-MTnND6xzdEVuApuQUPCjAin34ygp9QPk2VfQaM1z-ZHchTaXtsv5gyLwu3bqA91vugmrtGuSBG8pFaN6mYL_ivt1Q_7QDLqXZ5_WBhkoXO5DZ4-6ApLvQ\",\"p\":\"58fTzOMjU1zJ42ZdUkJjSpRlZXdlWx3ILStrvVw7kCHH1iBZ4Lckd7SdqJ9DUfdIBFTNPaAKfDqpoz7fWOUZyyUpy7_8qaDagFi53pAjuCGUuKnOV5hbSPBIOvGi9iTHwLNz6Om5eRV6lBXoTRJgT7g8u88HeSyl29RmYt-N7rs\",\"q\":\"oXTxPC0BFDxpFjk2Jpuj6hBkioD3Kiv7HEJjxRoOL3TEAAc3811f7V7bO5FWK2L_2g8I5YiZhsyh0SyxjPBfuIzcbAfGSTAsFqKiIOGZ7fqiFTOV319FJIkcMOrT2dbvGxNeGgTJpWB1vcX6C8i3ytzPFto1H9Bl3xAPVFflHFM\",\"dp\":\"RU-eaLCryav_u37K_WRY6N6Di9oudxbq24cWiuPf8_QGHGREPEzIHPvoAZrOuN4nrRPm5DzNpeStAeI1TBIGqpcMbp-U4Oz3KlZeDs4vwEpafPZafBtVgPRJxUapIs5Q5bFEQixSiIEBzPLYKuQJ5Q0FLGx2oafWWWykyYBsoy0\",\"dq\":\"SS2_yQ581rcqyi_UI1uXx5b2evBJFowonH5ayhMtKsU5sOmUqnE_8U50_2K4M6IDZMo7tg1byIUnMq-XKdIpEHSH008SyElVMk00PsMCCaL3o7Rl0YBUzmJ2rJVCwBFy_kqg9BoHazV1KDZ7RqwK4Z-DHVB5k5nZEmktCYVtCpE\",\"qi\":\"jDbVP3xGaYx2wgAGJT7KNjdoC4dYbl5ajp9saRCgAih3TYr1CjZSrLRm9L90UukgwajU0pHaffP74epVx0RBhnS5GtZhCoGitpLwYSDkZ9qTMTVnFPHrg6M1OYEEXjZ_UKlnYCrzrDe6tfHcO1UTzMzsuOgHjRAV7IS6ImfzwVw\"}";
    private static String publicKeyStr = "{\"kty\":\"RSA\",\"kid\":\"fa677d525c0e4ee485a61543937794af\",\"alg\":\"RS256\",\"n\":\"ki6NKW2ow53FBjWf21xNGF0v-Fzv9R4-vu5tz7LHz4vZ7TE2Lp7Xx0N2vFIH-HLZPLfAYW35W5iV29sW_MkbhVlh6f0q4AeCIeYrVjBGbcYTK5g-Sb8i9sO78DkGivryKTU4tUnOjqar2bfobwXScFhAgc4-BjIcvZ9V8LEzcAW76he500-sqekXqvYv7LbxIMlbadGEwbBqjscE83hiYjk1KSFrEeNWKP6E0X_cHVGEEGys8IKlBcfwOOCgaJ0sCFxvN3M54V33jSUknFzHAi1qJRsOI87-Fk1oYS-aniQOTfm5y5x1syTIgWEX9JvXCQgTxjp2kMItuoL2G2faoQ\",\"e\":\"AQAB\"}";

    /**
     * 过期时间
     */
    public static long accessTokenExpirationTime = 60 * 60 * 24;

    /**
     * 创建token
     * @param account 用户名
     * @return
     */
    public String createToken(String account) {
        try {
            //Payload
            JwtClaims claims = new JwtClaims();
            claims.setGeneratedJwtId();
            claims.setIssuedAtToNow();
            //expire time
            NumericDate date = NumericDate.now();
            date.addSeconds(accessTokenExpirationTime);
            claims.setExpirationTime(date);
            claims.setNotBeforeMinutesInThePast(1);
            claims.setSubject("YOUR_SUBJECT");
            claims.setAudience("YOUR_AUDIENCE");
            //添加自定义参数,必须是字符串类型
            claims.setClaim("account", account);

            //jws
            JsonWebSignature jws = new JsonWebSignature();
            //签名算法RS256
            jws.setAlgorithmHeaderValue(AlgorithmIdentifiers.RSA_USING_SHA256);
            String keyId = UUID.randomUUID().toString();
            jws.setKeyIdHeaderValue(keyId);
            jws.setPayload(claims.toJson());

            PrivateKey privateKey = new RsaJsonWebKey(JsonUtil.parseJson(privateKeyStr)).getPrivateKey();
            jws.setKey(privateKey);

            //get token
            String idToken = jws.getCompactSerialization();
            return idToken;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * jws校验token
     *
     * @param token
     * @return 返回 用户账号
     * @throws JoseException
     */
    public String verifyToken(String token) {
        try {
            JwtConsumer consumer = new JwtConsumerBuilder()
                    .setRequireExpirationTime()
                    .setMaxFutureValidityInMinutes(5256000)
                    .setAllowedClockSkewInSeconds(30)
                    .setRequireSubject()
                    .setExpectedAudience("YOUR_AUDIENCE")
                    .setVerificationKey(new RsaJsonWebKey(JsonUtil.parseJson(publicKeyStr)).getPublicKey())
                    .build();

            JwtClaims claims = consumer.processToClaims(token);
            if (claims != null) {
                System.out.println("认证通过！");
                String account = (String) claims.getClaimValue("account");
                System.out.println("token payload携带的自定义内容:用户账号account=" + account);
                return account;
            }
        }  catch (JoseException e) {
            e.printStackTrace();
        }  catch (InvalidJwtException e) {
            e.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 创建jwk keyId , 公钥 ，秘钥
     */
    public static void createKeyPair(){
        String keyId = UUID.randomUUID().toString().replaceAll("-", "");
        RsaJsonWebKey jwk = null;
        try {
            jwk = RsaJwkGenerator.generateJwk(2048);
        } catch (JoseException e) {
            e.printStackTrace();
        }
        jwk.setKeyId(keyId);
        //采用的签名算法 RS256
        jwk.setAlgorithm(AlgorithmIdentifiers.RSA_USING_SHA256);
        String publicKey = jwk.toJson(RsaJsonWebKey.OutputControlLevel.PUBLIC_ONLY);
        String privateKey = jwk.toJson(RsaJsonWebKey.OutputControlLevel.INCLUDE_PRIVATE);

        System.out.println("keyId="+keyId);
        System.out.println();
        System.out.println("公钥 publicKeyStr="+publicKey);
        System.out.println();
        System.out.println("私钥 privateKeyStr="+privateKey);
    }
}
