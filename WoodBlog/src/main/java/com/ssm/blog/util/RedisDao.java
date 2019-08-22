package com.ssm.blog.util;

import com.ssm.blog.entity.Article;
import io.protostuff.LinkedBuffer;
import io.protostuff.ProtobufIOUtil;
import io.protostuff.ProtostuffIOUtil;
import io.protostuff.runtime.RuntimeSchema;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;


public class RedisDao {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private JedisPool jedisPool;

    private final static String REDIS_IP = "127.0.0.1";

    private final static int REDIS_PORT = 6379;

    private RuntimeSchema<Article> schema = RuntimeSchema.createFrom(Article.class);
    //也可以用：private Schema<User> schema = RuntimeSchema.createFrom(User.class);

    public RedisDao(String REDIS_IP, int REDIS_PORT){
        jedisPool = new JedisPool(REDIS_IP,REDIS_PORT);
    }


    /**
     * 根据传入的articleId来做redis中的key，value则是序列化成字节数组的Article对象
     * 其中将Article对象序列化成自己数组没有用原生的Serilizable接口自己转化，
     * 而是用的protostuff来序列化，具体方法见：setRedisUser()；
     */
    public Article getRedisArticle(Integer articleId){
        Article article = null;
        Jedis jedis = jedisPool.getResource();
        try{
            article = schema.newMessage();
            String key = "articleId:" + articleId;
            byte[] bytes = jedis.get(key.getBytes());
            if(bytes != null){
                //schema创建的空User对象，将字节数组中的信息反序列化到User对象上
                ProtostuffIOUtil.mergeFrom(bytes,article,schema);
                System.out.println("article:"+article.toString());
                return article;
            }
        } catch (Exception e){
            logger.error(e.getMessage(), e);
        } finally {
            jedis.close();
        }
        return article;
    }

    /**
     * 通过setRedisUser()方法来将从数据库查询出来的Article对象序列化存储到redis上
     * 序列化的方式是用protostuff的ProtobufIOUtil中的toByteArray方法，将User对象序列化成字节数组
     * 返回String类的结果，"OK"表示序列化存储成功。返回null则表示失败。
     */
    public String setRedisArticle(Article article){
        String result=null;
        Jedis jedis = jedisPool.getResource();
        try{
            String key = "articleId:"+article.getArticleId();
            byte[] bytes = ProtobufIOUtil.toByteArray(article, schema,
                    LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
            int timeout = 60 * 60;
            result = jedis.setex(key.getBytes(), timeout, bytes);
            return result;
        } catch(Exception e){
            logger.error(e.getMessage(), e);
        } finally {
            jedis.close();
        }
        return result;
    }

    public boolean removeArticle(Integer articlId){
        boolean flag = false;
        Jedis jedis = jedisPool.getResource();
        try{
            String key = "articleId:"+articlId;
            Long result = jedis.del(key);
            if(result.equals(new Long(1))){
                flag=true;
            }
        } catch(Exception e){
            logger.error(e.getMessage(), e);
        } finally {
            jedis.close();
        }
        return flag;
    }

}
