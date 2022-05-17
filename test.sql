/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2021-05-13 12:58:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_account`
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '款项公示ID',
  `alabel` varchar(100) NOT NULL COMMENT '款项名称',
  `auname` varchar(100) NOT NULL COMMENT '经手人名字',
  `avalue` double NOT NULL COMMENT '款项金额',
  `adescribe` varchar(355) DEFAULT NULL COMMENT '款项用途详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_account
-- ----------------------------
INSERT INTO `t_account` VALUES ('7', '医疗-费用', '罗森', '-234.88', '1号动物息肉切除');
INSERT INTO `t_account` VALUES ('8', '收入-领养费', '福斯', '350', '5号动物的领养费用');
INSERT INTO `t_account` VALUES ('9', '人员-城际交通', '张文玥', '-133', '用于本次救助的公共交通');
INSERT INTO `t_account` VALUES ('10', '人员-食宿', '张文玥', '-250', '救助志愿者吃饭');

-- ----------------------------
-- Table structure for `t_adopt`
-- ----------------------------
DROP TABLE IF EXISTS `t_adopt`;
CREATE TABLE `t_adopt` (
  `aid` bigint(20) NOT NULL COMMENT '动物ID',
  `uid` bigint(20) NOT NULL COMMENT '申请人ID',
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '申请人性别',
  `age` int(10) DEFAULT NULL COMMENT '申请人年龄',
  `maritalstatus` int(11) DEFAULT '2' COMMENT '婚姻状况',
  `occupation` varchar(12) DEFAULT NULL COMMENT '家庭住址',
  `tel` bigint(20) DEFAULT NULL COMMENT '联系方式',
  `location` varchar(355) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '家庭住址',
  `fixresident` int(12) DEFAULT NULL COMMENT '固定住所',
  `income` int(12) DEFAULT NULL COMMENT '收入',
  `experience` int(12) DEFAULT NULL COMMENT '养宠经验',
  `petnum` int(12) DEFAULT NULL COMMENT '现有宠物数量',
  `familyagree` int(112) DEFAULT NULL COMMENT '家人同意',
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '微信号',
  `vstate` int(12) DEFAULT '0' COMMENT '申请状态',
  `apic` varchar(255) DEFAULT NULL COMMENT '动物图片',
  `uname` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `aname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aid`,`uid`),
  KEY `uid` (`uid`),
  CONSTRAINT `t_adopt_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `t_animal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_adopt_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_adopt
-- ----------------------------
INSERT INTO `t_adopt` VALUES ('10001', '1', '女', '30', '2', '邮递员', '1111', '上海市杨浦区', '1', '4000', '1', '2', '1', '11111', '0', '1619999075860', '李四', '思思');
INSERT INTO `t_adopt` VALUES ('10002', '1', '男', '21', '2', '学生', '111111111', '上海市杨浦区', '1', '3000', '1', '2', '1', 'we222', '0', '1619974742741', '黎明', '大壮');
INSERT INTO `t_adopt` VALUES ('10003', '21', '女', '23', '2', '学生', '190011', '安徽省淮北市', '1', '2000', '1', '1', '1', '11111', '1', '1619974758837', '张文玥', '默默');
INSERT INTO `t_adopt` VALUES ('10005', '1', '女', '24', '2', '设计师', '123334343', '上海市虹口区', '1', '4000', '1', '0', '1', '22222', '0', '1619974780054', '张三', 'DOFE');
INSERT INTO `t_adopt` VALUES ('10006', '21', '女', '23', '2', '学生', '1221344', '安徽省淮北市', '1', '3000', '1', '2', '1', '1234242424', '0', '1619980059403', '张文玥', '波波');
INSERT INTO `t_adopt` VALUES ('10009', '1', '男', '34', '1', '老师', '11111', '上海市杨浦区', '0', '4000', '0', '3', '1', '2211111', '1', '1620199166487', '王二', '某某');

-- ----------------------------
-- Table structure for `t_animal`
-- ----------------------------
DROP TABLE IF EXISTS `t_animal`;
CREATE TABLE `t_animal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动物ID',
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '大壮' COMMENT '动物名字',
  `ttype` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '狗' COMMENT '动物品种',
  `tsex` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '未知' COMMENT '动物性别',
  `tbirthday` date NOT NULL DEFAULT '2021-03-01' COMMENT '动物生日',
  `tpic` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '动物图片',
  `tstate` int(12) NOT NULL DEFAULT '2' COMMENT '动物状态',
  `tdescribe` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '无' COMMENT '动物描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_animal
