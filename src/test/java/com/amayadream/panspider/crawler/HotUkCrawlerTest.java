package com.amayadream.panspider.crawler;

import com.amayadream.panspider.AbstractSpringTest;
import com.amayadream.panspider.common.util.RedisManager;
import com.amayadream.panspider.crawler.parse.UkCrawler;
import org.junit.Test;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;

/**
 * @author :  Amayadream
 * @date :  2017.04.24 22:58
 */
public class HotUkCrawlerTest extends AbstractSpringTest {

    @Resource
    private UkCrawler crawler;
    @Resource
    private RedisManager redisManager;

    @Test
    public void test() throws InterruptedException {
        Jedis jedis = null;
        try {
            jedis = redisManager.initResource();
            crawler.getFollow(jedis, "224534490");
        } finally {
            redisManager.releaseResource(jedis);
        }
    }

}
