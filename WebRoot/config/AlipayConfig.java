package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101000650224";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCPxNDHr7klrtgIAnYDbvwle9g8iXfCFjAnv7P1EBDCgMQKNyMBn8eYdGYs8JoZEjgEvvGaBqy7/TY1zeGI7DLzEGoRjaxskuV+eT70XXBVsQOlYJjlkZb8Xnj8OK9/Ayn+ThKB2+C8XdmFWsYLOka6nABqOdPFaHDTMOALNHtjNiC3IX9hRBiG0PuQmbxz1NkuJFebRcBc/JPesVMhZLXM/OCTnLSEWi/ay1jSC5MdDJdB0/XZhlj131oO1Kcat4ccspNdRUTvYqt2Acf1gpoAH7lEe7we2JPFjJIuGu1wwSb6S5DgpBFY+hF/ZjxJgyBfU+ZiCuPKj+O1p0d3EJSjAgMBAAECggEAOVY8EbdyNqYhgChDGqFzrBtVJOeKPHyO3ftlcNHkbT3fcVeF/YrUlmetrDSUsHUEpFfmkRAiaaLVsOWYEfxpYWjldHS1FGQNZMBELD7rozFCi/0XXU8QETw4MhcFXrlLUSGf3exsF5OyQa3vF+E4/gljXPoNDEjX3lI6uB1JLEp79EtZcYbxWlG2QurG2gN+qISDgyRaprK/lZmbUpwMiDWBcAN+hwaa/cqOhoOOQJMBiRbs05+otmi7BfHRxuGZm/JR3IPJNhMLejRQzpQ52gPp9gGIJaW1CEckplxZjHzb634m3ABoRhQVsEjgpZTqq6ne6sherqUqGlu5dPt4gQKBgQDE7GRRsWlDcYyiApoyQLOflLPHoavwadvwKLyeCWPkaNqMo8VtFNr/e4wxqOW96p15uZjX9IPJD3ZDy6paTqk5EiTk0JjnjZwj6KpidC/xlLgZ11lowGCxWx8bCTSAZ+4E9jUbT1d3hB8WTv3Z4nkSWVcw4ELCqHFRQA0sOogKQQKBgQC65i4pPc2o7TxuHffD5sSj8ElGtJR57vsBjwVM1CcaebsOw0HAD18zJlrHwFrr6MbLiALMiSRopJE2AnlLs/oplyKemwkaKdEXqCQrwe/qNQcbiKRiyy3rTy/v0VpG09oSvintZv51E9w1MtTNBXrnsRAqQuXhdXPxnji9mn494wKBgFiEdheuqsVxPij5CHz8ToG2IxXiW1pnC0Ep3pcfW3Kpm0vKtgzxafubeoo8BIFY+85imgzA0ZhIRf31h66uWyzXNhRQm9rB8eTGSgiVd5OdKSAciAkpKI2wiwvpGFt73CcI0Rhkksmbbynk+gC953RTCnli5T+A3ecK5qDx8oLBAoGAHXk1KF3Ns+kNkZP6QZN/yRaYh6TskToFrV4/iLkgHYW64P4bvUzvR2KyCDQmYnOH/grJ3jV2X2YsXCcRt8V/GtXxqK9sRQr5JVDnu1rPGdEY+NeYjNfbuvL27UvHf8ni5vfEJuMKF651GJKWimpl0mnS0cdQ9zgNe7nm2selRt8CgYEAg/wqAsfnsh5l/MiX0tOzZ0vGTjfL0m+krggsTCHmraxS6zChdjv3AJTiyA9TreAfYAjIgDVIX1EC+Ro9ntlt0fyU9Ou1VMkIG+YaVp59MVFZlVXa8OzCcIwEzyKgmpOyr14SJY+BYih5KnDmZDkyCssxrZ6E7w7hyDDOM50MrLs=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkNckhK6qOp9UwtKMwRm+6uuuhEsxe5Ulq7FuGbYw7JfB4uZ6ztgypMT0fUegUAvnNFLGHAYpFn7OunhbOFrkpoZ2toxnY8i9nva0N2PfqccegU06b4/1DKiL12ZamvRe+bLmKsNQaKJVzbqeRpL2nOrQYjOb2uwfzgNpE9tr8u9WeJISCvJo/2pMv+WYZHBFBlwLS4qskKZG5Khxa++LtNasbeON8FR4MLn/OcDNsodZdMExz4vsOdeAKv+jSVMwgDfxL5GNgq0qJOiaDJiqTLjctFhDh/xOlnEG9mV651tjM1lbym9Q58Wg7AfcscvxwPHLsB+MEmzkYc64zFIX9QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-GBK/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-GBK/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "GBK";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