-- ----------------------------
INSERT INTO `t_animal` VALUES ('10001', '思思', '猫', '未知', '2021-05-30', '1619999075860', '1', '漂亮的小校园里流浪猫，曾经被抛弃过，比较胆小未绝育');
INSERT INTO `t_animal` VALUES ('10002', '大壮', '比格', '母', '2010-12-02', '1619974742741', '1', '健康状况良好，亲人，适合领养');
INSERT INTO `t_animal` VALUES ('10003', '默默', '比格', '公', '2021-04-19', '1619974758837', '1', '比格实验犬，需要有经验的主人进行社会化培养');
INSERT INTO `t_animal` VALUES ('10004', '可可', '未知', '未知', '2021-01-12', '1619010478231', '1', '从狗肉贩子初救下，胆小，右耳有皮肤病');
INSERT INTO `t_animal` VALUES ('10005', 'DOFE', '比格', '公', '2021-04-06', '1619974780054', '2', '这个狗非常调皮，谨慎带回家');
INSERT INTO `t_animal` VALUES ('10006', '波波', '狗', '未知', '2021-03-01', '1619980059403', '2', '无');
INSERT INTO `t_animal` VALUES ('10007', '咪咪', '猫', '母', '2020-05-04', '1620006191125', '2', '已经绝育的流浪猫，很可爱');
INSERT INTO `t_animal` VALUES ('10008', '悠悠', '家猫', '公', '2021-05-30', '1620199097977', '2', '活泼好动，曾经是流浪猫，精力较为旺盛，比较适合领养');
INSERT INTO `t_animal` VALUES ('10009', '某某', '家猫', '公', '2021-05-23', '1620199166487', '3', '胆小');
INSERT INTO `t_animal` VALUES ('10010', '111', '1111', '母', '2021-05-02', '1620617530063', '2', '1111');
INSERT INTO `t_animal` VALUES ('10011', '咪咪', '家猫', '母', '2020-06-22', '1620662396281', '2', '未绝育，比较适合领养。性格温和');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '关于义工申请', '未满18岁需要家长陪同');
INSERT INTO `t_notice` VALUES ('3', '领养须知', '请仔细阅读以下内容并慎重考虑!\n1、你的家人都喜欢并接受它吗?\n2、如果它在家到处大小便、破坏家具、乱叫、咬烂东西，你和家人可以原谅它并教导它吗?\n3、有足够的经济能力在它生病的时候带它到医院治疗，还要每年定期为猫狗打疫苗、驱虫和常规体检。\n4、猫狗有十几年的寿命，它可能会陪伴你将来工作、结婚、生小孩、搬家，你能确定无论如何都不抛弃它吗?\n5、牵引绳是狗狗的生命绳，出门一定牵引，保证它的安全。随手清理粪便，做好环境卫生。\n6、做好迎接家庭新成员的准备（用品、用具、安全措施）。\n7、接受我们义工的上门考察和不定期回访');
INSERT INTO `t_notice` VALUES ('4', '关于领养为什么要收押金的问题', '因为我们从多年领养得出教训，尽管领养我们尽力把好关，但是结果非常失望，有一部分领养人口是心非，爱心一时，无责任感，因而再次造成动物被伤害，为了被领养的猫狗有生活质量的保证，所以从即日起领养收取押金，押金满一年半后，带上你领养的宝贝到基地退还押金。\n');
INSERT INTO `t_notice` VALUES ('5', '对于参观者及志愿者温馨提示', '由于救助的流浪动物较多，而它们会以不同方式表示对人的亲热，在这过程中有可能有被误伤的风险，如果愿意自行承担风险者方可入内参观非常感谢您对爱之家动物救助中心的关注和支持');
INSERT INTO `t_notice` VALUES ('7', '领养者必须具备的条件', '1.申请领养人必须年满21岁,有稳定的住所、稳定的工作及良好的经济收入, 同时必须签署领养协议并承诺尽力给予宠物最好的照顾 ( 我们只接受深圳市区及深圳关附近地区的领养, 暂不接受远距离及外地领养)。\n\n2.领养时需提供身份证或护照的原件及复印件、电话号码及QQ号码或微信号、家庭住址, 同时我们将拍摄领养人和被领养的宠物留底以做备案之用, 为防止宠物进入新家庭而出现跌落等意外情况, 请接受我们在领养之前安排工作人员事先上门考察门窗及阳台、花园的围栏情况,  甚至我们会要求领养人将其阳台或卫生间及厨房等用合适的网格封闭起来,  我们考察合格后, 方能同意领养, 我们会视情况将宠物送往领养者家中, 领养人要同意加入我们的QQ群或微信并接受不定期回访。\n\n3.需缴纳领养押金（狗狗RMB300元/只，猫猫RMB100元/只），由领养之家开收据，并请妥善保管好此收据，如领养半年后宠物健康的被带回领养之家体检合格，需凭此收据退还押金；如果半年内宠物丢失, 或随意转手他人,以及宠物死亡，我们将不退还押金。\n\n4.领养之家所有成年宠物已做绝育并接种疫苗，对于领养还没有做绝育的幼小动物,我们将另加收绝育保证金350元/只, 并开收据,小动物年满六个月后,请带回领养之家我们给于免费绝育,并收回收据全数退回绝育保证金. 绝育康复后再自行带回. (原则上我们不建议领养未做绝育的宠物）。\n\n 5.领养后发现生病需自行带到附近宠物医院或到与我们合作的宠物医院进行及时治疗,也可求助于我们领养之家，切勿狠心将其遗弃而使之再次流浪街头。');
INSERT INTO `t_notice` VALUES ('8', '捐助须知', '捐助范围:\n1、我们非常乐意接受爱心朋友们经常性的捐助,但仅限于小猫小狗们的食 物、 衣物、玩具等实物.\n2.、我们也非常希望爱心朋友们能为小猫小狗们捐出您的时间.\n3、我们暂不接受现金的捐助.\n备注: 我们会对您的捐助做好记录, 并定期在网站上公布.\n物品捐助: 我们诚挚地感谢以下捐助者和捐助团体.');
INSERT INTO `t_notice` VALUES ('9', '养宠须知', '1. 猫不用遛。遛狗是为了它的健康，顺便解决下大小便。猫不用遛，让它自己呆着就舒服了。\n\n\n\n2. 大小便自己解决。准备猫厕所，猫砂。猫会自己在里面解决大小便，并埋好。你要定时去清理。猫砂猫粮和猫厕所是猫必用的。猫窝不必买，它们会自己找到喜欢的趴的地方。猫项圈（防跳蚤圈，铃铛）不必买。项圈戴久了会皱了脖子的毛，防蚤圈没效果，铃铛会吵。别拴养，笼养。不买猫服。猫不喜欢束缚。\n\n\n\n3. 小猫不要喂牛奶。部分猫天生乳糖不耐，喂了牛奶会拉稀。\n\n\n\n4. 猫咪主食一定是合适的干粮，在所有食物中不要低于50%。\n\n\n\n5. 它们每天几乎 16~20 小时在睡觉。有 2 次（每次 20 分钟）活跃时间。注意家里的易碎品。餐具，杯子，花瓶等等，它们会不经意弄掉地上。\n\n\n\n6. 内外驱虫。每年吃两次，不要说不外出，不吃不干净食物的话。\n\n\n\n7. 每隔一两个礼拜观察猫中耳。如果里面黑了脏了，滴几滴耳油，然后轻揉耳背，再用棉签掏。\n\n\n\n8. 生病要及时带去看医生。猫很皮实，不爱生病。但是一旦生病，就很容易挂。比如食欲差，拉稀。尽快送医');

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单路径',
  `flag` varchar(10) DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限菜单表';

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '用户管理', '用户管理', '/page/end/user.html', 'user');
INSERT INTO `t_permission` VALUES ('2', '角色管理', '角色管理', '/page/end/role.html', 'role');
INSERT INTO `t_permission` VALUES ('3', '权限管理', '权限管理', '/page/end/permission.html', 'permission');
INSERT INTO `t_permission` VALUES ('5', '救助咨询', '救助咨询', '/page/end/im.html', 'im');
INSERT INTO `t_permission` VALUES ('6', '动物管理', '管理动物名单', '/page/end/animal.html', 'animal');
INSERT INTO `t_permission` VALUES ('7', '回访管理', '管理动物领养后回访记录', '/page/end/visit.html', 'visit');
INSERT INTO `t_permission` VALUES ('8', '领养管理', '管理领养信息以及完成相关审批', '/page/end/adopt.html', 'adopt');
INSERT INTO `t_permission` VALUES ('9', '凭证管理', '管理上传凭证', '/page/end/proof.html', 'proof');
INSERT INTO `t_permission` VALUES ('10', '自助申请', '提交表单', '/page/end/adopt_view.html', 'adopt_view');
INSERT INTO `t_permission` VALUES ('11', '我的领养', '查看当前用户的领养申请数据', '/page/end/my_adopt.html', 'my_adopt');
INSERT INTO `t_permission` VALUES ('12', '凭证录入', '自助凭证录入', '/page/end/adopt_view.html', 'my_proof');
INSERT INTO `t_permission` VALUES ('13', '义工申请管理', '义工申请管理', '/page/end/volunteer.html', 'volunteer');
INSERT INTO `t_permission` VALUES ('15', '义工申请', '查看审批义工申请', '/page/end/volunteer_apply.html', 'apply');
INSERT INTO `t_permission` VALUES ('17', '资金公示管理', '资金公示管理', '/page/end/account.html', 'account');
INSERT INTO `t_permission` VALUES ('43', '动物展示', '展示待领养的动物', '/page/end/adopt_view.html', 'adopt_view');
INSERT INTO `t_permission` VALUES ('44', '通知管理', '管理系统公告', '/page/end/notice.html', 'notice');

