package com.lyj.utils;

import com.lyj.pojo.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class WebUtils {
    public static <T> T copyParamToBean(Map value, T bean){

        try {
            System.out.println("注入之前："+bean);
            BeanUtils.populate(bean,value);
            System.out.println("注入之后："+bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * 将字符串装换为int类型
     * @param strInt
     * @param defaultValue
     * @return
     */
    public static int parseInt(String strInt,int defaultValue){
            try {
                return Integer.parseInt(strInt);
            } catch (Exception e) {
                //e.printStackTrace();
            }

        return defaultValue;
    }
}
