package com.ssm.blog.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class GetLeafIDUtil {
    public static String getLeafID(String parmURL, String parmID){
        try
        {
            URL url = new URL(parmURL+parmID);//"http://192.168.192.128:8080/api/segment/get/leaf-segment-test"
            URLConnection urlConnection = url.openConnection();
            HttpURLConnection connection = null;
            connection = (HttpURLConnection) urlConnection;
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String urlString = "";
            String current;
            while((current = in.readLine()) != null)
            {
                urlString += current;
            }
            return urlString;
        }catch(IOException e)
        {
            e.printStackTrace();
        }
        return "failed";
    }
}