-- ----------------------------
-- Table structure for `t_proof`
-- ----------------------------
DROP TABLE IF EXISTS `t_proof`;
CREATE TABLE `t_proof` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '凭证ID',
  `ptitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '未知' COMMENT '凭证名称',
  `ppic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '凭证图片',
  `paid` bigint(20) NOT NULL COMMENT '领养ID',
  `puid` bigint(20) NOT NULL,
  `aname` varchar(20) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paid` (`paid`),
  KEY `puid` (`puid`),
  CONSTRAINT `t_proof_ibfk_1` FOREIGN KEY (`paid`) REFERENCES `t_animal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_proof_ibfk_2` FOREIGN KEY (`puid`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2021000006 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_proof
-- ----------------------------
INSERT INTO `t_proof` VALUES ('2021000001', '狗证-犬只到家后办理', '1620649797076', '10003', '21', '默默', '张文玥');
INSERT INTO `t_proof` VALUES ('2021000002', '身份证-人像面', '1620650915754', '10003', '21', '默默', '张文玥');
INSERT INTO `t_proof` VALUES ('2021000003', '结婚证', '1620650987751', '10003', '21', '默默', '张文玥');
INSERT INTO `t_proof` VALUES ('2021000004', '动物绝育证明', '1620650493897', '10003', '21', '默默', '张文玥');
INSERT INTO `t_proof` VALUES ('2021000005', '房产证', '1620652269080', '10003', '21', '默默', '张文玥');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `permission` varchar(2000) DEFAULT NULL COMMENT '权限列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '所有权限', '[{\"id\":3,\"name\":\"权限管理\",\"path\":\"/page/end/permission.html\",\"description\":\"权限管理\",\"flag\":\"permission\"},{\"id\":2,\"name\":\"角色管理\",\"path\":\"/page/end/role.html\",\"description\":\"角色管理\",\"flag\":\"role\"},{\"id\":1,\"name\":\"用户管理\",\"path\":\"/page/end/user.html\",\"description\":\"用户管理\",\"flag\":\"user\"}]');
INSERT INTO `t_role` VALUES ('2', '志愿者', '部分权限', '[{\"id\":7,\"name\":\"回访管理\",\"path\":\"/page/end/visit.html\",\"description\":\"管理动物领养后回访记录\",\"flag\":\"visit\"},{\"id\":6,\"name\":\"动物管理\",\"path\":\"/page/end/animal.html\",\"description\":\"管理动物名单\",\"flag\":\"animal\"},{\"id\":8,\"name\":\"领养管理\",\"path\":\"/page/end/adopt.html\",\"description\":\"管理领养信息以及完成相关审批\",\"flag\":\"adopt\"},{\"id\":9,\"name\":\"凭证管理\",\"path\":\"/page/end/proof.html\",\"description\":\"管理上传凭证\",\"flag\":\"proof\"},{\"id\":44,\"name\":\"通知管理\",\"path\":\"/page/end/notice.html\",\"description\":\"管理系统公告\",\"flag\":\"notice\"},{\"id\":13,\"name\":\"义工申请管理\",\"path\":\"/page/end/volunteer.html\",\"description\":\"义工申请管理\",\"flag\":\"volunteer\"},{\"id\":17,\"name\":\"资金公示管理\",\"path\":\"/page/end/account.html\",\"description\":\"资金公示管理\",\"flag\":\"account\"},{\"id\":5,\"name\":\"救助咨询\",\"path\":\"/page/end/im.html\",\"description\":\"救助咨询\",\"flag\":\"im\"}]');
INSERT INTO `t_role` VALUES ('3', '普通用户', '部分非工作权限', '[{\"id\":5,\"name\":\"救助咨询\",\"path\":\"/page/end/im.html\",\"description\":\"救助咨询\",\"flag\":\"im\"},{\"id\":43,\"name\":\"动物展示\",\"path\":\"/page/end/adopt_view.html\",\"description\":\"展示待领养的动物\",\"flag\":\"adopt_view\"},{\"id\":11,\"name\":\"我的领养\",\"path\":\"/page/end/my_adopt.html\",\"description\":\"查看当前用户的领养申请数据\",\"flag\":\"my_adopt\"},{\"id\":15,\"name\":\"义工申请\",\"path\":\"/page/end/volunteer_apply.html\",\"description\":\"查看审批义工申请\",\"flag\":\"apply\"}]');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '头像',
  `role` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'admin', '111124444@.com', '13978786565', '1619007548868', '[{\"id\":1,\"name\":\"超级管理员\",\"description\":null,\"permission\":null}]');
INSERT INTO `t_user` VALUES ('11', 'tom', '123456', 'tom@qq.com', '13685249632', '1618665195702', '[{\"id\":2,\"name\":\"志愿者\",\"description\":\"部分权限\",\"permission\":[{\"id\":7,\"name\":\"回访管理\",\"path\":\"/page/end/visit.html\",\"description\":\"管理动物领养后回访记录\",\"flag\":\"visit\"},{\"id\":6,\"name\":\"动物管理\",\"path\":\"/page/end/animal.html\",\"description\":\"管理动物名单\",\"flag\":\"animal\"},{\"id\":8,\"name\":\"领养管理\",\"path\":\"/page/end/adopt.html\",\"description\":\"管理领养信息以及完成相关审批\",\"flag\":\"adopt\"},{\"id\":9,\"name\":\"凭证管理\",\"path\":\"/page/end/proof.html\",\"description\":\"管理上传凭证\",\"flag\":\"proof\"},{\"id\":44,\"name\":\"通知管理\",\"path\":\"/page/end/notice.html\",\"description\":\"管理系统公告\",\"flag\":\"notice\"},{\"id\":13,\"name\":\"义工申请管理\",\"path\":\"/page/end/volunteer.html\",\"description\":\"义工申请管理\",\"flag\":\"volunteer\"},{\"id\":17,\"name\":\"资金公示管理\",\"path\":\"/page/end/account.html\",\"description\":\"资金公示管理\",\"flag\":\"account\"},{\"id\":5,\"name\":\"救助咨询\",\"path\":\"/page/end/im.html\",\"description\":\"救助咨询\",\"flag\":\"im\"}]}]');
INSERT INTO `t_user` VALUES ('20', 'jerry', '123456', 'jerry@qq.com', '13698597854', '1616284768677', '[{\"id\":3,\"name\":\"普通用户\",\"description\":\"部分非工作权限\",\"permission\":[{\"id\":5,\"name\":\"救助咨询\",\"path\":\"/page/end/im.html\",\"description\":\"救助咨询\",\"flag\":\"im\"},{\"id\":43,\"name\":\"动物展示\",\"path\":\"/page/end/adopt_view.html\",\"description\":\"展示待领养的动物\",\"flag\":\"adopt_view\"},{\"id\":11,\"name\":\"我的领养\",\"path\":\"/page/end/my_adopt.html\",\"description\":\"查看当前用户的领养申请数据\",\"flag\":\"my_adopt\"},{\"id\":15,\"name\":\"义工申请\",\"path\":\"/page/end/volunteer_apply.html\",\"description\":\"查看审批义工申请\",\"flag\":\"apply\"}]}]');
INSERT INTO `t_user` VALUES ('21', 'hello', '123456', 'hello@qq.com', '13695285412', '1619053076032', '[{\"id\":3,\"name\":\"普通用户\",\"description\":\"部分非工作权限\",\"permission\":[{\"id\":5,\"name\":\"救助咨询\",\"path\":\"/page/end/im.html\",\"description\":\"救助咨询\",\"flag\":\"im\"},{\"id\":29,\"name\":\"自助申请\",\"path\":\"/page/end/adopt_view.html\",\"description\":\"提交表单\",\"flag\":\"adopt_view\"}]}]');
INSERT INTO `t_user` VALUES ('23', 'yes', '123456', '1QQQ35@.com', '11111', '1619053076032', '[{\"id\":3,\"name\":\"普通用户\",\"description\":\"部分非工作权限\",\"permission\":[{\"id\":5,\"name\":\"救助咨询\",\"path\":\"/page/end/im.html\",\"description\":\"救助咨询\",\"flag\":\"im\"},{\"id\":43,\"name\":\"动物展示\",\"path\":\"/page/end/adopt_view.html\",\"description\":\"展示待领养的动物\",\"flag\":\"adopt_view\"},{\"id\":11,\"name\":\"我的领养\",\"path\":\"/page/end/my_adopt.html\",\"description\":\"查看当前用户的领养申请数据\",\"flag\":\"my_adopt\"},{\"id\":15,\"name\":\"义工申请\",\"path\":\"/page/end/volunteer_apply.html\",\"description\":\"查看审批义工申请\",\"flag\":\"apply\"},{\"id\":12,\"name\":\"凭证录入\",\"path\":\"/page/end/adopt_view.html\",\"description\":\"自助凭证录入\",\"flag\":\"my_proof\"}]}]');
INSERT INTO `t_user` VALUES ('32', 'jehh', '123345', '128372837@qq.com', '1111', '1619053076032', '[{\"id\":3,\"name\":\"普通用户\",\"description\":\"部分非工作权限\",\"permission\":[{\"id\":5,\"name\":\"救助咨询\",\"path\":\"/page/end/im.html\",\"description\":\"救助咨询\",\"flag\":\"im\"},{\"id\":43,\"name\":\"动物展示\",\"path\":\"/page/end/adopt_view.html\",\"description\":\"展示待领养的动物\",\"flag\":\"adopt_view\"},{\"id\":11,\"name\":\"我的领养\",\"path\":\"/page/end/my_adopt.html\",\"description\":\"查看当前用户的领养申请数据\",\"flag\":\"my_adopt\"},{\"id\":15,\"name\":\"义工申请\",\"path\":\"/page/end/volunteer_apply.html\",\"description\":\"查看审批义工申请\",\"flag\":\"apply\"}]}]');

-- ----------------------------
-- Table structure for `t_visit`
-- ----------------------------
DROP TABLE IF EXISTS `t_visit`;
CREATE TABLE `t_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '回访ID',
  `pet_id` bigint(20) NOT NULL COMMENT '动物ID',
  `vtime` date NOT NULL DEFAULT '2021-03-01' COMMENT '回访时间',
  `state` int(12) NOT NULL COMMENT '健康状态',
  `pic` varchar(355) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回访图片',
  `remark` varchar(355) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回访评价',
  `vname` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '回访标题',
  `uid` bigint(20) NOT NULL,
  `aname` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `t_visit_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `t_animal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_visit
