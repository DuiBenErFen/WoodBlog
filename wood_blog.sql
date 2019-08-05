-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: wood_blog
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

CREATE DATABASE wood_blog;

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_user_id` int(11) unsigned DEFAULT NULL,
  `article_title` varchar(255) DEFAULT NULL,
  `article_content` mediumtext,
  `article_view_count` int(11) DEFAULT '0',
  `article_comment_count` int(11) DEFAULT '0',
  `article_like_count` int(11) DEFAULT '0',
  `article_is_comment` int(1) unsigned DEFAULT NULL,
  `article_status` int(1) unsigned DEFAULT '1',
  `article_order` int(11) unsigned DEFAULT NULL,
  `article_update_time` datetime DEFAULT NULL,
  `article_create_time` datetime DEFAULT NULL,
  `article_summary` text,
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (36,1,'浅谈volatile','<h1 id=\"一、volatile是什么\" style=\"text-align: justify;\">一、volatile是什么</h1><p style=\"text-align: justify;\">volatile是Java提供的一种轻量级的同步机制<br>保证变量的修改其它线程立马可见，解决部分并发问题</p><h1 id=\"二、volatile局限性\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190612-%E6%B5%85%E8%B0%88volatile/#%E4%BA%8C%E3%80%81volatile%E5%B1%80%E9%99%90%E6%80%A7\" class=\"headerlink\" title=\"二、volatile局限性\"></a>二、volatile局限性</h1><p style=\"text-align: justify;\">无法解决复合操作，例如 i++ i–这种操作<br>原因：i++操作分三步</p><ol style=\"text-align: justify;\"><li>读取i=1；</li><li>i=i+1=2；</li><li>i=2写入主存<br>有可能在3写入之前，其它线程已经对i进行了修改，比如改为100了，结果覆盖写入了2</li></ol><h1 id=\"三、volatile原理\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190612-%E6%B5%85%E8%B0%88volatile/#%E4%B8%89%E3%80%81volatile%E5%8E%9F%E7%90%86\" class=\"headerlink\" title=\"三、volatile原理\"></a>三、volatile原理</h1><p style=\"text-align: justify;\">volatile底层依靠指令重排序来实现内存可见性的<br>具体的规则如下</p><ol style=\"text-align: justify;\"><li>当第二个操作是voaltile写时，无论第一个操作是什么，都不能进行重排序</li><li>当第一个操作是volatile读时，不管第二个操作是什么，都不能进行重排序</li><li>当第一个操作是volatile写时，第二个操作是volatile读时，不能进行重排序</li></ol><h1 id=\"四、-参考\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190612-%E6%B5%85%E8%B0%88volatile/#%E5%9B%9B%E3%80%81-%E5%8F%82%E8%80%83\" class=\"headerlink\" title=\"四、 参考\"></a>四、 参考</h1><p><a id=\"more\" style=\"text-align: justify;\"></a></p><p style=\"text-align: justify;\"><a href=\"https://www.cnblogs.com/chengxiao/p/6528109.html\" target=\"_blank\" rel=\"noopener\">https://www.cnblogs.com/chengxiao/p/6528109.html</a></p>',0,0,0,1,1,1,'2019-08-04 16:05:24','2019-08-04 15:50:22','一、volatile是什么volatile是Java提供的一种轻量级的同步机制保证变量的修改其它线程立马可见，解决部分并发问题二、volatile局限性无法解决复合操作，例如 i++ i–这种操作原因：i++操作分三步读取i=1；i=i+1=2；i=2写入主存有可能在3写入之前，其它线程已经对i进行'),(37,1,'JVM GC理论与优化案例','<h1 id=\"一、理论知识\" style=\"text-align: justify;\">一、理论知识</h1><p style=\"text-align: justify;\">常见参数：</p><ol style=\"text-align: justify;\"><li>-Xms 堆初始化 例如：-Xms256m</li><li>-Xmx 堆最大值 例如：-Xmx512m</li><li>-Xmn 堆新生代 例如：-Xmn100m</li><li>-XX:NewRatio 新生代与老年代的比例</li><li>-XX:SurvivorRatio 新生代区域比例，默认8,代表Eden:From Survivor:To Survivor = 8:1:1</li></ol><p style=\"text-align: justify;\">垃圾回收器：</p><ol style=\"text-align: justify;\"><li>Serial/Serial Old 新生代/老年代，古老，单线程，暂停所有用户线程，复制算法/标记整理算法</li><li>ParNew 1的多线程版本</li><li>Parallel Scavenge 新生代，多线程，不需要暂停用户线程，复制算法</li><li>Parallel Old 老年代，多线程，不需要暂停用户线程，标记整理算法</li><li>CMS（Current Mark Sweep，<a href=\"http://www.importnew.com/2782.html\" target=\"_blank\" rel=\"noopener\">详情</a>）老年代，与ParNew配合使用，牺牲吞吐量获得最短停顿，标记整理算法</li><li>G1 并行与并发收集器，可预测的停顿时间</li></ol><h1 id=\"二、实践案例\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190429-Java%20GC%20-%20%E7%90%86%E8%AE%BA%E4%B8%8E%E5%AE%9E%E8%B7%B5%20-%20%E9%99%84%E4%BC%98%E5%8C%96%E6%A1%88%E4%BE%8B/#%E4%BA%8C%E3%80%81%E5%AE%9E%E8%B7%B5%E6%A1%88%E4%BE%8B\" class=\"headerlink\" title=\"二、实践案例\"></a>二、实践案例</h1><ol style=\"text-align: justify;\"><li>Full GC 之前进行 Minor GC 避免扫描过多的对象， 配置：CMSScavengeBeforeRemark</li><li>Xms和Xmx设置为相同，这样可以减少内存自动扩容和收缩带来的性能损失</li><li>JVM调优是最后的稻草，进行JVM调优之前应该先优化架构和代码</li><li>调优是一个复杂的过程，根据具体的场景结合对垃圾回收器的深入理解进行调优，才可能事半功倍。</li></ol><p style=\"text-align: justify;\">各个区大小比例建议<br></p><figure class=\"highlight plain\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br></pre></td><td class=\"code\"><pre><span class=\"line\"># 活跃空间大小：Full GC后堆中老年代占用空间的大小</span><br><span class=\"line\">空间      倍数</span><br><span class=\"line\">总大小    3-4倍活跃空间大小</span><br><span class=\"line\">新生代    1-1.5倍活跃空间大小</span><br><span class=\"line\">老年代    2-3倍活跃空间大小</span><br></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\"></p><h1 id=\"三、参考连接\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190429-Java%20GC%20-%20%E7%90%86%E8%AE%BA%E4%B8%8E%E5%AE%9E%E8%B7%B5%20-%20%E9%99%84%E4%BC%98%E5%8C%96%E6%A1%88%E4%BE%8B/#%E4%B8%89%E3%80%81%E5%8F%82%E8%80%83%E8%BF%9E%E6%8E%A5\" class=\"headerlink\" title=\"三、参考连接\"></a>三、参考连接</h1><p><a id=\"more\" style=\"text-align: justify;\"></a></p><p style=\"text-align: justify;\">1.1&nbsp;<a href=\"https://www.cnblogs.com/honey01/p/9475726.html\" target=\"_blank\" rel=\"noopener\">https://www.cnblogs.com/honey01/p/9475726.html</a><br>1.2&nbsp;<a href=\"https://www.cnblogs.com/dolphin0520/p/3783345.html\" target=\"_blank\" rel=\"noopener\">https://www.cnblogs.com/dolphin0520/p/3783345.html</a><br>2.1&nbsp;<a href=\"https://tech.meituan.com/2017/12/29/jvm-optimize.html\" target=\"_blank\" rel=\"noopener\">https://tech.meituan.com/2017/12/29/jvm-optimize.html</a></p>',1,1,0,1,1,1,'2019-08-04 16:11:34','2019-08-04 16:10:52','一、理论知识常见参数：-Xms 堆初始化 例如：-Xms256m-Xmx 堆最大值 例如：-Xmx512m-Xmn 堆新生代 例如：-Xmn100m-XX:NewRatio 新生代与老年代的比例-XX:SurvivorRatio 新生代区域比例，默认8,代表Eden:From Survivor:To'),(38,1,'JAVA IO 总结','<h1 id=\"一、名词解释\" style=\"text-align: justify;\">一、名词解释</h1><h2 id=\"1-1-同步与异步\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%AE%A4%E8%AF%86Java%20IO%20%7C%20BIO-NIO-AIO/#1-1-%E5%90%8C%E6%AD%A5%E4%B8%8E%E5%BC%82%E6%AD%A5\" class=\"headerlink\" title=\"1.1 同步与异步\"></a>1.1 同步与异步</h2><p style=\"text-align: justify;\">同步与异步主要是针对CPU来说的</p><ol style=\"text-align: justify;\"><li>同步：CPU必须等着结果返回，这期间不能干别的;</li><li>异步：CPU不必等着结果返回，这期间可以干别的;</li></ol><h2 id=\"1-2-阻塞与非阻塞\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%AE%A4%E8%AF%86Java%20IO%20%7C%20BIO-NIO-AIO/#1-2-%E9%98%BB%E5%A1%9E%E4%B8%8E%E9%9D%9E%E9%98%BB%E5%A1%9E\" class=\"headerlink\" title=\"1.2 阻塞与非阻塞\"></a>1.2 阻塞与非阻塞</h2><p style=\"text-align: justify;\">阻塞与非阻塞主要是针对I/O来说的</p><ol style=\"text-align: justify;\"><li>阻塞：I/O线程会挂起，需等待结果;</li><li>非阻塞：I/O线程不必挂起，不等待结果;</li></ol><h2 id=\"1-3-伪异步I-O\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%AE%A4%E8%AF%86Java%20IO%20%7C%20BIO-NIO-AIO/#1-3-%E4%BC%AA%E5%BC%82%E6%AD%A5I-O\" class=\"headerlink\" title=\"1.3 伪异步I/O\"></a>1.3 伪异步I/O</h2><p style=\"text-align: justify;\">本质上还是同步阻塞I/O<br>不过是在服务器把socket链接封装成Task提交给线程池处理<br>因为有队列，所以可以突破C:S=1:1的比例</p><h2 id=\"1-4-I-O多路复用\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%AE%A4%E8%AF%86Java%20IO%20%7C%20BIO-NIO-AIO/#1-4-I-O%E5%A4%9A%E8%B7%AF%E5%A4%8D%E7%94%A8\" class=\"headerlink\" title=\"1.4 I/O多路复用\"></a>1.4 I/O多路复用</h2><p style=\"text-align: justify;\">通过把多个I/O的阻塞复用到一个阻塞上，从而使得系统在单线程情况下可以处理多个客户端的请求。<br>类似于linux的epoll、select</p><h2 id=\"1-5-多路复用器\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%AE%A4%E8%AF%86Java%20IO%20%7C%20BIO-NIO-AIO/#1-5-%E5%A4%9A%E8%B7%AF%E5%A4%8D%E7%94%A8%E5%99%A8\" class=\"headerlink\" title=\"1.5 多路复用器\"></a>1.5 多路复用器</h2><p style=\"text-align: justify;\">Selector，核心是通过Selector来轮询注册在其上的Channel<br>当发现有Channel就绪就返回Channel的选择键集合，进行I/O操作；</p><h1 id=\"二、不同I-O模型对比表格\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%AE%A4%E8%AF%86Java%20IO%20%7C%20BIO-NIO-AIO/#%E4%BA%8C%E3%80%81%E4%B8%8D%E5%90%8CI-O%E6%A8%A1%E5%9E%8B%E5%AF%B9%E6%AF%94%E8%A1%A8%E6%A0%BC\" class=\"headerlink\" title=\"二、不同I/O模型对比表格\"></a>二、不同I/O模型对比表格</h1><table class=\"layui-table\" style=\"text-align: justify;\"><thead><tr><th style=\"text-align: left;\">对比项</th><th style=\"text-align: left;\">同步阻塞I/O(BIO)</th><th style=\"text-align: left;\">伪异步IO</th><th style=\"text-align: left;\">非阻塞I/O(NIO)</th><th style=\"text-align: left;\">异步I/O(AIO)</th></tr></thead><tbody><tr><td style=\"text-align: left;\">客户端个数:I/O线程数</td><td style=\"text-align: left;\">1:1</td><td style=\"text-align: left;\">M:N(M&gt;=N)</td><td style=\"text-align: left;\">M:1</td><td style=\"text-align: left;\">M:O</td></tr><tr><td style=\"text-align: left;\">I/O类型(是否同步)</td><td style=\"text-align: left;\">同步</td><td style=\"text-align: left;\">同步</td><td style=\"text-align: left;\">同步(I/O多路复用)</td><td style=\"text-align: left;\">异步</td></tr><tr><td style=\"text-align: left;\">I/O类型(是否阻塞)</td><td style=\"text-align: left;\">阻塞</td><td style=\"text-align: left;\">阻塞</td><td style=\"text-align: left;\">阻塞</td><td style=\"text-align: left;\">非阻塞</td></tr><tr><td style=\"text-align: left;\">API使用难度</td><td style=\"text-align: left;\">简单</td><td style=\"text-align: left;\">简单</td><td style=\"text-align: left;\">非常复杂</td><td style=\"text-align: left;\">复杂</td></tr><tr><td style=\"text-align: left;\">调试难度</td><td style=\"text-align: left;\">简单</td><td style=\"text-align: left;\">简单</td><td style=\"text-align: left;\">复杂</td><td style=\"text-align: left;\">复杂</td></tr><tr><td style=\"text-align: left;\">可靠性</td><td style=\"text-align: left;\">非常差</td><td style=\"text-align: left;\">差</td><td style=\"text-align: left;\">高</td><td style=\"text-align: left;\">高</td></tr><tr><td style=\"text-align: left;\">吞吐量</td><td style=\"text-align: left;\">低</td><td style=\"text-align: left;\">中</td><td style=\"text-align: left;\">高</td><td style=\"text-align: left;\">高</td></tr></tbody></table><h1 id=\"三、参考\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%AE%A4%E8%AF%86Java%20IO%20%7C%20BIO-NIO-AIO/#%E4%B8%89%E3%80%81%E5%8F%82%E8%80%83\" class=\"headerlink\" title=\"三、参考\"></a>三、参考</h1><p><a id=\"more\" style=\"text-align: justify;\"></a></p><ol style=\"text-align: justify;\"><li>《Netty权威指南 2th》</li></ol>',0,0,0,1,1,1,'2019-08-04 16:12:30','2019-08-04 16:12:13','一、名词解释1.1 同步与异步同步与异步主要是针对CPU来说的同步：CPU必须等着结果返回，这期间不能干别的;异步：CPU不必等着结果返回，这期间可以干别的;1.2 阻塞与非阻塞阻塞与非阻塞主要是针对I/O来说的阻塞：I/O线程会挂起，需等待结果;非阻塞：I/O线程不必挂起，不等待结果;1.3 伪异'),(39,1,'MySQL隔离级别及原理','<h1 id=\"一、名词解释\" style=\"text-align: justify;\">一、名词解释</h1><p style=\"text-align: justify;\">脏读：在一个查询事务过程中，读到了其它事务没有提交的数据；<br>不可重复读：一个事务查询过程中，多次查询得到了不一致的结果，原因是：有别的更新事务提交了；<br>幻读：一个事务查询过程中，多次查询得到了不一致的结果，原因是：有别的删除事务/插入事务提交了；</p><h1 id=\"二、数据库隔离级别\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#%E4%BA%8C%E3%80%81%E6%95%B0%E6%8D%AE%E5%BA%93%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB\" class=\"headerlink\" title=\"二、数据库隔离级别\"></a>二、数据库隔离级别</h1><table class=\"layui-table\" style=\"text-align: justify;\"><thead><tr><th style=\"text-align: left;\">name</th><th style=\"text-align: left;\">名称</th><th style=\"text-align: left;\">脏读</th><th style=\"text-align: left;\">不可重复读</th><th style=\"text-align: left;\">幻读</th><th style=\"text-align: left;\">加锁读</th></tr></thead><tbody><tr><td style=\"text-align: left;\">Read uncommitted</td><td style=\"text-align: left;\">读未提交</td><td style=\"text-align: left;\">Yes</td><td style=\"text-align: left;\">Yes</td><td style=\"text-align: left;\">Yes</td><td style=\"text-align: left;\">No</td></tr><tr><td style=\"text-align: left;\">Read committed</td><td style=\"text-align: left;\">读已提交</td><td style=\"text-align: left;\">No</td><td style=\"text-align: left;\">Yes</td><td style=\"text-align: left;\">Yes</td><td style=\"text-align: left;\">No</td></tr><tr><td style=\"text-align: left;\">Repeatable read</td><td style=\"text-align: left;\">可重复读</td><td style=\"text-align: left;\">No</td><td style=\"text-align: left;\">No</td><td style=\"text-align: left;\">Yes</td><td style=\"text-align: left;\">No</td></tr><tr><td style=\"text-align: left;\">Serializable</td><td style=\"text-align: left;\">序列化</td><td style=\"text-align: left;\">No</td><td style=\"text-align: left;\">No</td><td style=\"text-align: left;\">No</td><td style=\"text-align: left;\">Yes</td></tr></tbody></table><p style=\"text-align: justify;\">默认的隔离级别为：RR，原因：5.1之后版本，如果Binlogog开启语句级别，必须为RR，RC可能会导致Binlog数据错误(<a href=\"https://blog.csdn.net/shudaqi2010/article/details/79958222\" target=\"_blank\" rel=\"noopener\">详情</a>);</p><h1 id=\"三、控制方式\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#%E4%B8%89%E3%80%81%E6%8E%A7%E5%88%B6%E6%96%B9%E5%BC%8F\" class=\"headerlink\" title=\"三、控制方式\"></a>三、控制方式</h1><p style=\"text-align: justify;\">读未提交：每次都是读数据最新的版本(包括事务未提交的数据)；<br>读已提交：MVCC控制；<br>可重复读：MVCC控制；<br>序列化：在读取的每一行上加锁，只能按顺序进行读写；</p><h1 id=\"四、InnoDB-MVCC-多版本并发控制-原理\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#%E5%9B%9B%E3%80%81InnoDB-MVCC-%E5%A4%9A%E7%89%88%E6%9C%AC%E5%B9%B6%E5%8F%91%E6%8E%A7%E5%88%B6-%E5%8E%9F%E7%90%86\" class=\"headerlink\" title=\"四、InnoDB MVCC(多版本并发控制)原理\"></a>四、InnoDB MVCC(多版本并发控制)原理</h1><p style=\"text-align: justify;\">InnoDB引擎下的MVCC，是通过在每一行上增加两个隐藏列实现的；<br>每发生一个新的事务，系统版本都会递增；<br>当UPDATE数据的时候，都是先copy出来一行操作，不影响原表数据，提交之后才影响；</p><p style=\"text-align: justify;\">一个保存创建时间(非时间值，而是系统版本号)；<br>一个保存删除时间(非时间值，而是系统版本号)；</p><h2 id=\"4-1-SELECT\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#4-1-SELECT\" class=\"headerlink\" title=\"4.1 SELECT\"></a>4.1 SELECT</h2><p style=\"text-align: justify;\">当前查询事务系统ID：5<br>结果条件：</p><ol style=\"text-align: justify;\"><li>CREATE VERSION &lt;= 5(RR级别为 &lt;= 5,RC级别应该是直接取最大值)；</li><li>DELETE VERSION == null or DELETE VERSION &gt; 5 (RR级别应该只有为空，RC级别可能有 &gt; 5的情况)；</li></ol><p style=\"text-align: justify;\">1可以保证读取到的行，在事务开始之前就已经存在，要么是事务自身插入或者修改的；<br>2可以保证读取到的行，在事务开始之前未被删除；</p><h2 id=\"4-2-INSERT\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#4-2-INSERT\" class=\"headerlink\" title=\"4.2 INSERT\"></a>4.2 INSERT</h2><p style=\"text-align: justify;\">为新插入的每一行保存当前系统版本号作为CREATE VERSION；</p><h2 id=\"4-3-DELETE\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#4-3-DELETE\" class=\"headerlink\" title=\"4.3 DELETE\"></a>4.3 DELETE</h2><p style=\"text-align: justify;\">为删除的每一行保存当前系统版本号作为DELETE VERSION；</p><h2 id=\"4-4-UPDATE\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#4-4-UPDATE\" class=\"headerlink\" title=\"4.4 UPDATE\"></a>4.4 UPDATE</h2><p style=\"text-align: justify;\">插入一行新的记录，保存当前系统版本号作为CREATE VERSION；<br>同事保存当前系统版本号到原来的行上作为DELETE VERSION；</p><h1 id=\"五、参考：\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20190413-%E8%81%8A%E8%81%8AMySQL%E7%9A%84%E9%9A%94%E7%A6%BB%E7%BA%A7%E5%88%AB/#%E4%BA%94%E3%80%81%E5%8F%82%E8%80%83%EF%BC%9A\" class=\"headerlink\" title=\"五、参考：\"></a>五、参考：</h1><p><a id=\"more\" style=\"text-align: justify;\"></a></p><ol style=\"text-align: justify;\"><li>《高性能MySQL》</li><li><a href=\"https://www.cnblogs.com/huanongying/p/7021555.html\" target=\"_blank\">MySQL的四种事务隔离级别</a></li></ol>',0,0,0,1,1,1,'2019-08-04 16:13:57','2019-08-04 16:13:22','一、名词解释脏读：在一个查询事务过程中，读到了其它事务没有提交的数据；不可重复读：一个事务查询过程中，多次查询得到了不一致的结果，原因是：有别的更新事务提交了；幻读：一个事务查询过程中，多次查询得到了不一致的结果，原因是：有别的删除事务/插入事务提交了；二、数据库隔离级别name名称脏读不可重复读幻'),(40,1,'MySQL批量删除重复数据，只保留id最小的一条','<div class=\"post-body\" itemprop=\"articleBody\" style=\"text-align: justify;\"><p>stu数据如下：</p><table class=\"layui-table\"><thead><tr><th style=\"text-align: left;\">id</th><th style=\"text-align: left;\">name</th></tr></thead><tbody><tr><td>1</td><td>hisen</td></tr><tr><td>2</td><td>hisen</td></tr><tr><td>3</td><td>hisen</td></tr><tr><td>4</td><td>hisenyuan</td></tr><tr><td>5</td><td>hisenyuan</td></tr></tbody></table><p>删除重复的name，保留id最小的。</p><p>思路就是先找出重复数据，然后再找出需要保留的数据(重复中id最小的)</p><p>然后删除id不在需要保留的id中的所有数据</p><figure class=\"highlight sql\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br></pre></td><td class=\"code\"><pre><span class=\"line\"><span class=\"keyword\">delete</span></span><br><span class=\"line\"><span class=\"keyword\">from</span> stu</span><br><span class=\"line\"><span class=\"keyword\">where</span> <span class=\"keyword\">id</span> <span class=\"keyword\">not</span> <span class=\"keyword\">in</span> (<span class=\"keyword\">select</span> t.minId</span><br><span class=\"line\">                 <span class=\"keyword\">from</span> (<span class=\"keyword\">select</span> <span class=\"keyword\">min</span>(<span class=\"keyword\">id</span>) minId <span class=\"keyword\">from</span> stu <span class=\"keyword\">group</span> <span class=\"keyword\">by</span> <span class=\"keyword\">name</span> <span class=\"keyword\">having</span> <span class=\"keyword\">count</span>(<span class=\"keyword\">name</span>) &gt; <span class=\"number\">1</span>) t)</span><br></pre></td></tr></tbody></table></figure></div>',0,0,0,1,1,1,'2019-08-04 16:16:28','2019-08-04 16:16:28','stu数据如下：idname1hisen2hisen3hisen4hisenyuan5hisenyuan删除重复的name，保留id最小的。思路就是先找出重复数据，然后再找出需要保留的数据(重复中id最小的)然后删除id不在需要保留的id中的所有数据1234deletefrom stuwhere i'),(35,1,'HashMap源码分析','<blockquote style=\"text-align: justify;\"><h2 id=\"1概念解释\">1.概念解释</h2></blockquote><p style=\"text-align: justify;\"><span>最近在看Java集合的底层源码实现，打算挑几个重要的内容写个小结，也对比学习了很多篇博客，如有错误，还望指出，不胜感激。</span></p><p style=\"text-align: justify;\"><span>HashMap是一个数组+链表的实现，数组中存储了所有的头结点，每个头结点所在的一格称为一个桶，桶后面存放的每一个数据称为bin。</span></p><p style=\"text-align: justify;\"><span>HashMap由数组+链表组成，数组是HashMap的主体，当添加一个元素时，通过key计算hash值，并确定插入数组中的位置。如果插入的位置已经有元素存在，则通过equals方法进一步判断，若返回true则覆盖该位置上的Node，若返回false则添加到该元素的后面形成了链表。当链表长度太长时，链表就转换为红黑树，这样大大提高了查找的效率。</span></p><p style=\"text-align: justify;\"><span>JDK 1.8 以前的HashMapd的实现是数组+链表，即使哈希函数取得再好，也很难达到元素百分百均匀分布。针对这种情况，JDK 1.8 引入了红黑树（查找时间复杂度为O(logn)）来优化这个问题，当同一个hash值的节点数不小于8时，不再采用单链表形式存储，而是采用红黑树的存储形式。</span></p><p style=\"text-align: justify;\"><img src=\"https://images2015.cnblogs.com/blog/616953/201603/616953-20160304192851940-1880633940.png\" alt=\"\"></p><p style=\"text-align: justify;\"><img src=\"https://tech.meituan.com/img/java-hashmap/hashMap%e5%86%85%e5%ad%98%e7%bb%93%e6%9e%84%e5%9b%be.png\" alt=\"\"></p><p style=\"text-align: justify;\"><span>类的数据成员：</span></p><p style=\"text-align: justify;\"><span>DEFAULT_INITIAL_CAPACITY：表示HashMap中桶的数量，即数组长度，默认值为16。每一次扩容都是原来的2倍，总之，容量都是2的幂。</span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>/**\r\n*The default initial capacity - MUST be a power of two.\r\n*/\r\nstatic final int DEFAULT_INITIAL_CAPACITY = 1 &lt;&lt; 4;\r\n</code></pre></div></div><p style=\"text-align: justify;\"><span>DEFAULT_LOAD_FACTOR：表示装载因子，用来衡量HashMap满的程度，其默认值为0.75f，计算装载因子的公式为：size / capacity，并非用占用桶的数量除以capacity。</span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>/**\r\n*The load factor used when none specified in constructor.\r\n*/\r\nstatic final float DEFAULT_LOAD_FACTOR = 0.75f;\r\n</code></pre></div></div><p style=\"text-align: justify;\"><span>threshold：threshold表示临界值，当HashMap的size大于threshold时会执行resize操作。threshold = capacity * loadFactor。</span></p><p style=\"text-align: justify;\"><span>size：表示HashMap中存放的key-value键值对的个数。</span></p><p style=\"text-align: justify;\"><span>TREEIFY_THRESHOLD：当桶上的结点大于这个值时，链表就会转成红黑树。</span></p><p style=\"text-align: justify;\"><span>UNTREEIFY_THRESHOLD：当桶上的结点小于这个值时，红黑树就会转回链表。</span></p><p style=\"text-align: justify;\"><span>MIN_TREEIFY_CAPACITY：桶中结构转化为红黑树对应的table的最小大小。</span></p><p style=\"text-align: justify;\"><span>transient Node<k,v>[] table：存放元素的数组，总是2的幂次倍。</k,v></span></p><p style=\"text-align: justify;\"><span>transient Set<map.entry<k,v» entryset：存放具体元素的值。<=\"\" span=\"\"></map.entry<k,v»></span></p><blockquote style=\"text-align: justify;\"><h2 id=\"2基本方法\">2.基本方法</h2></blockquote><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>public class HashMapTest {\r\n \r\n	public static void main(String[] args) {\r\n		// TODO Auto-generated method stub\r\n		HashMap<string, string=\"\"> hashMap = new HashMap&lt;&gt;();\r\n		//添加方法\r\n		hashMap.put(\"1\", \"string1\");\r\n   			//遍历方法1\r\n		Set<string> keys = hashMap.keySet();\r\n		for(String key  :keys){\r\n			System.out.println(key + \" = \" + hashMap.get(key));\r\n		}\r\n		//遍历方法2\r\n		Set<entry<string, string=\"\">&gt; entrys =  hashMap.entrySet();\r\n		for(Entry<string, string=\"\"> entry : entrys){\r\n			String key = entry.getKey();\r\n			String value = entry.getValue();\r\n			System.out.println(key + \" = \" + value);\r\n		}\r\n		//遍历方法3(for和iterator实现原理相同)\r\n		Iterator iter = hashMap.keySet().iterator(); \r\n		while (iter.hasNext()) { \r\n	 		String key = (String) iter.next(); \r\n			String value = hashMap.get(key); \r\n			System.out.println(key + \" = \" + value);\r\n		}\r\n		//遍历方法4\r\n		Iterator<entry<string, string=\"\">&gt; iterator = hashMap.entrySet().iterator();\r\n		while(iterator.hasNext()){\r\n			Entry<string, string=\"\"> entry = iterator.next();\r\n			String key = entry.getKey();\r\n			String value = entry.getValue();\r\n			System.out.println(key + \" = \" + value);\r\n		}\r\n		//查询方法\r\n		System.out.println(hashMap.get(\"1\"));\r\n		//删除方法\r\n		hashMap.remove(\"1\");		\r\n	}\r\n \r\n}\r\n</string,></entry<string,></string,></entry<string,></string></string,></code></pre></div></div><blockquote style=\"text-align: justify;\"><h2 id=\"3源码分析\">3.源码分析</h2></blockquote><p style=\"text-align: justify;\"><span>1.HashMap<string, string=\"\"> hashMap = new HashMap&lt;&gt;();</string,></span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>public HashMap(int initialCapacity, float loadFactor) {\r\n	//初始容量不能&lt;0\r\n	if (initialCapacity &lt; 0)\r\n		throw new IllegalArgumentException(\"Illegal initial capacity: \" +\r\n   		initialCapacity);\r\n	//初始容量不能 &gt; 最大容量值，HashMap的最大容量值为2^30 \r\n	if (initialCapacity &gt; MAXIMUM_CAPACITY)\r\n		initialCapacity = MAXIMUM_CAPACITY;\r\n	//负载因子不能 &lt; 0\r\n	if (loadFactor &lt;= 0 || Float.isNaN(loadFactor))\r\n		throw new IllegalArgumentException(\"Illegal load factor: \" +\r\n  	    loadFactor);\r\n	this.loadFactor = loadFactor;\r\n	this.threshold = tableSizeFor(initialCapacity);\r\n   	}\r\n</code></pre></div></div><p style=\"text-align: justify;\"><span>class Node<k,v>是HashMap的一个内部类，实现了Map.Entry<k,v>接口。</k,v></k,v></span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>static class Node<k,v> implements Map.Entry<k,v> {\r\n	final int hash;\r\n	final K key;\r\n	V value;\r\n	Node<k,v> next;//指向下一个结点\r\n	\r\n	//构造函数\r\n	Node(int hash, K key, V value, Node<k,v> next) {\r\n		this.hash = hash;\r\n		this.key = key;\r\n		this.value = value;\r\n		this.next = next;\r\n	}\r\n\r\n	public final K getKey(){ return key; }\r\n	public final V getValue()  { return value; }\r\n   		public final String toString() { return key + \"=\" + value; }\r\n\r\n	public final int hashCode() {\r\n		return Objects.hashCode(key) ^ Objects.hashCode(value);\r\n	}\r\n\r\n	public final V setValue(V newValue) {\r\n		V oldValue = value;\r\n		value = newValue;\r\n		return oldValue;\r\n	}\r\n\r\n	//判断两个Node是否相等，如果key和value都相等则返回true\r\n	public final boolean equals(Object o) {\r\n		if (o == this)\r\n			return true;\r\n		if (o instanceof Map.Entry) {\r\n			Map.Entry<!--?,?--> e = (Map.Entry<!--?,?-->)o;\r\n   		 		if (Objects.equals(key, e.getKey()) &amp;&amp;\r\n				Objects.equals(value, e.getValue()))\r\n				return true;\r\n			}\r\n		return false;\r\n	}\r\n   	}\r\n</k,v></k,v></k,v></k,v></code></pre></div></div><p style=\"text-align: justify;\"><span>HashMap其实就是一个Entry（Node）数组，Entry对象中包含了键和值，其中next也是一个Entry对象，它就是用来处理hash冲突的，形成一个链表。</span></p><p style=\"text-align: justify;\"><span>2.红黑树</span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>//红黑树\r\nstatic final class TreeNode<k,v> extends LinkedHashMap.Entry<k,v> {\r\n	TreeNode<k,v> parent;  // 父节点\r\n	TreeNode<k,v> left; //左子树\r\n	TreeNode<k,v> right;//右子树\r\n	TreeNode<k,v> prev;// needed to unlink next upon deletion\r\n	boolean red;//颜色属性\r\n	TreeNode(int hash, K key, V val, Node<k,v> next) {\r\n		super(hash, key, val, next);\r\n	}\r\n \r\n	//返回当前节点的根节点\r\n	final TreeNode<k,v> root() {\r\n		for (TreeNode<k,v> r = this, p;;) {\r\n			if ((p = r.parent) == null)\r\n				return r;\r\n			r = p;\r\n		}\r\n	}\r\n}\r\n</k,v></k,v></k,v></k,v></k,v></k,v></k,v></k,v></k,v></code></pre></div></div><p style=\"text-align: justify;\"><span>红黑树比链表多了四个变量，parent父节点、left左节点、right右节点、prev上一个同级节点。</span></p><p style=\"text-align: justify;\"><span>桶的树形化：</span></p><p style=\"text-align: justify;\"><span>(1)根据哈希表中元素个数确定是扩容还是树形化；</span></p><p style=\"text-align: justify;\"><span>(2)如果是树形化遍历桶中的元素，创建相同个数的树形节点，复制内容，建立起联系；</span></p><p style=\"text-align: justify;\"><span>(3)然后让桶第一个元素指向新建的树头结点，替换桶的链表内容为树形内容。</span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>//将桶内所有的链表结点替换成红黑树结点\r\nfinal void treeifyBin(Node<k,v>[] tab, int hash) {\r\n	int n, index;\r\n	Node<k,v> e;\r\n	//如果当前哈希表为空，或者哈希表中元素的个数小于 进行树形化的阈值(默认为64)，就去新建/扩容\r\n	if (tab == null || (n = tab.length) &lt; MIN_TREEIFY_CAPACITY)\r\n		resize();\r\n	else if ((e = tab[index = (n - 1) &amp; hash]) != null) {\r\n		//如果哈希表中的元素个数超过了树形化阈值，进行树形化\r\n		//e是哈希表中指定位置桶里的链表结点，从第一个开始\r\n		TreeNode<k,v> hd = null, tl = null;//红黑树的头、尾结点\r\n		do {\r\n			//新建一个树形结点，内容和当前链表结点e一致\r\n			TreeNode<k,v> p = replacementTreeNode(e, null);\r\n			if (tl == null)//确定树头结点\r\n				hd = p;\r\n			else {\r\n				p.prev = tl;\r\n				tl.next = p;\r\n			}\r\n			tl = p;\r\n		} while ((e = e.next) != null);\r\n		//让桶的第一个元素指向新建的红黑树头结点，以后这个桶里的元素就是红黑树而不是链表了\r\n		if ((tab[index] = hd) != null)\r\n			hd.treeify(tab);\r\n	}\r\n}\r\n</k,v></k,v></k,v></k,v></code></pre></div></div><p style=\"text-align: justify;\"><span>3.hashMap.put(“1”,”string1”);</span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>public V put(K key, V value) {\r\n	return putVal(hash(key), key, value, false, true);\r\n}\r\n</code></pre></div></div><p style=\"text-align: justify;\"><span>当我们调用put存值时，HashMap首先会获取key的哈希值，通过哈希值快速找到某个存放位置，这个位置可以被称之为bucketIndex。</span></p><p style=\"text-align: justify;\"><span>对于一个key，如果hashCode不同，equals一定为false，如果hashCode相同，equals不一定为true。</span></p><p style=\"text-align: justify;\"><img src=\"https://tech.meituan.com/img/java-hashmap/hashMap%20put%e6%96%b9%e6%b3%95%e6%89%a7%e8%a1%8c%e6%b5%81%e7%a8%8b%e5%9b%be.png\" alt=\"\"></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>final V putVal(int hash, K key, V value, boolean onlyIfAbsent,boolean evict) {\r\n	Node<k,v>[] tab; \r\n	Node<k,v> p; \r\n	int n, i;\r\n	//若table未初始化或长度为0，则进行扩容\r\n	if ((tab = table) == null || (n = tab.length) == 0)\r\n		n = (tab = resize()).length;\r\n	//计算index,并对null做处理\r\n	//(n - 1) &amp; hash确定元素存放的位置，桶为空，则将结点放入桶中\r\n	if ((p = tab[i = (n - 1) &amp; hash]) == null)\r\n		tab[i] = newNode(hash, key, value, null);\r\n	//桶中已经存在元素\r\n	else {\r\n		Node<k,v> e; K k;\r\n		//比较桶中第一个节点的hash值和key值，若相等则覆盖\r\n		if (p.hash == hash &amp;&amp; ((k = p.key) == key || (key != null &amp;&amp; key.equals(k))))\r\n			e = p;//将第一个元素赋值给e，用e来记录\r\n		else if (p instanceof TreeNode)//判断该链是否为红黑树\r\n			e = ((TreeNode<k,v>)p).putTreeVal(this, tab, hash, key, value); \r\n		else {//该链为链表\r\n			//在链表最末插入结点\r\n			for (int binCount = 0; ; ++binCount) {\r\n				//到达链表的尾部\r\n				if ((e = p.next) == null) {\r\n					p.next = newNode(hash, key, value, null);\r\n					如果结点数达到阈值，转换为红黑树\r\n					if (binCount &gt;= TREEIFY_THRESHOLD - 1) // -1 for 1st\r\n					treeifyBin(tab, hash);\r\n					break;\r\n				}\r\n				//判断链表中结点的key值与插入元素的key值是否相等\r\n				if (e.hash == hash &amp;&amp; ((k = e.key) == key || (key != null &amp;&amp; key.equals(k))))\r\n					break;\r\n				p = e;\r\n			}\r\n		}\r\n		//表示在桶中找到key值和hash值与插入元素相等的结点\r\n		if (e != null) { // existing mapping for key\r\n			V oldValue = e.value;\r\n			if (!onlyIfAbsent || oldValue == null)\r\n				e.value = value;\r\n			afterNodeAccess(e);\r\n			return oldValue;\r\n		}\r\n	}\r\n	++modCount;//修改次数+1\r\n	//超过阈值则扩容\r\n	if (++size &gt; threshold)\r\n		resize();\r\n	afterNodeInsertion(evict);\r\n	return null;\r\n}\r\n</k,v></k,v></k,v></k,v></code></pre></div></div><p style=\"text-align: justify;\"><span>数据存储实现原理流程小结：</span></p><p style=\"text-align: justify;\"><span>根据key计算得到key.hash = (h = k.hashCode()) ^ (h&nbsp;»&gt; 16)；</span></p><p style=\"text-align: justify;\"><span>根据key.hash计算得到桶数组的索引index = key.hash &amp; (table.length - 1)，这样就找到该key的存放位置了：</span></p><p style=\"text-align: justify;\"><span>① 如果该位置没有数据，用该数据新生成一个节点保存新数据，返回null；</span></p><p style=\"text-align: justify;\"><span>② 如果该位置有数据是一个红黑树，那么执行相应的插入 / 更新操作；</span></p><p style=\"text-align: justify;\"><span>③ 如果该位置有数据是一个链表，分两种情况一是该链表没有这个节点，另一个是该链表上有这个节点，注意这里判断的依据是key.hash是否一样：如果该链表没有这个节点，那么采用尾插法新增节点保存新数据，返回null；如果该链表已经有这个节点了，那么找到该节点并更新新数据，返回老数据。</span></p><p style=\"text-align: justify;\"><span>4.hashMap.get(“1”);</span></p><div class=\"highlighter-rouge\" style=\"text-align: justify;\"><div class=\"highlight\"><pre class=\"highlight\"><code>final Node<k,v> getNode(int hash, Object key) {\r\n	Node<k,v>[] tab; \r\n	Node<k,v> first, e; \r\n	int n; \r\n	K k;\r\n	// table已经初始化，长度大于0，根据hash寻找table中的项也不为空\r\n	if ((tab = table) != null &amp;&amp; (n = tab.length) &gt; 0 &amp;&amp;\r\n		(first = tab[(n - 1) &amp; hash]) != null) {\r\n		// 桶中第一项(数组元素)相等\r\n		if (first.hash == hash &amp;&amp; // always check first node\r\n			((k = first.key) == key || (key != null &amp;&amp; key.equals(k))))\r\n			return first;\r\n		// 桶中不止一个结点\r\n		if ((e = first.next) != null) {\r\n		// 为红黑树结点\r\n			if (first instanceof TreeNode)\r\n			// 在红黑树中查找\r\n				return ((TreeNode<k,v>)first).getTreeNode(hash, key);\r\n			// 否则，在链表中查找\r\n			do {\r\n				if (e.hash == hash &amp;&amp;\r\n					((k = e.key) == key || (key != null &amp;&amp; key.equals(k))))\r\n					return e;\r\n			} while ((e = e.next) != null);\r\n		}\r\n	}\r\n	return null;\r\n}\r\n</k,v></k,v></k,v></k,v></code></pre></div></div><p style=\"text-align: justify;\"><span>说明：HashMap并没有直接提供getNode接口给用户调用，而是提供的get函数，而get函数就是通过getNode来取得元素的。</span></p>',1,0,0,1,1,1,'2019-08-04 15:36:46','2019-08-04 15:35:48','1.概念解释最近在看Java集合的底层源码实现，打算挑几个重要的内容写个小结，也对比学习了很多篇博客，如有错误，还望指出，不胜感激。HashMap是一个数组+链表的实现，数组中存储了所有的头结点，每个头结点所在的一格称为一个桶，桶后面存放的每一个数据称为bin。HashMap由数组+链表组成，数组是'),(41,1,'MySQL EXPLAIN关键字','<p style=\"text-align: justify;\">MySQL的EXPLAIN命令用于SQL语句的查询执行计划(QEP)。</p><p style=\"text-align: justify;\">这条命令的输出结果能够让我们了解MySQL 优化器是如何执行</p><p style=\"text-align: justify;\">执行下面的SQL<br></p><figure class=\"highlight plain\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">explain select * FROM book where name like \'活%\'</span><br></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">得到下面的数据</p><table class=\"layui-table\" style=\"text-align: justify;\"><thead><tr><th style=\"text-align: left;\">id</th><th style=\"text-align: left;\">select_type</th><th style=\"text-align: left;\">table</th><th style=\"text-align: left;\">partitions</th><th style=\"text-align: left;\">type</th><th style=\"text-align: left;\">possible_keys</th><th style=\"text-align: left;\">key</th><th style=\"text-align: left;\">key_len</th><th style=\"text-align: left;\">ref</th><th style=\"text-align: left;\">rows</th><th style=\"text-align: left;\">filered</th><th style=\"text-align: left;\">Extra</th></tr></thead><tbody><tr><td style=\"text-align: left;\">编号</td><td style=\"text-align: left;\">查询方式</td><td style=\"text-align: left;\">表名</td><td style=\"text-align: left;\">分区</td><td style=\"text-align: left;\">连接方式</td><td style=\"text-align: left;\">索引(可能)</td><td style=\"text-align: left;\">索引</td><td style=\"text-align: left;\">索引长度</td><td style=\"text-align: left;\">作用列</td><td style=\"text-align: left;\">行数</td><td style=\"text-align: left;\">百分比</td><td style=\"text-align: left;\">额外</td></tr><tr><td style=\"text-align: left;\">1</td><td style=\"text-align: left;\">SIMPLE</td><td style=\"text-align: left;\">book</td><td style=\"text-align: left;\">null</td><td style=\"text-align: left;\">ALL</td><td style=\"text-align: left;\">null</td><td style=\"text-align: left;\">null</td><td style=\"text-align: left;\">null</td><td style=\"text-align: left;\">null</td><td style=\"text-align: left;\">114</td><td style=\"text-align: left;\">11.11</td><td style=\"text-align: left;\">Using where</td></tr></tbody></table><p style=\"text-align: justify;\">###建表语句<br><a id=\"more\"></a><br></p><figure class=\"highlight plain\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br><span class=\"line\">11</span><br><span class=\"line\">12</span><br><span class=\"line\">13</span><br><span class=\"line\">14</span><br><span class=\"line\">15</span><br><span class=\"line\">16</span><br><span class=\"line\">17</span><br><span class=\"line\">18</span><br><span class=\"line\">19</span><br><span class=\"line\">20</span><br><span class=\"line\">21</span><br><span class=\"line\">22</span><br><span class=\"line\">23</span><br><span class=\"line\">24</span><br><span class=\"line\">25</span><br><span class=\"line\">26</span><br><span class=\"line\">27</span><br><span class=\"line\">28</span><br><span class=\"line\">29</span><br><span class=\"line\">30</span><br><span class=\"line\">31</span><br><span class=\"line\">32</span><br><span class=\"line\">33</span><br><span class=\"line\">34</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">#创建个人信息表</span><br><span class=\"line\">CREATE TABLE hisen_test_explain_people</span><br><span class=\"line\">(</span><br><span class=\"line\">  id bigint auto_increment primary key,</span><br><span class=\"line\">  zipcode char(32) not null default \'\',</span><br><span class=\"line\">  address varchar(128) not null default \'\',</span><br><span class=\"line\">  lastname char(64) not null default \'\',</span><br><span class=\"line\">  firstname char(64) not null default \'\',</span><br><span class=\"line\">  birthdate char(10) not null default \'\'</span><br><span class=\"line\">);</span><br><span class=\"line\">#创建索引</span><br><span class=\"line\">alter table hisen_test_explain_people add key(zipcode,firstname,lastname);</span><br><span class=\"line\"></span><br><span class=\"line\">#插入个人信息数据</span><br><span class=\"line\">insert into hisen_test_explain_people</span><br><span class=\"line\">(zipcode,address,lastname,firstname,birthdate)</span><br><span class=\"line\">values</span><br><span class=\"line\">  (\'230031\',\'anhui\',\'zhan\',\'jindong\',\'1989-09-15\'),</span><br><span class=\"line\">  (\'100000\',\'beijing\',\'zhang\',\'san\',\'1987-03-11\'),</span><br><span class=\"line\">  (\'200000\',\'shanghai\',\'wang\',\'wu\',\'1988-08-25\');</span><br><span class=\"line\">#创建汽车信息表</span><br><span class=\"line\">CREATE TABLE hisen_test_explain_people_car(</span><br><span class=\"line\">  people_id bigint,</span><br><span class=\"line\">  plate_number varchar(16) not null default \'\',</span><br><span class=\"line\">  engine_number varchar(16) not null default \'\',</span><br><span class=\"line\">  lasttime timestamp</span><br><span class=\"line\">);</span><br><span class=\"line\">#插入汽车信息</span><br><span class=\"line\">insert into hisen_test_explain_people_car</span><br><span class=\"line\">(people_id,plate_number,engine_number,lasttime)</span><br><span class=\"line\">values</span><br><span class=\"line\">  (1,\'A121311\',\'12121313\',\'2017-11-23 :21:12:21\'),</span><br><span class=\"line\">  (2,\'B121311\',\'1S121313\',\'2016-11-23 :21:12:21\'),</span><br><span class=\"line\">  (3,\'C121311\',\'1211SAS1\',\'2015-11-23 :21:12:21\');</span><br></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">###执行计划样例<br></p><figure class=\"highlight plain\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br><span class=\"line\">11</span><br><span class=\"line\">12</span><br><span class=\"line\">13</span><br><span class=\"line\">14</span><br><span class=\"line\">15</span><br><span class=\"line\">16</span><br><span class=\"line\">17</span><br><span class=\"line\">18</span><br><span class=\"line\">19</span><br><span class=\"line\">20</span><br><span class=\"line\">21</span><br><span class=\"line\">22</span><br><span class=\"line\">23</span><br><span class=\"line\">24</span><br><span class=\"line\">25</span><br><span class=\"line\">26</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">explain select zipcode,firstname,lastname from hisen_test_explain_people;</span><br><span class=\"line\">+----+-------------+---------------------------+------------+-------+---------------+---------+---------+------+------+----------+-------------+</span><br><span class=\"line\">| id | select_type | table                     | partitions | type  | possible_keys | key     | key_len | ref  | rows | filtered | Extra       |</span><br><span class=\"line\">+----+-------------+---------------------------+------------+-------+---------------+---------+---------+------+------+----------+-------------+</span><br><span class=\"line\">|  1 | SIMPLE      | hisen_test_explain_people | NULL       | index | NULL          | zipcode | 160     | NULL |    3 |   100.00 | Using index |</span><br><span class=\"line\">+----+-------------+---------------------------+------------+-------+---------------+---------+---------+------+------+----------+-------------+</span><br><span class=\"line\"></span><br><span class=\"line\">explain select zipcode from (select * from hisen_test_explain_people a) b;</span><br><span class=\"line\">+----+-------------+-------+------------+-------+---------------+---------+---------+------+------+----------+-------------+</span><br><span class=\"line\">| id | select_type | table | partitions | type  | possible_keys | key     | key_len | ref  | rows | filtered | Extra       |</span><br><span class=\"line\">+----+-------------+-------+------------+-------+---------------+---------+---------+------+------+----------+-------------+</span><br><span class=\"line\">|  1 | SIMPLE      | a     | NULL       | index | NULL          | zipcode | 160     | NULL |    3 |   100.00 | Using index |</span><br><span class=\"line\">+----+-------------+-------+------------+-------+---------------+---------+---------+------+------+----------+-------------+</span><br><span class=\"line\"></span><br><span class=\"line\"></span><br><span class=\"line\">id是用来顺序标识整个查询中SELELCT 语句的，通过上面这个简单的嵌套查询可以看到id越大的语句越先执行。</span><br><span class=\"line\">该值可能为NULL，如果这一行用来说明的是其他行的联合结果，比如UNION语句：</span><br><span class=\"line\"></span><br><span class=\"line\">explain select * from hisen_test_explain_people where zipcode = 100000 union select * from hisen_test_explain_people where zipcode = 200000;</span><br><span class=\"line\">+----+--------------+---------------------------+------------+------+---------------+------+---------+------+------+----------+-----------------+</span><br><span class=\"line\">| id | select_type  | table                     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra           |</span><br><span class=\"line\">+----+--------------+---------------------------+------------+------+---------------+------+---------+------+------+----------+-----------------+</span><br><span class=\"line\">|  1 | PRIMARY      | hisen_test_explain_people | NULL       | ALL  | zipcode       | NULL | NULL    | NULL |    3 |    33.33 | Using where     |</span><br><span class=\"line\">|  2 | UNION        | hisen_test_explain_people | NULL       | ALL  | zipcode       | NULL | NULL    | NULL |    3 |    33.33 | Using where     |</span><br><span class=\"line\">|NULL| UNION RESULT | &lt;union1,2&gt;                | NULL       | ALL  | NULL          | NULL | NULL    | NULL | NULL |     NULL | Using temporary |</span><br><span class=\"line\">+----+--------------+---------------------------+------------+------+---------------+------+---------+------+------+----------+-----------------+</span><br></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\"><br></p>',0,0,0,1,1,1,'2019-08-04 16:17:40','2019-08-04 16:17:40','MySQL的EXPLAIN命令用于SQL语句的查询执行计划(QEP)。这条命令的输出结果能够让我们了解MySQL 优化器是如何执行执行下面的SQL1explain select * FROM book where name like \'活%\'得到下面的数据idselect_typetablepart'),(42,1,'单例模式最佳实现方法——枚举','<div class=\"post-body\" itemprop=\"articleBody\" style=\"text-align: justify;\"><p>Effective Java：<br></p><figure class=\"highlight plain\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">单元素的枚举类型已经成为实现Singleton的最佳方法</span><br></pre></td></tr></tbody></table></figure><p></p><p>理由：</p><ol><li>因为枚举单例有序列化和线程安全的保证</li><li>避免反射和并发困扰</li></ol><p>单例模式模式：<a href=\"https://github.com/hisenyuan/IDEAPractice/tree/master/src/main/java/com/hisen/interview/effective/no3enumsingleton\" target=\"_blank\">完整代码+测试</a></p><p>主要代码：</p><figure class=\"highlight java\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br><span class=\"line\">11</span><br><span class=\"line\">12</span><br><span class=\"line\">13</span><br><span class=\"line\">14</span><br><span class=\"line\">15</span><br><span class=\"line\">16</span><br><span class=\"line\">17</span><br><span class=\"line\">18</span><br><span class=\"line\">19</span><br><span class=\"line\">20</span><br><span class=\"line\">21</span><br><span class=\"line\">22</span><br></pre></td><td class=\"code\"><pre><span class=\"line\"><span class=\"keyword\">public</span> <span class=\"class\"><span class=\"keyword\">class</span> <span class=\"title\">EnumSingleton</span> </span>{</span><br><span class=\"line\"></span><br><span class=\"line\">  <span class=\"function\"><span class=\"keyword\">private</span> <span class=\"title\">EnumSingleton</span><span class=\"params\">()</span> </span>{</span><br><span class=\"line\">  }</span><br><span class=\"line\"></span><br><span class=\"line\">  <span class=\"function\"><span class=\"keyword\">public</span> <span class=\"keyword\">static</span> EnumSingleton <span class=\"title\">getInstance</span><span class=\"params\">()</span> </span>{</span><br><span class=\"line\">    <span class=\"keyword\">return</span> Singleton.INSTANCE.getInstance();</span><br><span class=\"line\">  }</span><br><span class=\"line\"></span><br><span class=\"line\">  <span class=\"keyword\">private</span> <span class=\"keyword\">enum</span> Singleton {</span><br><span class=\"line\">    INSTANCE;</span><br><span class=\"line\">    <span class=\"keyword\">private</span> EnumSingleton singleton;</span><br><span class=\"line\"></span><br><span class=\"line\">    Singleton() {</span><br><span class=\"line\">      singleton = <span class=\"keyword\">new</span> EnumSingleton();</span><br><span class=\"line\">    }</span><br><span class=\"line\"></span><br><span class=\"line\">    <span class=\"function\"><span class=\"keyword\">public</span> EnumSingleton <span class=\"title\">getInstance</span><span class=\"params\">()</span> </span>{</span><br><span class=\"line\">      <span class=\"keyword\">return</span> singleton;</span><br><span class=\"line\">    }</span><br><span class=\"line\">  }</span><br><span class=\"line\">}</span><br></pre></td></tr></tbody></table></figure></div><div></div><div></div><footer class=\"post-footer\"><div class=\"post-tags\"><a href=\"https://hisen.me/tags/java/\" rel=\"tag\"># java</a></div></footer>',1,0,0,1,1,1,'2019-08-04 16:19:33','2019-08-04 16:19:19','Effective Java：1单元素的枚举类型已经成为实现Singleton的最佳方法理由：因为枚举单例有序列化和线程安全的保证避免反射和并发困扰单例模式模式：完整代码+测试主要代码：12345678910111213141516171819202122public class EnumSingl'),(43,1,'Spring IOC&AOP 原理','<h2 id=\"简单理解IOC和AOP\" style=\"text-align: justify;\">简单理解IOC和AOP</h2><h3 id=\"IOC：Inversion-of-Control，依赖倒置\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#IOC%EF%BC%9AInversion-of-Control%EF%BC%8C%E4%BE%9D%E8%B5%96%E5%80%92%E7%BD%AE\" class=\"headerlink\" title=\"IOC：Inversion of Control，依赖倒置\"></a>IOC：Inversion of Control，依赖倒置</h3><h4 id=\"生活场景助记\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#%E7%94%9F%E6%B4%BB%E5%9C%BA%E6%99%AF%E5%8A%A9%E8%AE%B0\" class=\"headerlink\" title=\"生活场景助记\"></a>生活场景助记</h4><p style=\"text-align: justify;\">如有有天你想喝一瓶矿泉水，你可以去小区便利店，告诉老板你要买矿泉水，然后老板卖给你。</p><p style=\"text-align: justify;\">但是你可能需要想这下雨天怎么去小卖部？是否要带伞？去了之后是否有我想要的水等一系列问题。</p><p style=\"text-align: justify;\">解决这个问题：</p><ol style=\"text-align: justify;\"><li>使用外卖！到平台注册，告诉平台你需要什么水。</li><li>平台给你送到家，你只管付钱拿到水之后直接喝，不用考虑上述问题。</li></ol><p style=\"text-align: justify;\">是不是和Spring的做法很类似呢？Spring就是小卖部，你就是A对象，水就是B对象<br>第一：在Spring中声明一个类：A<br>第二：告诉Spring，A需要B<br><a id=\"more\"></a><br>假设A是UserAction类，而B是UserService类<br></p><figure class=\"highlight plain\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br></pre></td><td class=\"code\"><pre><span class=\"line\"><bean id=\"userService\" class=\"org.leadfar.service.UserService\"></bean></span><br><span class=\"line\"><bean id=\"documentService\" class=\"org.leadfar.service.DocumentService\"></bean></span><br><span class=\"line\"><bean id=\"orgService\" class=\"org.leadfar.service.OrgService\"></bean></span><br><span class=\"line\"></span><br><span class=\"line\"><bean id=\"userAction\" class=\"org.leadfar.web.UserAction\"></bean></span><br><span class=\"line\">     <property name=\"userService\" ref=\"userService\"></property></span><br><span class=\"line\"></span><br></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">在Spring这个商店（工厂）中，有很多对象/服务：userService,documentService,orgService</p><p style=\"text-align: justify;\">也有很多会员：userAction等等</p><p style=\"text-align: justify;\">声明userAction需要userService即可，</p><p style=\"text-align: justify;\">Spring将通过你给它提供的通道主动把userService送上门来，因此UserAction的代码示例类似如下所示：<br></p><figure class=\"highlight plain\" style=\"text-align: justify;\"><table class=\"layui-table\"><tbody><tr><td class=\"gutter\"><pre style=\"text-align: right;\"><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">package org.leadfar.web;</span><br><span class=\"line\">public class UserAction{</span><br><span class=\"line\">     private UserService userService;</span><br><span class=\"line\">     public String login(){</span><br><span class=\"line\">          userService.valifyUser(xxx);</span><br><span class=\"line\">     }</span><br><span class=\"line\">     public void setUserService(UserService userService){ </span><br><span class=\"line\">          this.userService = userService;</span><br><span class=\"line\">     }</span><br><span class=\"line\">}</span><br></pre></td></tr></tbody></table></figure><p style=\"text-align: justify;\"></p><p style=\"text-align: justify;\">在这段代码里面，你无需自己创建UserService对象（Spring作为背后无形的手，把UserService对象通过你定义的setUserService()方法把它主动送给了你，这就叫依赖注入！）</p><p style=\"text-align: justify;\">Spring依赖注入的实现技术是：<span>动态代理</span></p><h3 id=\"AOP-Aspect-Oriented-Programming-面向切面编程\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#AOP-Aspect-Oriented-Programming-%E9%9D%A2%E5%90%91%E5%88%87%E9%9D%A2%E7%BC%96%E7%A8%8B\" class=\"headerlink\" title=\"AOP:Aspect Oriented Programming,面向切面编程\"></a>AOP:Aspect Oriented Programming,面向切面编程</h3><p style=\"text-align: justify;\">你只要做你关注的事情，其他的事情一概不管，让AOP帮你去做</p><p style=\"text-align: justify;\">你可以灵活组合各种杂七杂八的事情交给AOP去做，而不会干扰你关注的事情。</p><p style=\"text-align: justify;\">从Spring的角度看，AOP最大的用途就在于提供了事务管理的能力。</p><p style=\"text-align: justify;\">事务管理就是一个关注点，你的正事就是去访问数据库，而你不想管事务（太烦）</p><p style=\"text-align: justify;\">所以，Spring在你访问数据库之前，自动帮你开启事务，当你访问数据库结束之后，自动帮你提交/回滚事务！</p><h2 id=\"ICO-和-AOP的原理\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#ICO-%E5%92%8C-AOP%E7%9A%84%E5%8E%9F%E7%90%86\" class=\"headerlink\" title=\"ICO 和 AOP的原理\"></a>ICO 和 AOP的原理</h2><h3 id=\"IoC的实现形式有两种：\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#IoC%E7%9A%84%E5%AE%9E%E7%8E%B0%E5%BD%A2%E5%BC%8F%E6%9C%89%E4%B8%A4%E7%A7%8D%EF%BC%9A\" class=\"headerlink\" title=\"IoC的实现形式有两种：\"></a>IoC的实现形式有两种：</h3><ol style=\"text-align: justify;\"><li>依赖查找：容器提供回调接口和上下文环境给组件。EJB和Apache Avalon都是使用这种方式。</li><li>依赖注入：组件不做定位查询，只是提供普通的Java方法让容器去决定依赖关系。<br>容器全权负责组件的装配，它会把符合依赖关系的对象通过JavaBean属性或者构造子传递给需要的对象。</li></ol><p style=\"text-align: justify;\">通过JavaBean属性注射依赖关系的做法称为设值方法注入（Setter Injection）；</p><p style=\"text-align: justify;\">将依赖关系作为构造子参数传入的做法称为构造子注入（Constructor Injection）。</p><h3 id=\"AP实现有多种方案，主要包括：\" style=\"text-align: justify;\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#AP%E5%AE%9E%E7%8E%B0%E6%9C%89%E5%A4%9A%E7%A7%8D%E6%96%B9%E6%A1%88%EF%BC%8C%E4%B8%BB%E8%A6%81%E5%8C%85%E6%8B%AC%EF%BC%9A\" class=\"headerlink\" title=\"AP实现有多种方案，主要包括：\"></a>AP实现有多种方案，主要包括：</h3><ol style=\"text-align: justify;\"><li>AspectJ (TM)：创建于Xerox PARC. 有近十年历史，技术成熟。但其过于复杂；破坏封装；而且需要专门的Java编译器，易用性较差。</li><li>动态代理AOP：使用JDK提供的动态代理API或字节码Bytecode处理技术来实现。基于动态代理API的具体项目有： JBoss 4.0 JBoss 4.0服务器。</li><li>基于字节码的AOP，例如：Aspectwerkz、CGlib、Spring等。<h2 id=\"后期准备补充\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#%E5%90%8E%E6%9C%9F%E5%87%86%E5%A4%87%E8%A1%A5%E5%85%85\" class=\"headerlink\" title=\"后期准备补充\"></a>后期准备补充</h2>用过spring的朋友都知道spring的强大和高深，都觉得深不可测，</li></ol><p style=\"text-align: justify;\">其实当你真正花些时间读一读源码就知道它的一些技术实现其实是建立在一些最基本的技术之上而已；<br>例如：</p><ol style=\"text-align: justify;\"><li>AOP(面向方面编程)的实现是建立在CGLib提供的类代理和jdk提供的接口代理</li><li>IOC(控制反转)的实现建立在工厂模式、Java反射机制和jdk的操作XML的DOM解析方式.<h2 id=\"参考\"><a href=\"https://hisen.me/20171120-Spring%20-%20IOC%E5%92%8CAOP%E7%9A%84%E5%8E%9F%E7%90%86/#%E5%8F%82%E8%80%83\" class=\"headerlink\" title=\"参考\"></a>参考</h2></li><li><a href=\"https://www.cnblogs.com/damowang/p/4305107.html\" target=\"_blank\" rel=\"noopener\">https://www.cnblogs.com/damowang/p/4305107.html</a></li><li><a href=\"http://blog.csdn.net/linxijun120903/article/details/56487073\" target=\"_blank\" rel=\"noopener\">http://blog.csdn.net/linxijun120903/article/details/56487073</a></li></ol>',2,0,0,1,1,1,'2019-08-04 16:21:02','2019-08-04 16:20:37','简单理解IOC和AOPIOC：Inversion of Control，依赖倒置生活场景助记如有有天你想喝一瓶矿泉水，你可以去小区便利店，告诉老板你要买矿泉水，然后老板卖给你。但是你可能需要想这下雨天怎么去小卖部？是否要带伞？去了之后是否有我想要的水等一系列问题。解决这个问题：使用外卖！到平台注册，');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category_ref`
--

