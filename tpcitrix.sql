/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tpcitrix

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-07-08 11:34:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '文章名称',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `article_cate_id` int(11) NOT NULL COMMENT '上级分类',
  `thumb` int(11) DEFAULT NULL COMMENT '缩略图',
  `content` text COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0待审核1已审核',
  `is_top` int(1) NOT NULL DEFAULT '0' COMMENT '1置顶0普通',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  `skim_sum` int(11) DEFAULT '0' COMMENT '浏览量',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_top` (`is_top`) USING BTREE,
  KEY `article_cate_id` (`article_cate_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='文章,新闻表';

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES ('1', '字符串拆分explode', '字符串拆分explode', '字符串拆分explode', '7', '86', '<pre class=\"brush:php;toolbar:false;\">explode(separator,string,limit)\r\n参数描述\r\nseparator&nbsp;&nbsp;&nbsp;&nbsp;必需。规定在哪里分割字符串。&nbsp;&nbsp;&nbsp;&nbsp;\r\nstring&nbsp;&nbsp;&nbsp;&nbsp;必需。要分割的字符串。&nbsp;&nbsp;&nbsp;&nbsp;\r\nlimit&nbsp;&nbsp;&nbsp;&nbsp;可选。规定所返回的数组元素的数目。可能的值：大于&nbsp;0&nbsp;-&nbsp;返回包含最多&nbsp;limit&nbsp;个元素的数组小于&nbsp;0&nbsp;-&nbsp;返回包含除了最后的&nbsp;-limit&nbsp;个元素以外的所有元素的数组0&nbsp;-&nbsp;返回包含一个元素的数组</pre><p><br/></p>', '1562204425', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('2', '数组转字符串implode', '数组转字符串implode', '数组转字符串implode', '7', '86', '<p>implode(separator,array)</p><p>参数&nbsp; 描述</p><p>separator&nbsp; &nbsp;可选。规定数组元素之间放置的内容。默认是 &quot;&quot;（空字符串）。</p><p>array&nbsp; &nbsp;必需。要组合为字符串的数组。</p><p><br/></p>', '1562204817', '1562204833', '1', '0', '11', '0');
INSERT INTO `tp_article` VALUES ('3', '随机数生成rand', '随机数生成rand', '随机数生成rand', '7', '86', '<p>rand(min,max)</p><p>参数&nbsp; 描述</p><p>min,max 可选。规定随机数产生的范围。</p><p><br/></p>', '1562204918', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('4', '循环for ', '循环for ', '循环for ', '7', '86', '<p>for (init counter; test counter; increment counter) {</p><p>&nbsp; code to be executed;</p><p>}</p><p>参数：</p><p><br/></p><p>init counter：初始化循环计数器的值</p><p>test counter：: 评估每个循环迭代。如果值为 TRUE，继续循环。如果它的值为 FALSE，循环结束。</p><p>increment counter：增加循环计数器的值</p><p><br/></p>', '1562205022', '1562205123', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('5', '<marquee>滚动文字</marquee>', '<marquee>滚动文字</marquee>', '<marquee>滚动文字</marquee>', '35', '86', '<p>&lt;marquee&gt;滚动文字&lt;/marquee&gt;</p>', '1562205308', '1562291960', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('7', '邮箱正则表达式', '邮箱正则表达式', '邮箱正则表达式', '44', '83', '<p><span class=\"hl-var\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(0, 0, 139); font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14.3px; white-space: pre-wrap;\"></span></p><pre class=\"brush:php;toolbar:false\">$mail&nbsp;=&nbsp;&#39;2722279500@qq.com&#39;;&nbsp;&nbsp;//邮箱地址\r\n$pattern&nbsp;=&nbsp;&quot;/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,})$/&quot;;\r\npreg_match($pattern,&nbsp;$mail,&nbsp;$matches);\r\nvar_dump($matches);</pre><p><span class=\"hl-code\" style=\"border: 0px; margin: 0px; padding: 0px; color: gray; font-family: Menlo, Monaco, Consolas, &quot;Andale Mono&quot;, &quot;lucida console&quot;, &quot;Courier New&quot;, monospace; font-size: 14.3px; white-space: pre-wrap;\"></span><br/></p>', '1562205789', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('8', '手机号正则表达式', '手机号正则表达式', '手机号正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;手机是18158863751&#39;;\r\n&nbsp;preg_match_all(&quot;/^1[34578]d{9}$/&quot;,&nbsp;$str,&nbsp;$mobiles);\r\nvar_dump($mobiles);</pre><p><br/></p>', '1562205888', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('9', '匹配正整数正则表达式', '匹配正整数正则表达式', '匹配正整数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^[1-9]d*$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206037', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('10', '匹配负整数正则表达式', '匹配负整数正则表达式', '匹配负整数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^-[1-9]d*$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206091', '1562206165', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('11', '匹配整数正则表达式', '匹配整数正则表达式', '匹配整数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^-?[1-9]d*$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206155', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('12', '匹配非负整数（正整数 + 0）正则表达式', '匹配非负整数（正整数 + 0）正则表达式', '匹配非负整数（正整数 + 0）正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^[1-9]d*|0$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206212', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('13', '匹配非正整数（负整数 + 0） 正则表达式', '匹配非正整数（负整数 + 0） 正则表达式', '匹配非正整数（负整数 + 0） 正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^-[1-9]d*|0$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206249', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('14', '匹配正浮点数正则表达式', '匹配正浮点数正则表达式', '匹配正浮点数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^[1-9]d*.d*|0.d*[1-9]d*$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206284', '1562206529', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('15', '匹配负浮点数正则表达式', '匹配负浮点数正则表达式', '匹配负浮点数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^-([1-9]d*.d*|0.d*[1-9]d*)$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206342', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('16', '匹配浮点数正则表达式', '匹配浮点数正则表达式', '匹配浮点数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^-?([1-9]d*.d*|0.d*[1-9]d*|0?.0+|0)$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206377', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('17', '匹配非负浮点数（正浮点数 + 0）正则表达式', '匹配非负浮点数（正浮点数 + 0）正则表达式', '匹配非负浮点数（正浮点数 + 0）正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^[1-9]d*.d*|0.d*[1-9]d*|0?.0+|0$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206414', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('18', '匹配非正浮点数（负浮点数 + 0）正则表达式', '匹配非正浮点数（负浮点数 + 0）正则表达式', '匹配非正浮点数（负浮点数 + 0）正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^(-([1-9]d*.d*|0.d*[1-9]d*))|0?.0+|0$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206470', '1562291947', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('19', '验证数字正则表达式', '验证数字正则表达式', '验证数字正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^[0-9]*$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206516', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('20', '验证n位的数字正则表达式', '验证n位的数字正则表达式', '验证n位的数字正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^d{n}$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206589', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('21', '验证至少n位数字正则表达式', '验证至少n位数字正则表达式', '验证至少n位数字正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^d{n,}$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206627', '0', '1', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('22', '验证m-n位的数字正则表达式', '验证m-n位的数字正则表达式', '验证m-n位的数字正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^d{m,n}$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206665', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('23', '验证零和非零开头的数字', '验证零和非零开头的数字', '验证零和非零开头的数字', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^(0|[1-9][0-9]*)$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206711', '0', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('24', '验证有两位小数的正实数', '验证有两位小数的正实数', '验证有两位小数的正实数', '44', '85', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^[0-9]+(.[0-9]{2})?$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206738', '1562291876', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('25', '验证有1-3位小数的正实数正则表达式', '验证有1-3位小数的正实数正则表达式', '验证有1-3位小数的正实数正则表达式', '45', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^[0-9]+(.[0-9]{1,3})?$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206772', '1562291845', '0', '1', '10', '0');
INSERT INTO `tp_article` VALUES ('26', '验证非零的正整数正则表达式', '验证非零的正整数正则表达式', '验证非零的正整数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^+?[1-9][0-9]*$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206810', '0', '1', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('27', '验证非零的负整数正则表达式', '验证非零的负整数正则表达式', '验证非零的负整数正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^-[1-9][0-9]*$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206844', '0', '1', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('28', '验证非负整数（正整数 + 0）正则表达式', '验证非负整数（正整数 + 0）正则表达式', '验证非负整数（正整数 + 0）正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false;\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^d+$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206878', '0', '1', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('29', '验证非正整数（负整数 + 0）正则表达式', '验证非正整数（负整数 + 0）正则表达式', '验证非正整数（负整数 + 0）正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^((-d+)|(0+))$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206909', '0', '1', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('30', '验证长度为3的字符正则表达式', '验证长度为3的字符正则表达式', '验证长度为3的字符正则表达式', '44', '83', '<pre class=\"brush:php;toolbar:false\">$str&nbsp;=&nbsp;&#39;111111---000333&#39;;\r\npreg_match_all(&quot;/^.{3}$/&quot;,&nbsp;$str,&nbsp;$result);\r\nvar_dump($result);</pre><p><br/></p>', '1562206948', '0', '1', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('31', 'onchangeHTML 元素已被改变触发', 'onchangeHTML 元素已被改变触发', 'onchangeHTML 元素已被改变触发', '77', '87', '<pre class=\"brush:html;toolbar:false\">&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;name&quot;&nbsp;onchange=&quot;click()&quot;&gt;\r\n&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;\r\nfunction&nbsp;click()\r\n{\r\n&nbsp;&nbsp;&nbsp;&nbsp;console.log(&quot;触发&quot;);\r\n}\r\n&lt;/script&gt;</pre><p><br/></p>', '1562207099', '1562291991', '1', '0', '12', '0');
INSERT INTO `tp_article` VALUES ('32', 'onclick用户点击了 HTML 元素', 'onclick用户点击了 HTML 元素', 'onclick用户点击了 HTML 元素', '77', '88', '<pre class=\"brush:php;toolbar:false\">&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;name&quot;&nbsp;onclick=&quot;click()&quot;&gt;\r\n&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;\r\nfunction&nbsp;click()\r\n{\r\n&nbsp;&nbsp;&nbsp;&nbsp;console.log(&quot;触发&quot;);\r\n}\r\n&lt;/script&gt;</pre><p><br/></p>', '1562207147', '1562291998', '1', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('33', 'onmouseover	用户把鼠标移动到 HTML 元素上', 'onmouseover	用户把鼠标移动到 HTML 元素上', 'onmouseover	用户把鼠标移动到 HTML 元素上', '77', '55', '<pre class=\"brush:php;toolbar:false\">&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;name&quot;&nbsp;onmouseover=&quot;click()&quot;&gt;\r\n&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;\r\nfunction&nbsp;click()\r\n{\r\n&nbsp;&nbsp;&nbsp;&nbsp;console.log(&quot;触发&quot;);\r\n}\r\n&lt;/script&gt;</pre><p><br/></p>', '1562207356', '1562224551', '0', '0', '102', '0');
INSERT INTO `tp_article` VALUES ('34', 'onmouseout  用户把鼠标移开 HTML 元素', 'onmouseout  用户把鼠标移开 HTML 元素', 'onmouseout  用户把鼠标移开 HTML 元素', '77', '84', '<pre class=\"brush:html;toolbar:false\">&lt;input&nbsp;type=&quot;text&quot;&nbsp;name=&quot;name&quot;&nbsp;onmouseout=&quot;click()&quot;&gt;\r\n&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;&nbsp;onmouseout&nbsp;&nbsp;用户把鼠标移开&nbsp;HTML&nbsp;元素\r\nfunction&nbsp;click()\r\n{\r\n&nbsp;&nbsp;&nbsp;&nbsp;console.log(&quot;触发&quot;);\r\n}\r\n&lt;/script&gt;</pre><p><br/></p>', '1562207432', '1562291853', '0', '0', '10', '0');
INSERT INTO `tp_article` VALUES ('35', 'onkeydown   用户按下键盘按键', 'onkeydown   用户按下键盘按键', 'onkeydown   用户按下键盘按键', '77', '49', '<pre class=\"brush:html;toolbar:false\">参数描述\r\nSomeJavaScriptCode&nbsp;&nbsp;&nbsp;&nbsp;必需。规定该事件发生时执行的&nbsp;JavaScript。\r\n支持该事件的&nbsp;HTML&nbsp;标签：\r\n&lt;a&gt;,&nbsp;&lt;acronym&gt;,&nbsp;&lt;address&gt;,&nbsp;&lt;area&gt;,&nbsp;&lt;b&gt;,&nbsp;&lt;bdo&gt;,&nbsp;&lt;big&gt;,&nbsp;&lt;blockquote&gt;,&nbsp;&lt;body&gt;,&nbsp;\r\n&lt;button&gt;,&nbsp;&lt;caption&gt;,&nbsp;&lt;cite&gt;,&nbsp;&lt;code&gt;,&nbsp;&lt;dd&gt;,&nbsp;&lt;del&gt;,&nbsp;&lt;dfn&gt;,&nbsp;&lt;div&gt;,&nbsp;&lt;dt&gt;,&nbsp;&lt;em&gt;,&nbsp;\r\n&lt;fieldset&gt;,&nbsp;&lt;form&gt;,&nbsp;&lt;h1&gt;&nbsp;to&nbsp;&lt;h6&gt;,&nbsp;&lt;hr&gt;,&nbsp;&lt;i&gt;,&nbsp;&lt;input&gt;,&nbsp;&lt;kbd&gt;,&nbsp;&lt;label&gt;,&nbsp;&lt;legend&gt;,&nbsp;\r\n&lt;li&gt;,&nbsp;&lt;map&gt;,&nbsp;&lt;object&gt;,&nbsp;&lt;ol&gt;,&nbsp;&lt;p&gt;,&nbsp;&lt;pre&gt;,&nbsp;&lt;q&gt;,&nbsp;&lt;samp&gt;,&nbsp;&lt;select&gt;,&nbsp;&lt;small&gt;,&nbsp;\r\n&lt;span&gt;,&nbsp;&lt;strong&gt;,&nbsp;&lt;sub&gt;,&nbsp;&lt;sup&gt;,&nbsp;&lt;table&gt;,&nbsp;&lt;tbody&gt;,&nbsp;&lt;td&gt;,&nbsp;&lt;textarea&gt;,&nbsp;&lt;tfoot&gt;,&nbsp;\r\n&lt;th&gt;,&nbsp;&lt;thead&gt;,&nbsp;&lt;tr&gt;,&nbsp;&lt;tt&gt;,&nbsp;&lt;ul&gt;,&nbsp;&lt;var&gt;\r\n支持该事件的&nbsp;JavaScript&nbsp;对象：\r\ndocument,&nbsp;image,&nbsp;link,&nbsp;textarea</pre><p><br/></p><p><br/></p><p><br/></p>', '1562207492', '1562207638', '1', '1', '10', '0');
INSERT INTO `tp_article` VALUES ('36', 'onload  浏览器已经完成页面加载', 'onload  浏览器已经完成页面加载', 'onload  浏览器已经完成页面加载', '77', '50', '<pre class=\"brush:html;toolbar:false\">&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;\r\nwindow.onload=function(){\r\n&nbsp;&nbsp;&nbsp;&nbsp;console.log(&quot;触发&quot;);\r\n};\r\n&lt;/script&gt;</pre><p><br/></p>', '1562207558', '0', '0', '1', '10', '0');

-- ----------------------------
-- Table structure for tp_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_article_cate`;
CREATE TABLE `tp_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `keyword` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) DEFAULT '1' COMMENT '文章列表样式1列表2九宫格',
  `is_top_index` tinyint(1) DEFAULT '0' COMMENT '首页推荐1已推荐',
  `is_top_mobile` tinyint(1) DEFAULT '0' COMMENT '手机端推荐',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='文章,新闻分类表';

-- ----------------------------
-- Records of tp_article_cate
-- ----------------------------
INSERT INTO `tp_article_cate` VALUES ('71', '特效', '特效', '特效', '34', '1562201395', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('30', '前端技术', '前端技术', '前端技术', '0', '1562146196', '0', '100', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('25', 'thinkphp', 'thinkphp', 'thinkphp', '8', '1562146122', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('26', 'Yii', 'Yii', 'Yii', '8', '1562146130', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('27', 'tpshop', 'tpshop', 'tpshop', '8', '1562146142', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('28', 'ecshop', 'ecshop', 'ecshop', '8', '1562146149', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('32', 'jquery', 'jquery', 'jquery', '30', '1562146217', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('31', 'html', 'html', 'html', '30', '1562146206', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('29', 'smarty', 'smarty', 'smarty', '8', '1562146170', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('33', 'javascript', 'javascript', 'javascript', '30', '1562146234', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('34', 'h5', 'h5', 'h5', '30', '1562146245', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('35', 'div+css', 'div+css', 'div+css', '30', '1562146257', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('36', 'mysql', 'mysql', 'mysql', '3', '1562146278', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('37', 'MongoDB', 'MongoDB', 'MongoDB', '3', '1562146294', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('38', 'redis', 'redis', 'redis', '4', '1562146314', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('39', 'memcache', 'memcache', 'memcache', '4', '1562146321', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('8', 'php框架', 'php框架', 'php框架', '1', '1562145121', '1562145134', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('3', '数据库', 'mysql，MongoDB', '数据库大全', '0', '1562144716', '1562145007', '98', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('4', '缓存技术', 'redis，memcache', '缓存技术大全', '0', '1562144761', '0', '97', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('7', 'php函数', 'php函数', 'php函数', '1', '1562145087', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('1', 'php', 'php函数，php代码，php框架，phpcms，thikphp，ecshop，tpshop，smarty', 'php大全', '0', '1562144595', '1562144945', '99', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('72', '小游戏', '小游戏', '小游戏', '34', '1562201405', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('43', '正则表达式', '正则表达式', '正则表达式', '0', '1562146440', '0', '96', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('44', 'php正则表达式', 'php正则表达式', 'php正则表达式', '43', '1562146451', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('45', 'javascript，jquery', 'javascript，jquery正则表达式', 'javascript，jquery正则表达式', '43', '1562146481', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('46', '人生杂谈', '人生杂谈', '人生杂谈', '0', '1562146520', '1562223350', '0', '2', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('47', '心灵鸡汤', '心灵鸡汤', '心灵鸡汤', '0', '1562146528', '1562223307', '0', '2', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('48', '人生百科', '人生百科', '人生百科', '0', '1562146549', '1562223300', '0', '2', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('66', '使用', '使用', '使用', '39', '1562201291', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('64', '使用', '使用', '使用', '38', '1562201274', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('77', '事件', '事件', '事件', '33', '1562201500', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('65', '安装', '安装', '安装', '39', '1562201283', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('63', '安装', '安装', '安装', '38', '1562201264', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('76', '函数', '函数', '函数', '33', '1562201493', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('73', '标签', '标签', '标签', '31', '1562201416', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('74', '函数', '函数', '函数', '32', '1562201467', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('67', '安装', '安装', '安装', '36', '1562201304', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('68', '使用', '使用', '使用', '36', '1562201313', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('69', '安装', '安装', '安装', '37', '1562201322', '0', '0', '1', '0', '0');
INSERT INTO `tp_article_cate` VALUES ('70', '使用', '使用', '使用', '37', '1562201330', '0', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for tp_sys_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_admin`;
CREATE TABLE `tp_sys_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `name` varchar(100) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `thumb` int(11) NOT NULL DEFAULT '1' COMMENT '管理员头像',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登录ip',
  `admin_menu_id` int(2) NOT NULL DEFAULT '1' COMMENT '管理员分组',
  `login_num` int(11) DEFAULT '0' COMMENT '登录次数',
  `token` varchar(255) NOT NULL COMMENT 'token登录令牌(单点登录)',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `admin_menu_id` (`admin_menu_id`) USING BTREE,
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Records of tp_sys_admin
-- ----------------------------
INSERT INTO `tp_sys_admin` VALUES ('1', 'tpcitrix', '2722279500@qq.com', '77745c56ea5fee84a3a1aa8963ebe6e0', '97', '1562061093', '1562551240', '1562551240', '127.0.0.1', '1', '18', 'MDlmYzEyNTljOWM2MTYyYjMxZTE3YmM3ODE4ZTE5OTA=');
INSERT INTO `tp_sys_admin` VALUES ('2', 'Designer', 'ArtDesigner@163.com', '44b9f4b355a1182528e1adabc7ceac44', '91', '1562061129', '1562296466', '0', '', '4', '0', '');
INSERT INTO `tp_sys_admin` VALUES ('3', 'index', 'index@163.com', 'dca72021245900b1c7c719ba0cc44f7e', '90', '1562061145', '1562296453', '0', '', '2', '0', '');
INSERT INTO `tp_sys_admin` VALUES ('4', 'mobile', '18158863751@163.com', 'dca72021245900b1c7c719ba0cc44f7e', '89', '1562061193', '1562296437', '1562121725', '127.0.0.1', '7', '1', 'MDlmYzEyNTljOWM2MTYyYjMxZTE3YmM3ODE4ZTE5OTA=');
INSERT INTO `tp_sys_admin` VALUES ('7', '小qq', '486535375@qq.com', '77745c56ea5fee84a3a1aa8963ebe6e0', '56', '1562230140', '0', '0', '', '1', '0', '');

-- ----------------------------
-- Table structure for tp_sys_admin_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_admin_cate`;
CREATE TABLE `tp_sys_admin_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `menu` text COMMENT '权限菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `description` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='后台权限组表';

-- ----------------------------
-- Records of tp_sys_admin_cate
-- ----------------------------
INSERT INTO `tp_sys_admin_cate` VALUES ('1', '超级管理员', '[\"70\",\"71\",\"12\",\"2\",\"32\",\"33\",\"34\",\"3\",\"68\",\"69\",\"4\",\"66\",\"67\",\"5\",\"65\",\"6\",\"64\",\"7\",\"63\",\"8\",\"62\",\"9\",\"61\",\"10\",\"60\",\"13\",\"22\",\"42\",\"25\",\"27\",\"38\",\"39\",\"40\",\"26\",\"35\",\"36\",\"37\",\"72\",\"14\",\"23\",\"41\",\"43\",\"44\",\"46\",\"45\",\"24\",\"28\",\"51\",\"52\",\"75\",\"29\",\"49\",\"50\",\"30\",\"53\",\"54\",\"31\",\"55\",\"56\",\"76\",\"47\",\"48\",\"74\",\"73\",\"82\",\"83\",\"84\",\"85\",\"77\",\"78\",\"79\",\"80\",\"81\",\"11\",\"19\",\"59\",\"20\",\"58\",\"21\",\"57\"]', '1562057671', '1562406887', '拥有所有管理权限');
INSERT INTO `tp_sys_admin_cate` VALUES ('2', '仓库管理', '[\"14\",\"23\",\"41\"]', '1562057737', '0', '仓库派发');
INSERT INTO `tp_sys_admin_cate` VALUES ('3', '小编', '[\"25\",\"26\",\"35\",\"36\",\"37\",\"27\",\"38\",\"39\",\"40\"]', '1562057777', '0', '新闻，资讯，文章发布');
INSERT INTO `tp_sys_admin_cate` VALUES ('4', '美工', '[\"24\",\"29\",\"49\",\"50\",\"30\",\"53\",\"54\",\"31\",\"55\",\"56\"]', '1562057818', '0', 'web端美化');
INSERT INTO `tp_sys_admin_cate` VALUES ('7', '维护管理员', '[\"12\",\"2\",\"5\",\"65\",\"6\",\"64\",\"7\",\"63\",\"8\",\"62\",\"9\",\"61\",\"10\",\"60\"]', '1562059238', '1562059593', '系统维护管理员');

-- ----------------------------
-- Table structure for tp_sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_attachment`;
CREATE TABLE `tp_sys_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `filename` char(50) NOT NULL DEFAULT '' COMMENT '文件名',
  `filepath` char(200) NOT NULL DEFAULT '' COMMENT '文件路径+文件名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `fileext` char(10) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `uploadip` char(15) NOT NULL DEFAULT '' COMMENT '上传IP',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0未审核1已审核-1不通过',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL COMMENT '审核者id',
  `audit_time` int(11) NOT NULL COMMENT '审核时间',
  `use` varchar(200) DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT '0' COMMENT '下载量',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `filename` (`filename`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of tp_sys_attachment
-- ----------------------------
INSERT INTO `tp_sys_attachment` VALUES ('7', 'admin', '8a80eca7ef1dfbf1469d0270906ab36b.png', 'publicuploadsadminadmin_thumb201907038a80eca7ef1dfbf1469d0270906ab36b.png', '316120', 'png', '0', '127.0.0.1', '1', '1562114755', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('8', 'admin', '9be70bb17ecbed230a4f85f6a47e548d.png', 'publicuploadsadminadmin_thumb201907039be70bb17ecbed230a4f85f6a47e548d.png', '319993', 'png', '0', '127.0.0.1', '1', '1562114769', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('9', 'admin', '4b74b155175b3e18f5034e8d80c43838.png', 'publicuploadsadminadmin_thumb201907034b74b155175b3e18f5034e8d80c43838.png', '576446', 'png', '0', '127.0.0.1', '1', '1562115551', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('10', 'admin', 'efd30995e55041e068442f3d23d270b4.jpg', 'publicuploadsadminadmin_thumb20190703efd30995e55041e068442f3d23d270b4.jpg', '63525', 'jpg', '0', '127.0.0.1', '1', '1562115620', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('11', 'admin', '9f721c5a8d572ecd8cd6ce823b1022c5.png', 'publicuploadsadminadmin_thumb201907039f721c5a8d572ecd8cd6ce823b1022c5.png', '470957', 'png', '0', '127.0.0.1', '1', '1562115629', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('12', 'admin', 'dcc5ddaa395ee1f7efa12ff7d83e6b4c.png', 'publicuploadsadminadmin_thumb20190704dcc5ddaa395ee1f7efa12ff7d83e6b4c.png', '350936', 'png', '0', '127.0.0.1', '1', '1562203587', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('13', 'admin', '443493f85235d9d1812d38325afb188b.jpg', 'publicuploadsadminadmin_thumb20190704443493f85235d9d1812d38325afb188b.jpg', '17945', 'jpg', '0', '127.0.0.1', '1', '1562204421', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('14', 'admin', '79cc28a6e8b153be7ef36e11ad451d1c.jpg', 'publicuploadsadminadmin_thumb2019070479cc28a6e8b153be7ef36e11ad451d1c.jpg', '17945', 'jpg', '0', '127.0.0.1', '1', '1562204811', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('15', 'admin', 'f4c566ddf3f7bb32ea4c90aa45802997.jpg', 'publicuploadsadminadmin_thumb20190704f4c566ddf3f7bb32ea4c90aa45802997.jpg', '17945', 'jpg', '0', '127.0.0.1', '1', '1562204917', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('16', 'admin', '045a8e10a4fc96d744f0a32e91f5ae45.jpg', 'publicuploadsadminadmin_thumb20190704\045a8e10a4fc96d744f0a32e91f5ae45.jpg', '17945', 'jpg', '0', '127.0.0.1', '1', '1562205020', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('17', 'admin', '1e7ff2ff08de72a61b784cde39ad8fd9.jpg', 'publicuploadsadminadmin_thumb201907041e7ff2ff08de72a61b784cde39ad8fd9.jpg', '74010', 'jpg', '0', '127.0.0.1', '1', '1562205307', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('18', 'admin', 'ce3f88631b12beee639265192c3ae91c.jpg', 'publicuploadsadminadmin_thumb20190704ce3f88631b12beee639265192c3ae91c.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562205788', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('19', 'admin', '8226d167cc9c46b7c341db52c604ad60.jpg', 'publicuploadsadminadmin_thumb201907048226d167cc9c46b7c341db52c604ad60.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562205887', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('20', 'admin', '1c27a41fe932b45246bdf1c65276e067.jpg', 'publicuploadsadminadmin_thumb201907041c27a41fe932b45246bdf1c65276e067.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206030', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('21', 'admin', '1099ab0df20fad365b3760132b377358.jpg', 'publicuploadsadminadmin_thumb201907041099ab0df20fad365b3760132b377358.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206090', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('22', 'admin', 'f23874ad4a4d0c0568060622354b23eb.jpg', 'publicuploadsadminadmin_thumb20190704f23874ad4a4d0c0568060622354b23eb.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206154', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('23', 'admin', '83c1b612d98b5678d5aaca70268f8061.jpg', 'publicuploadsadminadmin_thumb2019070483c1b612d98b5678d5aaca70268f8061.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206211', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('24', 'admin', 'e3a1f25e406265046bb4db7b5a4f3028.jpg', 'publicuploadsadminadmin_thumb20190704e3a1f25e406265046bb4db7b5a4f3028.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206231', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('25', 'admin', 'fca9df38758d99cc73d9f51ea71b59f4.jpg', 'publicuploadsadminadmin_thumb20190704fca9df38758d99cc73d9f51ea71b59f4.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206283', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('26', 'admin', '158537ec28ae080a0efe7fd281b6a129.jpg', 'publicuploadsadminadmin_thumb20190704158537ec28ae080a0efe7fd281b6a129.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206326', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('27', 'admin', 'dbd7c69fd254aae54396f4275ab5f0b5.jpg', 'publicuploadsadminadmin_thumb20190704dbd7c69fd254aae54396f4275ab5f0b5.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206376', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('28', 'admin', '3c3eb2b9b48fe85e5d143179acd039df.jpg', 'publicuploadsadminadmin_thumb201907043c3eb2b9b48fe85e5d143179acd039df.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206413', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('29', 'admin', 'b3078aede63024396a70f3d173e17aa6.jpg', 'publicuploadsadminadmin_thumb201907043078aede63024396a70f3d173e17aa6.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206451', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('30', 'admin', '9f707a66a00ab23700bb07453bd47c5d.jpg', 'publicuploadsadminadmin_thumb201907049f707a66a00ab23700bb07453bd47c5d.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206515', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('31', 'admin', '6cf01394fdebf2f482de6b969e7d7706.jpg', 'publicuploadsadminadmin_thumb201907046cf01394fdebf2f482de6b969e7d7706.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206589', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('32', 'admin', '2210c06ec7fe8ccf01ecb62a4a8c76f7.jpg', 'publicuploadsadminadmin_thumb201907042210c06ec7fe8ccf01ecb62a4a8c76f7.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206626', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('33', 'admin', 'dd3b7d75329779bdbc70ff3a3d3b8e0a.jpg', 'publicuploadsadminadmin_thumb20190704dd3b7d75329779bdbc70ff3a3d3b8e0a.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206664', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('34', 'admin', 'eb001a42bc61dec979e0bbdb5d5f8018.jpg', 'publicuploadsadminadmin_thumb20190704eb001a42bc61dec979e0bbdb5d5f8018.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206710', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('35', 'admin', '69046a300d3e273e7e186a720d2b1259.jpg', 'publicuploadsadminadmin_thumb2019070469046a300d3e273e7e186a720d2b1259.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206738', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('36', 'admin', 'b1f326a5d676f180e9fb1cf392ff2362.jpg', 'publicuploadsadminadmin_thumb201907041f326a5d676f180e9fb1cf392ff2362.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206771', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('37', 'admin', 'a062b0e59af03c1c7fffb63da4d44bd6.jpg', 'publicuploadsadminadmin_thumb20190704a062b0e59af03c1c7fffb63da4d44bd6.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206809', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('38', 'admin', 'e23c46a39abc81aaadaa63eca8268344.jpg', 'publicuploadsadminadmin_thumb20190704e23c46a39abc81aaadaa63eca8268344.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206843', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('39', 'admin', '488d7d4a5d4a0d90019c776e8db24062.jpg', 'publicuploadsadminadmin_thumb20190704488d7d4a5d4a0d90019c776e8db24062.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206877', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('40', 'admin', '38fb7ce75a54c2d330a930cadd22cfba.jpg', 'publicuploadsadminadmin_thumb2019070438fb7ce75a54c2d330a930cadd22cfba.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206907', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('41', 'admin', 'e91bdbb577e972a9e8d63a7f1f7a2841.jpg', 'publicuploadsadminadmin_thumb20190704e91bdbb577e972a9e8d63a7f1f7a2841.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562206947', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('42', 'admin', 'd89c79e81007d0a39fb4c96a2ce33711.jpg', 'publicuploadsadminadmin_thumb20190704d89c79e81007d0a39fb4c96a2ce33711.jpg', '74010', 'jpg', '0', '127.0.0.1', '1', '1562207098', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('43', 'admin', 'c18137f265a123465327c3aeb25547d0.jpg', 'publicuploadsadminadmin_thumb20190704c18137f265a123465327c3aeb25547d0.jpg', '74010', 'jpg', '0', '127.0.0.1', '1', '1562207146', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('44', 'admin', 'aa8d19c60072884880b1f996b55c3fec.jpg', 'publicuploadsadminadmin_thumb20190704aa8d19c60072884880b1f996b55c3fec.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562207312', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('45', 'admin', '8ec980b97b6dccb048e1179a152bb1c1.jpg', 'publicuploadsadminadmin_thumb201907048ec980b97b6dccb048e1179a152bb1c1.jpg', '84251', 'jpg', '0', '127.0.0.1', '1', '1562207355', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('46', 'admin', '9a31a125e4c5e04960675ee53af6bda2.jpg', 'publicuploadsadminadmin_thumb201907049a31a125e4c5e04960675ee53af6bda2.jpg', '84251', 'jpg', '0', '127.0.0.1', '1', '1562207364', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('47', 'admin', 'c82e3d2caf10bdd7677fb90a342205bb.jpg', 'publicuploadsadminadmin_thumb20190704c82e3d2caf10bdd7677fb90a342205bb.jpg', '84251', 'jpg', '0', '127.0.0.1', '1', '1562207373', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('48', 'admin', '4e578d28ffea26357e7d6865798ddac4.jpg', 'publicuploadsadminadmin_thumb201907044e578d28ffea26357e7d6865798ddac4.jpg', '84251', 'jpg', '0', '127.0.0.1', '1', '1562207431', '0', '0', 'admin_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('57', 'fragment_thumb', 'cf927620994520e124b3154960c3da56.png', 'publicuploadsfragment_thumbfragment_thumb20190704cf927620994520e124b3154960c3da56.png', '361921', 'png', '0', '127.0.0.1', '1', '1562231304', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('58', 'fragment_thumb', 'e27fb1e8b01bfa9a64d9e18e280d7386.jpg', 'publicuploadsfragment_thumbfragment_thumb20190704e27fb1e8b01bfa9a64d9e18e280d7386.jpg', '52281', 'jpg', '0', '127.0.0.1', '1', '1562231797', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('59', 'fragment_thumb', '5abfa8eb44c9f33d9d415294abaa7baa.jpg', 'publicuploadsfragment_thumbfragment_thumb201907045abfa8eb44c9f33d9d415294abaa7baa.jpg', '281110', 'jpg', '0', '127.0.0.1', '1', '1562231952', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('60', 'fragment_thumb', 'f2f681f8f40c3d420f6d83a580a5c41d.png', 'publicuploadsfragment_thumbfragment_thumb20190704f2f681f8f40c3d420f6d83a580a5c41d.png', '347043', 'png', '0', '127.0.0.1', '1', '1562232951', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('61', 'fragment_thumb', 'e1fa49add0f9209372d1e6b104c13c32.png', 'publicuploadsfragment_thumbfragment_thumb20190704e1fa49add0f9209372d1e6b104c13c32.png', '556318', 'png', '0', '127.0.0.1', '1', '1562232978', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('62', 'fragment_thumb', 'a23362c07d04652d0f0238c7b246e58f.jpg', 'publicuploadsfragment_thumbfragment_thumb20190704a23362c07d04652d0f0238c7b246e58f.jpg', '57346', 'jpg', '0', '127.0.0.1', '1', '1562233023', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('63', 'fragment_thumb', '7a714708ce910c0aa581dc97d2348325.png', 'publicuploadsfragment_thumbfragment_thumb201907047a714708ce910c0aa581dc97d2348325.png', '187312', 'png', '0', '127.0.0.1', '1', '1562233243', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('64', 'fragment_thumb', '58d2eb59d1fff55a7e24d31f79622005.jpg', 'publicuploadsfragment_thumbfragment_thumb2019070458d2eb59d1fff55a7e24d31f79622005.jpg', '84638', 'jpg', '0', '127.0.0.1', '1', '1562233433', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('65', 'fragment_thumb', 'fb23e46455a36f3ab85b79e80d059f09.png', 'publicuploadsfragment_thumbfragment_thumb20190704fb23e46455a36f3ab85b79e80d059f09.png', '237727', 'png', '0', '127.0.0.1', '1', '1562233445', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('66', 'fragment_thumb', '5300c557520875d699213bcfd328cf1b.png', 'publicuploadsfragment_thumbfragment_thumb201907045300c557520875d699213bcfd328cf1b.png', '3707', 'png', '0', '127.0.0.1', '1', '1562233840', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('67', 'fragment_thumb', 'efd48539a9481938cb8fbcab964a3a26.png', 'publicuploadsfragment_thumbfragment_thumb20190704efd48539a9481938cb8fbcab964a3a26.png', '3707', 'png', '0', '127.0.0.1', '1', '1562233850', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('68', 'fragment_thumb', '612ffac2312cc51fe315dd5c0433ee1a.png', 'publicuploadsfragment_thumbfragment_thumb20190704612ffac2312cc51fe315dd5c0433ee1a.png', '3707', 'png', '0', '127.0.0.1', '1', '1562233857', '0', '0', 'fragment_thumb', '0');
INSERT INTO `tp_sys_attachment` VALUES ('69', 'fragment_defaul', '3b113639f25f2262f9449ad9833a3cd3.png', 'publicuploadsfragment_defaultfragment_default201907053b113639f25f2262f9449ad9833a3cd3.png', '316120', 'png', '0', '127.0.0.1', '1', '1562288259', '0', '0', 'fragment_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('70', 'fragment_defaul', '64edc51c3c91b7d270d64f8fc377283f.png', 'publicuploadsfragment_defaultfragment_default2019070564edc51c3c91b7d270d64f8fc377283f.png', '528440', 'png', '0', '127.0.0.1', '1', '1562288272', '0', '0', 'fragment_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('71', 'fragment_defaul', 'e947b43732b42de048fc63343d930972.png', 'publicuploadsfragment_defaultfragment_default20190705e947b43732b42de048fc63343d930972.png', '324301', 'png', '0', '127.0.0.1', '1', '1562288282', '0', '0', 'fragment_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('72', 'fragment_defaul', '2024a7f7c40b388518651e303856c863.png', 'publicuploadsfragment_defaultfragment_default201907052024a7f7c40b388518651e303856c863.png', '567191', 'png', '0', '127.0.0.1', '1', '1562288292', '0', '0', 'fragment_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('73', 'fragment_defaul', '453fde5eb2957d209fa7565e0cb2fff8.png', 'publicuploadsfragment_defaultfragment_default20190705453fde5eb2957d209fa7565e0cb2fff8.png', '367728', 'png', '0', '127.0.0.1', '1', '1562288302', '0', '0', 'fragment_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('74', 'fragment_defaul', 'd7eec3ddd3a5f9fa0fb9e450dc814025.png', 'publicuploadsfragment_defaultfragment_default20190705d7eec3ddd3a5f9fa0fb9e450dc814025.png', '470957', 'png', '0', '127.0.0.1', '1', '1562288314', '0', '0', 'fragment_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('75', 'fragment_defaul', '3fadfdcecee0755af641f1c2c86c7dc1.png', 'publicuploadsfragment_defaultfragment_default201907053fadfdcecee0755af641f1c2c86c7dc1.png', '497350', 'png', '0', '127.0.0.1', '1', '1562288330', '0', '0', 'fragment_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('76', 'article_default', '8e1ff4067616e34ef4ee076ce74b4af4.png', 'publicuploadsarticle_defaultarticle_default201907058e1ff4067616e34ef4ee076ce74b4af4.png', '457985', 'png', '0', '127.0.0.1', '1', '1562290685', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('77', 'article_default', 'a393a7ad3221ffe1d4f2678d00ab5df6.jpg', 'publicuploadsarticle_defaultarticle_default20190705a393a7ad3221ffe1d4f2678d00ab5df6.jpg', '281110', 'jpg', '0', '127.0.0.1', '1', '1562291014', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('78', 'article_default', '694443ce658c99180e4e90b5888d3940.png', 'publicuploadsarticle_defaultarticle_default20190705694443ce658c99180e4e90b5888d3940.png', '250999', 'png', '0', '127.0.0.1', '1', '1562291137', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('79', 'article_default', '0dcfb61fc1e6007ac5bf6ab5367f45af.png', 'publicuploadsarticle_defaultarticle_default20190705\0dcfb61fc1e6007ac5bf6ab5367f45af.png', '457985', 'png', '0', '127.0.0.1', '1', '1562291367', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('80', 'article_default', '51396ac2bbf1751e45291dc305a60fff.jpg', 'publicuploadsarticle_defaultarticle_default2019070551396ac2bbf1751e45291dc305a60fff.jpg', '107666', 'jpg', '0', '127.0.0.1', '1', '1562291395', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('81', 'article_default', '5eff5eea5f626528bca0b4ddd9592dc0.png', 'publicuploadsarticle_defaultarticle_default201907055eff5eea5f626528bca0b4ddd9592dc0.png', '340963', 'png', '0', '127.0.0.1', '1', '1562291606', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('82', 'article_default', '99fe17caae5399c81699264ec371a0b8.jpg', 'publicuploadsarticle_defaultarticle_default2019070599fe17caae5399c81699264ec371a0b8.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562291832', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('83', 'article_default', '44eec6a714ac4eb882c20754879a8a8c.jpg', 'publicuploadsarticle_defaultarticle_default2019070544eec6a714ac4eb882c20754879a8a8c.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562291842', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('84', 'article_default', '6dd5960c291f151f981b768c38fb2fa2.jpg', 'publicuploadsarticle_defaultarticle_default201907056dd5960c291f151f981b768c38fb2fa2.jpg', '84251', 'jpg', '0', '127.0.0.1', '1', '1562291852', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('85', 'article_default', '1eab85163f40ab07b960fc19fd41485f.jpg', 'publicuploadsarticle_defaultarticle_default201907051eab85163f40ab07b960fc19fd41485f.jpg', '57619', 'jpg', '0', '127.0.0.1', '1', '1562291875', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('86', 'article_default', '59ff0bd707d7c988e32405a3b01c997b.jpg', 'publicuploadsarticle_defaultarticle_default2019070559ff0bd707d7c988e32405a3b01c997b.jpg', '17945', 'jpg', '0', '127.0.0.1', '1', '1562291959', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('87', 'article_default', '8bdfd3393b1bf2ae91bc93c668fd62cb.jpg', 'publicuploadsarticle_defaultarticle_default201907058bdfd3393b1bf2ae91bc93c668fd62cb.jpg', '84251', 'jpg', '0', '127.0.0.1', '1', '1562291990', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('88', 'article_default', 'dacf29f4e663a35298aa1e58b341210c.jpg', 'publicuploadsarticle_defaultarticle_default20190705dacf29f4e663a35298aa1e58b341210c.jpg', '84251', 'jpg', '0', '127.0.0.1', '1', '1562291997', '0', '0', 'article_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('89', 'admin_default', 'd317c6cfa7baefc6362403cb7b5f1fd1.png', 'publicuploadsadmin_defaultadmin_default20190705d317c6cfa7baefc6362403cb7b5f1fd1.png', '2077100', 'png', '0', '127.0.0.1', '1', '1562296435', '0', '0', 'admin_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('90', 'admin_default', '79bb4905252838b0e486c218e7d041c5.jpg', 'publicuploadsadmin_defaultadmin_default2019070579bb4905252838b0e486c218e7d041c5.jpg', '17945', 'jpg', '0', '127.0.0.1', '1', '1562296444', '0', '0', 'admin_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('91', 'admin_default', '74e4228cbe21980aa10a6cc99790cf26.jpg', 'publicuploadsadmin_defaultadmin_default2019070574e4228cbe21980aa10a6cc99790cf26.jpg', '74010', 'jpg', '0', '127.0.0.1', '1', '1562296459', '0', '0', 'admin_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('92', 'admin_default', '000c17a5cb404fc70e80915b8abad53c.jpeg', 'publicuploadsadmin_defaultadmin_default20190705\000c17a5cb404fc70e80915b8abad53c.jpeg', '552419', 'jpeg', '0', '127.0.0.1', '1', '1562296473', '0', '0', 'admin_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('93', 'link_default', 'd7ce1dc600ff4ccd87ba1677b7edc69b.jpg', 'publicuploadslink_defaultlink_default20190706d7ce1dc600ff4ccd87ba1677b7edc69b.jpg', '11141', 'jpg', '0', '127.0.0.1', '1', '1562383853', '0', '0', 'link_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('94', 'link_default', 'fed9e764463725bc6f3e3045de7c8b5a.jpg', 'publicuploadslink_defaultlink_default20190706fed9e764463725bc6f3e3045de7c8b5a.jpg', '145622', 'jpg', '0', '127.0.0.1', '1', '1562383891', '0', '0', 'link_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('95', 'link_default', 'a15ca13bfea85fe59c9569e5f9c8558e.jpg', 'publicuploadslink_defaultlink_default20190706a15ca13bfea85fe59c9569e5f9c8558e.jpg', '16130', 'jpg', '0', '127.0.0.1', '1', '1562383944', '0', '0', 'link_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('96', 'link_default', 'aa7361490c7825b51ff242e567a60fbd.jpg', 'publicuploadslink_defaultlink_default20190706aa7361490c7825b51ff242e567a60fbd.jpg', '15183', 'jpg', '0', '127.0.0.1', '1', '1562384040', '0', '0', 'link_default', '0');
INSERT INTO `tp_sys_attachment` VALUES ('97', 'admin_default', '26b6cbf7b43ccd254d47e1feb0e72b1b.gif', '\\public\\uploads\\admin_default\\admin_default\\20190706\\26b6cbf7b43ccd254d47e1feb0e72b1b.gif', '45936', 'gif', '0', '127.0.0.1', '1', '1562407056', '0', '0', 'admin_default', '0');

-- ----------------------------
-- Table structure for tp_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_config`;
CREATE TABLE `tp_sys_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of tp_sys_config
-- ----------------------------
INSERT INTO `tp_sys_config` VALUES ('1', 'title', 'tpCitrx后台管理框架', 'admin', '网站名称');
INSERT INTO `tp_sys_config` VALUES ('2', 'keywords', 'bootstrap+layui+thinkphp5集成的简单方便tpCitrix', 'admin', '网站关键词');
INSERT INTO `tp_sys_config` VALUES ('3', 'description', '简单实用，一键部署的thinkphp框架tpCitrx后台管理框架', 'admin', '网站描述');
INSERT INTO `tp_sys_config` VALUES ('4', 'log_status', '1', 'admin', '开启日志0未开启1已开启');
INSERT INTO `tp_sys_config` VALUES ('5', 'title', 'tpCitrx后台管理框架', 'index', '网站名称');
INSERT INTO `tp_sys_config` VALUES ('6', 'keywords', 'bootstrap+layui+thinkphp5集成的简单方便tpCitrix', 'index', '网站关键词');
INSERT INTO `tp_sys_config` VALUES ('7', 'description', '简单实用，一键部署的thinkphp框架tpCitrx后台管理框架', 'index', '网站描述');
INSERT INTO `tp_sys_config` VALUES ('8', 'log_status', '1', 'index', '开启日志0未开启1已开启');
INSERT INTO `tp_sys_config` VALUES ('9', 'logon_status', '1', 'index', '开启注册0未开启1已开启');
INSERT INTO `tp_sys_config` VALUES ('10', 'enroll_status', '0', 'index', '开启登录0未开启1已开启');
INSERT INTO `tp_sys_config` VALUES ('11', 'verify_status', '1', 'index', '开启注册审核0需要审核1无需审核');
INSERT INTO `tp_sys_config` VALUES ('12', 'title', 'tpCitrx后台管理框架', 'mobile', '网站名称');
INSERT INTO `tp_sys_config` VALUES ('13', 'keywords', 'bootstrap+layui+thinkphp5集成的简单方便tpCitrix', 'mobile', '网站关键词');
INSERT INTO `tp_sys_config` VALUES ('14', 'description', '简单实用，一键部署的thinkphp框架tpCitrx后台管理框架', 'mobile', '网站描述');
INSERT INTO `tp_sys_config` VALUES ('15', 'log_status', '0', 'mobile', '开启日志0未开启1已开启');
INSERT INTO `tp_sys_config` VALUES ('16', 'logon_status', '1', 'mobile', '开启注册0未开启1已开启');
INSERT INTO `tp_sys_config` VALUES ('17', 'enroll_status', '0', 'mobile', '开启登录0未开启1已开启');
INSERT INTO `tp_sys_config` VALUES ('18', 'verify_status', '1', 'mobile', '开启注册审核0需要审核1无需审核');

-- ----------------------------
-- Table structure for tp_sys_fragment
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_fragment`;
CREATE TABLE `tp_sys_fragment` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fragment_name` varchar(150) NOT NULL DEFAULT '' COMMENT '碎片名称',
  `mark` varchar(55) NOT NULL DEFAULT '' COMMENT '唯一标记',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '分组',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `content` text COMMENT '内容',
  `link` varchar(1000) NOT NULL DEFAULT '' COMMENT '链接',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='内容碎片';

-- ----------------------------
-- Records of tp_sys_fragment
-- ----------------------------
INSERT INTO `tp_sys_fragment` VALUES ('1', 'pc端首页banner1图', 'pcBanner1', '0', '69', '<p>11111111111111</p>', '##', '1562288261', '1562231857');
INSERT INTO `tp_sys_fragment` VALUES ('2', 'pc端首页banner2图', 'pcBanner2', '1', '74', '<p>1111</p>', '##', '1562288316', '1562231955');
INSERT INTO `tp_sys_fragment` VALUES ('3', 'pc端首页banner3图', 'pcBanner3', '1', '73', '<p>444</p>', '##', '1562288303', '1562232959');
INSERT INTO `tp_sys_fragment` VALUES ('4', 'pc端首页banner4图', 'pcBanner4', '1', '72', '<p>11111111111</p>', '##', '1562288293', '1562232982');
INSERT INTO `tp_sys_fragment` VALUES ('5', 'pc端首页banner5图', 'pcBanner5', '1', '71', '<p>4545648</p>', '##', '1562288284', '1562233025');
INSERT INTO `tp_sys_fragment` VALUES ('6', '手机端banner1', 'mobileBanner1', '0', '75', '', '##', '1562288334', '1562233222');
INSERT INTO `tp_sys_fragment` VALUES ('7', '手机端banner2', 'mobileBanner2', '6', '70', '<p>46648684648</p>', '##', '1562288273', '1562233249');

-- ----------------------------
-- Table structure for tp_sys_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_link`;
CREATE TABLE `tp_sys_link` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL COMMENT '链接名称',
  `thumb` varchar(150) NOT NULL COMMENT '链接图标',
  `path_url` varchar(255) NOT NULL DEFAULT '' COMMENT '''链接地址''',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `create_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of tp_sys_link
-- ----------------------------
INSERT INTO `tp_sys_link` VALUES ('1', '百度', '93', 'https://www.baidu.com/', '0', '1562383855', '10');
INSERT INTO `tp_sys_link` VALUES ('2', '京东商城', '94', 'https://www.jd.com/', '0', '1562383892', '11');
INSERT INTO `tp_sys_link` VALUES ('3', '淘宝', '95', 'https://www.taobao.com/', '1562384088', '1562383944', '10');
INSERT INTO `tp_sys_link` VALUES ('4', '当当网', '96', 'http://www.dangdang.com/', '0', '1562384041', '10');
INSERT INTO `tp_sys_link` VALUES ('8', '2222', '0', '11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '0', '1562384619', '10');

-- ----------------------------
-- Table structure for tp_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_menu`;
CREATE TABLE `tp_sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL COMMENT '模块',
  `controller` varchar(100) NOT NULL COMMENT '控制器',
  `function` varchar(100) NOT NULL COMMENT '方法',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `is_display` int(1) NOT NULL DEFAULT '1' COMMENT '1显示在左侧菜单2只作为节点',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1权限节点2普通节点',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级菜单0为顶级菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_open` int(1) NOT NULL DEFAULT '0' COMMENT '0默认闭合1默认展开',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值，越小越靠前',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `module` (`module`) USING BTREE,
  KEY `controller` (`controller`) USING BTREE,
  KEY `function` (`function`) USING BTREE,
  KEY `is_display` (`is_display`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of tp_sys_menu
-- ----------------------------
INSERT INTO `tp_sys_menu` VALUES ('2', '系统菜单', 'admin', 'permissionMenu', 'index', '系统菜单列表', '1', '1', '12', '1561970980', '1561972802', '', '0', '99');
INSERT INTO `tp_sys_menu` VALUES ('3', '管理员列表', 'admin', 'permissionAdmin', 'index', '管理员列表', '2', '1', '12', '1561970980', '1561972794', '', '0', '98');
INSERT INTO `tp_sys_menu` VALUES ('4', '权限组', 'admin', 'permissionLimit', 'index', '权限组列表', '2', '1', '12', '1561970980', '1561972784', '', '0', '97');
INSERT INTO `tp_sys_menu` VALUES ('5', '系统配置', 'admin', 'systemAdmin', 'index', '系统配置admin模块', '1', '1', '12', '1561970980', '1561972728', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('6', '系统配置', 'admin', 'systemIndex', 'index', '系统配置index模块', '2', '1', '12', '1561970980', '1561972736', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('7', '系统配置', 'admin', 'systemMobile', 'index', '系统配置mobile模块', '2', '1', '12', '1561970980', '1561972717', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('8', '日志管理', 'admin', 'logAdmin', 'index', '日志管理admin模块', '1', '1', '12', '1561970980', '1561972772', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('9', '日志管理', 'admin', 'logIndex', 'index', '日志管理index模块', '2', '1', '12', '1561970980', '1561972763', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('10', '日志管理', 'admin', 'logMobile', 'index', '日志管理mobile模块', '2', '1', '12', '1561970980', '1561972755', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('11', '通知列表', '', '', '', '通知列表', '1', '1', '0', '1561972233', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('12', '系统管理', '', '', '', '系统管理', '1', '1', '0', '1561972288', '0', '', '0', '100');
INSERT INTO `tp_sys_menu` VALUES ('13', '会员管理', '', '', '', '会员管理', '1', '1', '0', '1561972336', '0', '', '0', '96');
INSERT INTO `tp_sys_menu` VALUES ('14', '营销管理', '', '', '', '营销管理', '1', '1', '0', '1561972368', '0', '', '0', '94');
INSERT INTO `tp_sys_menu` VALUES ('19', '短信列表', 'admin', 'smsAdmin', 'index', '短信列表admin模块', '1', '1', '11', '1561974262', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('20', '短信列表', 'admin', 'smsIndex', 'index', '短信列表index模块', '2', '1', '11', '1561974294', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('21', '短信列表', 'admin', 'smsMobile', 'index', '短信列表mobile模块', '2', '1', '11', '1561974321', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('22', '会员列表', 'admin', 'user', 'index', '会员列表', '1', '1', '13', '1561974358', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('23', '订单列表', 'admin', 'order', 'index', '订单列表', '1', '1', '14', '1561974381', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('24', '系统工具', '', '', '', '系统工具', '1', '1', '0', '1561974408', '0', '', '0', '92');
INSERT INTO `tp_sys_menu` VALUES ('25', '热点资讯', '', '', '', '热点资讯', '1', '1', '0', '1561974447', '0', '', '0', '95');
INSERT INTO `tp_sys_menu` VALUES ('26', '文章列表', 'admin', 'article', 'index', '文章列表', '1', '1', '25', '1561974471', '0', '', '0', '99');
INSERT INTO `tp_sys_menu` VALUES ('27', '文章分类', 'admin', 'articleCate', 'index', '文章分类', '1', '1', '25', '1561974502', '0', '', '0', '100');
INSERT INTO `tp_sys_menu` VALUES ('28', '单项页面', 'admin', 'singlePage', 'index', '单项页面', '1', '1', '24', '1561974646', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('29', '内容碎片', 'admin', 'fragment', 'index', '内容碎片', '1', '1', '24', '1561974685', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('30', '幻灯广告', 'admin', 'slideAdvertising', 'index', '幻灯广告', '1', '1', '24', '1561974734', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('31', 'Web导航', 'admin', 'navigationBar', 'index', 'Web导航列表', '1', '1', '24', '1561974782', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('32', '新增/编辑', 'admin', 'permissionMenu', 'publish', '新增/编辑', '2', '1', '2', '1561974980', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('33', '删除', 'admin', 'permissionMenu', 'infoDelete', '删除', '2', '1', '2', '1561975005', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('34', '快捷编辑', 'admin', 'permissionMenu', 'changeTableVal', '快捷编辑', '2', '1', '2', '1561975045', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('35', '删除', 'admin', 'article', 'infoDelete', '删除', '2', '1', '26', '1562046293', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('36', '新增/编辑', 'admin', 'article', 'publish', '新增/编辑', '2', '1', '26', '1562046325', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('37', '快捷编辑', 'admin', 'article', 'changeTableVal', '快捷编辑', '2', '1', '26', '1562046363', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('38', '快捷编辑', 'admin', 'articleCate', 'changeTableVal', '快捷编辑', '2', '1', '27', '1562046384', '1562046410', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('39', '删除', 'admin', 'articleCate', 'infoDelete', '删除', '2', '1', '27', '1562046442', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('40', '新增/编辑', 'admin', 'articleCate', 'publish', '新增/编辑', '2', '1', '27', '1562046474', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('41', '删除', 'admin', 'order', 'delete', '删除', '2', '1', '23', '1562046545', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('42', '删除', 'admin', 'user', 'delete', '删除', '2', '1', '22', '1562046568', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('43', '论坛设置', '', '', '', '论坛设置', '1', '1', '0', '1562046634', '1562046687', '', '0', '93');
INSERT INTO `tp_sys_menu` VALUES ('44', '论坛管理', 'admin', 'forum', 'index', '论坛管理', '1', '1', '43', '1562046670', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('45', '设置管理', 'admin', 'forumSys', 'index', '设置管理', '1', '1', '43', '1562046790', '1562046803', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('46', '删除', 'admin', 'forum', 'delete', '删除', '2', '1', '44', '1562046832', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('47', '附件管理', 'admin', 'attachment', 'index', '附件管理', '1', '1', '24', '1562046905', '1562225285', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('48', '删除', 'admin', 'attachment', 'infoDelete', '删除', '2', '1', '47', '1562046930', '1562229562', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('49', '删除', 'admin', 'fragment', 'infoDelete', '删除', '2', '1', '29', '1562046961', '1562231699', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('50', '新增/编辑', 'admin', 'fragment', 'publish', '新增/编辑', '2', '1', '29', '1562046998', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('51', '新增/编辑', 'admin', 'singlePage', 'publish', '新增/编辑', '2', '1', '28', '1562047043', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('52', '删除', 'admin', 'singlePage', 'infoDelete', '删除', '2', '1', '28', '1562047064', '1562291519', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('53', '新增/编辑', 'admin', 'slideAdvertising', 'publish', '新增/编辑', '2', '1', '30', '1562047101', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('54', '删除', 'admin', 'slideAdvertising', 'delete', '删除', '2', '1', '30', '1562047135', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('55', '新增/编辑', 'admin', 'navigationBar', 'publish', '新增/编辑', '2', '1', '31', '1562047178', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('56', '删除', 'admin', 'navigationBar', 'infoDelete', '删除', '2', '1', '31', '1562047197', '1562295412', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('57', '删除', 'admin', 'smsMobile', 'delete', '删除', '2', '1', '21', '1562047667', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('58', '删除', 'admin', 'smsIndex', 'index', '删除', '2', '1', '20', '1562047686', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('59', '删除', 'admin', 'smsAdmin', 'index', '删除', '2', '1', '19', '1562047708', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('60', '删除', 'admin', 'logMobile', 'delete', '删除', '2', '1', '10', '1562047825', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('61', '删除', 'admin', 'logIndex', 'index', '删除', '2', '1', '9', '1562047844', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('62', '删除', 'admin', 'logAdmin', 'index', '删除', '2', '1', '8', '1562047863', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('63', '编辑', 'admin', 'systemMobile', 'publish', '编辑', '2', '1', '7', '1562047899', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('64', '编辑', 'admin', 'systemIndex', 'publish', '编辑', '2', '1', '6', '1562047925', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('65', '编辑', 'admin', 'systemAdmin', 'publish', '编辑', '2', '1', '5', '1562047960', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('66', '新增/编辑', 'admin', 'permissionLimit', 'publish', '新增/编辑', '2', '1', '4', '1562047990', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('67', '删除', 'admin', 'permissionLimit', 'delete', '删除', '2', '1', '4', '1562048014', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('68', '新增/编辑', 'admin', 'permissionAdmin', 'publish', '新增/编辑', '2', '1', '3', '1562048056', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('69', '删除', 'admin', 'permissionAdmin', 'delete', '删除', '2', '1', '3', '1562048078', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('70', '应用首页', 'admin', 'index', 'index', '应用首页', '1', '1', '0', '1562122000', '0', '', '0', '101');
INSERT INTO `tp_sys_menu` VALUES ('71', '默认首页', 'admin', 'index', 'main', '默认首页', '2', '1', '70', '1562124472', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('72', '批量删除', 'admin', 'article', 'batchDelete', '批量删除', '2', '1', '26', '1562221646', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('73', '数据备份', 'admin', 'databackup', 'index', '数据备份', '1', '1', '24', '1562225432', '1562225473', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('74', '批量删除', 'admin', 'attachment', 'batchDelete', '批量删除', '2', '1', '47', '1562229548', '1562229894', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('75', '快捷编辑', 'admin', 'singlePage', 'changeTableVal', '快捷编辑', '2', '1', '28', '1562291436', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('76', '快捷编辑', 'admin', 'navigationBar', 'changeTableVal', '快捷编辑', '2', '1', '31', '1562295447', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('77', '友情链接', 'admin', 'link', 'index', '友情链接', '1', '1', '24', '1562382500', '1562382513', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('78', '删除', 'admin', 'link', 'infoDelete', '删除', '2', '1', '77', '1562382538', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('79', '新增/编辑', 'admin', 'link', 'publish', '新增/编辑', '2', '1', '77', '1562382563', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('80', '快捷编辑', 'admin', 'link', 'changeTableVal', '快捷编辑', '2', '1', '77', '1562382590', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('81', '批量删除', 'admin', 'link', 'batchDelete', '批量删除', '2', '1', '77', '1562382811', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('82', '执行备份', 'admin', 'databackup', 'executeBackups', '执行备份', '2', '1', '73', '1562398446', '0', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('83', '还原备份', 'admin', 'databackup', 'originalBackups', '还原备份', '2', '1', '73', '1562398522', '1562398616', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('84', '删除备份', 'admin', 'databackup', 'deleteBackups', '删除备份', '2', '1', '73', '1562398558', '1562398634', '', '0', '0');
INSERT INTO `tp_sys_menu` VALUES ('85', '还原备份(列表)', 'admin', 'databackup', 'originalBackupsList', '还原备份(列表)', '2', '1', '73', '1562406879', '0', null, '0', '0');

-- ----------------------------
-- Table structure for tp_sys_page
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_page`;
CREATE TABLE `tp_sys_page` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '0' COMMENT '页面名称名称',
  `keyword` varchar(255) NOT NULL DEFAULT '0' COMMENT '关键词',
  `description` varchar(500) NOT NULL DEFAULT '0' COMMENT '简单描述',
  `content` text COMMENT '简单描述',
  `thumb` varchar(500) NOT NULL DEFAULT '0' COMMENT '图片',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核',
  `sort` int(10) NOT NULL DEFAULT '10' COMMENT '排序',
  `update_time` int(10) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='单页面';

-- ----------------------------
-- Records of tp_sys_page
-- ----------------------------
INSERT INTO `tp_sys_page` VALUES ('1', '用户协议标题', '用户协议关键词', '用户协议描述', '<p>用户协议<span style=\"color: rgb(68, 68, 68); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 19.25px; background-color: rgb(255, 255, 255);\">内容</span></p>', '78', '0', '10', '0', '1562291161');
INSERT INTO `tp_sys_page` VALUES ('2', '注册协议标题', '注册协议关键词', '注册协议描述', '<p>注册协议<span style=\"color: rgb(68, 68, 68); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 19.25px; background-color: rgb(255, 255, 255);\">内容</span></p>', '81', '1', '111', '1562291607', '1562291255');
INSERT INTO `tp_sys_page` VALUES ('3', '支付协议标题', '支付协议关键词', '支付协议描述', '<p>支付协议<span style=\"color: rgb(68, 68, 68); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 19.25px; background-color: rgb(255, 255, 255);\">内容</span></p>', '80', '1', '110', '0', '1562291397');

-- ----------------------------
-- Table structure for tp_sys_show_nav
-- ----------------------------
DROP TABLE IF EXISTS `tp_sys_show_nav`;
CREATE TABLE `tp_sys_show_nav` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT '0' COMMENT '导航名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1top3middle2footer',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新窗口打开',
  `link` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用',
  `update_time` int(10) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  `sort` int(10) DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='导航菜单';

-- ----------------------------
-- Records of tp_sys_show_nav
-- ----------------------------
INSERT INTO `tp_sys_show_nav` VALUES ('2', '2222222', '1', '0', '1', '##', '0', '0', '1562294917', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('3', '33333333333333', '3', '0', '0', '##33333333333333333333', '0', '0', '1562294939', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('4', '4444444444', '1', '0', '1', '##44444444', '1', '0', '1562294952', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('5', '555', '3', '0', '1', '##55555', '0', '0', '1562295040', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('6', '66666', '2', '0', '0', '##666666666666666666666666', '0', '0', '1562295051', '11');
INSERT INTO `tp_sys_show_nav` VALUES ('7', '77777777777777777777', '2', '5', '0', '##', '0', '1562295086', '1562295078', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('8', '8888888888888', '1', '0', '0', '##', '1', '0', '1562295093', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('11', '101010101', '2', '7', '1', '##', '0', '0', '1562295527', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('10', '99999999999', '1', '8', '0', '##', '0', '0', '1562295333', '10');
INSERT INTO `tp_sys_show_nav` VALUES ('12', '323453438448348', '3', '10', '1', '##', '0', '0', '1562295534', '11');
INSERT INTO `tp_sys_show_nav` VALUES ('13', '4864', '1', '10', '0', '##341343483434834', '0', '0', '1562295540', '10');