-- ----------------------------
INSERT INTO `t_visit` VALUES ('6', '10003', '2021-05-04', '5', '1620646663964', '动物状况比较好', '黎明', '21', '大壮');
INSERT INTO `t_visit` VALUES ('7', '10003', '2021-05-03', '4', '1620655507688', '动物状态较好，有一点皮肤病', '张文玥', '21', '默默');
INSERT INTO `t_visit` VALUES ('8', '10009', '2021-05-03', '4', '1620663306862', '动物在新家适应较好，有待持续观察', '黎明', '1', '某某');
INSERT INTO `t_visit` VALUES ('9', '10003', '2021-04-03', '4', '1620694917691', '动物基本状态较为良好，有待进一步观察', '张文玥', '21', '默默');

-- ----------------------------
-- Table structure for `t_volunteer`
-- ----------------------------
DROP TABLE IF EXISTS `t_volunteer`;
CREATE TABLE `t_volunteer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `age` int(12) NOT NULL COMMENT '性别',
  `tel` varchar(255) NOT NULL COMMENT '手机',
  `email` varchar(255) NOT NULL COMMENT '电子邮件',
  `wechat` varchar(255) NOT NULL COMMENT '微信号',
  `location` varchar(255) NOT NULL COMMENT '现住址',
  `company` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `isvisit` int(12) NOT NULL DEFAULT '0' COMMENT '是否到过基地',
  `moreability` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更多技能',
  `sparetime` int(12) DEFAULT NULL COMMENT '空闲时间',
  `vstate` int(12) NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of t_volunteer
-- ----------------------------
INSERT INTO `t_volunteer` VALUES ('1', '张文玥', '13', '1333333', '11111@.com', '1999vrr', '安徽省淮北市', '上海财经大学', '1', '愿意参加中心劳动、参与救助、临时安置动物；可以为救助活动提供交通工具；擅长摄影，可以参与基地的网络推广等等', '7', '0');
INSERT INTO `t_volunteer` VALUES ('4', '陈学人', '21', '11112', '1122213@.qq.com', '1111', '上海市杨浦区', '上海财经大学', '1', '擅长写网络推广', '2', '0');
INSERT INTO `t_volunteer` VALUES ('7', '张文玥', '21', '1111111', '1111@.com', '1111', '上海市', '上海财经大学', '1', '愿意参加动物救助', '2', '1');
INSERT INTO `t_volunteer` VALUES ('8', '罗一舟', '21', '111', '11111', '11', '上海市', '上海财经大学', '1', '111', '111', '0');
INSERT INTO `t_volunteer` VALUES ('9', '李光耀', '11', '11', '11', '1', '上海市', '上海财经大学', '0', '11', '11', '0');