DROP TABLE IF EXISTS `article_category_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category_ref` (
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category_ref`
--

LOCK TABLES `article_category_ref` WRITE;
/*!40000 ALTER TABLE `article_category_ref` DISABLE KEYS */;
INSERT INTO `article_category_ref` VALUES (35,1),(35,3),(36,1),(36,4),(37,1),(37,5),(38,1),(38,6),(39,10),(39,12),(40,10),(40,12),(41,10),(41,12),(42,20),(42,22),(43,50),(43,51);
/*!40000 ALTER TABLE `article_category_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag_ref`
--

DROP TABLE IF EXISTS `article_tag_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tag_ref` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag_ref`
--

LOCK TABLES `article_tag_ref` WRITE;
/*!40000 ALTER TABLE `article_tag_ref` DISABLE KEYS */;
INSERT INTO `article_tag_ref` VALUES (35,1),(35,2),(36,3),(37,43),(38,44),(39,45),(40,45),(41,45),(42,46),(43,47);
/*!40000 ALTER TABLE `article_tag_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_pid` int(11) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_order` int(11) unsigned DEFAULT '1',
  `category_icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100000016 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,0,'Java知识点','Java知识点',1,'fa fa-coffee'),(2,1,'Java 基础','',1,''),(3,1,'Java 容器','',1,''),(4,1,'Java 并发','',1,''),(5,1,'Java 虚拟机','',1,''),(6,1,'Java IO','',1,''),(10,0,'计算机基础','计算机基础',1,'fa fa-cubes'),(11,10,'数据结构与算法','',1,''),(12,10,'数据库','',1,''),(13,10,'计算机网络','',1,''),(14,10,'操作系统','',1,''),(20,0,'面向对象','面向对象',1,'fa fa-circle'),(21,20,'面向对象思想','',NULL,''),(22,20,'设计模式','',NULL,''),(50,0,'框架及相关技术','',1,'fa-snowflake-o fa'),(51,50,'Spring','',NULL,''),(52,50,'SpringMVC','',NULL,''),(53,50,'MyBatis','',NULL,''),(54,50,'Spring Boot','',NULL,''),(55,50,'Dubbo','',NULL,''),(56,50,'ZooKeeper','',NULL,'');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_pid` int(11) unsigned DEFAULT '0',
  `comment_pname` varchar(255) DEFAULT NULL,
  `comment_article_id` int(11) unsigned DEFAULT NULL,
  `comment_author_name` varchar(50) DEFAULT NULL,
  `comment_author_email` varchar(50) DEFAULT NULL,
  `comment_author_url` varchar(50) DEFAULT NULL,
  `comment_author_avatar` varchar(100) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_agent` varchar(200) DEFAULT NULL,
  `comment_ip` varchar(50) DEFAULT NULL,
  `comment_create_time` datetime DEFAULT NULL,
  `comment_role` int(1) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (34,0,'',37,'流年','2864156644@qq.com','','/uploads/2019\\7/logo.jpg','JVM博大精深',NULL,'0:0:0:0:0:0:0:1','2019-08-05 16:09:12',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `link_image` varchar(255) DEFAULT NULL,
  `link_description` varchar(255) DEFAULT NULL,
  `link_owner_nickname` varchar(40) DEFAULT NULL,
  `link_owner_contact` varchar(255) DEFAULT NULL,
  `link_update_time` datetime DEFAULT NULL,
  `link_create_time` datetime DEFAULT NULL,
  `link_order` int(2) unsigned DEFAULT '1',
  `link_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `link_name` (`link_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,'https://www.google.com','Google',NULL,'Google大法好',NULL,'','2019-07-20 19:37:53','2017-10-07 16:29:35',5,1),(9,'https://leetcode-cn.com','力扣',NULL,'刷题大法好',NULL,'','2019-07-20 19:37:42','2019-07-20 19:36:24',1,1),(6,'https://www.nowcoder.com','牛客网',NULL,'牛客网',NULL,'','2019-07-20 19:36:33','2017-10-07 16:51:49',2,1),(10,'https://leetcode.com/problemset','LeetCode',NULL,'刷题大法好',NULL,'','2019-07-20 19:37:35','2019-07-20 19:37:35',1,1),(11,'https://github.com/','GitHub',NULL,'全球最大xx交友社区',NULL,'','2019-07-20 19:39:00','2019-07-20 19:39:00',6,1);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_level` int(11) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'留言板','/message',2,'fa fa-comment',1),(3,'关于本站','/aboutSite',1,'fa fa-info',1),(4,'文章归档','/articleFile',1,'fa-list-alt fa',2),(5,'申请友链','/applyLink',1,'fa fa-link',3);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_content` varchar(10000) DEFAULT NULL,
  `notice_create_time` datetime DEFAULT NULL,
  `notice_update_time` datetime DEFAULT NULL,
  `notice_status` int(1) unsigned DEFAULT '1',
  `notice_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'你今天刷题了嘛?','<p>吾日三省吾身，你今天刷题了嘛？</p><p><br></p>','2017-10-06 23:44:35','2019-07-20 20:30:38',1,1),(3,'你今天学习了嘛？','<p>吾日三省吾身，你今天学习了嘛？</p>','2018-11-25 20:28:33','2019-07-20 20:28:44',1,2),(4,'你今天有思考嘛？','吾日三省吾身，你今天有思考嘛？','2019-07-20 20:30:24','2019-07-20 20:30:30',1,3);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_site_title` varchar(255) DEFAULT NULL,
  `option_site_descrption` varchar(255) DEFAULT NULL,
  `option_meta_descrption` varchar(255) DEFAULT NULL,
  `option_meta_keyword` varchar(255) DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) DEFAULT NULL,
  `option_aboutsite_title` varchar(255) DEFAULT NULL,
  `option_aboutsite_content` varchar(255) DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) DEFAULT NULL,
  `option_aboutsite_github` varchar(255) DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) DEFAULT NULL,
  `option_tongji` varchar(255) DEFAULT NULL,
  `option_status` int(1) DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'流年博客','但行好事，莫问前程','流年博客,一个简洁的Java博客','博客,Java博客','/uploads/2019\\7/logo(1).jpg','流年','不忘初心，方得始终','/uploads/2019\\7/weixin.jpg','','DuiBenErFen','',NULL,1);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_key` varchar(50) DEFAULT NULL,
  `page_title` varchar(50) DEFAULT NULL,
  `page_content` mediumtext,
  `page_create_time` datetime DEFAULT NULL,
  `page_update_time` datetime DEFAULT NULL,
  `page_view_count` int(10) unsigned DEFAULT '0',
  `page_comment_count` int(5) unsigned DEFAULT '0',
  `page_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'map','站点地图',NULL,NULL,NULL,0,0,2),(2,'articleFile','文章归档',NULL,NULL,NULL,0,0,2),(3,'message','留言板',NULL,NULL,NULL,0,0,2),(4,'applyLink','申请友链',NULL,NULL,NULL,0,0,2),(5,'aboutSite','关于本站','<h2>个人博客系统项目</h2><p><p class=\"MsoNormal\" align=\"left\" style=\"text-align: left;\"><b><span>项目简述：</span></b><span>对自己学习过的知识、解决过的问题进行记录总结无疑是很好的正反馈，为此基于</span><span lang=\"EN-US\">Spring + SpringMVC +\r\nMyBatis</span><span>框架搭建个人博客系统，数据库使用</span><span lang=\"EN-US\">MySQL</span><span>与</span><span lang=\"EN-US\">Redis</span><span>，整个项目工程使用</span><span lang=\"EN-US\">Maven</span><span>进行管理。</span><span lang=\"EN-US\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-align: left;\"><b><span>工作内容</span><span lang=\"EN-US\">: <span>&nbsp;</span></span></b><span lang=\"EN-US\">1. </span><span>游客可以浏览博文，增加博文的浏览量，给博文点赞，留下评论，并输入关键字搜索相应博文；用户登录后可以写博文并发布，对博文归类管理，回复评论。</span><span lang=\"EN-US\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-align: left;\"><span lang=\"EN-US\">2. </span><span>使用拦截器验证用户权限，拦截器对进入后台的请求进行拦截，通过</span><span lang=\"EN-US\">Session</span><span>判断用户有无登录，若还未登录则跳转至登录页面；根据搜索的关键词，对博文标题进行模糊匹配，返回符合条件的博文，并且能根据博文数量进行分页显示；配置静态资源虚拟路径，可为博文配上插图，并正常显示。</span><span lang=\"EN-US\"><o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" align=\"left\" style=\"text-align: left;\"><span lang=\"EN-US\">3. </span><span>博客系统运行时可以实时接收分布式配置管理平台的配置信息，配置更新后，实时生效。</span><span lang=\"EN-US\"><o:p></o:p></span></p><br></p>','2017-10-06 23:40:35','2019-08-04 16:31:28',NULL,NULL,1),(7,'hello','sdrfe','sergv','2018-12-21 21:46:50','2019-07-19 19:58:13',NULL,NULL,1);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) DEFAULT NULL,
  `tag_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'HashMap',NULL),(2,'源码阅读',NULL),(3,'Volatile',''),(43,'JVM',''),(44,'IO',''),(45,'MySQL',''),(46,'单例模式',''),(47,'Spring','');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nickname` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  `user_url` varchar(100) DEFAULT '',
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_last_login_ip` varchar(255) DEFAULT NULL,
  `user_register_time` datetime DEFAULT NULL,
  `user_last_login_time` datetime DEFAULT NULL,
  `user_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456','流年','2864156644@qq.com','','/uploads/2019\\7/logo.jpg','0:0:0:0:0:0:0:1','2017-10-06 21:56:33','2019-08-05 16:25:04',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-05 17:03:39
