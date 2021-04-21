/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.26 : Database - webnote
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webnote` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webnote`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `author` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`author`) values 
(1,'Java',7),
(2,'Python测试',7),
(4,'Test',8),
(5,'Lee分类',7);

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abs` varchar(255) DEFAULT NULL,
  `content_html` longtext,
  `content_md` longtext,
  `author` int(10) DEFAULT NULL COMMENT '作者',
  `category` int(10) DEFAULT NULL COMMENT '类别',
  `last_modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `note_ibfk_1` (`author`),
  KEY `note_ibfk_2` (`category`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `note_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `note` */

insert  into `note`(`id`,`name`,`abs`,`content_html`,`content_md`,`author`,`category`,`last_modified_time`,`created_time`) values 
(1,'Vue开发1','1212','<p>#二叉树（Binary Tree）</p>\n<p><img src=\"http://localhost:8081/article/images/2021-04-21/4da019ba-ea4b-4ad1-a8e8-2a3513711810.png\" alt=\"wallhavenym2oqd.png\" /></p>\n<p>test</p>\n<h1><a id=\"_5\"></a>测试</h1>\n<pre><code class=\"lang-\">print(\'test\')\n\n</code></pre>\n<p><img src=\"http://localhost:8081/article/images/2021-04-21/b9e8b3c7-104c-46ea-93c0-1af554fd39dd.jpg\" alt=\"wallhavendg1yeg.jpg\" /></p>\n<h2><a id=\"test2_11\"></a>test2</h2>\n<h2><a id=\"test2_12\"></a>test2</h2>\n<h2><a id=\"test2_14\"></a>test2</h2>\n<h2><a id=\"test2_16\"></a>test2</h2>\n<h2><a id=\"test2_18\"></a>test2</h2>\n<h2><a id=\"test2_20\"></a>test2</h2>\n<h2><a id=\"test2_22\"></a>test2</h2>\n<h2><a id=\"test2_24\"></a>test2</h2>\n<h2><a id=\"test2_26\"></a>test2</h2>\n<h2><a id=\"test2_28\"></a>test2</h2>\n<h2><a id=\"test2_30\"></a>test2</h2>\n<h2><a id=\"test2_32\"></a>test2</h2>\n','#二叉树（Binary Tree）\n\n![wallhavenym2oqd.png](http://localhost:8081/article/images/2021-04-21/4da019ba-ea4b-4ad1-a8e8-2a3513711810.png)\n\ntest\n# 测试\n```\nprint(\'test\')\n\n```\n![wallhavendg1yeg.jpg](http://localhost:8081/article/images/2021-04-21/b9e8b3c7-104c-46ea-93c0-1af554fd39dd.jpg)\n## test2\n## test2\n\n## test2\n\n## test2\n\n## test2\n\n## test2\n\n## test2\n\n## test2\n\n## test2\n\n## test2\n\n## test2\n\n## test2\n',7,1,'2021-04-21 16:58:41','2021-04-13 14:41:44'),
(2,'stringdsadas','222222',NULL,NULL,7,2,'2021-04-13 14:41:49','2021-04-13 14:41:51'),
(3,'Axios','1212112312312312312312312312312312312312312312312312312312312312','<h1><a id=\"_0\"></a>红黑树和平衡二叉树有什么区别？</h1>\n<p>数据结构属于理解一些源码和技术所必备的知识，比如要读懂 Java 语言中 TreeMap 和 TreeSet 的源码就要懂红黑树的数据结构，不然是无法理解源码中关于红黑树数据的操作代码的，比如左旋、右旋、添加和删除操作等。因此本课时我们就来学习一下数据结构的基础知识，方便看懂源码或者是防止面试中被问到。</p>\n<p>我们本课时的面试题是，红黑树和二叉树有什么区别？</p>\n<h2><a id=\"_6\"></a>典型回答</h2>\n<p>要回答这个问题之前，我们先要弄清什么是二叉树？什么是红黑树？</p>\n<h3><a id=\"Binary_Tree_10\"></a>二叉树（Binary Tree）</h3>\n<p>二叉树（Binary Tree）是指每个节点最多只有两个分支的树结构，即不存在分支大于 2 的节点，二叉树的数据结构如下图所示：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622134800.png\" alt=\"\" /></p>\n<p>这是一棵拥有 6 个节点深度为 2（深度从 0 开始），并且根节点为 3 的二叉树。</p>\n<p>二叉树有两个分支通常被称作“左子树”和“右子树”，而且这些分支具有左右次序不能随意地颠倒。</p>\n<h3><a id=\"_20\"></a>二叉查找树</h3>\n<p>一棵空树或者满足以下性质的二叉树被称之为二叉查找树：</p>\n<ul>\n<li>若任意节点的左子树不为空，则左子树上所有节点的值均小于它的根节点的值；</li>\n<li>若任意节点的右子树不为空，则右子树上所有节点的值均大于或等于它的根节点的值；</li>\n<li>任意节点的左、右子树分别为二叉查找树。</li>\n</ul>\n<p>如下图所示，这就是一个标准的二叉查找树：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622134933.png\" alt=\"\" /></p>\n<p>二叉查找树（Binary Search Tree）也被称为二叉搜索树、有序二叉树（Ordered Binary Tree）或排序二叉树（Sorted Binary Tree）等。</p>\n<h3><a id=\"Red_Black_Tree_34\"></a>红黑树（Red Black Tree）</h3>\n<p>红黑树（Red Black Tree）是一种自平衡二叉查找树，它最早被称之为“对称二叉 B 树”，它现在的名字源于 1978 年的一篇论文，之后便被称之为红黑树了。</p>\n<p>所谓的平衡树是指一种改进的二叉查找树，顾名思义平衡树就是将二叉查找树平衡均匀地分布，这样的好处就是可以减少二叉查找树的深度。</p>\n<p>一般情况下二叉查找树的查询复杂度取决于目标节点到树根的距离（即深度），当节点的深度普遍较大时，查询的平均复杂度就会上升，因此为了实现更高效的查询就有了平衡树。</p>\n<p>非平衡二叉树如下图所示：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135211.png\" alt=\"\" /></p>\n<p>平衡二叉树如下图所示：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135247.png\" alt=\"\" /></p>\n<p>可以看出使用平衡二叉树可以有效的减少二叉树的深度，从而提高了查询的效率。</p>\n<p>红黑树除了具备二叉查找树的基本特性之外，还具备以下特性：</p>\n<ul>\n<li>节点是红色或黑色；</li>\n<li>根节点是黑色；</li>\n<li>所有叶子都是黑色的空节点（NIL 节点）；</li>\n<li>每个红色节点必须有两个黑色的子节点，也就是说从每个叶子到根的所有路径上，不能有两个连续的红色节点；</li>\n<li>从一个节点到该节点的子孙节点的所有路径上包含相同数目的黑色节点。</li>\n</ul>\n<p>红黑树结构如下图所示：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135504.png\" alt=\"\" /></p>\n<h2><a id=\"_64\"></a>考点分析</h2>\n<p>红黑树是一个较为复杂的数据结构，尤其是对于增加和删除操作来说，一般面试官不会让你直接手写红黑树的具体实现。如果你只有很短的时间准备面试的话，那么我建议你不要死磕这些概念，要学会有的放矢，因为即使你花费很多的时间来背这些概念，一转眼的功夫就会彻底忘掉，所以你只需要大概地了解其中的一些概念和明白大致的原理就足够了。</p>\n<p>和此知识点相关的面试题还有以下这些：</p>\n<ul>\n<li>为什么工程中喜欢使用红黑树而不是其他二叉查找树？</li>\n<li>红黑树是如何保证自平衡的？</li>\n</ul>\n<h1><a id=\"_73\"></a>知识扩展</h1>\n<h2><a id=\"_75\"></a>红黑树的优势</h2>\n<p>红黑树的优势在于它是一个平衡二叉查找树，对于普通的二叉查找树（非平衡二叉查找树）在极端情况下可能会退化为链表的结构，例如，当我们依次插入 3、4、5、6、7、8 这些数据时，二叉树会退化为如下链表结构：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135635.png\" alt=\"\" /></p>\n<p>当二叉查找树退化为链表数据结构后，再进行元素的添加、删除以及查询时，它的时间复杂度就会退化为 O(n)；而如果使用红黑树的话，它就会将以上数据转化为平衡二叉查找树，这样就可以更加高效的添加、删除以及查询数据了，这就是红黑树的优势。</p>\n<blockquote>\n<p>小贴士：红黑树的高度近似 log2n，它的添加、删除以及查询数据的时间复杂度为 O(logn)。</p>\n</blockquote>\n<p>我们在表示算法的执行时间时，通常会使用大 O 表示法，常见的标识类型有以下这些：</p>\n<ul>\n<li>O(1)：常量时间，计算时间与数据量大小没关系；</li>\n<li>O(n)：计算时间与数据量成线性正比关系；</li>\n<li>O(logn)：计算时间与数据量成对数关系；</li>\n</ul>\n<h2><a id=\"_91\"></a>自平衡的红黑树</h2>\n<p>红黑树能够实现自平衡和保持红黑树特征的主要手段是：变色、左旋和右旋。</p>\n<p><strong>左旋</strong>指的是围绕某个节点向左旋转，也就是逆时针旋转某个节点，使得父节点被自己的右子节点所替代，如下图所示：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135840.png\" alt=\"\" /></p>\n<p>在 TreeMap 源码中左旋的实现源码如下：</p>\n<pre><div class=\"hljs\"><code class=\"lang-java\"><span class=\"hljs-comment\">// 源码基于 JDK 1.8</span>\n<span class=\"hljs-function\"><span class=\"hljs-keyword\">private</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">rotateLeft</span><span class=\"hljs-params\">(Entry&lt;K,V&gt; p)</span> </span>{\n    <span class=\"hljs-keyword\">if</span> (p != <span class=\"hljs-keyword\">null</span>) {\n        <span class=\"hljs-comment\">// 右子节点</span>\n        Entry&lt;K,V&gt; r = p.right; \n        <span class=\"hljs-comment\">// p 节点的右子节点为 r 的左子节点</span>\n        p.right = r.left;\n        <span class=\"hljs-comment\">// r 左子节点如果非空，r 左子节点的父节点设置为 p 节点</span>\n        <span class=\"hljs-keyword\">if</span> (r.left != <span class=\"hljs-keyword\">null</span>) \n            r.left.parent = p; \n        r.parent = p.parent; <span class=\"hljs-comment\">// r 父节点等于 p 父节点</span>\n        <span class=\"hljs-comment\">// p 父节点如果为空，那么讲根节点设置为 r 节点</span>\n        <span class=\"hljs-keyword\">if</span> (p.parent == <span class=\"hljs-keyword\">null</span>)\n            root = r;\n        <span class=\"hljs-comment\">// p 父节点的左子节点如果等于 p 节点，那么 p 父节点的左子节点设置 r 节点</span>\n        <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (p.parent.left == p)\n            p.parent.left = r;\n        <span class=\"hljs-keyword\">else</span>\n            p.parent.right = r;\n        r.left = p; \n        p.parent = r;\n    }\n}\n</code></div></pre>\n<p>左旋代码说明：在刚开始时，p 为父节点，r 为子节点，在左旋操作后，r 节点代替 p 节点的位置，p 节点成为 r 节点的左孩子，而 r 节点的左孩子成为 p 节点的右孩子。</p>\n<p><strong>右旋</strong>指的是围绕某个节点向右旋转，也就是顺时针旋转某个节点，此时父节点会被自己的左子节点取代，如下图所示：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622140438.png\" alt=\"\" /></p>\n<p>在 TreeMap 源码中右旋的实现源码如下：</p>\n<pre><div class=\"hljs\"><code class=\"lang-java\"><span class=\"hljs-function\"><span class=\"hljs-keyword\">private</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">rotateRight</span><span class=\"hljs-params\">(Entry&lt;K,V&gt; p)</span> </span>{\n    <span class=\"hljs-keyword\">if</span> (p != <span class=\"hljs-keyword\">null</span>) {\n        Entry&lt;K,V&gt; l = p.left;\n        <span class=\"hljs-comment\">// p 节点的左子节点为 l 的右子节点</span>\n        p.left = l.right;\n        <span class=\"hljs-comment\">// l 节点的右子节点非空时，设置 l 的右子节点的父节点为 p</span>\n        <span class=\"hljs-keyword\">if</span> (l.right != <span class=\"hljs-keyword\">null</span>) l.right.parent = p;\n        l.parent = p.parent;\n        <span class=\"hljs-comment\">// p 节点的父节点为空时，根节点设置成 l 节点</span>\n        <span class=\"hljs-keyword\">if</span> (p.parent == <span class=\"hljs-keyword\">null</span>)\n            root = l;\n        <span class=\"hljs-comment\">// p 节点的父节点的右子节点等于 p 节点时，p 的父节点的右子节点设置为 l</span>\n        <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (p.parent.right == p)\n            p.parent.right = l;\n        <span class=\"hljs-keyword\">else</span> p.parent.left = l;\n        l.right = p;\n        p.parent = l;\n    }\n}\n</code></div></pre>\n<p>右旋代码说明：在刚开始时，p 为父节点 l为子节点，在右旋操作后，l节点代替 p 节点，p 节点成为 l 节点的右孩子，l 节点的右孩子成为 p 节点的左孩子。</p>\n<p>对于红黑树来说，如果当前节点的左、右子节点均为红色时，因为需要满足红黑树定义的第四条特征，所以需要执行变色操作，如下图所示：</p>\n<p><img src=\"https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622140649.png\" alt=\"\" /></p>\n<h1><a id=\"_163\"></a>小结</h1>\n<p>我们本课时介绍了二叉树、二叉查找树及红黑树的概念，还有红黑树的五个特性。普通二叉查找树在特殊情况下会退化成链表的数据结构，因此操作和查询的时间复杂度变成了 O(n)，而红黑树可以实现自平衡，因此它的操作（插入、删除）和查找的时间复杂度都是 O(logn)，效率更高更稳定，红黑树保证平衡的手段有三个：变色、左旋和右旋。</p>\n','# 红黑树和平衡二叉树有什么区别？\n\n数据结构属于理解一些源码和技术所必备的知识，比如要读懂 Java 语言中 TreeMap 和 TreeSet 的源码就要懂红黑树的数据结构，不然是无法理解源码中关于红黑树数据的操作代码的，比如左旋、右旋、添加和删除操作等。因此本课时我们就来学习一下数据结构的基础知识，方便看懂源码或者是防止面试中被问到。\n\n我们本课时的面试题是，红黑树和二叉树有什么区别？\n\n## 典型回答\n\n要回答这个问题之前，我们先要弄清什么是二叉树？什么是红黑树？\n\n### 二叉树（Binary Tree）\n\n二叉树（Binary Tree）是指每个节点最多只有两个分支的树结构，即不存在分支大于 2 的节点，二叉树的数据结构如下图所示：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622134800.png)\n\n这是一棵拥有 6 个节点深度为 2（深度从 0 开始），并且根节点为 3 的二叉树。\n\n二叉树有两个分支通常被称作“左子树”和“右子树”，而且这些分支具有左右次序不能随意地颠倒。\n\n### 二叉查找树\n\n一棵空树或者满足以下性质的二叉树被称之为二叉查找树：\n\n- 若任意节点的左子树不为空，则左子树上所有节点的值均小于它的根节点的值；\n- 若任意节点的右子树不为空，则右子树上所有节点的值均大于或等于它的根节点的值；\n- 任意节点的左、右子树分别为二叉查找树。\n\n如下图所示，这就是一个标准的二叉查找树：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622134933.png)\n\n二叉查找树（Binary Search Tree）也被称为二叉搜索树、有序二叉树（Ordered Binary Tree）或排序二叉树（Sorted Binary Tree）等。\n\n### 红黑树（Red Black Tree）\n\n红黑树（Red Black Tree）是一种自平衡二叉查找树，它最早被称之为“对称二叉 B 树”，它现在的名字源于 1978 年的一篇论文，之后便被称之为红黑树了。\n\n所谓的平衡树是指一种改进的二叉查找树，顾名思义平衡树就是将二叉查找树平衡均匀地分布，这样的好处就是可以减少二叉查找树的深度。\n\n一般情况下二叉查找树的查询复杂度取决于目标节点到树根的距离（即深度），当节点的深度普遍较大时，查询的平均复杂度就会上升，因此为了实现更高效的查询就有了平衡树。\n\n非平衡二叉树如下图所示：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135211.png)\n\n平衡二叉树如下图所示：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135247.png)\n\n可以看出使用平衡二叉树可以有效的减少二叉树的深度，从而提高了查询的效率。\n\n红黑树除了具备二叉查找树的基本特性之外，还具备以下特性：\n\n- 节点是红色或黑色；\n- 根节点是黑色；\n- 所有叶子都是黑色的空节点（NIL 节点）；\n- 每个红色节点必须有两个黑色的子节点，也就是说从每个叶子到根的所有路径上，不能有两个连续的红色节点；\n- 从一个节点到该节点的子孙节点的所有路径上包含相同数目的黑色节点。\n\n红黑树结构如下图所示：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135504.png)\n\n## 考点分析\n\n红黑树是一个较为复杂的数据结构，尤其是对于增加和删除操作来说，一般面试官不会让你直接手写红黑树的具体实现。如果你只有很短的时间准备面试的话，那么我建议你不要死磕这些概念，要学会有的放矢，因为即使你花费很多的时间来背这些概念，一转眼的功夫就会彻底忘掉，所以你只需要大概地了解其中的一些概念和明白大致的原理就足够了。\n\n和此知识点相关的面试题还有以下这些：\n\n- 为什么工程中喜欢使用红黑树而不是其他二叉查找树？\n- 红黑树是如何保证自平衡的？\n\n# 知识扩展\n\n## 红黑树的优势\n\n红黑树的优势在于它是一个平衡二叉查找树，对于普通的二叉查找树（非平衡二叉查找树）在极端情况下可能会退化为链表的结构，例如，当我们依次插入 3、4、5、6、7、8 这些数据时，二叉树会退化为如下链表结构：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135635.png)\n\n当二叉查找树退化为链表数据结构后，再进行元素的添加、删除以及查询时，它的时间复杂度就会退化为 O(n)；而如果使用红黑树的话，它就会将以上数据转化为平衡二叉查找树，这样就可以更加高效的添加、删除以及查询数据了，这就是红黑树的优势。\n\n> 小贴士：红黑树的高度近似 log2n，它的添加、删除以及查询数据的时间复杂度为 O(logn)。\n\n我们在表示算法的执行时间时，通常会使用大 O 表示法，常见的标识类型有以下这些：\n\n- O(1)：常量时间，计算时间与数据量大小没关系；\n- O(n)：计算时间与数据量成线性正比关系；\n- O(logn)：计算时间与数据量成对数关系；\n\n## 自平衡的红黑树\n\n红黑树能够实现自平衡和保持红黑树特征的主要手段是：变色、左旋和右旋。\n\n**左旋**指的是围绕某个节点向左旋转，也就是逆时针旋转某个节点，使得父节点被自己的右子节点所替代，如下图所示：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622135840.png)\n\n在 TreeMap 源码中左旋的实现源码如下：\n\n```java\n// 源码基于 JDK 1.8\nprivate void rotateLeft(Entry<K,V> p) {\n    if (p != null) {\n        // 右子节点\n        Entry<K,V> r = p.right; \n        // p 节点的右子节点为 r 的左子节点\n        p.right = r.left;\n        // r 左子节点如果非空，r 左子节点的父节点设置为 p 节点\n        if (r.left != null) \n            r.left.parent = p; \n        r.parent = p.parent; // r 父节点等于 p 父节点\n        // p 父节点如果为空，那么讲根节点设置为 r 节点\n        if (p.parent == null)\n            root = r;\n        // p 父节点的左子节点如果等于 p 节点，那么 p 父节点的左子节点设置 r 节点\n        else if (p.parent.left == p)\n            p.parent.left = r;\n        else\n            p.parent.right = r;\n        r.left = p; \n        p.parent = r;\n    }\n}\n```\n\n左旋代码说明：在刚开始时，p 为父节点，r 为子节点，在左旋操作后，r 节点代替 p 节点的位置，p 节点成为 r 节点的左孩子，而 r 节点的左孩子成为 p 节点的右孩子。\n\n**右旋**指的是围绕某个节点向右旋转，也就是顺时针旋转某个节点，此时父节点会被自己的左子节点取代，如下图所示：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622140438.png)\n\n在 TreeMap 源码中右旋的实现源码如下：\n\n```java\nprivate void rotateRight(Entry<K,V> p) {\n    if (p != null) {\n        Entry<K,V> l = p.left;\n        // p 节点的左子节点为 l 的右子节点\n        p.left = l.right;\n        // l 节点的右子节点非空时，设置 l 的右子节点的父节点为 p\n        if (l.right != null) l.right.parent = p;\n        l.parent = p.parent;\n        // p 节点的父节点为空时，根节点设置成 l 节点\n        if (p.parent == null)\n            root = l;\n        // p 节点的父节点的右子节点等于 p 节点时，p 的父节点的右子节点设置为 l\n        else if (p.parent.right == p)\n            p.parent.right = l;\n        else p.parent.left = l;\n        l.right = p;\n        p.parent = l;\n    }\n}\n```\n\n右旋代码说明：在刚开始时，p 为父节点 l为子节点，在右旋操作后，l节点代替 p 节点，p 节点成为 l 节点的右孩子，l 节点的右孩子成为 p 节点的左孩子。\n\n对于红黑树来说，如果当前节点的左、右子节点均为红色时，因为需要满足红黑树定义的第四条特征，所以需要执行变色操作，如下图所示：\n\n![](https://gitee.com/krislin_zhao/IMGcloud/raw/master/img/20200622140649.png)\n\n# 小结\n\n我们本课时介绍了二叉树、二叉查找树及红黑树的概念，还有红黑树的五个特性。普通二叉查找树在特殊情况下会退化成链表的数据结构，因此操作和查询的时间复杂度变成了 O(n)，而红黑树可以实现自平衡，因此它的操作（插入、删除）和查找的时间复杂度都是 O(logn)，效率更高更稳定，红黑树保证平衡的手段有三个：变色、左旋和右旋。',7,1,'2021-04-19 18:55:42','2021-04-13 14:41:48'),
(5,'sdsdsdsd','sdsdsd',NULL,NULL,NULL,1,'2021-04-15 16:14:25','2021-04-15 16:14:25'),
(6,'test','test',NULL,NULL,NULL,1,'2021-04-21 14:57:46','2021-04-21 14:57:46'),
(7,'test2','test2',NULL,NULL,NULL,1,'2021-04-21 14:57:54','2021-04-21 14:57:54'),
(8,'asdas','dasdasdas',NULL,NULL,NULL,1,'2021-04-21 14:57:57','2021-04-21 14:57:57'),
(9,'fasf','asf',NULL,NULL,NULL,1,'2021-04-21 14:58:00','2021-04-21 14:58:00'),
(10,'asdf','asdf',NULL,NULL,NULL,1,'2021-04-21 14:58:04','2021-04-21 14:58:04'),
(11,'asdfsdc','asdfc',NULL,NULL,NULL,1,'2021-04-21 14:58:08','2021-04-21 14:58:08'),
(12,'svsadv','asdvasdvsd',NULL,NULL,NULL,1,'2021-04-21 14:58:11','2021-04-21 14:58:11'),
(13,'asdvsad','vsdavsavas',NULL,NULL,NULL,1,'2021-04-21 14:58:14','2021-04-21 14:58:14'),
(14,'asdvs','avazv',NULL,NULL,NULL,1,'2021-04-21 14:58:17','2021-04-21 14:58:17'),
(15,'asdvsBA','BAFSB',NULL,NULL,NULL,1,'2021-04-21 14:58:21','2021-04-21 14:58:21'),
(16,'sadv','asdvsadv',NULL,NULL,NULL,1,'2021-04-21 14:58:24','2021-04-21 14:58:24'),
(17,'学习笔记','学习笔记',NULL,NULL,7,5,'2021-04-21 15:48:19','2021-04-21 15:48:19');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `test` */

insert  into `test`(`id`,`username`) values 
(1,'loser'),
(2,'lee');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`salt`) values 
(7,'lee','894271ba5c7ddae5b375b97918861dfb','lU5PwxcoRNRCgghfrho2Yg=='),
(8,'loser','7b85617061fc94bf1ef35beb43cc11ef','usv9PifAAu+0SpmH0xAPpQ=='),
(9,'test','9dbc2bee959b43ef1ee59f480f5f6bff','bu+ngnd26rlZPkzsdBJyRA==');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
