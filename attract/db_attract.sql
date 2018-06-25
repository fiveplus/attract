/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : db_attract

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-06-22 21:31:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_group_permission`;
CREATE TABLE `sys_group_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `permission_id` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_group_permission
-- ----------------------------
INSERT INTO `sys_group_permission` VALUES ('22', '1', 'handle');
INSERT INTO `sys_group_permission` VALUES ('23', '1', 'user');
INSERT INTO `sys_group_permission` VALUES ('24', '1', 'group');
INSERT INTO `sys_group_permission` VALUES ('25', '1', 'syslog');
INSERT INTO `sys_group_permission` VALUES ('26', '1', 'register');
INSERT INTO `sys_group_permission` VALUES ('27', '1', 'card');
INSERT INTO `sys_group_permission` VALUES ('28', '1', 'domain');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_menu` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_name` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_index` int(11) DEFAULT NULL,
  `image_url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('admin', 'Admin', null, 'N', null, 'Y', '1', null, null, '1440665159555');
INSERT INTO `sys_permission` VALUES ('card', '名片管理', 'cardManage', 'Y', '', 'Y', '2', '', 'admin/card/list/1', '1497257715978');
INSERT INTO `sys_permission` VALUES ('cardManage', '名片管理', 'admin', 'Y', 'icon-list', 'Y', '2', '', '', '1496731529919');
INSERT INTO `sys_permission` VALUES ('domain', '领域管理', 'cardManage', 'Y', '', 'Y', '3', '', 'admin/domain/list/1', '1511322414469');
INSERT INTO `sys_permission` VALUES ('group', '组管理', 'main', 'Y', '', 'Y', '3', '', 'admin/group/list/1', '1473391211303');
INSERT INTO `sys_permission` VALUES ('handle', '菜单/权限', 'main', 'Y', '', 'Y', '1', '', 'admin/permission/list/1', '1440666423850');
INSERT INTO `sys_permission` VALUES ('main', '后台管理', 'admin', 'Y', 'icon-desktop', 'Y', '1', '', '', '1440664698162');
INSERT INTO `sys_permission` VALUES ('register', '用户管理', 'cardManage', 'Y', '', 'Y', '1', '', 'admin/register/list/1', '1496731593225');
INSERT INTO `sys_permission` VALUES ('syslog', '日志管理', 'main', 'Y', '', 'Y', '4', '', 'admin/syslog/list/1', '1510019719266');
INSERT INTO `sys_permission` VALUES ('user', '用户管理', 'main', 'Y', '', 'Y', '2', '', 'admin/user/list/1', '1440665159555');

-- ----------------------------
-- Table structure for sys_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_permission`;
CREATE TABLE `sys_user_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `tbl_advertisement`;
CREATE TABLE `tbl_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `url` text CHARACTER SET utf8,
  `remark` text CHARACTER SET utf8,
  `create_time` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `image` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_card
-- ----------------------------
DROP TABLE IF EXISTS `tbl_card`;
CREATE TABLE `tbl_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(1000) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `telephone` varchar(300) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `company_name` varchar(400) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `websize` varchar(1000) DEFAULT NULL,
  `remark` text,
  `project_stage` varchar(100) DEFAULT NULL,
  `project_name` varchar(1000) DEFAULT NULL,
  `project_brief` text,
  `create_time` varchar(100) DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `demand` varchar(1000) DEFAULT NULL,
  `domain_id` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_card
-- ----------------------------
INSERT INTO `tbl_card` VALUES ('644', null, '赖小静', '18618107678', 'CEO', '四川赛维康科技有限公司', '1425069912@qq.com', '', '', '初创期', '牧元人医学营养项目', '牧元人是专注于通过移动互联网进行慢病营养管理的医学营养综合服务商。一方面为医疗机构营养科提供Saas软件，同时给慢病患者、癌症患者等特殊疾病人群提供医用营养产品；另一方面，为院外特定病患和特定人群提供营养个性化解决方案。', '1500952855210', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('645', null, '段文峰', '13096397900', 'CEO', '', 'wayne.duan@ktbhealth.com', '', '', '初创期', '视网膜光适应治疗仪-成都聚焦眼底科技有限公司', '视网膜光适应治疗', '1500952855311', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('646', null, '陈炳辰', '18645653555', 'CEO', '四川旭康医疗电器有限公司', 'shawn.chen0418@foxmail.com', 'www.ikcare.com', '', '成熟期', '旭康医电项目', '骨科关节康复器械', '1500952855326', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('647', null, '周彦沛', '13540838830', 'CEO', '成都亿咖极科技有限公司', 'gino.zhou@ekagee.com', '', '', '初创期', '亿咖极心电', '12导联心电监测', '1500952855339', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('648', null, '杜小川', '', 'CEO', '', 'www.drluobo.com', '', '', '成熟期', '萝卜听诊器', '一种针对儿童的家用听诊器', '1500952855349', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('649', null, '翁玉麟', '', 'CEO', '鼎科医疗技术（苏州）有限公司', 'yl.weng@dkmedtech.com', '', '', '成长期', '药物球囊导管和可降解支架', '用于冠脉支架再狭窄和冠脉分枝病变的药物球囊；由于冠脉狭窄的可降解带药支架', '1500952855363', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('650', null, '尚小珂', '18827338233', 'CEO', '', 'shangxiaoke@ yuanturen.com', '', '', '初创期', '主动脉介入瓣膜项目', '替代手术换瓣的主动脉介入瓣膜，适应不适合外科手术的高危和老年病人', '1500952855389', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('651', null, 'Tony Zhang', '', 'CEO', '', 'tony.zhang@bluejayhealth.com', '', '', '成熟期', '蓝健移动健康管理有限公司', '通过远程康复的电子平台，推动社区与居家康复，给予 病人持续关怀', '1500952855399', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('652', null, 'David He', '', 'CEO', '', 'david.he@hotmail.com', '', '', '成长期', '测量心脏健康的可穿戴设备', '无', '1500952855415', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('653', null, 'Scott Wolf', '', 'CEO', '', 'swolf@volthealth.com', '', '', '成长期', '电刺激肌肉治疗尿失禁项目', '无', '1500952855438', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('654', null, 'Adrian Cheng', '', 'CEO', '', 'adrian.c@hotmail.com', '', '', '初创期', '非侵入性高速显微镜技术', '无', '1500952855455', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('655', null, 'George Ma', '', 'CEO', '', 'georgewenma@yahoo.com', '', '', '成长期', '便携式多功能X射线影像系统', '无', '1500952855467', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('656', null, '苏彦', '', 'CEO', '', 'sally@sunay.dk', '', '', '成熟期', '康复机器人', '帮助病人活动关节四肢', '1500952855483', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('657', null, 'Rob Royea', '', 'CEO', '', 'rroyea@cyrcadiahealth.com', '', '', '成熟期', 'iTBra智能内衣乳腺癌早期检测', '无', '1500952855500', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('658', null, 'Yoav Noyman', '', 'CEO', '', 'yoavnoyman@gmail.com', '', '', '成长期', '基于唾液的诊断', '无', '1500952855521', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('659', null, 'Ofer Harpak', '', 'CEO', '', 'ofer.harpak@oxitone.com', '', '', '成熟期', '医疗级血氧心率持续监测手表', '无', '1500952855538', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('660', null, '支正良', '', 'CEO', '', 'zhizhengliang@yahoo.com', '', '', '成熟期', '抗凝血纳米膜涂层', '抗凝血的生物膜涂层，使用嵌段共聚物结合透析膜，使其不会在表面产生血液凝固、粘附的现象', '1500952855550', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('661', null, 'Nicolas TESSE', '', 'CEO', '', 'nicolas.tesse@neteos-groupe.com', '', '', '成长期', 'OTC 中成药和抗菌剂', '无', '1500952855565', null, '融资服务,生产服务,区域服务', '4', 'Y');
INSERT INTO `tbl_card` VALUES ('662', null, 'Dalibor Hodko', '858-577-0422', 'CEO', 'Nexogen, Inc', 'dhodko@nexogentech.com', '7939 Silverton Ave., Ste 806  San Diego, CA 92126', '', '成长期', 'DNA/POCT', '核酸快速提取仪', '1500952855590', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('663', null, '许永根', '', 'CEO', '北京大学第三医院', 'pkujiangxue@163.com', '', '', '成长期', '组织化工程人工角膜', '人工角膜，利用猪的脱细胞基质与人工培育的角膜上皮层细胞，构成可临床使用的人工角膜', '1500952855604', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('664', null, 'Tal Leemor', '', 'CEO', 'Amnis Therapeutics', 'tal@amnis.life', 'www.amnis.life', '', '成长期', '血栓消除器械', '血栓消除器械', '1500952855620', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('665', null, '于立波', '', 'CEO', '都灵理工大学', 'libo.yu.unine@gmail.com', '', '', '成熟期', '荧光激增器', '荧光激增器，能够通过集成技术将载玻片改造，提高荧光灵敏度50倍', '1500952855631', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('666', null, '成杰', '', 'CEO', '', 'jcheng88@gmail.com', '', '', '初创期', '基于基因检测的癌症手术预后测试', '无', '1500952855639', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('667', null, '王孟渝', '', 'CEO', '', 'mengyu_wang@meei.harvard.edu', '', '', '初创期', '便携式眼部疾病筛查设备和云诊断系统', '无', '1500952855650', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('668', null, '吴山东', '', 'CEO', '', 'roboted@gmail.com', '', '', '初创期', '个性化的乳腺癌患病风险预测技术和服务', '无', '1500952855669', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('669', null, '陈季清', '', 'CEO', '', 'jqchen315@hotmail.com', '', '', '初创期', '人体精准生物电经络共振超声波智能保健治疗系统', '无', '1500952855683', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('670', null, '柳杭', '', 'CEO', '', 'hangliu28@hotmail.com', '', '', '初创期', 'lifestone健康管理中心', '无', '1500952855697', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('671', null, '杨征', '', 'CEO', '', 'zyang@quanovate.com', '', '', '初创期', '备孕助手', '无', '1500952855728', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('672', null, 'Li Mao', '', 'CEO', '', 'lmao9@its.jnj.com', '', '', '初创期', '肺癌早诊试剂盒', '无', '1500952855738', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('673', null, '王书崎', '18616288998', 'CEO', '湖北新柏奥生物科技有限公司', 'albertw371@gmail.com', '', '', '初创期', '基于微流体芯片的精子活力筛查技术', '无', '1500952855747', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('674', null, '王卫光', '', 'CEO', '', 'wangweiguang2002@hotmail.com', '', '', '初创期', '电脑智能辅助的癌症精准诊断和治疗', '无', '1500952855762', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('675', null, '赵漪', '', 'CEO', '', 'zhaoyi@ylweb.org', '', '', '初创期', '光谷医联互联网+家庭医生', '无', '1500952855773', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('676', null, '李勇', '', 'CEO', '', 'yong.li@oltfoot.com', '', '', '成长期', '3D打印医用功能足垫', '无', '1500952855789', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('677', null, '王新原', '', 'CEO', '', 'dwang@exceraortho.com', '', '', '初创期', '人工关节置换系统', '无', '1500952855799', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('678', null, 'Obdulio Piloto', '', 'CEO', '', 'obdulio.piloto@entopsis.com', '', '', '成长期', 'NUTeC多功能检测平台', '无', '1500952855808', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('679', null, 'Kevin Harris', '', 'CEO', '', 'kevin@curemetrix.com', '', '', '成长期', '乳腺癌影像早期诊断', '无', '1500952855823', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('680', null, 'Nassos Alevizopoulos', '', 'CEO', '', 'nassos@therapten.com', '', '', '初创期', '肺癌新药研发项目', '无', '1500952855836', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('681', null, 'Steve Goodison', '', 'CEO', '', 'goodisonsteve@gmail.com', '', '', '成长期', '无创高精准度的膀胱癌尿液测试', '无', '1500952855860', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('682', null, 'Mehran Talebinejad', '', 'CEO', '', 'mt@neuroqore.com', '', '', '成熟期', '单方向重复经颅磁刺激治疗抑郁症', '无', '1500952855872', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('683', null, '刘永兴', '', 'CEO', '', 'liuyox@gmail.com', '', '', '成长期', '半月板修复产品', '无', '1500952855881', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('684', null, 'Adi Zamir', '', 'CEO', '', 'adi@dermacompare.com', '', '', '成长期', '黑色素瘤辅助诊断APP', '无', '1500952855894', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('685', null, 'Nick Damiano', '', 'CEO', '', 'nick@zenflow.com', '', '', '成长期', '无创有效的前列腺良性增生(BPH)支架', '无', '1500952855907', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('686', null, 'Neil C. Barman', '', 'CEO', 'Ziva Medical', 'nbarman@zivamedical.com', '', '', '初创期', 'RF射频消融治疗多囊卵巢综合症', '无', '1500952855917', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('687', null, 'Ruey-Kang Chang', '', 'CEO', '', 'rk.chang@qtmedical.com', '', '', '成熟期', '12导联可家用ECG检测筛查', '无', '1500952855934', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('688', null, '胡拥军', '', 'CEO', '武汉豆听科技有限公司', '<huyongjun@tinglibao.com.cn', '', '', '成熟期', '洗耳器', '无', '1500952855952', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('689', null, '刘海峰', '', 'CEO', '武汉康复得生物科技股份有限公司', 'liuhaifeng@kfdbio.com', '', '', '成熟期', '尿草酸检测试剂盒', '无', '1500952855960', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('690', null, '郑岷雪', '15676185408', 'CEO', '分子诊断公司', 'minxue.zheng@gmail.com', '', '', '成熟期', 'HPV筛查试剂盒', '郑岷雪博士和中国科学院苏州生物医学工程技术研究所（医工所）共同出资创建已在苏州落户，项目融资做HPV注册申报，已服务入股的模式洽谈', '1500952855970', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('691', null, '孙京海', '18062415280', 'CEO', '', '1613575795@qq.com', '', '', '初创期', '荧光定量检测心肌梗塞试剂盒,产前检测', '无', '1500952855976', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('692', null, '杨广宇', '13788919124', 'CEO', '武汉瀚海新酶生物科技', 'yang@hzymes.com', '', '', '成长期', '糖化血红蛋白生化检测试剂', '无', '1500952855983', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('693', null, '王维真', '', 'CEO', '', 'wangjenny@jenivision.com', '', '', '初创期', '干眼症治疗首创新药和青光眼治疗创新药', '无', '1500952855992', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('694', null, '刘畅', '', 'CEO', '', 'chang_liu_2@brown.edu', '', '', '初创期', 'BPFlex 智能可穿戴动态血压测量系统', '无', '1500952856006', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('695', null, 'Austin Walker', '', 'CEO', '', 'austin@innoveinmedical.com', '', '', '初创期', '静脉人工瓣膜', '无', '1500952856014', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('696', null, '樊毅', '', 'CEO', '', '13910725677@139.com', '', '', '初创期', '模法眼镜', '无', '1500952856021', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('697', null, '张静澜', '', 'CEO', '', 'jinglanzh@hotmail.com', '', '', '初创期', '孕前和新生儿的医学遗传学检测', '无', '1500952856030', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('698', null, '李骏', '', 'CEO', '', 'tuyue8801@gmail.com', '', '', '成长期', '人体内肠道诊查微型机器人系统', '无', '1500952856042', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('699', null, 'Vanessa Vankerckhoven', '', 'CEO', 'novosanis', 'vanessa.vankerckhoven@novosanis.com', 'www.novosanis.com', '', '成长期', '微定量精准皮下注射器械', '微定量精准皮下注射器械', '1500952856058', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('700', null, 'Eran Agmon', '', 'CEO', 'Sensifree', 'erana@sensifree.com', 'www.sensifree.com', '', '成长期', '腕戴式血压监测仪', '腕戴式血压监测仪（免袖带）', '1500952856068', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('701', null, 'Alejandro Zamorano', '508.397.8440', 'CEO', 'PainQx', 'AZamorano@PainQx.com', 'www.PainQx.com', '', '初创期', '疼痛量化管理', 'PainQx is a diagnostic/software company that has developed a next generation approach to objectively measure pain in humans. The PainQx platform achieves this by assessing neural activity from a patient’s brain and processing and decoding the data through proprietary algorithms. The output is a scaled pain and neurological side effects biomarker that is directly correlated to a patient’s pain state.', '1500952856078', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('702', null, '吴建中', '', 'CEO', '', 'cnwuhe@vip.163.com', '', '', '成长期', '康迪菲(苏州)生物科技有限公司', '基于人类基因检测的试剂及仪器开发', '1500952856102', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('704', null, '孟令雨', '13733338548', 'CEO', '', 'info@medihorizon.com', '', '', '成熟期', '天健行', '印度医疗旅游', '1500952856139', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('705', null, '王家辉', '', 'CEO', '', '18530159488@139.com', '', '', '成长期', '音频骨传导视觉多媒体可穿戴系统', '无', '1500952856154', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('706', null, '杨辰烨', '', 'CEO', '', 'jasony_84@hotmail.com', '', '', '初创期', '基于新型模块化微流控生物芯片的体外癌细胞建模及筛药平台', '无', '1500952856163', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('707', null, '安岡克典', '', 'CEO', 'Excel', 'yasuoka@excel-jpn.com', 'www.excel-jpn.com', '', '成熟期', 'Excel老年护理设备/系统', '产品已成熟并上市，产品目录丰富', '1500952856170', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('708', null, '张鹏', '', 'CEO', '', 'peng.zhang@uc.edu', '', '', '初创期', '基于新型非抗生素材料的便携式装置应用于防止病菌感染', '无', '1500952856189', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('709', null, '马巧丽', '', 'CEO', '', 'qiaoli.ma@gmail.com', '', '', '初创期', '新型近红外淋巴管示踪剂及成像技术的开发与产业化', '无', '1500952856198', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('710', null, '杨红军', '', 'CEO', '', 'hjyang@iccas.ac.cn', '', '', '初创期', '快速构建抗血栓纯聚氨酯人造血管', '无', '1500952856214', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('711', null, '张潮', '', 'CEO', '', 'chz2009@med.cornell.edu', '', '', '初创期', '生物医学测序数据服务系统', '无', '1500952856226', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('712', null, 'Derek Herrera', '', 'CEO', 'Spinal Singularity', 'info@spinalsingularity.com', 'http://www.spinalsingularity.com/', '', '成长期', 'The Connected Catheter™', 'Better catheter：更好的导尿管 在去年，超过500万的人使用了导尿管。Spinal Singularity的导尿管可以让你通过一个磁铁阀来控制尿流。这个导尿管体积非常小，在家里就可以自己安装／拆除。今年Spinal Singularity将进入人体临床实验，并且计划明年可以发售。', '1500952856239', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('713', null, '潘翔', '', 'CEO', '', '13912961748@139.com', '', '', '初创期', '全时陪伴-健康监测系统腕表', '无', '1500952856252', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('714', null, '潘攀', '', 'CEO', '', 'pan.pan.phd@gmail.com', '', '', '初创期', '愈伤快帖', '无', '1500952856260', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('715', null, '任鹏宇', '', 'CEO', '', 'reaping2006@gmail.com', '', '', '初创期', '反馈式自调节褥疮监测预防智能系统', '无', '1500952856271', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('716', null, '庄杰', '', 'CEO', '', 'zhuangjie007@163.com', '', '', '初创期', '用于实体肿瘤消融的高电压纳秒脉冲医疗器械', '无', '1500953014800', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('717', null, '任无畏', '', 'CEO', '', 'rww0602@gmail.com', '', '', '初创期', '基于MEMS的多功能荧光分子断层成像系统', '无', '1500953014812', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('718', null, 'Andrea Maesani', '', 'CEO', 'Intento', 'andrea.maesani@intento.ch', '', '', '初创期', '可穿戴中风康复解决方案', '无', '1500953014820', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('719', null, '叶亚金', '', 'CEO', '', 'qx@niaodaifu.cn', '', '', '成熟期', '尿大夫', '手机拍照进行常规尿检', '1500953014827', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('720', null, '于寅', '', 'CEO', '', 'frank.yin.yu@gmail.com', '', '', '初创期', '关节创伤和骨关节炎药物以及靶向给药平台', '无', '1500953063588', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('721', null, '沙林楠', '', 'CEO', '', 'shaln92138@gmail.com', '', '', '初创期', '糖糖运动医生', '无', '1500953063600', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('722', null, '周慧君', '', 'CEO', '', 'huijun@idna.com.cn', '', '', '成熟期', '益基-Celsee JV项目', '无', '1500953063610', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('723', null, 'Magnus Blixt', '', 'CEO', 'LUMINA', 'magblixt@gmail.com', '', '', '成熟期', 'LUMINA胶粘敷料', '无', '1500953063656', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('724', null, 'No Name', '0755-86381070', 'CEO', '深圳中科金证科技有限公司', 'yangj@casking.com.cn', '', '', '初创期', '中科金证医疗云、影像云', '医疗云、影像云，大数据平台。', '1500953063667', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('725', null, 'No Name', '021-80123585', 'CEO', '雅特士生物科学技术有限公司', 'nana.wu@adaltis-abc.net', '', '', '初创期', 'T-Gex二代测序分析解读平台', '意大利亚特斯在中国的分公司，致力于T-Gex二代测序平台', '1500953063681', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('726', null, 'No Name', '029-84290935', 'CEO', '广州翔康生物技术公司', 'yimin@xkbiotec.com', '', '', '初创期', '广州翔康CRO', '无', '1500953063693', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('727', null, 'No Name', '', 'CEO', '广州佳贝尔环保有限公司', 'liu_shukai@126.com', '', '', '成熟期', '功能水净化器', '利用生物膜技术进行水质的净化', '1500953063709', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('728', null, 'No Name', '', 'CEO', '深圳爱湾医学检验所', 'huangning@aonelab.com.cn', '', '', '初创期', '新生儿遗传代谢病检测', '新生儿的遗传代谢疾病检测及辅助治疗方案，岛津气相色谱仪质谱联用仪', '1500953063718', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('729', null, 'No Name', '', 'CEO', '北京华诺时代科技有限公司', 'zhangminwen@honortech.cn', '', '', '成长期', '基因检测方法学-π基因', '根据基因检测结果指定个性化健康管理方案', '1500953063735', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('730', null, 'No Name', '0755-26508339', 'CEO', '深圳新产业生物医学工程股份有限公司', 'marketsnibe@163.com', '', '', '成熟期', '全自动化学发光免疫分析仪', '临床检验分析仪器', '1500953063759', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('731', null, 'Isabel Hoffmann', '', 'CEO', 'TellSpec USA', 'isabel@tellspec.com', '', '', '成长期', '掌上型分析食物光谱仪', '无', '1500953063884', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('732', null, 'Mor Stavsky', '', 'CEO', '', 'mors@senspd.com', '', '', '初创期', '早期自闭症客观筛查诊断', '无', '1500953063898', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('733', null, 'Wayne Bacon', '', 'CEO', 'Garwood Medical Devices,  LLC', 'wbacon@garwoodmedical.com', '', '', '初创期', '感染控制', '无', '1500953063913', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('734', null, 'Derek Dashti', '', 'CEO', 'D&P Bioinnovations', 'dcdashti@dpbioinnovations.com', '', '', '初创期', '食管再生修复生物材料', '无', '1500953063925', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('735', null, 'Jeet Raut', '', 'CEO', 'behold.ai', 'jeet@behold.ai', '', '', '初创期', 'Behold.ai人工智能医疗软件', '无', '1500953063940', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('736', null, 'Harry Gandhi', '', 'CEO', 'Medella Health', 'harry@medella.ca', '', '', '初创期', 'Medella血糖监测智能隐形眼镜', '无', '1500953063949', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('737', null, '向敬', '', 'CEO', '', 'jing.xiang@mecurer.com', '', '', '初创期', '便携式脑磁图系统', '无', '1500953063958', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('738', null, '施文典', '', 'CEO', '', 'wendian@cytochipinc.com', '', '', '初创期', '血细胞检测', '无', '1500953063970', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('739', null, '吴竞尧', '', 'CEO', '', 'jywu90@gmail.com', '', '', '初创期', '新型金属基可吸收血管支架', '无', '1500953063978', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('740', null, '孙国明', '', 'CEO', '', 'gmsun8@gmail.com', '', '', '初创期', '水凝胶全皮肤再生材料', '无', '1500953063993', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('741', null, '王璞', '', 'CEO', '', 'puwang101@gmail.com', '', '', '成长期', '血管内光声成像在心血管疾病中的应用', '无', '1500953064005', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('742', null, '孙瑞', '', 'CEO', '', 'ruisun@bu.edu', '', '', '成长期', '智能输液管理系统', '无', '1500953064015', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('743', null, 'InnoVein', '', 'CEO', 'InnoVein', 'info@innoveinmedical.com', 'http://www.innoveinmedical.com/', '', '初创期', '静脉的假体阀门', '每年都有400万人们花费上千万在静脉维护上。InnoVein通过假体阀门来帮用户维护他们的静脉。InnoVein已经在绵羊身上成功地进行了实验，并且计划在2017年进入人体临床实验。', '1500953064028', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('744', null, 'Unima', '', 'CEO', 'Unima', 'info@unima.com.mx', 'http://www.unima.com.mx/nsite/index.html', '', '初创期', '通过纸条来进行便宜高效的疾病诊断', '无', '1500953064040', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('745', null, 'Airo Health', '', 'CEO', 'Airo Health', 'team@airohealth.com', 'http://www.getairo.com/', '', '初创期', '卡路里追踪反馈 可穿戴设备', '无', '1500953064047', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('746', null, '庄永杰', '', 'CEO', '', 'yongjie.zhuang@163.com', '', '', '初创期', '铸梦三维3D打印', '无', '1500953064074', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('747', null, '董理', '', 'CEO', '', 'dliepfl@gmail.com', '', '', '初创期', '高通量药物筛选微流控芯片', '无', '1500953064082', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('748', null, 'Marc Thibonnier', '', 'CEO', 'AptamiR Therapeutics, Inc.', 'mthibonnier@aptamir.com', '', '', '初创期', '将脂肪储存细胞转化为脂肪燃烧细胞，治疗肥胖', '将脂肪储存细胞转化为脂肪燃烧细胞，治疗肥胖', '1500953064099', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('749', null, 'Dedi Gilad', '', 'CEO', 'Tytocare', 'dedig@tytocare.com', '', '', '成熟期', '家用检查诊断仪', '家用医疗器械，可做心、肺、耳、喉、体温、皮肤的检查。', '1500953064112', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('750', null, 'Manu S. Nair', '', 'CEO', 'Oklahoma Medical Research Foundation (\"OMRF\")', 'manu-nair@omrf.org', 'www.omrf.org', '', '成熟期', '研究机构，治疗各种疾病的治疗技术', '研究机构，治疗各种疾病的治疗技术', '1500953064125', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('751', null, 'Morteza Ahmadi', '', 'CEO', 'qidni', 'ma@qidni.com', 'http://qidni.com/', '', '初创期', '可植入人工肾', '无需动力，可植入体内两年', '1500953064140', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('752', null, 'James Janicki', '', 'CEO', '3idx', 'jim@3idx.com', '', '', '初创期', '败血症感染物快速鉴定', '快速鉴定微生物1小时内完成', '1500953064159', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('753', null, 'Greg King', '+1.415.902.4721', 'CEO', 'Fibralign', 'gking@fibralignbio.com', '', '', '初创期', '再生材料（淋巴水肿治疗+软组织修复）', '独特的材料特性，能促进淋巴再生', '1500953064180', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('754', null, 'Daniel Nadis', '2031379201', 'CEO', 'Occams Resources', 'daniel.nadis@occamsresources.com', 'www.occamsresources.com', '', '初创期', 'Larger Venture', '项目中介机构（连接国内外项目和投资人）', '1500953064199', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('755', null, '李少勇', '', 'CEO', 'Applied Genetic Technologies Corporation (AGTC)公司', 'lisybj@gmail.com', '', '', '初创期', '利用AAV重组病毒载体表达单抗治疗肺癌', '重组病毒载体利用AAV导入人体治疗肺癌', '1500953064209', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('756', null, 'Amit Zilberstein', '', 'CEO', 'NG Needle', 'amit@ngneedle.com', '', '', '初创期', '经皮肺穿刺活检 生物电阻抗针', '无', '1500953064224', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('757', null, 'Alexis Zervoglos', '', 'CEO', '', 'alexis@getqardio.com', '', '', '成长期', 'QardioCore可穿戴的无线蓝牙心电图仪', '无', '1500953064234', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('758', null, 'Oren Oz', '', 'CEO', 'Nuvo Group', 'oren.oz@nuvo-group.com', '', '', '成长期', '监测母婴心跳等体征信息的安全绑带', '无', '1500953064248', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('759', null, 'Michael Seres', '', 'CEO', '11 Health', 'michael@11health.com', '', '', '初创期', 'Ostom-i Alert 造口术袋传感器', '无', '1500953064267', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('760', null, 'Shanil Gunasekara', '', 'CEO', 'eTreatMD', 'sgunasekara@etreatmd.com', '', '', '成熟期', '关节炎诊断App', '无', '1500953064282', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('761', null, 'Kevin A Auton Ph.D', '', 'CEO', 'Aseptika Ltd (Activ8rlives)', 'kevin.auton@aseptika.com', '', '', '成长期', '呼吸道感染病原体平台技术', '无', '1500953064290', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('762', null, '陈功', '', 'CEO', '', 'gong118911@126.com', '', '', '初创期', '可穿戴式下肢康复/助老外骨骼机器人', '无', '1500953064299', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('763', null, 'No Name', '', 'CEO', '深圳瑞奥康晨生物科技有限公司', 'service@reohealth.cn', '', '', '初创期', '个体遗传检测及健康管理方案', '无', '1500953064310', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('764', null, 'Jessica', '', 'CEO', 'IntuiTap medical', 'jtraver@intuitapmedical.com', 'www.intuitapmedical.com', '', '初创期', '腰间穿刺手持设备', '无', '1500953064319', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('765', null, 'Sergios Katsaros', 'M: +30 6974385127', 'CEO', 'HCi Viocare', 'sergios.katsaros@hciviocare.com', '', '', '初创期', '糖尿病足智能鞋垫', '无', '1500953064332', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('766', null, 'Richard Wang', '', 'CEO', 'Clinicloud', 'richard.wang@clinicloud.com', 'https://www.clinicloud.com/', '', '成熟期', '体温计&听诊器便携可穿戴设备+APP', '现需在中国注册CFDA（保留上海生产线），在线医生平台搭建', '1500953064338', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('767', null, '李章勇', '13647697607', 'CEO', '重庆海睿科技有限公司', 'lizy@cqupt.edu.cn', '', '', '成长期', '心血管恶性事件在线预警系统和装备', '通过外置设备采集心电信号，通过APP呈现实时心率与呼吸率、 心电图波形、指标参数、心血管深度信息、精神压力状况、接收健康建议 引导改善HRV，云端建立大数据库', '1500953064348', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('768', null, 'No Name', '', 'CEO', '深圳博大博聚科技有限公司', 'bdbj@bodboge.com', '', '', '初创期', '全自动细胞计数器', '无', '1500953064356', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('769', null, 'No Name', '', 'CEO', '深圳市常键康徕微生态科技有限公司', '81829670@qq.com', '', '', '初创期', '胃肠道健康管理平台', '无', '1500953064376', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('770', null, 'Zhu Weiliang', '0755-26473319', 'CEO', '深圳市亚辉龙生物科技股份有限公司', 'zhuweiliang@szyhlo.com', 'www.szyhlo.com', '', '初创期', '免疫分析仪', '无', '1500953064386', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('771', null, 'No Name', '0022-58617161', 'CEO', '中源协和细胞基因工程股份有限公司', 'xupenga@vcanbio.com', 'www.vcanbio.com', '', '初创期', '基金检测及体外诊断检测', '无', '1500953064403', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('772', null, 'Colin Greenspon', '', 'CEO', 'Adimab', 'bd@adimab.com', 'http://www.adimab.com/', '', '初创期', '快速发现人类抗体的技术', '比现有技术更快发现人类抗体', '1500953064412', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('773', null, 'Aya Jakobovits', '', 'CEO', 'Adicet Bio, Inc.', 'info@adicetbio.com', 'www.adicetbio.com', '', '初创期', '新型通用免疫细胞治疗平台技术(癌症和其他病症）', 'Adicet Bio，Inc.正在开发用于癌症和其他疾病适应症的新型通用免疫细胞治疗平台技术，特别是针对源自胞内蛋白质组的疾病特异性靶标的新型免疫治疗', '1500953064425', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('774', null, 'Amanda J. Shaw', '', 'CEO', 'Adaptimmune', 'usinfo@adaptimmune.com', 'http://www.adaptimmune.com/', '', '初创期', 'TCR', 'Adaptimmune正在开发使用工程化T细胞用于严重疾病的颠覆性治疗。 公司的核心技术是TCR。', '1500953064433', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('775', null, 'Paul Fletcher-Hill', '', 'CEO', 'Patientbank', 'info@patientbank.us', 'https://www.patientbank.us/', '', '初创期', '医院流程管理，病患数据切入。', '无', '1500953064448', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('776', null, 'No Name', '', 'CEO', '广州中科新知科技有限公司', 'jeanine.li@senviv.com', '', '', '成长期', '心晓-基于人工智能的虚拟家庭医生', '无', '1500953064455', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('777', null, 'Erin Frey', '', 'CEO', 'Kip Health', 'hi@hellokip.com', 'http://www.kiphealth.com/', '', '初创期', '心理治疗App', 'Psychotherapist patient communications：帮助心理理疗师和病人交流 每5个美国人中，就有1个人有心理的问题。病人们可以通过Kip来追踪每天的症状和进度。这些数据会被分享给他们的心理理疗师，用来校正他们的治疗。在过去的6周内，Kip Health已经将超过90位临床医生带上了这个平台。', '1500953064462', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('778', null, 'No Name', '', 'CEO', '上海爱易生物医学科技股份有限公司', 'aehealth@163.com', '', '', '成长期', '肿瘤用药个体化靶标检测', '无', '1500953064473', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('779', null, 'Linda Avey', '', 'CEO', 'Perlstein Lab', 'info@perlsteinlab.com', 'http://www.perlara.com/', '', '初创期', '罕见病药物自动发现', 'Automated drug discovery for rare diseases：罕见病的自动药物发现 每12个人中，就有一个人患有罕见病。而这个人会花费50万美金以上来获得康复。Perlstein Lab通过使用CRISPR来修改染色体组，在虫子、苍蝇、鱼的身上寻找罕见病的治疗方法。然后，Perlstein Lab可以将发现的药物卖给患有罕见病的人。', '1500953064483', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('780', null, 'Ke Cheng', '', 'CEO', 'HistoWiz', 'info@histowiz.com', 'https://histowiz.com', '', '初创期', '癌症研究的组织病理学数据库', 'Histopathology for cancer research：癌症研究的组织病理学 科学家们花费很多的时间来切断和粘连组织样本。HistoWiz承诺可以通过让科学家邮寄组织样本、建造研究数据库，来节省2周以上的时间。科学家们可以在网上观察组织样本，还能够通过遥控来控制虚拟显微镜。HistoWiz现在在全球已经有超过400个客户。', '1500953064497', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('781', null, '张军', '13611333919', 'CEO', '', 'alilly18@qq.com', '', '', '初创期', '肿瘤诊断系列试剂盒项目', '研发 和生产适合国内需求的新型肿瘤检测试剂盒与抗肿瘤药物', '1500953064513', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('782', null, '沈中平', '15122036941', 'CEO', '', 'receive99@hotmail.com', '', '', '初创期', '国际新生婴儿检测试剂公司', '指在婴儿出生后的10天内，在婴儿足跟上采取几滴血，用快速的实验室方法筛查出新生婴儿某些严重的遗传性疾病，以便在早期得到诊断和早期治疗，从而避免部分婴儿的智力低下和严重疾病', '1500953064530', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('783', null, 'Artyom Astafurov', '', 'CEO', 'OpenTrons', 'info@opentrons.com', 'https://opentrons.com', '', '初创期', '生命科学的第一个PC', '生命科学的第一个PC 很多生命科学的基层研究的重复性都非常高。像吸液／移液的科研人员，要一个试管一个试管地重复。OpenTrons将他们自己称为“生命科学的第一个PC”。这家公司从中国的Haxclr8tr诞生，在2014年完成了一次成功的Kickstarter众筹。现在，它在以每月50%的速度增长。', '1500953064542', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('784', null, 'No Name', '', 'CEO', '深圳市智慧健康产业发展有限公司', '1326783443@qq.com', '', '', '成熟期', '一体化健康小屋/移动体检包', '一体化健康小屋/移动体检包', '1500953064551', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('785', null, 'No Name', '', 'CEO', '深圳万和制药有限公司', 'henyidi@wanhe-phar.com', '', '', '成熟期', '缓/控释微丸，超微丸', '引进，研发控释胶囊，复方氨基酸胶囊/颗粒', '1500953123807', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('786', null, 'No Name', '', 'CEO', '深圳市合一康生物科技股份有限公司', '1131044998@qq.com', '', '', '成熟期', '免疫细胞技术美容', '新三板上市公司，免疫细胞技术第一股，主营美容产品', '1500953123827', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('787', null, 'No Name', '0755-29111907', 'CEO', '深圳市三方医药科技有限公司', '1520140765@qq.com', '', '', '成熟期', '医用仿生载体贴膜', '医用仿生载体贴膜', '1500953123839', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('788', null, 'No Name', '0755-89219055', 'CEO', '深圳市太空科技南方研究院', 'chenying99999@163.com', '', '', '成熟期', '大规模干细胞自动培育装置', '大规模干细胞自动培育装置', '1500953123849', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('789', null, 'No Name', '', 'CEO', '深圳市爱康健齿科集团有限公司', '997896809@qq.com', '', '', '成熟期', '口腔医院', '口腔医院', '1500953123860', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('790', null, '康石磊', '', 'CEO', '上海金弗康生物科技公司', 'shilei.kang@geneforhealth.cn', '', '', '成熟期', '新型大数据分析平台', '新型大数据分析平台，较以往的平台更为快捷准确', '1500953123881', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('791', null, '耿明刚', '13504199852', 'CEO', '上海爱蓝环保工程有限公司', 'shalhb@163.com', '', '', '初创期', '肽类诊断试剂', '肽类诊断试剂', '1500953123901', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('792', null, '朱神红', '13632910177', 'CEO', '深圳市华讯方舟软件信息科技有限公司', 'zhushenhong@huaxunchina.cn', '', '', '初创期', '生物科技电子芯片', '生物科技行业的电子芯片技术', '1500953123908', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('793', null, 'Vivek Nanda', '', 'CEO', 'Klara', 'v.nanda@klara.com', 'https://www.klara.com', '', '成熟期', '连接医院医生、患者的APP平台', 'Klara was founded in 2013 with the vision to change the broken healthcare experience by directly connecting doctors and patients through technology.   Klara’s secure and HIPAA-compliant medical messaging platform allows practices to centralize all their medical communication in one simple and secure app.', '1500953123926', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('794', null, '刘纯清', '17764232385', 'CEO', '', '3067177091@qq.com', '', '', '初创期', '精准个体化医疗、重离子质子治疗技术', '引进个体化医疗，同时结合重离子质子治疗技术，通过遗传分析，预防疾病发生，对已发病人考虑基因型，从而使治疗最优化，同时引进重离子治疗技术，采用高能重离子束治疗肿瘤，降低并发症，最大化功效的同时最小化副作用，提高治愈率。', '1500953123933', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('795', null, '田兆兴', '', 'CEO', '', 'tjtzx@126.com', '', '', '初创期', '线控记忆伞', '线控技术研发新的诊疗记忆伞', '1500953123940', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('796', null, '肖奇才', '', 'CEO', '香港中文大学', 'qicaixiao@gmail.com', '', '', '初创期', '光动力诊疗药物', '使用光敏药物作为新型治疗手段', '1500953123950', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('797', null, '刘柯兰', '', 'CEO', '', 'liliu_98@yahoo.com', '', '', '初创期', 'CMOS生物芯片和POCT分子诊断', '无', '1500953123959', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('798', null, '李则轩', '', 'CEO', '武汉白原科技有限公司', '6133570@qq.com', '', '', '成长期', 'GeneTell智能健康管理平台', '结合社交网络，个性化娱乐的个人基因组检测服务项目', '1500953123966', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('799', null, '邱磊', '', 'CEO', '澳大利亚国立大学', 'qiulei@hotmail.com', '', '', '初创期', '便携式12导联心电监护仪', '便携式12导联心电监护仪', '1500953123974', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('800', null, '于忠启', '', 'CEO', '', '15019205396@139.com', '', '', '初创期', '深圳汇松科技发展有限公司', '无', '1500953123995', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('801', null, '张志霞', '15210434676', 'CEO', '', '15210434676@139.com', '', '', '初创期', '北京亿昊基因技术有限公司', '无', '1500953124013', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('802', null, '朱斌', '', 'CEO', '', 'Bin_Zhu@hms.harvard.edu;', '', '', '初创期', 'RNA聚合酶及试剂盒开发', '无', '1500953124028', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('803', null, '何伟', '18949667828', 'CEO', '', 'hewei@163.com', '', '', '初创期', '乳腺炎生物活性材料', '无', '1500953124040', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('804', null, '吕丘仑', '', 'CEO', '', 'aaron.ql.lu@gmail.com', '', '', '初创期', '动脉瘤早期预警筛查', '无', '1500953124047', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('805', null, '刘海军', '13651313048', 'CEO', '武汉正天成生物科技', 'ztclhj@163.com', '', '', '成熟期', '复配澄清剂', '海洋生物提取的食品添加剂', '1500953124055', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('806', null, '田洪涛', '1827171618', 'CEO', '协和医院', 'taozii@hotmail.com', '', '', '初创期', '弹力止血袜', '无', '1500953124106', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('807', null, '蒋丽', '18607133516', 'CEO', '佰奥达生物科技武汉有限公司', 'HYJTJL@qq.com', 'www.biodapoct.com', '', '成长期', 'POCT定量检测系统', 'POCT定量检测系统', '1500953124115', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('808', null, '张玉峰', '18607198656', 'CEO', '武汉维印科技有限责任公司', '380497633@qq.com', '', '', '成熟期', '医用3D打印生物骨粉的产业化', '无', '1500953124123', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('809', null, 'Aron Rachamim', '', 'CEO', 'Orphidia, Inc.', 'aron@orphidia.com', 'http://www.orphidia.com/', '', '成长期', 'orphidia: POCT can finish 50 tests by one drop of blood', '规划有50个血液标志物检测项目，同时集成在一张微流控芯片，20分钟内完成', '1500953124143', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('810', null, '彭义杰', '13004506176', 'CEO', '贝尔曼生物科技有限公司', 'yijiepeng@yahoo.com', '', '', '初创期', '癌症的伴随（精准）诊断系统的产业化', '新型靶向治疗诊断和疗效评估免疫系统的研发', '1500953124151', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('811', null, 'Nina Tandon', '', 'CEO', 'Epi Bone', 'nina@epibone.com', '', '', '成长期', '3D打印自体脂肪干细胞再生骨', '将3D打印和再生医学结合，提取病人的干细胞，在体外诱导分化，并通过生物反应器培养成目标形状的人造骨（facial bone, cartilage, dental）', '1500953124159', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('812', null, '德万•莫里斯•埃尔文', '+1213 5508293', 'CEO', '', 'doctordmi@gmail.com', '', '', '初创期', '基于干细胞的再生医学技术用于医疗和健康领域的皮肤修复', '无', '1500953124165', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('813', null, '曾承', '18986213117', 'CEO', '武汉泰乐奇信息科技有限公司', 'wh_talent@163.com', '', '', '初创期', '治趣—在线虚拟诊疗平台', '无', '1500953124173', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('814', null, '夏艳红', '', 'CEO', '中检所', '497261818@qq.com', '', '', '初创期', '样品检验', '无', '1500953124183', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('815', null, '王亚楠', '15527748255', 'CEO', '', '15527748255@139.com', '', '', '初创期', '医疗器械（二类）、技术服务', '无', '1500953124191', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('816', null, '顾朝江', '15926328415', 'CEO', '', 'cg2447jwsun@outlook.com', '', '', '成长期', '抗艾滋病毒药物评价模型和新一代治愈型纳米药物的研发', '无', '1500953124199', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('817', null, '张胜民', '', 'CEO', '华中科技大学生命科学院621', 'smzhang@hust.edu.cn', '', '', '初创期', '纳米材料、3D打印（人鼻、耳器官支架）', '无', '1500953124208', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('818', null, '黄福龙', '', 'CEO', '武汉华威生物材料工程有限公司', 'ludajjp@126,com', '', '', '成长期', '生物陶瓷材料（骨科、牙科）', '无', '1500953124216', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('819', null, '林华明', '', 'CEO', '武汉佰安博生物工程有限公司', 'bioabb@bioabb.com', '', '', '初创期', '技术服务开发平台（蛋白质、抗体、小分子技术）', '无', '1500953124226', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('820', null, '黄泽波', '18971135050', 'CEO', '武汉大学药学院', '89153438@qq.com', '', '', '成长期', '黄芪寡糖', '无', '1500953124241', null, '融资服务,生产服务,区域服务', '4', 'Y');
INSERT INTO `tbl_card` VALUES ('821', null, '杨溪', '15216677828', 'CEO', '美国麻省理工学院', 'woshi358539575@gmail.com', '', '', '成长期', '脑胶质瘤的克星 纳米颗粒', '将纳米颗粒技术与基因治疗相结合，用来治疗脑胶质瘤等肿瘤。', '1500953124248', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('822', null, '王乔', '', 'CEO', '', 'biosnp2016@hotmail.com', '', '', '初创期', '复杂疾病的遗传流行病学诊断', '无', '1500953124266', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('823', null, '刘飞', '', 'CEO', '', 'feiliu13@stanford.edu', '', '', '初创期', '基于高通量微流控芯片的外泌体提纯及癌症早期及时诊断系统', '无', '1500953124274', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('824', null, '胡昭宇', '', 'CEO', '', 'huzhaoyu@126.com', '', '', '初创期', '生物医用糖类药物分子及糖（偶联）蛋白研发平台', '无', '1500953124281', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('825', null, 'No Name', '', 'CEO', '中科健康产业集团股份有限公司', '82547435@qq.com', '', '', '成熟期', '中科健康产业集团股份有限公司', '主营业务为中药保健品的研制生产与销售。', '1500953124288', null, '融资服务,生产服务,区域服务', '4', 'Y');
INSERT INTO `tbl_card` VALUES ('826', null, 'No Name', '', 'CEO', '广州逸善舒晨生物科技有限公司', 'market@hellosun.com', '', '', '成熟期', '广州逸善舒晨生物科技有限公司', '针对鼾症的产品，智鼾垫，不影响睡眠，改善鼾症。', '1500953124296', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('827', null, '刘敏', '+862787531661', 'CEO', '中美华世通生物医药科技（武汉）有限公司', '-', '', '', '成熟期', '中美华世通生物医药科技（武汉）有限公司', '该公司主营业务为研发、生产、销售医药中间体、原料药、制剂。', '1500953124302', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('828', null, '王咏舟', '027-871962852-811', 'CEO', '武汉生之源生物科技股份有限公司', 'wangyongzhou@szybio.com', '', '', '成长期', '武汉生之源生物科技股份有限公司', '生之源是一家专业从事临床体外诊断试剂及其配套原料研发、生产和销售的高新技术企业。', '1500953124310', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('829', null, '杨卓', '18627088850', 'CEO', '湖北盛齐安生物科技有限公司', 'david.zhouyang@outlook.com', '', '', '成长期', '湖北盛齐安生物科技有限公司', '以“肿瘤囊泡”新型生物载体研发应用为基础，集肿瘤生物治疗技术研发、推广于一体的高新技术企业。', '1500953124318', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('830', null, '董腾云', '15102775567', 'CEO', '武汉汉密顿生物科技股份有限公司', '无', '', '', '成熟期', '武汉汉密顿生物科技股份有限公司', '致力于免疫细胞制备技术的研发以及提供免疫细胞制备技术服务的高新技术企业及新三板上市公司。', '1500953124326', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('831', null, '张全', '02759590066', 'CEO', '武汉海吉力生物科技有限公司', 'haijili@hygeianey.com', '', '', '成熟期', '武汉海吉力生物科技有限公司', '产品主要涵盖肿瘤个体化诊断、肿瘤早期筛查预警、遗传及心血管个体化诊断、医学检测服务、医疗分析仪器。', '1500953124333', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('832', null, '徐晶晶', '027-87001625', 'CEO', '光谷生物城生物医药园', '369157181@qq.com', '', '', '成熟期', '光谷生物城生物医药园', '光谷生物城生物医药园', '1500953124343', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('833', null, '祝擎', '18692202616', 'CEO', '武汉光谷国际生物医药企业加速器', '475700220@qq.com', '', '', '成熟期', '武汉光谷国际生物医药企业加速器', '武汉光谷国际生物医药企业加速器', '1500953124358', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('834', null, '成宁宁', '15071294520', 'CEO', '武汉豆听科技有限公司', 'chengningning@tinglibao.com.cn', '', '', '成熟期', '武汉豆听科技有限公司', '听力预防、保护、治疗为一体的移动医疗。主营业务为听力健康大数据平台，品牌主要是听力宝。', '1500953124375', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('835', null, '李慧芳', '18971175107', 'CEO', '武汉光谷新药孵化公共服务平台有限公司', '1657195685@qq.com', '', '', '成熟期', '武汉光谷新药孵化公共服务平台有限公司', '武汉光谷新药孵化公共服务平台有限公司', '1500953124385', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('836', null, '熊丹妮', '18971694743', 'CEO', '湖北益健堂科技股份有限公司', 'hinet2005@163.com', '', '', '成熟期', '湖北益健堂科技股份有限公司', '前身为武汉海纳川科技有限公司，主要经营康复类医疗器械。', '1500953124423', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('837', null, '温和春', '18622882690', 'CEO', '中科院苏州医工所天津工程技术研究院', 'wenhc@sibet.ac.cn', '', '', '成熟期', '中科院苏州医工所天津工程技术研究院', '天津市东丽区政府支持建立的研发机构。专业从事医疗器械工程技术研究和服务，高端人才培养，成果转移转化和产业孵化。', '1500953124431', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('838', null, '张旭', '13612043308', 'CEO', '执信（天津）科技企业孵化器有限公司', 'zhangxu@tj-zxfhq.com', '', '', '成熟期', '执信（天津）科技企业孵化器有限公司', '位于华明高新区低碳产业基地，建筑面积13800平方米，总投资额6000万元。天津市首个医疗行业专业孵化器。', '1500953124437', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('839', null, '赵德明', '13920522855', 'CEO', '天津中成佳益生物科技有限公司', 'zhaodeming@xinhongmedical.com', '', '', '成熟期', '天津中成佳益生物科技有限公司', '集研发、生产、销售、售后于一体的多元化企业。并拥有已通过GMP认证的万级和十万级洁净厂房。', '1500953124442', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('840', null, '李悦朕', '13032233322', 'CEO', '天津市东丽湖科教度假旅游区管委会', 'zhaoshang@tjdlh.com', '', '', '成长期', '天津市东丽湖科教度假旅游区管委会', '位于天津市中心与滨海新区核心区中心位置，区域面积68.72平方公里。', '1500953124450', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('841', null, 'Menachem Zucker, Ph.D', '+972-52-8313-890', 'CEO', 'E3D', 'menachem@elcam.co.il', 'www.elcam3d.com', '', '成熟期', 'Patch Pump', '无', '1500953179995', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('842', null, '张馨', '13920170596', 'CEO', '华明高新区', '13920170596@139.com', '', '', '初创期', '华明高新区招商', '华明高新区是天津市示范工业园区，先后被市政府和科技部批准为市级高新区和国家火炬计划节能装备特色产业基地，规划总面积约27.3平方公里，已开发面积近10平方公里。', '1500953180015', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('843', null, '王克南', '18920161938', 'CEO', '东丽经济技术开发区管委会', 'kn.wang@tjdeda.com', 'www.tjdeda.com', '', '初创期', '东丽经济技术开发区招商', '东丽经济技术开发区是1992年6月经天津市政府批准设立，2012年4月24日被批准为天津市高新技术产业开发区，2014年2月18日正式获批升级为国家级经济技术开发区，规划面积7.21平方公里。', '1500953180022', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('844', null, '栾大伟', '13821049433', 'CEO', '博奥赛斯（天津）生物科技有限公司', 'marketing@bioscience-tj.com', 'bioscience-tj.com', '', '初创期', '化学发光（CLIA）和床旁诊断（POCT）', '主要产品分为化学发光（CLIA）和床旁诊断（POCT）两类，并且仪器和试剂均配套生产。CLIA试剂方面覆盖传染病系列、高血压系列、肝纤维化系列、肿瘤标志物系列、甲状腺功能系列、性腺激素系列和糖尿病系列等十大系列，仪器方面除了半自动（PETECK96-I）还拥有管式（AXCEED 160）和板式（AXCEED 200T\\400T）等不同类别与型号的产品。同事，POCT方面主攻国际市场，心肌系列荧光定量产品及其配套检测仪器。', '1500953180028', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('845', null, '冯玉旭', '13651346413', 'CEO', '天津华安福缘医药科技有限公司', '3434570976@qq.com', 'www.hafy88.com', '', '初创期', '“中医成象”全息智能硬件设备', '一台将人体健康问题与中成药、中医疗法及食品相匹配的中医智能机器人，借助该设备，将医养上下游各产业链接融合。', '1500953180034', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('846', null, 'Niranjan', '', 'CEO', '', 'info@cyclopsmedtech.com', 'cyclopsmedtech.com', '', '成长期', 'complete balance assessment tool', '\"complete balance assessment tool\" is a wearable clinical device used to diagnose vertigo. We started working on the product in 2012 and produced a working alpha prototype in 8 months. The device was tested at a leading ENT centre in Bangalore for over 6 months. The device was showcased at AOICON and received a overwhelming response from ENT specialists from across the country. Presently we are on the verge of completing our beta prototype and the product should be commercially available by the end of 2015.', '1500953180040', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('847', null, '高志伟', '18819497599', 'CEO', '广东礼宾医疗科技股份有限公司', 'gaozw@libinhealth.com', 'www.libinhealth.com', '', '初创期', '平行健康机器人', '通过技术和经济手段解决医疗资源短缺、预后护理不足、医疗保险制度不完善等问题，立志于成为国内智慧康复解决方案的提供者、服务机器人终端的管理者。', '1500953217451', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('848', null, '李爱宁', '13911176978', 'CEO', '乐威（天津）医药科技发展有限公司', 'ainingli@lavianacorp.com', 'www.lavianacorp.com', '', '成熟期', '化学外包服务', '为全球众多著名药厂、生物制药企业提供药物化学、化学合成工艺研发、分析化学、制剂研发，及临床药物生产等群方位的化学外包服务，以及公斤级定制合成及原料药以及吨级中间体的外包生产服务。', '1500953217461', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('849', null, '邵月婷', '', 'CEO', '', 'tingshao2003@gmail.com', '', '', '初创期', 'siRNA-survivin与p53共表达系统抗前列腺癌的药物研发', '无', '1500953217468', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('850', null, '计萌', '13752365877', 'CEO', '国医华科（天津）医疗科技集团有限公司', 'evaji@gyhuake.com', '', '', '成熟期', '医疗器械', '集研发、生产、销售、临床服务为一体的医疗高新技术企业。以“开启智慧医疗，创新健康科技”为目标，致力于世界尖端医疗器械技术的研发生产，形成了“为客户提供最优质服务、实现最有效价值”的服务理念。', '1500953217474', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('851', null, '王霄', '18522000432', 'CEO', '天津鼎燕科技有限公司', 'syue2010@163.com', 'www.tjdingyan.com', '', '成熟期', '冷链监控系统', '冷链监控系统的研发和生产，引进美国的先进技术独立进行开发，研发出复合GSP、ISO15189和GMP的冷链监控系统。该系统是基于低功耗的WIFI技术，实时监控用户货品安全，对温湿度等环境数据进行记录、统计分析，超限后报警。该系统主要应用于医院、血站、医药类和物流类等对温湿度有严格要求的企业。', '1500953217482', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('852', null, '张耀洲', '13474635956', 'CEO', '天津市湖滨盘古基因科学发展有限公司', 'logo-wang@163.com', 'www.powergene.cn', '', '初创期', '第三代单分子实时高通量测序分析', '第三代单分子实时高通量测序分析及相关生物医药相关产品开发、技术服务和产品销售', '1500953217490', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('853', null, '李晓丹', '13820515810', 'CEO', '天津红中基因科技有限公司', 'bowmusic@126.com', 'www.homegene.cn', '', '初创期', '个体化精准诊疗服务', '通过运用基因组学、临床医学、生物信息学、人源肿瘤组织移植瘤模型以及临床病程管理等世界领先的科学技术手段，为医生和患者提供个性化精准诊疗服务。', '1500953217497', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('854', null, '吕铭洋', '043189361818', 'CEO', '长春维石检测技术服务有限公司', 'wishtech_yang@163.com', '', '', '初创期', '肿瘤个体化治疗指导', '以外泌体的分离检测为核心，常规肿瘤分子病理检测为基石，致力于打造肿瘤个体化治疗临床检测服务及科研一站式解决方案。', '1500953217504', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('855', null, '林穗珠', '13535066192', 'CEO', '北昊干细胞与再生医学研究院有限公司', '827716974@qq.com', '', '', '初创期', '细胞技术产品', '免疫细胞及其干细胞产品，利用基因修饰平台，发展基因修饰细胞技术，如TCR-T,TCR-HER2或IPS功能细胞等；根据精准筛选平台对个体进行检测，开发出具有针对性的细胞产品，实施真正意义的精准医疗。', '1500953217511', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('856', null, '张一男', '01084447988', 'CEO', '长和生物', 'yinan.zhang@eubio.com.cn', 'www.eubio.com', '', '成熟期', '肿瘤生物治疗', '肿瘤生物治疗研究、干细胞与再生医学研究、细胞技术研发、组织工程技术研发、基因工程研究等，同时向全国提供组织细胞冷冻存储服务。', '1500953217518', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('857', null, '何国红', '15000343962', 'CEO', '上海恒润达生生物科技有限公司', 'heguohong@dashengbio.com', 'www.dashengbio.com', '', '初创期', '上海恒润达生生物科技有限公司', '推进创新肿瘤免疫治疗技术向临床应用的转化研究。', '1500953217533', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('858', null, '程能忠', '021-20959281', 'CEO', '上海奇康生物科技开发有限公司', 'chengnz@163.com', '', '', '成熟期', '上海奇康生物科技开发有限公司', '公司致力于再生医学临床细胞治疗技术平台产业转化，已获多项国家基金支持。', '1500953217541', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('859', null, '崔小利', '15135148011', 'CEO', '山西康斯亚森生物科技有限公司', 'curecell@163.com', '', '', '成熟期', '山西康斯亚森生物科技有限公司', '已投资建设太原高新区康森肿瘤专科医院和太原高新区康斯亚森肿瘤研究所，旨在研发和开发生物免疫细胞和新型抗肿瘤药物。', '1500953217549', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('860', null, '边珊珊', '18101130627', 'CEO', 'GE医疗生命科学事业部', 'shanshanbian@ge.com', '', '', '成熟期', 'GE医疗生命科学事业部', '该事业部的产品技术主要应用于基因科学、蛋白质科学、药物开发研究以及生物制药、诊断、法医和环保等行业。', '1500953217555', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('861', null, '张海燕', '15943016111', 'CEO', '吉林亚泰医药产业园管理有限公司', '751027788@qq.com', '', '', '成长期', '吉林亚泰医药产业园管理有限公司', '国家级开发区-长春新区的规划、运营企业。亚泰国际健康产业园是亚泰集团发展战略的重要载体和高新示范项目。2020年将全部建成。', '1500953217561', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('862', null, 'No Name', '01056315318', 'CEO', '北京百奥赛图基因生物技术有限公司', 'info@bbctg.com.cn', '', '', '成熟期', '北京百奥赛图基因生物技术有限公司', '建立了基因敲除小鼠开发与服务平台，包括小鼠、大鼠、细胞系、灵长类动物四类敲除与敲入服务系统。', '1500953217571', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('863', null, '毕薇薇', '04343676021', 'CEO', '吉林省拓华生物科技有限公司', 'thswkfb@126.com', '', '', '成熟期', '拓华生物科技有限公司', '公司业务主要范围涉及技术合作、医疗机构投资、健康产业投资、保健品和化妆品等。', '1500953217579', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('864', null, '张君慧', '13535080403', 'CEO', '广州市达瑞生物技术股份有限公司', 'daruinipt@163.com', '', '', '成熟期', '广州市达瑞生物技术股份有限公司', '长期专注于出生缺陷、遗传病、肿瘤等领域的筛查和诊断技术，并致力于二代基因测序技术和高端免疫诊断技术产品的开发及应用。', '1500953217585', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('865', null, '李正成', '18520836431', 'CEO', '本康生物制药（深圳）有限公司', 'lizhengcheng07@163.com', '', '', '成熟期', '本康生物制药（深圳）有限公司', '主要从事生物制药和细胞治疗创新工具与技术解决方案，并建立起了针对细胞靶向修饰等的研究平台。', '1500953217590', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('866', null, '张勇', '01056610996', 'CEO', '舒迪安医药研发（北京）有限公司', 'sotio@sotio.com', '', '', '成熟期', '舒迪安医药研发（北京）有限公司', '致力于开发活化树突状细胞的新疗法，采用基于自有知识产权的细胞技术开发新的治疗方法，填补现有医疗空缺。', '1500953217597', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('867', null, '咸秀艳', '0755-26993192-8062', 'CEO', '深圳来福士医疗器械有限公司', 'brand@feellife.com', '', '', '成熟期', '深圳来福士医疗器械有限公司', '开创了第三种给药方式，智能雾化，减少了传统给药的不便性及危害。', '1500953217605', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('868', null, '官恩同', '13808343678', 'CEO', '重庆大地企业公园', 'ddqygy@qq.com', '', '', '初创期', '重庆大地企业公元', '定位于大健康服务领域，以生物制药和医疗器械为主的重点都市楼宇产业园。', '1500953217614', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('869', null, '陈永泓', '0755-26710795', 'CEO', '深圳邦普医疗设备系统有限公司', 'marketing@bpump.com.cn', '', '', '成熟期', '深圳邦普医疗设备系统有限公司', '专注于心血管疾病检测和个人心健康管理解决方案的研究。提供多种检测设备。', '1500953217627', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('870', null, '赵伟', '13241784328', 'CEO', '中博瑞康（北京）生物技术有限公司', 'zhaowei@sinobiocan.com', '', '', '成熟期', '中博瑞康（北京）生物技术有限公司', '公司着重发展基因检测和分子诊断，能够提供其标准化制备与管理解决方案、耗材管理。', '1500953217644', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('871', null, '孙峰波', '18010156905', 'CEO', '北京泽平科技有限责任公司', 'sunfengbo@bjzeping.com', '', '', '成熟期', '北京泽平科技有限责任公司', '北京泽平科技有限责任公司委2003年成立的新技术产品贸易公司。专营进口生物试剂，科学仪器，实验室消耗品，化工原料及医药中间体。', '1500953217651', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('872', null, '田立国', '021-62728646', 'CEO', '力康生物医疗科技控股集团', 'shanghai@healforce.com', '', '', '成熟期', '力康生物医疗科技控股集团', '力康是香港的医疗器械与软件的研发、生产、制造商。产品主要包括生物安全柜、离心机、PCR、洁净工作台、超纯水及中央纯水系统，为医院及生物公司提供设备。', '1500953217657', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('873', null, '贾俊霞', '18068013550', 'CEO', '美国PeproTech中国代表处', 'jia@peprotech.com', '', '', '成熟期', '美国PeproTech', '美国PeproTech是重组细胞因子和蛋白的生产商。提供各种生物诊断试剂包括110种无动物成分的细胞因子和蛋白、无血清培养基、BioGems流式细胞术品牌。', '1500953217663', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('874', null, '王莹莹', '18646388959', 'CEO', '达科为生物技术有限公司', 'wang_yingying@dakewe.com', '', '', '成熟期', '达科为生物技术有限公司', '达科为公司位于深圳，成立于1999年。主要业务包括生命科学研究用仪器和试剂、医疗设备和诊断试剂等产品的研发、生产及推广。', '1500953217669', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('875', null, '李涵', '18211131824', 'CEO', '金西盟国际集团', 'sales3@sim-lab.com', '', '', '成熟期', '金西盟国际集团', '全球性生物技术公司，能够提供整套的样本低温存储设备与服务，包括大型气相液氮罐、液氮塔及管路设计与搭建、样本管理软件、低温监控系统等。', '1500953217676', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('876', null, 'Dan Clark', '310.721.6222', 'CEO', 'Linear Health Sciences', 'dan.clark@linearsciences.com', 'http://www.linearhealthsciences.com/', '', '成熟期', 'Linear Health Sciences', 'Linear Health Sciences:  IV catheters are often accidentally snagged during day-to-day hospital activity, sometimes leading to painful unintentional removal of the catheter from the body. Much like the Apple MacBook’s magnetic breakaway power connectors, linear health science has a similar concept in their OrchidValve. This device attaches to a standard IV luer lock connector in-line with standard IV tubing. If the cord is snagged the tubing will breakaway harmlessly, leaving the catheter in place. A new valve is then placed and the IV can be restarted without another catheter placement procedure, saving the hospital time and money and saves the patient from the discomfort of repeated IV attempts.', '1500953217683', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('877', null, 'Angel', '', 'CEO', 'Quibim', 'angel@quibim.com', 'http://quibim.com/', '', '初创期', '精准分析CT等影像', '精准分析CT等影像(不需要医生的主观判断）', '1500953217690', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('878', null, 'Junchen Diao', '', 'CEO', 'Fannin innovation', 'junchen@fannininnovation.com', 'www.fannininnovation.com', '', '成熟期', 'Incubator', 'Incubator in USA', '1500953217700', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('879', null, 'Dr. Yael Rozen', '972-4-6660677', 'CEO', 'BrainMARC ltd', 'yael@brainmarc.com', 'http://brainmarc.com/', '', '成长期', 'depression solution', '基于注意力评估的指标-BEI（Brain Engagement Index )，可以探测人抑郁  时脑波的变化   预判抗抑郁治疗的效果： 1）错误的药物会增加患者的痛苦，增加患者就医不必要的次数，甚至导致更高的自杀风险。  2）目前实践最好情况需要在抗抑郁治疗开始4-8周后才能证明需要换药物；该技术在之前的临床试验中证明，只需要7-10天就能预测出药物疗效。', '1500953217709', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('880', null, '蒋春胜', '18608627666', 'CEO', '士捷医疗设备（武汉）有限公司', 'zhuhui1000@163.com', '', '', '初创期', '循环肿瘤细胞（CTC）血液检测诊断系统', '无', '1500953260213', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('881', null, '乔治帕里卡洛斯', '18986069045', 'CEO', '武汉美迪威斯无线传感医疗设备有限公司', 'decai.chen@mediwise.co.uk', '', '', '初创期', 'Glucowise 无创血糖检测仪', '无', '1500953260224', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('882', null, '李航', '', 'CEO', '', 'hangli@163.com', '', '', '成长期', '基因诊疗技术及数据应用的产业化', '无', '1500953260230', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('883', null, '范全臻', '13910908778', 'CEO', '', '1017010911@qq.com', '', '', '成长期', '干细胞及免疫细胞个体化精准医疗', '无', '1500953260240', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('884', null, '李锐', '13918780427', 'CEO', '', 'li945@purdue.edu', '', '', '初创期', '血管内成像系统', '无', '1500953260247', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('885', null, '徐天宏', '', 'CEO', '', 'xutventure@gmail.com', '', '', '成长期', '常见疾病早期诊断和风险评估系统', '我们在美国研发的世界首创的常见慢性疾病早期诊断系统，为广大人民提供如心血管疾病、糖尿病等常见重大慢性疾病的早期诊断，从而在一定程度上解决我国乃至世界所面临的日益严重的慢性疾病的挑战。我们所研发的早期诊断系统将通过检测多个遗传标记、蛋白质生物标记和表型标记等多项因素，通过复杂的数学方程和软件对患者进行风险评估，检测出那些在今后5年内出现临床症状高风险的患者。我们的目标是为临床医生和患者提供必要的疾病风险信息，帮助他们及早通过有效的干预手段延缓甚至预防疾病的发生。 这是世界上第一个综合基因组、蛋白质组和表型组的疾病早期诊断系统，可以准确评估检测者5到10年患病的风险。与现有的诊断指标包括如血压、BMI、胆固醇浓度等相比，该系统可以显著提高风险评估的准确率（P< 0.001）。 这项技术的产业化前景非常明朗。仅以我国为例，早期诊断市场巨大且增长速度很快，有更大的发展潜力。即使保守估计，心血管疾病、糖尿病和骨质疏松的早期诊断市场也分别达到83亿、49亿和33亿人民币的容量。但目前仅有少部分人接受了相应的治疗措施。而且，我们的系统与现有诊断产品并不形成直接竞争关系。', '1500953260253', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('886', null, 'Laurent Le Guyader, PhD', '+86 186 1676 5103', 'CEO', 'DNAlytics', 'laurent.leguyader@villerose-ltd.com', 'http://dnalytics.com/', '', '成熟期', 'DNAlytics', '无', '1500953260260', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('887', null, 'Uri TAMIR', '+972 9 86 56 051', 'CEO', 'Lev EL Diagnostics of Heart Diseases Ltd', 'uri@levhm.com', 'http://www.levhm.com/', '', '成熟期', 'Level', '无', '1500953260266', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('888', null, 'Bob King', '855.765.0845', 'CEO', 'Good Start Genetics', 'solutions@gsgenetics.com', 'www.gsgenetics.com', '', '初创期', 'Pre-natal screening', '无', '1500953260272', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('889', null, 'Brian WRIGHT', '602.850.7046', 'CEO', 'Paradigm', 'BWright@paradigmdx.org', 'www.paradigmdx.org', '', '成熟期', 'Cancer diagnostics', '无', '1500953260280', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('890', null, 'Steve Kim', '82 10 3152 6041', 'CEO', 'GL Inc.', 'stevekim@glinc.co.kr', 'www.glinc.co.kr', '', '初创期', 'Needle-free blood sample', '无', '1500953260284', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('891', null, 'Linda Pomeroy', '', 'CEO', 'Cambfix', 'l.c.pomeroy.04@cantab.net', 'www.cambfix.co.uk/', '', '初创期', 'Comprehensive trauma fixation system', '无', '1500953260289', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('892', null, '张林涛', '13928888876', 'CEO', '', 'lintao.zhang@argus-sci.com', '', '', '成长期', '三类医疗器械（超声影像）', '无', '1500953260300', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('893', null, '杨国华', '15607196951', 'CEO', '武汉百泰康基因技术有限公司', '41263657@qq.com', '', '', '成长期', '肝癌早期血浆循环核酸甲基化诊断试剂盒的研发', '无', '1500953260306', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('894', null, 'Brad Morgan', '9252151807', 'CEO', 'POC Medical Systems Inc.', 'bmorgan@POCMedSys.com', 'www.POCMedicalSystems.com', '', '初创期', 'POC cancer diagnostic', '无', '1500953260312', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('895', null, 'Scott', '+4477 686 36766', 'CEO', 'Xenetic Biosciences Inc', 's.maguire@xeneticbio.com', 'http://www.xeneticbio.com/', '', '初创期', 'drugs delivery', 'Xenetic is a biopharmaceutical company providing specialist delivery solutions to improve the efficacy of performance drugs and novel orphan oncology drug candidates.', '1500953260321', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('896', null, 'Hansruedi', '', 'CEO', 'one bio', 'contact@one.bio', 'http://one.bio/', '', '初创期', 'meet bio 2017 Jan.', 'meet bio 2017 Jan.', '1500953260326', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('897', null, 'Daniel Hussey', '', 'CEO', 'The University of Texas At Austin - Office of Technology Com', 'daniel.j.hussey@gmail.com', '', '', '初创期', 'The University of Texas At Austin - Office of Technology Com', 'The University of Texas at Austin has a variety of life science inventions available for licensing including.  UT Austin also has partnering opportunities for drug discovery.  Areas of expertise include drug delivery (inhaled and opthalmic), anti-infectives, and point of care diagnostics.', '1500953260332', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('898', null, '贾士东', '', 'CEO', '慧渡（上海）医疗科技有限公司', 'shidong_jia@yahoo.com', '', '', '初创期', '“ctRNA＋ctDNA”液态活检技术', '无', '1500953260338', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('899', null, '陈博', '13627143627', 'CEO', '武汉巴蒂思生物科技有限公司', 'bchen85@163.com', '', '', '成长期', '兽用诊断试剂', '无', '1500953260347', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('900', null, '徐晓峰', '15071178117', 'CEO', '武汉科隆生物', '15071178117@126.com', '', '', '成长期', '癌症检测试剂', '无', '1500953260355', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('901', null, '林小峰', '0033673334153', 'CEO', '福膜科技有限责任公司', 'fumembrane@icloud.com', '', '', '初创期', '创 新 型 水 处 理 纳 滤 膜 的 产 业 化', '本项目是基于高分子自组装纳米技术在水处理纳滤膜又称超低压节能反渗透膜的最新 应用。主要突破点是将高分子自组装纳米技术成功应用于制造低成本、 高通量、抗氯氧 化创新型纳滤膜。', '1500953260367', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('902', null, '谈静泉', '13774385521', 'CEO', '七螺旋探索者研究有限公司', 'jingquan.tan@outlook.com', '', '', '初创期', '新型 GPCR靶向药物的研发', '本公司依靠国际领先的创新膜蛋白结晶技术，即脂立方相技术，向海外有实力进行自主药物研发的制药企业提供源头阶段的技术服务。', '1500953260373', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('903', null, '于吉峰', '', 'CEO', '美国 San Diego', 'jfy8168@yahoo.com', '', '', '成长期', '抗克隆体、HIV CD4 检测、CBA诊断试剂盒', '抗克隆体、HIV CD4 检测、CBA诊断试剂盒', '1500953260380', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('904', null, '赵文', '', 'CEO', '', 'zhaowen100@139.com', '', '', '初创期', '郑州市心血管和抗肿瘤创新药物平台建设', '无', '1500953308075', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('905', null, '王盛典', '', 'CEO', '', 'sdwang@moon.ibp.ac.cn', '', '', '初创期', '诊断试剂抗原抗体原料研发及生产', '无', '1500953308092', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('906', null, '黄安利', '', 'CEO', '', 'chaohuang123@163.com', '', '', '成长期', '癌症分子检测中心', '无', '1500953308104', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('907', null, '靳建新', '13523912008', 'CEO', '', 'jinjx2008@163.com', '', '', '初创期', '超精密微型透镜制造工艺和设计及医用内窥镜研发制造', '无', '1500953308110', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('908', null, '孙明山', '', 'CEO', '贝尔曼生物科技有限公司（筹）', 'sunmingshan@yahoo.com', '', '', '成熟期', '癌症的伴随（精准）诊断系统的产业化', '公司拟于2016年成立，注册资本500万元。 公司主要研发、生产和销售国际先进水平的用于癌症、心血管疾病诊断的时间分辨试剂及配套定量检测仪。 公司的技术和产品具有巨大的竞争优势 ，将创造巨大的经济效益和社会效益。', '1500953308118', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('909', null, 'Dr Mark Eccleston MBA', '+44 (0) 7812 046749', 'CEO', 'VolitionRx  A Volition Company', 'm.eccleston@volitionrx.com', 'www.volitionrx.com', '', '初创期', 'REVOLUTIONIZING CANCER DIAGNOSIS', 'liquid biopsy', '1500953308128', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('910', null, '邓体良', '', 'CEO', '', 'tldeng8@gmail.com', '', '', '成长期', '重组疫苗人源毒素制药技术平台', '无', '1500953308134', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('911', null, '佘飞', '18203995008', 'CEO', '', '282179249@qq.com', '', '', '初创期', '重症肌无力诊断试剂', '无', '1500953308143', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('912', null, '吴皖', '18672308558', 'CEO', '湖北华赛生物医药技术有限公司', 'tony@ctech-wh.com', '', '', '成长期', 'DC疫苗、NK细胞治疗', '无', '1500953308150', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('913', null, '朱燕华', '13621132174', 'CEO', '湖北杰因生物技术有限公司', 'zhuyhca@163.com', '', '', '初创期', '基于核糖体展示技术的诊断试剂', '无', '1500953308155', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('914', null, '郑正炯', '13507156422', 'CEO', '武汉市九合生物技术有限公司', 'leon@foxmail.com', '', '', '初创期', '功能性可溶可食复合包装膜', '无', '1500953308164', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('915', null, '张万明', '18374808205', 'CEO', '武汉明佰思特生物技术有限公司', 'wmwmzhang@163.com', '', '', '初创期', '恶性肿瘤免疫细胞治疗方案', '无', '1500953308172', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('916', null, '张能敏', '13072720006', 'CEO', '湖北金海潮科技有限公司', 'nm-zhang@163.com', '', '', '初创期', '新型生物杀螺剂螺威拓展应用研究与产业化', '无', '1500953308181', null, '融资服务,生产服务,区域服务', '13', 'Y');
INSERT INTO `tbl_card` VALUES ('917', null, '杨柳', '18627983678', 'CEO', '', '4485712@qq.com', '', '', '初创期', '基于云计算平台的康复医疗体系', '无', '1500953308187', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('918', null, '肖智红', '15623814703', 'CEO', '', 'Mph100@163.com', '', '', '初创期', '卫客医疗', '无', '1500953308193', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('919', null, '杨小龙', '0713-3976908', 'CEO', '黄冈鲁班药业股份有限公司', 'yxl@yeschem.com', '', '', '初创期', '奥美沙坦酯原料及片剂工艺开发及产业化', '无', '1500953308200', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('920', null, '杨环宇', '13477941111', 'CEO', '宣恩贡硒实业有限责任公司', '570073790@qq.com', '', '', '初创期', '贡水白柚深加工', '无', '1500953308208', null, '融资服务,生产服务,区域服务', '13', 'Y');
INSERT INTO `tbl_card` VALUES ('921', null, '蒲江波', '18920385660', 'CEO', '', 'jiangbo.pu@qq.com', '', '', '初创期', '心血管病院外人工智能专家决策辅助诊断系统', '无', '1500953308214', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('922', null, '许勇', '18627734489', 'CEO', '湖北生物医药产业技术研究院有限公司', 'xuyong@hbbiopharm.com', '', '', '成长期', '重组质粒-肝细胞生长因子注射液（pUDK-HGF）', '无', '1500953308221', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('923', null, '刘铁莹', '13379888405', 'CEO', '', 'Mayshu6@hotmail.com', '', '', '初创期', '新型替代手术治疗眼病', '无', '1500953308227', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('924', null, '廖玉华', '13871356425', 'CEO', '', 'Liaoyh27@163.com', '', '', '初创期', '高血压治疗性降压疫苗的研发', '无', '1500953308232', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('925', null, '徐学军', '18621534352', 'CEO', '河南省锐达医药科技有限公司', '1322078049@qq.com', '', '', '初创期', '基于STAT3蛋白靶点靶向型药物的研发', '无', '1500953308238', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('926', null, '李健雄', '13916499775', 'CEO', '', 'jason@jasonbiotech.com', '', '', '初创期', '新型辅料的研发与产业化平台建设', '无', '1500953308245', null, '融资服务,生产服务,区域服务', '13', 'Y');
INSERT INTO `tbl_card` VALUES ('927', null, '徐旭', '', 'CEO', '', 'Yanuw220wpl803@163.com', '', '', '初创期', '栀子系列天然色素的清洁生产工艺及应用', '无', '1500953308250', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('928', null, '李涵泺', '15902752228', 'CEO', '', 'ala1004@gmail.com', '', '', '初创期', '由人毛囊外根鞘开发的自体组织工程皮肤用于白癜风和不愈合创', '无', '1500953308255', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('929', null, '夏岩', '13917120376', 'CEO', '天士力研究院', 'yanxia08820@yahoo.com', '', '', '初创期', '抗血栓新药 PAR-1 拮抗剂项目', '无', '1500953308261', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('930', null, '侯炜', '13971389761', 'CEO', '', '729505078@qq.com', '', '', '初创期', '长链非编码RNA和蛋白质组学综合服务平台', '无', '1500953308267', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('931', null, '洪爱群', '', 'CEO', '', 'Aiqun_h@hotmail.com', '', '', '初创期', '洪爱群_数字医疗影像设备的特显技术及应用', '无', '1500953308273', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('932', null, '王凯', '13263816769', 'CEO', '武汉凯吉盈科技有限公司', 'Kaichop@gmail.com', '', '', '成长期', '高通量测序的临床检测与诊断', '精准医疗的大数据分析', '1500953308283', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('933', null, '王继锋', '', 'CEO', '南京趣酶生物科技有限公司', 'wangjf@gmail.com', '', '', '成长期', '生物酶催化合成工艺服务及产业化平台', '无', '1500953344355', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('934', null, '方华丰', '15527567130', 'CEO', '', '15527567130@163.com', '', '', '初创期', '新一代治疗糖尿病药物的产业化', '无', '1500953344366', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('935', null, '汤珊', '18571471263', 'CEO', '武汉汇研生物科技股份有限公司', 'huiyanbio@126.com', '', '', '初创期', '生物分离纯化介质的产业化', '无', '1500953344375', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('936', null, '汤斌', '15653790028', 'CEO', '安提金生物工程有限公司', 'Jbtang2014@163.com', '', '', '初创期', '牛呼吸道合胞体病毒病蛋白疫苗的产业开发', '无', '1500953344392', null, '融资服务,生产服务,区域服务', '13', 'Y');
INSERT INTO `tbl_card` VALUES ('937', null, '方骢', '', 'CEO', '', 'catnycongfang@gmail.com', '', '', '初创期', '诱导多能干细胞在药物研发和细胞疗法中的应用平台', '无', '1500953344401', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('938', null, '陈文强', '13901379899', 'CEO', '', 'wynn.chen@telemed-healthcare.com', '', '', '初创期', 'EASYTEMP医用可抛体温贴', '无', '1500953372725', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('939', null, '曾建华', '180 8668 2997', 'CEO', '', '613421390@qq.com', '', '', '成长期', '生物医学抗衰老护肤品', '无', '1500953372735', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('940', null, '白光洁', '18068819618', 'CEO', '', 'baiguangjie@163.com', '', '', '初创期', '超声波治疗仪装置的产业化', '无', '1500953372744', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('941', null, 'Simon Haworth', '18607148782', 'CEO', '', 'simon.haworth@dynastybio.com', '', '', '初创期', '结核菌诊断试剂盒', '无', '1500953372752', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('942', null, '孟立建', '00351962325429', 'CEO', '', 'ljm@isep.ipp.pt', '', '', '初创期', '激光快速诊断纳米生物标记材料与技术', '无', '1500953372757', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('943', null, '马达', '15140093118', 'CEO', '中山市菔风堂生物技术有限公司', 'MD1959@163.com', '', '', '初创期', '药食两用药材莱菔治疗痛风', '无', '1500953372762', null, '融资服务,生产服务,区域服务', '4', 'Y');
INSERT INTO `tbl_card` VALUES ('944', null, '胡拥军', '18911521308', 'CEO', '武汉豆听科技有限公司', 'huyongjun@tinglibao.com.cn', '', '', '初创期', '听力健康大数据平台', '无', '1500953401102', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('945', null, '顾新华', '13381808060', 'CEO', '武汉斯奈德生命科技有限责任公司', 'guxh@littlepasciences.com', '', '', '初创期', '生物荧光分子探针的产业化', '无', '1500953401113', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('946', null, '蔡立刚', '13317101355', 'CEO', '武汉博威德生物技术有限公司', 'cai-ligang@163.com', '', '', '初创期', '重组柯萨奇病毒 B3 及其抗肿瘤的研究', '无', '1500953401126', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('947', null, 'Amy Lynn', '13986123840', 'CEO', '武汉迪卡斯生物科技有限公司', 'amy@skymedicus.com', '', '', '初创期', '医疗旅游业交互式网络交易平台软件开发及服务', '无', '1500953401133', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('948', null, '涂仁静', '15323783499', 'CEO', '深圳市前仁人科技开发有限公司', 'renjing_tu@163.com', '', '', '成长期', '新兽用和人用狂犬减毒活疫苗', '无', '1500953401140', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('949', null, '张阳', '15017969591', 'CEO', '艾普康', 'aptacam@hotmail.com', '', '', '成长期', '基于核酸分子的第二代抗体技术的产业化', '无', '1500953401147', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('950', null, '姜世民', '13995606690', 'CEO', '迪艾斯医学（武汉）有限公司', '70951570@qq.com', '', '', '成长期', '自动化细菌分离培养系统', '无', '1500953401154', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('951', null, 'Adina Remz', '(+972).3.624.2266', 'CEO', 'Nuvo Group', 'adina.remz@nuvo-group.com', 'www.nuvo-group.com', '', '初创期', 'Pregnancy Sensor', '无', '1500953401178', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('952', null, 'DR高本雍治', '05-3244-6975', 'CEO', '豊橋技術科学大学', 'y-takamoto@rac.tut.ac.jp', 'y-takamoto@rac.tut.ac.jp', '', '成长期', 'CAR-T细胞再生繁殖', '无', '1500953401192', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('953', null, 'DR伊藤悟', '05-3435-2681', 'CEO', '浜松医科大学', 'www.hama-med.ac.jp', 'www.hama-med.ac.jp', '', '成熟期', '干细胞诱导，免疫细胞培养再繁殖', '资料还不全面', '1500953428324', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('954', null, '伊井正明', '07-2684-7279', 'CEO', '大阪医科大学研究センター', 'www.researchgate.net/profile/Masaaki_Ii', 'www.researchgate.net/profile/Masaaki_Ii', '', '成熟期', 'IPS细胞分裂配置计划', '细胞保存和培养基础技术提供商，不是直接面向消费者的技术', '1500953428335', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('955', null, '吉村　取締役', '07-2807-3525', 'CEO', '吉村MEDICAL株式会社', 'www.ymwc.co.jp', 'www.ymwc.co.jp', '', '成熟期', 'ながら电子针灸', '随时随地电子针灸', '1500953428343', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('956', null, '田村　マネージャー', '04-5475-3887', 'CEO', 'Reprocell', 'www.reprocell.com', 'www.reprocell.com', '', '成长期', '再生医疗品，干细胞培养', '干细胞诱导，3D培养', '1500953428356', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('957', null, '小山贵史', '05-2211-3032', 'CEO', '天野エンザイム株式会社', 'www.amano-enzyme.co.jp', 'www.amano-enzyme.co.jp', '', '初创期', '酵素临床研究', '生物酶制剂', '1500953428365', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('958', null, '住野 绘理', '06-6353-5326', 'CEO', 'sanplatec株式会社', 'www.sanplatec.co.jp', 'www.sanplatec.co.jp', '', '成长期', '细胞保存容器', '生物活性制品运输保存箱，主要从事科研基础工具研发。', '1500953428372', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('959', null, '横田和拡', '07-7565-6968', 'CEO', 'タカラバイオ株式会社', 'www.takara-bio.co.jp', 'www.takara-bio.co.jp', '', '成长期', '遗传基因治疗药物', '抗癌基因治疗药物已经在美国进入临床一期', '1500953428378', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('960', null, '北野 绚嗣', '05-3366-2129', 'CEO', 'J-TEC', 'www.jpte.co.jp', 'www.jpte.co.jp', '', '成熟期', '骨科材料，再生软骨组织', '再生软骨，注射式填充，临床效果明显，方便快捷，无副作用', '1500953428383', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('961', null, '野口 教授', '03-5348-1881', 'CEO', 'ノーザ株式会社', 'www.nhosa.co.jp', 'www.nhosa.co.jp', '', '成熟期', '齿科移动医疗系统', '齿科移动医疗系统，可以复制到中国，市场前景较好', '1500953428390', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('962', null, '户田 章弘 教授', '07-4584-9333', 'CEO', 'グランソール奈良', 'www.grandsoul.co.jp', 'www.grandsoul.co.jp', '', '成长期', '细胞免疫治疗', '癌症的免疫细胞资料 γδNKT细胞', '1500953428398', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('963', null, '程相国', '18771003066', 'CEO', '武汉波睿达生物科技有限公司', 'prime.cheng@bio-raid,com', '', '', '成长期', '武汉波睿达生物CAR-T', '血液瘤CAR-T治疗', '1500953428404', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('964', null, '汪德鹏', '18986200281', 'CEO', '', 'wangg@grandmics.com', 'http://www.nextomics.cn/', '', '成熟期', '基于pacific bioscience平台的三代测序服务', '未来组生物科技有限公司（Nextomics Biosciences）于2011年8月8日在武汉市光谷生物城成立，是一支具备丰富基因组学研究经验的专业团队，立志于将基因组学发展的前沿技术与各领域的基础与应用研究相结合，为更多的学者提供全面、个性化组学解决方案，用科技创造未来。  未来组的科研顾问团队由多位基因组学相关领域内的权威学者组成，为科研合作项目及技术研发提供专业指导。年轻的项目负责人团队成员具备严谨的科研背景，并拥有丰富组学项目经验，为每一个项目的具体执行进行整体协调与把握。  2013年，未来组技术团队通过前期大量的研发投入，成功开发了基于美国Pacific Biosciences公司的第三代单分子实时测序平台的生物信息分析流程，成为国内首家正式推出第三代测序服务的公司。短短两年时间内，未来组通过上百个大小项目的实战经验积累，进一步优化和完善了自己基于第三代测序的数据分析平台，成为国内最有影响力的第三代测序分析团队。  未来组目前的测序分析服务涵盖了基因组学、转录组学、表观基因组学等多个研究领域，为客户提供的针对多组学研究相关领域的完整解决方案。', '1500953428410', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('965', null, '吴启家', '18986200281', 'CEO', '武汉康测科技有限公司', 'hr@seqhealth.cn', '', '', '初创期', 'NGS 医学及科研测序检测服务', '公司致力于基于ctDNA的肿瘤无创检测技术的开发，具有自主知识产权的“外周血肿瘤DNA富集和检测”技术，可以将外周血中ctDNA的检测灵敏度提高1000倍以上，可对ctDNA进行全基因组、单碱基分辨率的检测。公司的主营业务包括二代/三代测序科研服务，以及癌症无创早期诊断、肿瘤无创个性化用药指导、疗效评估、复发监测服务，并构建全基因组覆盖的中国人癌症基因突变大数据。', '1500953428417', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('966', null, 'Jacques Lepine', '+ 33 - 6 80 13 92 32', 'CEO', 'Slow Control', 'jacques.lepine@slowcontrol.com', 'http://www.slowcontrol.com/', '', '初创期', 'Smart baby devices', '无', '1500953428423', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('967', null, '张田骏', '13720345222', 'CEO', '武汉九合生物技术有限公司', '1301331312@qq.com', '', '', '成长期', '可溶可食膜', '无', '1500953428431', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('968', null, 'Barry Cohen', '240 453-6339', 'CEO', '20/20 GeneSystems', 'bcohen@2020gene.com', 'http://www.2020gene.com/', '', '成熟期', 'Lung cancer test and risk prediction algorithm', '无', '1500953428436', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('969', null, '朱全友', '13307105610', 'CEO', '武汉爱威尔生物科技有限责任公司', 'H5243@126.com', 'www.chinaiwill.cn', '', '成长期', '肝癌敏感型基因检测', '无', '1500953428448', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('970', null, 'Dwain Morris-Irvin', '', 'CEO', 'Global StemCare Laboratories, Inc', 'dirvin@gsclabs.com', '', '', '成熟期', '干细胞皮肤修复技产品', '基于干细胞技术的再生医学科技和高质量的药妆', '1500953428454', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('971', null, '罗亮', '13016420128', 'CEO', '', 'luoliang1@yahoo.com;', '', '', '初创期', '多肽及蛋白药物皮下注射脂质胶体载体缓释技术', '无', '1500953428462', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('972', null, '贾博士', '', 'CEO', '', 'ihope1117@163.com', '', '', '初创期', '肿瘤标记分子', '无', '1500953428473', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('973', null, '李飞', '13913955768', 'CEO', '', 'kldlf@njmu.edu.cn', '', '', '初创期', '乏氧活化前药TH2566的开发', '无', '1500953428480', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('974', null, '伍博士', '13477014918', 'CEO', '', '1043396511@qq.com', '', '', '初创期', 'Beta内酰胺酶检测试剂盒', '无', '1500953428488', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('975', null, '李滔', '13720395159', 'CEO', '沪亚生物', 'tli@huyabio.com', '', '', '成长期', '与沪亚公司合作，对接药物技术转移项目', '无', '1500953428497', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('976', null, 'Max Ostermeier', '+49 511 2204 2581', 'CEO', 'Implandata Ophthalmic Products GmbH', 'mostermeier@implandata.com', 'http://www.implandata.com/', '', '成长期', 'EYEMATE eye pressure measurement system', '无', '1500953428504', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('977', null, '熊斌', '13886029351', 'CEO', '武汉中南医院肿瘤部', 'binxiong1961@whu.edu.cn', '', '', '初创期', '异构表型CTCs捕获技术', '透明纳米材料基板，量子点标记复合成像技术', '1500953428510', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('978', null, '廖鸿', '650-776-8378', 'CEO', '背景浩瑞士加', 'healther@olympiadianostics.com', '', '', '成熟期', '癌症分子诊断和预后预测试剂的产业化（前列腺癌）', '提供高特异性和敏感性的前列腺癌诊断试剂尿液检测产品，产品都是通过实时定量pcr方法得以实现的；项目主要有5个针对前列腺癌的产品，1.分辨是/否肿瘤2.分辨肿瘤良/恶3.分辨肿瘤转移/为转移4.分辨预后复发是/否5.前列腺癌患者的存活期判定', '1500953469879', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('979', null, 'Oranit IDO', '(+972) 3-624-2266', 'CEO', 'NUVO-INC', 'oranit@nuvo-group.com', 'www.nuvo-group.com', '', '成长期', 'PregSense', 'Medical Grade Pregnancy Sensor', '1500953469891', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('980', null, 'Itamar BITTON', '+972-3-575 42 28', 'CEO', 'Medtrix', 'itamar@med-trix.com', 'http://www.doctome.co/', '', '成熟期', 'Doctome - 24/7 doctors on APP', '无', '1500953469902', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('981', null, 'Zhang Qifan', '+41 21 693 70 12', 'CEO', 'Nanolive', 'qifan@nanolive.ch', 'http://nanolive.ch/', '', '成长期', '3D Screening Cells', '无', '1500953469908', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('982', null, 'Ken GOENAWAN', '+86 (21) 3319 9933 e', 'CEO', 'Primequal', 'k.goenawan@sim.biz', 'http://www.primequal.com/home.php', '', '成长期', 'Swiss Syringe', 'High precision syringe', '1500953469918', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('983', null, 'Dr. Yoram Romem', '(972) 77 543 4541', 'CEO', 'Healthwatch', 'yoram.r@personal-healthwatch.com', 'http://www.personal-healthwatch.com/', '', '成熟期', 'Connected sensor t-shirt', '无', '1500953469925', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('984', null, 'Dr Keserue', '+41 44 633 07 68', 'CEO', 'rqmicro AG', 'keserue@rqmicro.ch', 'http://www.rqmicro.ch/', '', '成熟期', 'Pathogen Separation & Detection', '无', '1500953469933', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('985', null, '黄炬', '13959291118', 'CEO', '乐土精准医疗科技有限公司', 'Huangju@shanhaishu.com.cn', '', '', '成长期', '第三方临床诊断中心及第三代基因测序仪器', '山海树集团要在国内投资精准医疗，准备从第三代测序入手。在操作上则从第三方临床检验中心开始着手，建立能够短期收支平衡的第三方临床检测中心，同时也为第三代测序铺好市场渠道。在建立临检中心的同时完成第三代测序的注册申报', '1500953469940', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('986', null, '张杰', '13788989405(上海） 1377', 'CEO', '江阴金泰克生物技术有限公司', 'jiezhang@post.Harvard.edu', '', '', '初创期', '可吸收性生物工程专用材料', '无', '1500953469949', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('987', null, '宋勇', '18068323667', 'CEO', '武汉汉奥', 'songyong_0200@yahoo.com　', '', '', '初创期', '四合一型呼吸道系统快速诊断试剂', '无', '1500953469956', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('988', null, '刘旺珍', '13911036231', 'CEO', '中国初级卫生保健基金会', 'zhen539@sohu.com', '', '', '初创期', '宫颈癌筛查技术', '无', '1500953496027', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('989', null, '周大鹏', '13020129385', 'CEO', 'The University of Texas MD Anderson Cancer Center, Houston, TX', 'dapengzhoulab@tongji.edu.cn', '', '', '初创期', '含α半乳糖神经酰胺佐剂的变态原片剂的研发生产', '无', '1500953496036', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('990', null, '陈瑞环', '650-387-4802', 'CEO', '滁州市洛达生物科技有限公司', 'ruihuan@gmail.com', '', '', '成熟期', '抗自身免疫靶向药物', '无', '1500953496043', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('991', null, '李军', '13986067586', 'CEO', 'American Peptide Company', 'junjamesli@gmail.com', '', '', '初创期', '新型紫杉醇抗癌药物', '无', '1500953496050', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('992', null, '黄俊仁', '18060169579', 'CEO', '福建福乐医药科技有限公司', 'eagle4625@163.com', '', '', '初创期', '计算机辅助药物设计', '无', '1500953496057', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('993', null, '李季男', '13810850852', 'CEO', '深圳市天瑞人健生物科技有限公司', 'amesweina@gmail.com', '', '', '初创期', '治愈糖尿病溃疡基因重组药物项目', '无', '1500953496064', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('994', null, '夏献民', '13667140618', 'CEO', '武汉益承生物科技有限公司', 'xianminxia@hotmail.com', '', '', '初创期', '治疗恶性肿瘤PI3K 亚型p55PIK特异抑制剂-IP55 多肽注射液', '无', '1500953496071', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('995', null, '徐艺峰', '00-19095326967', 'CEO', '美国万神灵制药集团', 'yifengxu123@aliyun.com', '', '', '初创期', '填补国际国内空白系列创新药物的产业化开发项目', '无', '1500953496079', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('996', null, '何传华', '1-203-928-0760', 'CEO', '美国耶鲁大学', 'chuanhua.he@gmail.com', '', '', '初创期', '抗肿瘤生物药GP-39的开发与商业化', '无', '1500953496084', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('997', null, '张建洲', '13520234309', 'CEO', '武汉联企生物有限公司', 'founder@ec4h.com', '', '', '初创期', '农药残留去除剂等生物农业产品', '无', '1500953496092', null, '融资服务,生产服务,区域服务', '13', 'Y');
INSERT INTO `tbl_card` VALUES ('998', null, '张厚玫', '13910764064', 'CEO', '北京软测科技有限公司', 'houmeiz@sina.com', '', '', '初创期', '血糖插件项目', '无', '1500953496100', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('999', null, '刘尚勤', '15871480931', 'CEO', '', 'ubeliu@aliyun.com', '', '', '初创期', '中西医结合治疗骨髓增生异常综合症', '无', '1500953496107', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1000', null, '杨锋', '', 'CEO', '武汉博仁凯润药业有限公司', 'fengyang74@yahoo.com', '', '', '成熟期', '生物纳米新药创制关键中间体', '无', '1500953522554', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1001', null, '景慧', '15272182677', 'CEO', '武汉普诺赛生命科技有限公司', 'kathyjinghui@hotmail.com', '', '', '初创期', '纳米装载与缓释技术在牙齿自修复材料中的应用及产业化', '无', '1500953522564', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1002', null, '赵漪华', '18120552501', 'CEO', '（武汉）光谷依联国际技术转移有限公司', 'yzhao@yltechtransfer.com', '', '', '初创期', '移动智慧医疗App开发平台', '无', '1500953522574', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('1003', null, '时宇', '15623754281', 'CEO', '武汉沃博科技有限公司', '125373662@qq.com', '', '', '初创期', '移动医疗图像处理系统', '无', '1500953522580', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('1004', null, '饶楠杰', '18202799879', 'CEO', '华中科技大学光弦项目组', 'EdwardRaoNJ@vip.qq.com', '', '', '初创期', '家庭健康监护智能软硬件', '无', '1500953522588', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('1005', null, '赵丙来', '15312564718', 'CEO', '上海金惠甫山心理测评公司', 'Zhbl1391@163.com', '', '', '初创期', '基于云计算的大数据心理学技术应用平台', '无', '1500953522600', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('1006', null, '陈炳良', '', 'CEO', '曼特拉克斯生物制药公司', 'bingliangchen@yahoo.com', '', '', '初创期', '生物传感器产业化与物联网健康', '无', '1500953522612', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('1007', null, '龚兆龙', '18611401148', 'CEO', '', 'gongzl@outlook.com', '', '', '初创期', '德国硅凝胶纤维敷料项目', '无', '1500953522621', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1008', null, '吕晓迎', '', 'CEO', '南京神桥医疗器械有限公司', 'lu xy@seu.edu.cn', '', '', '初创期', '微电子肢动', '无', '1500953522628', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1009', null, '崔文国', '18662483383', 'CEO', '', 'wgcui80@hotmail.com', '', '', '初创期', '研发及产业化生物降解型非血管用药物洗脱管状支架', '无', '1500953549908', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1010', null, '钱江', '', 'CEO', '', 'huakangbiotech@hotmail.com', '', '', '初创期', '心血管胶囊新药研发', '无', '1500953602201', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1011', null, '郭晓东', '15327216660', 'CEO', '武汉东田生物科技有限公司', 'gxdwh@yahoo.com.cn', '', '', '初创期', '以骨形态发生蛋白2活性肽为基础的系列人工骨修复材料的研制', '无', '1500953602213', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1012', null, '刘跃魁', '13336191296', 'CEO', '', 'lykui66@163.com', '', '', '初创期', '新型生物陶瓷活水器的开发应用', '无', '1500953627264', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('1013', null, '顾苗', '07568186659', 'CEO', '', 'm.gu@qmul.ac.uk', '', '', '初创期', '申请专利食品安全快速检测', '无', '1500953627348', null, '融资服务,生产服务,区域服务', '13', 'Y');
INSERT INTO `tbl_card` VALUES ('1014', null, '吴辰冰', '18616559182', 'CEO', '', 'epimab@163.com', '', '', '初创期', '双特异性抗体技术及抗体药物的开发', '无', '1500953627357', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1015', null, '朱文斯', '13901248876', 'CEO', '武汉智捷生物科技有限公司', 'bjvincezhu@gmail.com', '', '', '初创期', '乙肝(HBV)耐药性(YMDD)及新型焦磷酸测序(PYROSEQUENCING)突变检测应用', '无', '1500953627364', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1016', null, '邓友平', '18827676512', 'CEO', '', 'davidyng@163.com', '', '', '初创期', '肺癌早期检测产品的开发', '通过检测肺癌相关性高度的miRNA来实现早期癌症的诊断，最终产品以试剂盒和软件的形式投放市场', '1500953627373', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1017', null, '王建', '858-231-6626', 'CEO', '华盛测序技术有限公司', 'jwmc07@yahoo.com', '', '', '初创期', '最新纳米孔DNA测序仪研发', '第三代测序仪的研发', '1500953627380', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1018', null, '朱勇', '', 'CEO', 'genesys diognositics 公司', 'zy9961@163.com', '', '', '初创期', '临床细胞遗传分子生物学检测技术', '临床细胞遗传分子生物学检测技术', '1500953627388', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1019', null, '赫培远', '', 'CEO', '法国国家自然科学研究中心', 'hepeiyuan@hotmail.com', '', '', '初创期', '微流体系统和生物医药相容性胶囊的设计与制造', '无', '1500953627396', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1020', null, '刘传聚', '', 'CEO', '美国纽约大学医学院', 'Chuanju.liu@med.nyu.edu', '', '', '初创期', '开发肿瘤坏因子受体拮抗剂Atsttrin作为治疗类风湿关节炎和自身免性疾病的生物工程新药', '无', '1500953627403', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1021', null, 'Alex Ye', '', 'CEO', '美国Laureate Biopharmaceuticals,Inc', 'Alex.ye@lbios.com', '', '', '初创期', 'CRO公司', '无', '1500953627414', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1022', null, '李峤', '', 'CEO', '密西根大学医学院', 'qiaoli@umich.edu', '', '', '初创期', 'T、B细胞抗癌药物', '无', '1500953627422', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1023', null, '赵柏松', '', 'CEO', '吉林省霍普金斯医药研究院', 'zbs163@163.com', '', '', '初创期', '细胞生长因子和细胞因子系列产品产业化', '无', '1500953627428', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1024', null, '吴辰冰', '', 'CEO', '上海睿智化学研究有限公司', 'chbwu@chempartner.cn', '', '', '初创期', '单抗', '无', '1500953627439', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1025', null, 'Larry Huang', '', 'CEO', 'Ark Pharm, Inc', 'lhuang@arkpharminc.com', '', '', '初创期', 'CRO', '无', '1500953627449', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1026', null, '朱潮权', '13607137046', 'CEO', '武汉水金生物科技有限公司', 'peterzhu1@gmail.com', '', '', '初创期', '新型医药用功能水凝胶', '新型医药用功能水凝胶技术转让', '1500953627458', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1027', null, '宋晓彤', '', 'CEO', 'Baylor College of Medicine, Houston, TX', 'xxtongso@txch.org', '', '', '初创期', '新型高效的肿瘤免疫治疗技术的临床开发和应用', '新型高效的肿瘤免疫治疗技术的临床开发和应用', '1500953627467', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1028', null, 'Atika Saib', '', 'CEO', 'Eurobiomed', 'atika.saib@eurobiomed.org', '', '', '初创期', '邀请加入IBESA', '无', '1500953627475', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1029', null, 'StephenA.Hurly', '', 'CEO', 'Burrill Securities', 'shurly@b-c.com', '', '', '初创期', '有兴趣带一个欧洲团进行考察', '无', '1500953627483', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1030', null, 'Fabrizio Conicella', '', 'CEO', 'Bioindustry Park Silvano SpA - bioPmed innovation cluster', 'conicella@biopmed.eu', '', '', '初创期', 'IBESA成员', '无', '1500953627491', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1031', null, '唐松山', '', 'CEO', '美国', 'songstang@gmail.com', '', '', '成长期', 'I类化药止血蛇毒糖蛋白', '新型高活性止血蛋白开发', '1500953653003', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('1032', null, '张霖', '', 'CEO', '美国安美霖健康科技有限公司总经理', 'amlinhealth@gmail.com', '', '', '成长期', '抗痛风天然保健品', '抗痛风天然保健品的开发和市场', '1500953653013', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1033', null, '王丽琴', '', 'CEO', '武汉神码生物科技有限公司', 'liqinwang88@yahoo.com', '', '', '成长期', '血管性炎症的早期诊断和治疗', '许多常见病和多发病如高血压、糖尿病、冠心病、脑卒中等在发病早期即有血管性炎症，且多为其重要致病因子，对血管性炎症的早期诊断和治疗对于这些疾病本身的治疗和预后十分重要。目前虽有多种方法如C-反应蛋白测定、白细胞介素测定、免疫球蛋白测定等可以诊断普通的间歇性炎症性反应，但对于持续性、非感染性普通炎症性反应的检测往往为阴性的血管性炎症缺乏有效的诊断措施，导致这些重大的常见病和多发病要在临床诊断确立后方可采取治疗措施，不仅大大降低了预防疾病的可行性，而且严重影响了病人的预后，并加重了家庭和社会负担。', '1500953653020', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1034', null, '艾时斌', '13387585878', 'CEO', '武汉合谷生物技术有限公司', 'mt_pharm@126.com', '', '', '成长期', '肺癌的检测项目', '3551落选项目，手上有3个肿瘤、1个肺癌的检测项目正在进入临床阶段，需要尽快注册拿到产品文号', '1500953681135', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1035', null, '彭俊', '13871064865', 'CEO', '武汉珈源', 'pj1979011@163.com', '', '', '成熟期', 'CRP检测试剂', '与上海一家医药公司合作开发C-CRP检测试剂（免疫层析荧光定量法），用于临床生化检测', '1500953681144', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1036', null, 'Boris', '', 'CEO', 'Therabionic LLC', 'boris.pasche@therabionic.com', '', '', '成长期', '治疗中晚期肝癌', '治疗中晚期肝癌，正在进行第三阶段临床试验', '1500953681154', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1037', null, '裘建英', '', 'CEO', 'General Gene', 'jqiu@generalgene.com', '', '', '成长期', '重大疾病的预防和治疗疾病', '重大疾病的预防和治疗，涉及心脑血管病，老年痴呆，糖尿病，痛风，保肝等疾病。', '1500953681170', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1038', null, '李嘉男', '', 'CEO', '荷兰阿姆斯特丹自由大学', 'david.lijn@gmail.com', '', '', '成长期', '血管内成像系统项目', '血管内成像系统项目', '1500953681187', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1039', null, '段然', '', 'CEO', '武汉新创方舟电子科技有限公司', 'uberresolution@gmail.com', '', '', '成长期', '超精度嵌入式成像处理 （手术摄录设备）', 'Uber-Resolution 超精度嵌入式成像处理 （手术摄录设备）', '1500953681202', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1040', null, '章桦', '', 'CEO', '荷兰', 'reynzhang@hotmail.com', '', '', '成长期', '塔曼(TARGETMAN)IGART影像引导自适应放疗系统', '塔曼(TARGETMAN)IGART影像引导自适应放疗系统', '1500953681210', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1041', null, '周爱民', '', 'CEO', '克里夫兰州立大学', 'a.zhou@csuohio.edu', '', '', '成长期', '快速方便诊断肝癌新方法找技术合作', '快速方便诊断肝癌新方法找技术合作', '1500953681217', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1042', null, '邓杏飞', '', 'CEO', '', 'daviddeng50@hotmail.com', '', '', '成长期', '微流控芯片精细血脂亚组分和心血管标记物生化测定', '微流控芯片精细血脂亚组分和心血管标记物生化测定(中国心®心血管高级检测套餐)准确评估心血管疾病发作风险和个体化治疗方案', '1500953681227', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1043', null, '童云广', '', 'CEO', '', 'yunguangtong@gmail.com', '', '', '成长期', '预测肿瘤对抗癌药物敏感程度的生物标记物', '预测肿瘤对抗癌药物敏感程度的生物标记物', '1500953681240', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1044', null, '张胜军', '13663825617', 'CEO', 'Microbionetics', 'zhangs88@hotmail.com  szhang@frontagelab.com', '', '', '成长期', '尿路感染检测', '尿路感染检测', '1500953681255', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1045', null, '刘星海', '', 'CEO', '', 'liuxinghai@hotmail.com', '', '', '成长期', '新型生态毒性检测系统', '新型生态毒性检测系统', '1500953681262', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1046', null, '覃可', '', 'CEO', '纳罗生物', 'kqin@biopharmavision.com', '', '', '成长期', '快速医疗点分子诊断产品', '纳罗生物（NanoMDx，Inc.）是一家在美国麻州，波士顿的生物公司。该公司致力于研发“医疗点分子医疗诊断”（point-of-care clinical diagnostics，POCMDx）。产品检测的传染性疾病、癌症、生理条件（遗传药理学)和生物食品及环境监测。NanoMDx开发的独特的诊断产品是以我们专有的纳米技术、微流体、核酸(NAT)和聚合酶链反应（PCR）技术。产品可以在第一时间内，在医院门诊或病人的床边，提供准确，快速的临床诊断结果（45分钟-1小时）。因此可避免当前的冗长，繁琐的临床检验方式。这种技术和产品部署将大幅改善医疗诊断，病人护理，和减少整体医疗成本。', '1500953681270', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1047', null, '汪道文', '13971301060', 'CEO', '华中科技大学同济医学院', 'dwwang57@263.net.cn', '', '', '成长期', '药物滥用检测', '药物滥用检测', '1500953681277', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1048', null, '张君璐', '13397109955', 'CEO', '武汉康银生物医学科技有限公司', '598128160@qq.com', '', '', '成长期', '干细胞及免疫细胞贮存技术的工艺研究', '无', '1500953681287', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1049', null, '苏正定', '', 'CEO', '武汉艾默佳华生物科技有限公司', 'zhengding.su@gmail.com', '', '', '成长期', '肿瘤检测', '肿瘤检测', '1500953681296', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1050', null, '石毅', '13100715715', 'CEO', '武汉瑞法医疗器械有限公司', 'xhao_official@163.com', '', '', '成长期', '乙肝病毒吸附柱', '乙肝病毒吸附柱', '1500953681305', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1051', null, '张良禄', '17786420309', 'CEO', '武汉艾米森生物医药有限责任公司', 'ammubiomed@163.com', '', '', '成熟期', '艰难细菌RT-PCR', '艰难细菌RT-PC', '1500953681317', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1052', null, '刘路', '13986050366', 'CEO', '武汉仝干生物科技有限公司', 'lu.liu@nlvc.com; 13986050366@163.com; 33842265@qq.com', '', '', '成长期', '永生化人工肝项目', '永生化人工肝项目', '1500953681324', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1053', null, '万芪', '', 'CEO', '武汉弘跃医药科技有限公司', 'qwan@whu.edu.cn', '', '', '成长期', '脑损伤治疗仪', '脑损伤治疗仪', '1500953681333', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1054', null, '夏其林', '13971087577', 'CEO', '武汉菲恩生物科技有限公司', 'fine@fn-test.com', '', '', '成熟期', '实施分辨荧光技术检测心肌标志物', '实施分辨荧光技术检测心肌标志物', '1500953746470', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1055', null, 'Jiuyong Xie博士', '12049757774', 'CEO', 'Manitoba大学', 'xiej@umanitoba.ca', '', '', '初创期', '基因检测项目', '基因检测项目', '1500953746480', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1056', null, '杨唐斌', '13621044380', 'CEO', '北京晶泰美康生物科技有限公司', 'yangtangbin@najingtech.com', '', '', '成长期', '量子点定量检测试剂盒', '量子点定量检测试剂盒', '1500953746486', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1057', null, '田海中', '13938581155', 'CEO', '河南省出入境检疫局', 'tianhz@139.com', '', '', '成长期', '红外测温技术', '红外测温技术', '1500953746492', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1058', null, '郭社鹏', '15071631705', 'CEO', '湖北随州', '176256857@qq.ocm', '', '', '成熟期', '口腔医疗器械', '口腔医疗器械', '1500953746505', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1059', null, '鲁芬芬', '18717105685', 'CEO', '武汉生之源', '3247175069@qq.com', '', '', '成熟期', '分子诊断/基因芯片', '分子诊断/基因芯片', '1500953746514', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1060', null, '刘晓波', '13808637186', 'CEO', '安友医疗科技（武汉）有限责任公司', 'tomy.liu@amedunion.com', '', '', '成熟期', '电子验孕检测卡', '无', '1500953746525', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1061', null, '王兵', '', 'CEO', '山东潍坊', 'wb1078@163.com', '', '', '成长期', '卡波姆凝胶', '卡波姆凝胶', '1500953746533', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1062', null, '刘建业', '13972660333', 'CEO', '湖北鳄宝生物科技研发有限公司', '2090875611@qq.com', '', '', '成长期', '鳄鱼油', '实验室办公室租用', '1500953746538', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1063', null, '王长城', '13818187758', 'CEO', '武汉伊迪生医学诊断技术有限公司', 'cwang@dycentbio.com', '', '', '成熟期', '血脂检测卡', '血脂检测卡', '1500953746545', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1064', null, '曾辰光', '15915828298', 'CEO', '广州新诚生物科技有限公司', 'zeng@randd.cn', '', '', '成熟期', '真空采血管', '真空采血管', '1500953746561', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1065', null, '危宏平', '15337112162', 'CEO', '中国科学院武汉病毒研究所', 'hpwei@wh.iov.cn', '', '', '成长期', '耐甲氧西林金黄色葡萄球菌耐药基因检测', '快速、特异检测MRSA菌的荧光定量PCR检测以及免疫凝集检测两种试剂盒', '1500953746571', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1066', null, '张衣北', '13628679268(董)', 'CEO', '', 'zyb751204@163.com', '', '', '初创期', '动态椎间融合器、脊柱动态固定系统', '骨科植入材料，动态椎间融合器、脊柱动态固定系统', '1500953746578', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1067', null, '陈春', '', 'CEO', '福建博达生物科技有限公司', '147299194@qq.com', '', '', '初创', '一种提高CIK细胞增殖速度的中药提取物及其制备方法', '提取红参，麦冬，黄芪复合中药材，体外刺激CIK细胞的生长和细胞杀伤能力', '1500953746584', null, '融资服务,生产服务,区域服务', '4', 'Y');
INSERT INTO `tbl_card` VALUES ('1068', null, '钱江', '', 'CEO', '美国俄亥俄州', 'Qianjiang88@hotmail.com', '', '', '初创期', '主治心血管疾病的自折叠型贴片胶囊新药', '无', '1500953814410', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1069', null, '齐海燕', '', 'CEO', '纽约医学院/Springcell Corporation', 'haiyanqi72@gmail.com', '', '', '初创期', '防治脑卒中的一类新药', '无', '1500953814423', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1070', null, '刘新学', '', 'CEO', '北京大学', 'xinxueliu@gmail.com', '', '', '初创期', '生物标志物与食管癌的预防和治疗', '无', '1500953814435', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1071', null, '刘运鹏', '', 'CEO', '中国海洋大学', 'yliu65@gsu.edu', '', '', '初创期', '糖类酶制剂的研发和生产', '无', '1500953814441', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1072', null, '冯伟军', '', 'CEO', '美国内布拉斯加州立大学医学院', 'wfengus2000@yahoo.com', '', '', '初创期', '治疗免疫性炎症和血管疾病的一类多肽新药', '无', '1500953814446', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1073', null, 'Ralf Klein', '', 'CEO', 'Virusure', 'Ralf_Klein@virusure.com', '', '', '初创期', '病毒去除、灭活或清洁的定制化研究', '无', '1500953814452', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('1074', null, '张泓', '4972166546011', 'CEO', 'Medivir', 'hong.zhang@medivir.se', '', '', '初创期', '商务开拓，Medivir中国选址', '是一家瑞典生物制药企业，于1996年瑞典上市，目前仅在英国设有分公司。该公司专门从事HBV/HCV/anti-infectious/infectious and parasitic diseases/immune disorders等适应症的新药研发和生产。与J&J、Daewoong、GSK共同开发新药。意向：有意愿来中国设立公司，正在选址过程中(Medivir公司曾与人福有过合作，但不太愉快)。张泓博士(持北京口音)，瑞典博士毕业后一直供职于该公司，从产品研发逐渐过渡到商务拓展业务，是该公司在国内选择落地地点的决策者。', '1500953814462', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1075', null, '何南海', '13718243552', 'CEO', 'PrimCells LLC', 'nhe@salk.edu', '', '', '初创期', '新型高效哺乳动物蛋白表达生产平台的构建及应用', '正在注册公司', '1500953814469', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1076', null, '徐卫初/George Wright', '8589994005(李中瀚)', 'CEO', 'GLSynthesis Inc.', 'george.wright@glsynthesis.com', '', '', '初创期', '抗艰难梭菌新药开发', '无', '1500953814476', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1077', null, '郭丰亮', '', 'CEO', '企航新能源有限公司', 'giilee@163.com', '', '', '初创期', '分布式生物质能源热能与电能中心系统（2010年底，苏州工业园落地）', '无', '1500953814481', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('1078', null, '姚南华', '18916291880', 'CEO', '贝勒医学院', 'nhyao@yahoo.com', '', '', '初创期', '快速抗癌抗病毒的药物研发-基于高清药靶结构', '无', '1500953814488', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1079', null, 'David Baker', '', 'CEO', 'University Technology Park at IIT', 'bakerd@iit.edu', '', '', '初创期', '商务开拓，Biopark/Incubator/Accelerator', 'Chicago and Illinois have become the center of a growing Midwestern bio-cluster, featuring the headquarters some of the largest life sciences and pharmaceutical companies in the world', '1500953814494', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1080', null, '马建廷', '', 'CEO', '', 'jianting1107@hotmail.com', '', '', '初创期', 'IFORU 人工智能型机械外骨骼技术', '无', '1500953814500', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1081', null, 'Simone Cristoni', '', 'CEO', 'Ion Source & Biotechnology', 'simone.cristoni@gmail.com', '', '', '初创期', 'Customizing research services and products (cancer research, cancer diagnosis, kits)', 'Customizing research services and products (cancer research, cancer diagnosis, kits)', '1500953814509', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1082', null, 'Mark Baker', '0296474438', 'CEO', 'Australian School of Advanced Medicine', 'mark.baker@mq.edu.au', 'www.isbiolab.com', '', '初创期', 'Human Proteome Project', '无', '1500953814517', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1083', null, 'Andrew Wooten', '61 406 631 131', 'CEO', 'Baylor College of Medicine', 'alwooten123@gmail.com', '', '', '初创期', '美国贝勒医学院技术转移', 'Dan L. Duncan Institute for Clinical and Translational Research\nBaylor Licensing Group\nImplementing an integrated innovation program at BCM to identify and develop commercial solutions for unmet biomedical needs.', '1500953814528', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1084', null, 'Mindaugas Zagorskis', '', 'CEO', 'Pipelinepharma', 'mindaugas.zagorskis@gmail.com', 'Andrew Wooten', '', '初创期', 'pipelinepharma is a global marketplace, networking and trading platform for pharmaceutical', 'pipelinepharma is a global marketplace, networking and trading platform for pharmaceutical executives with free of charge product registration for in- and out-licensing, 31.000+ registered products: 19.400+ commercially available dossiers of finished formulations for out-license or distribution, 11.600+ API’s for sale, 400+ Marketing authorizations (MA’s); 1.400+ dossiers which clients are seeking for in-license. Marketplace available online for the computers, tablets and smart phones and do not require any special installations.', '1500953814536', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1085', null, 'Amr Abid', '37068582112', 'CEO', 'Regenerys Ltd.', 'amr.abid@glenlealtd.com', 'www.pipelinepharma.eu', '', '初创期', 'Regenerys is a regenerative medicine company', 'Regenerys is a regenerative medicine company working with adipose tissue for breast reconstruction and plastic surgery, and in skin regeneration technology.', '1500953814542', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1086', null, 'John Patava', '', 'CEO', 'Quintiles', 'john.patava@quintiles.com', 'www.regenerys.com', '', '初创期', '医药产业服务商', '无', '1500953814551', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1087', null, 'Lalit Baregama', '0065-97246016', 'CEO', 'Vimta Labs Ltd', 'lalit.baregama@vimta.com', 'www.quintiles.com', '', '初创期', '专业第三方检测服务', '无', '1500953814559', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1088', null, '马岩', '', 'CEO', '布鲁塞尔自由大学肿瘤研究所(Institut Jules Bordet)', 'yanbeili@yahoo.com', 'www.vimta.com', '', '初创期', '创建细胞基因学和分子生物学肿瘤诊断中心', '无', '1500953814565', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1089', null, '张兴', '', 'CEO', '广东康德瑞供应链管理有限公司', 'zhangxing@hotmail.com', '', '', '初创期', '一种诊断试剂的注册申报', '粪便中的致病微生物的检测', '1500953814573', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1090', null, 'Eyal Miller', '13829962607', 'CEO', 'Common Sense LTD', 'eyalmiller27745@gmail.com', 'www.cs-commonsense.com/', '', '初创期', 'Manufacturing diagnostic products for women health care', 'Manufacturing diagnostic products for women health care（COMMONSENSE panty-liners contain built-in sensing capabilities that accurately monitor vaginal and urinary tract health on a daily basis.  These novel, easy-to-use products sense, identify and diagnose vaginal and urinary pH levels - and via simple color coding, either indicate good health, or act as an immediate early warning system that there is a condition that needs to be treated.）', '1500953814579', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1091', null, 'RAJIV SINGH', '972 52 5628562', 'CEO', 'ADVY CHEMICAL PVT. LTD', 'raajivsingh78@gmail.com', 'www.advychemical.com', '', '成熟期', 'Manufactures lateral flow assays and an emerging focus in point of care Technologies', 'Manufactures lateral flow assays and an emerging focus in point of care Technologies', '1500953814598', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1092', null, 'Bob Boock', '91-22-6656-0900', 'CEO', 'Glucovation, Inc', 'r_boock@yahoo.com', 'www.glucovation.com', '', '初创期', 'Continuous glucose monitoring system that addresses the deficiencies of the existing CGM systems', 'Continuous glucose monitoring system that addresses the deficiencies of the existing CGM systems', '1500953814606', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1093', null, 'Cha-Mei Tang', '', 'CEO', 'Creatv MicroTech', 'cmtang@creatvmicrotech.com', 'www.creatvmicrotech.com/', '', '初创期', 'Novel Technology for the Detection of Low Abundance Protein', 'Novel Technology for the Detection of Low Abundance Protein', '1500953814614', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1094', null, 'Qi Zhang', '', 'CEO', 'SCIMALS', 'arcticknut@gmail.com', 'tulane.edu/www.scimals.com', '', '初创期', '第三方生命科学技术与市场咨询额公司', 'Scientific and Market Life Science Advising (SCIMALS) is a non-profit organization that provides objective third-party scientific and market due diligence for early stage life science investors and entrepreneurs through the collective efforts of graduate and post-doctoral students.', '1500953844496', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1095', null, '霍毅欣', '301-983-1650', 'CEO', 'Easel Biotechnologies, LLC', 'yixinhuo@gmail.com', '', '', '成长期', '重要氧络化合物的生物制备', '利用微生物以非食用蛋白为基质消耗电能固定二氧化碳合成高级醇', '1500953844506', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('1096', null, '葛跃', '1-（310）882-0459', 'CEO', '', 'yge48105@gmail.com', '', '', '初创期', '新ELISA专利技术及它在生物医学研究，疾病诊断，食品卫生和环境毒物检测中的广泛应用', '新ELISA专利技术及它在生物医学研究，疾病诊断，食品卫生和环境毒物检测中的广泛应用', '1500953879597', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1097', null, '李冬阳', '', 'CEO', '', 'tongyounglee@gmail.com', '', '', '成熟期', '血管内皮抑制素', '1.基于恩度的第二代血管内皮生长抑制剂2.主要优势是链接了人18号胶原蛋白片段后把药物的半衰期从数小时延长到数天3.第二代产品由动物细胞生产能有效减少人体的排异反应', '1500953879611', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1098', null, '陈利民', '617-919-2401', 'CEO', '泉盛生物科技股份有限公司', 'limin_chen_99@yahoo.com', '', '', '初创期', '病毒性肝炎治疗前疗效预测及个体化治疗', '病毒性肝炎治疗前疗效预测及个体化治疗', '1500953879621', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1099', null, '吕红艳', '', 'CEO', '多伦多大学', 'hongyan_lu01@yahoo.com', '', '', '成长期', '结核病高效诊断试剂和疫苗自主研发应用', '1.结核病高效诊断试剂和疫苗自主研发应用', '1500953879630', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1100', null, 'Ines Engle', '', 'CEO', 'University of Surrey', 'ines.engel@me.com', '', '', '初创期', 'Peroral administration of insulin', 'Future Health Pharma GmbH is a Partner Company of Five Office Ltd and uses 30 years of experience of this well-known and successful Swiss Service Provider:Clinical Research (I-IV)；RegulatoryHealth Marketing and Communication；Therapeutic Areas', '1500953879648', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1101', null, 'Dan Daly', '', 'CEO', 'Five Office', 'dan.daly@lein-ad.com', '', '', '初创期', 'A non-invasive glucose meter for people with diabetes', 'Lein is currently developing a non-invasive glucose meter for people with diabetes. Products:The CTS was originally designed to measure collagen thickness for tissue engineering applications.The Dione bidirectional sensor is a compact and affordable source/detector module that is at the core of the Lein confocal sensing technique. It can be used as either a scanning or static device, allowing measurements with sub-micron precision and repeatability. CTS2 Accurate thickness measurement of 3D engineered tissues and cells(Non-contact)', '1500953879656', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1102', null, '谢明', '', 'CEO', 'Humanoid Robotics International Pte Ltd', 'xieming@humanoid.com.sg', 'www.humanoid.com.sg', '', '初创期', '多自由度微创手术机器人', '多自由度微创手术机器人：本项目的目标是把一项自主创新技术开发成下一代的微创手术机器人。该技术实现了用一个未端电机去驱动N个独立的串行自由度 （N可以是任何整数）。由于电机处于未端，机器人的手臂和手指可以微型化。并且，它同时保证每个关节的额定输出力度。 我们的技术是世界首创，并于2000年申请PCT保护。', '1500953879664', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1103', null, 'Jim Stice', '7635765172', 'CEO', 'TWIN STAR MEDICAL', 'jimstice@charter.net', 'www.twinstarmedical.com', '', '初创期', 'porous hollow fiber (PHF) catheters \nwith vacuum systems and/or infusion pumps to address major unme', 'porous hollow fiber (PHF) catheters \nwith vacuum systems and/or infusion pumps to address major unmet medical needs in tissue drainage and drug delivery', '1500953879670', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1104', null, 'Kalevi Reijonen', '35840843569', 'CEO', 'FIT Biotech Oy', 'kalevi.reijonen@fitbiotech.com', '', '', '成熟期', 'GTU®---a new generation of none-viral delivery technology based on protein E2 for  gene therapy', 'GTU® is a none-viral gene delivery technology which can dilivers the target gene to cell safely', '1500953879676', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1105', null, '龚睿', '18696109012', 'CEO', '武汉大学', 'Gong_rui@msn.com', '', '', '初创期', '基于抗体Fc优化的新药开发以及相关若干技术服务平台的建立', '无', '1500953879684', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1106', null, '李平', '', 'CEO', '美国维克森林大学', 'Wfu1999@yahoo.com', '', '', '初创期', '活性维生素功能食品应用产业化实施', '无', '1500953879694', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1107', null, '兴津', '18627045161', 'CEO', '武汉市招商局对日窗口', 'k.okitsu@syspro.co.jp', '', '', '初创期', '株式会社シスプロ', '无', '1500953879701', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1108', null, '熊云', '', 'CEO', '日本贸易振兴联合会', 'yun_xiong@jetro.go.jp', '', '', '初创期', '日本贸易振兴机构', '无', '1500953879707', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1109', null, '小川', '', 'CEO', 'コトブキ薬粧株式会社', 'info@kotobuki-yakusho.co.jp', '', '', '初创期', 'コトブキ薬粧技术', '无', '1500953879713', null, '融资服务,生产服务,区域服务', '4', 'Y');
INSERT INTO `tbl_card` VALUES ('1110', null, '李静', '18627182076', 'CEO', '武汉正轩宇生物科技有限公司', '729788572@qq.com', '', '', '初创期', '抗雾霾防辐射技术开发', '无', '1500953879721', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1111', null, '余乐', '', 'CEO', '英国爱丁堡大学', 'leyu@msn.com', '', '', '初创期', '基因芯片技术应用及推广', '无', '1500953879730', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1112', null, '李敏', '', 'CEO', '美国默克', 'minli88@yahoo.com', '', '', '初创期', '国外服务机构3', '无', '1500953879736', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1113', null, 'Cong(Cathy)Fang', '', 'CEO', 'MIT Solan School of Management', 'cathycongfang@gmail.com', '', '', '初创期', '国外服务机构2', '无', '1500953879743', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1114', null, 'Robert G.Hunter', '', 'CEO', 'Predict-Medicine', 'rhunter@wave-pt.com', '', '', '初创期', '国外服务机构', '无', '1500953879750', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1115', null, '王金鹏', '', 'CEO', 'Aptitude Medical Systems', 'jp.wang@aptitude medical.com', '', '', '初创期', '第八届春晖杯项目，抗体合成', '无', '1500953879771', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1116', null, '龚欣', '', 'CEO', '北京首韩医药信息咨询有限公司', 'gongxin@zeni thpharm.net', '', '', '初创期', '推荐国外新药项目', '无', '1500953879784', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1117', null, '骆培方', '', 'CEO', 'Integrated Analytical Laboratories,Randolph.NJ,USA', 'pfrankluo@msn', '', '', '初创期', '1.帮助中国制药厂建立完整的、符合美国GMP标准系统的厂房和药检研发及质量控制实验室；2.引进并生产优质高效西药产品；3.寻求中国合作厂家向美国制药公司提供合同生产', '无', '1500953879798', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1118', null, 'James Yip', '', 'CEO', 'TEC Edumonton', 'james,Yip@tecedmonton.com', '', '', '初创期', '为加拿大一些中小企业寻找中国落户园区', '无', '1500953879805', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1119', null, '任罡', '', 'CEO', 'Lawrence Berkeley National Laboratory', 'garyren@yahoo.com', '', '', '初创期', '美国，CETP抑制抗体对人体好坏胆固醇调节的药物临床测试', '无', '1500953879811', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1120', null, '凌新生', '', 'CEO', 'Brown University,USA', 'xsling@brown.edu', '', '', '初创期', '筹建一个从事纳米多孔材料相关研究的实验室', '无', '1500953879819', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1121', null, '张伯科', '', 'CEO', 'Anterios Inc.', 'boke zhang@yahoo.com', '', '', '初创期', '纳米生物活性高端化妆品及涂抹剂抗皮肤癌药物开发', '无', '1500953879826', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1122', null, '何矿林', '', 'CEO', 'Fulirebio诊断公司', 'statqcbi@gmail.com', '', '', '初创期', '数据分析和生物科技引进CRO', '无', '1500953904478', null, '融资服务,生产服务,区域服务', '10', 'Y');
INSERT INTO `tbl_card` VALUES ('1123', null, '高志勇', '', 'CEO', '美国Prizer辉瑞药厂', 'Davidgao8@yahoo.com', '', '', '初创期', '开发多项新药和医疗器械', '无', '1500953904488', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1124', null, '林基桢', '13365912638', 'CEO', '美国明尼苏达大学医学院', 'linxx004@umn.edu', '', '', '初创期', '研发治疗头颈部肿瘤新药（新制剂）', '无', '1500953904495', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('1125', null, '冉瑞琼', '', 'CEO', '加州大学戴维斯分校', 'ranruiqiong@yahoo.com', '', '', '初创期', '解决肿瘤放化疗毒副反应的口服新药制剂', '无', '1500953904507', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('1126', null, 'Alex', '18064069875', 'CEO', 'Genomica', 'aaparicio@genomica.com', '', '', '成长期', '呼吸道病毒检测，癌症检测', '无', '1500953904514', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1127', null, '卢凡', '18961788588', 'CEO', '湖北中菩环保科技有限公司', 'algaencorp@gmail.com', '', '', '初创期', '新一代聚不饱和脂肪酸在食品和生物医药领域的产业化及应用', '无', '1500953904521', null, '融资服务,生产服务,区域服务', '12', 'Y');
INSERT INTO `tbl_card` VALUES ('1128', null, '唐焜', '15172407669', 'CEO', '武汉市泰安康生物科技有限公司', 'tangsk1990@163.com', '', '', '初创期', '肾癌诊断技术', '无', '1500953904534', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1129', null, '柯昌斌', '13581378676', 'CEO', '太和医院麻醉科', '406078284@qq.com', '', '', '初创期', '子宫收缩器', '无', '1500953904541', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1130', null, '王桐信', '18518220078', 'CEO', '', 'tongxinwang@yahoo.com', '', '', '初创期', '人工仿生骨骼', '无', '1500953931091', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1131', null, '胡清华', '15972138902', 'CEO', '', '459193867@qq.com', '', '', '初创期', '干细胞治疗', '无', '1500953931101', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1132', null, '邹恒', '027-87710197', 'CEO', '武汉市华中电测技术开发有限公司', 'dongf717@163.com', '', '', '成熟期', '血凝检测仪器', '无', '1500953931107', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1133', null, '苏欣', '13915259013', 'CEO', '武汉贞利康生物科技有限公司', 'xsu10@yahoo.com', '', '', '成长期', '心肌心梗标志物', '无', '1500953931115', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1134', null, '周总', '13907129966', 'CEO', '武汉珞珈基因医学产业股份有限公司', 'gy9966@126.com', '', '', '初创期', '开发直肠癌，妇科病和甲状腺癌诊断试剂盒', '无', '1500953931123', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1135', null, '任先生', '18519651509', 'CEO', '', 'yue.ren@purspec.cn', 'www.purspec.cn', '', '初创期', '专用小型质谱分析系统的研发与产业化', '专用小型质谱分析系统的研发与产业化', '1500953931132', null, '融资服务,生产服务,区域服务', '8', 'Y');
INSERT INTO `tbl_card` VALUES ('1136', null, '张伟', '', 'CEO', '', 'zhangwei.zju@gmail.com', '', '', '初创期', '一种新型治疗Ⅱ型糖尿病的长效胰高血糖素样肽-1受体和高血糖素样肽受体双靶点药物的研发和生产', '无', '1500953931159', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1137', null, '叶学敏', '', 'CEO', '', 'pete521@126.com', '', '', '初创期', '研发创新药老年痴呆病或阿尔茨海默病多肽药物', '本项目利用疫苗多肽进入体内，抑制Aβ沉积，从而防治老年痴呆病。', '1500953931168', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1138', null, '徐晓军', '', 'CEO', '', 'xiaojun.xu@ki.se', '', '', '初创期', '新型组合型镇痛药物的研究开发', '本项目计划研发一类新型的用于治疗疼痛的药物，基于原创科研发现的药物组合，研发的基本概念是通过联合使用小剂量的两种或多种药物达到协同有效的镇痛效果，减少副作用和药物耐受的发生。', '1500953931175', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('1139', null, '吴萌', '', 'CEO', '', 'wumeng19@gmail.com', '', '', '初创期', '新型薇藻藻种开发平台的建立', '最新的分子生物学和合成生物学技术为新藻种的开发利用带来了机遇。利用新一代基因组编辑技术，可实现定点改造基因组，获得预期的基因序列改变，从而控制生物体合成代谢途径并产生高浓度的目的产物，使生物体按照人的设计和要求产生所需的产品，有助于加快培育更优质、高产的优良品种。计划利用融资建立微藻藻种的商业化平台，并以新技术研发新藻种为创新点，收集并建立用于多个领域生产的藻种库，同时为微藻生产提供藻种保存、鉴定等服务和技术支持。', '1500953931184', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1140', null, '韦汉勋', '', 'CEO', '', 'hweihml@hotmail.com', '', '', '初创期', '老年痴呆症新药研发', '本项目是基于目前普遍被接受的“淀粉样蛋白假说”的基础上进行的。主要目的就是找到一个小分子，它能够有效地（活性好），选择性地（不干扰细胞别的功能）抑制γ-分泌酶活性。经过7年努力，该团队找到3、4个这样的化合物，其中一些化合物IC50（“抑制浓度50%”）小于1纳摩尔，化合物表现出的选择性（范围从300倍到700倍），它们都好于临床化合物Avagacestat（190倍）。', '1500953931198', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1141', null, '王琼', '', 'CEO', '', 'qwang01@rockefeller.edu', '', '', '初创期', '利用噬菌体裂解酶技术控制艰难梭菌感染', '利用噬菌体裂解酶技术控制艰难梭菌感染', '1500953931206', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1142', null, '王慧茹', '', 'CEO', '', 'wjane60527', '', '', '初创期', '非抗生素类抗重症流感新药', '一期产品为动物用新营养保健品或饲料添加剂。用于动物流感病毒感染，及其他呼吸道感染的预防', '1500953931216', null, '融资服务,生产服务,区域服务', '2', 'Y');
INSERT INTO `tbl_card` VALUES ('1143', null, '黄啸', '', 'CEO', '', 'huangxiao-33@163.com', '', '', '初创期', '治疗妊娠期肝内胆汁淤积症的新型药物', '结合瑞士先进的生物制药理念技术，开发了具有独立知识产权的天然植物类新药XCQ。团队全面综合考察XCQ治疗妊娠期肝内胆汁淤积症的综合药效体系，药代动力方向和系统毒理评价。结果表明XCQ治疗效果佳，服用周期短，毒副作用低，成药性极高，较好的填补了妊娠期肝内胆汁淤积症的治疗空白。此项目已获得中国和瑞士的研发资金支持，正处于临床一期试验的后期。结合目前项目可行性和完成度评估，可以节省至少十年的研发周期。', '1500953931224', null, '融资服务,生产服务,区域服务', '4', 'Y');
INSERT INTO `tbl_card` VALUES ('1144', null, '顾全', '', 'CEO', '', 'steven_gu2001@yahoo.com', '', '', '初创期', '干眼症泪栓和药物缓释泪栓', '通过与美国QLT/Mati therapeutics公司合作，开发第一代青光眼药物缓释泪栓。随后自主开发新一代眼科药物缓释产品。干眼症泪栓是一种微创的干眼症疗法。由于干眼症泪栓在美国是成熟产品，因此开发的费用和风险大大下降。我们已有一项干眼症泪栓自主产权。估计两年左右可推出产品。青光眼是失明的第二大原因。药物缓释泪栓治疗青光眼可控制眼压（IOP）和增强患者的坚持用药比率。目前，QLT/Mati therapeutics拥有37个已授权专利及约400专利申请。他们愿与该团队共同开发适合中国和亚洲市场的产品。他们的第一代产品L-PPDS已有超过570个病人在美国九个中心接受过二期临床试验治疗。临床试验证明L-PPDS在4,8和12周可控制眼压降眼压约5.0毫米汞柱，达到每天使用前列腺素眼药水效果。由于第一代产品在安全性和有效性方面已基本没有问题，因此待开发的新一代产品在时间、费用和风险大大下降。合作方式需要谈判（包括中国市场独家销售权，技术转让，入股Mati公司等方式）。', '1500953931230', null, '融资服务,生产服务,区域服务', '3', 'Y');
INSERT INTO `tbl_card` VALUES ('1145', null, '崔继红', '', 'CEO', '', 'jihong.cui@pharma.ethz.ch', '', '', '初创期', '靶向性抗肿瘤干细胞天然活性成分的研发', '靶向性抗肿瘤干细胞天然活性成分的研发', '1500953931237', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1146', null, '程夏楷', '', 'CEO', '', 'chengxiakai@gmail.com', '', '', '初创期', '治疗结肠癌的靶向药物', '治疗结肠癌的靶向药物', '1500953931244', null, '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1147', null, '许明安', '18662535679', 'CEO', '江苏华岱', 'manfred_xu@163.com', '', '', '初创期', '血型配血卡，化学发光试剂', '血型配血卡，化学发光试剂', '1500953931251', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1148', null, '黄跃进', '025-88107160', 'CEO', '南京杰蒙生物科技有限公司', 'info@jenomed.com', '', '', '初创期', '多重数字PCR进行产前诊断', '多重数字PCR进行产前诊断', '1500953931256', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1149', null, '熊春艳', '027-51877381', 'CEO', '武汉天源药业有限责任公司', 'hxl418@163.com', '', '', '初创期', '租用实验室', '租用实验室', '1500953931262', null, '融资服务,生产服务,区域服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1150', null, '许文俊', '', 'CEO', '', 'xwj8866@163.com', '', '', '初创期', '血凝检测试剂（PT、TT、FIB、APTT）', '血凝检测试剂（PT、TT、FIB、APTT）', '1500953931268', null, '融资服务,生产服务,区域服务', '7', 'Y');
INSERT INTO `tbl_card` VALUES ('1151', 'upload_images/9f32d212-ae52-4519-9bfa-d8cd13a2a899.jpg', '明锋', '15549406395', '业务经理', '永安康健药业', '382940169@qq.com', 'www.whyakj.com', null, '成长期', '保健食品代工', '', '1502956785830', '37', '生产服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1152', 'upload_images/a4dd3123-3450-40b1-a67f-4f158894d2d1.jpg', '聂金龙', '13329738805', '汽车服务', '武汉信租会汽车服务有限公司', '322506@qq.com', 'www.xinzuhui.com', null, '初创期', '共享汽车分时租赁', '服务生物园园区员工，企业用车', '1506001581162', '48', '区域服务,融资服务', '15', 'Y');
INSERT INTO `tbl_card` VALUES ('1153', 'upload_images/cd5ee0ad-c884-4875-bf52-09a8637e7661.jpg', '张雷', '13627247633', '执行董事', '武汉楚思米餐饮管理有限公司', '659716003@qq.com', 'www.chusimi.com', null, '初创期', '阳逻绿谷生物医药园', '生物医药园园外园阳逻绿谷基地，建地2400苗，先招商各行企业入驻，智能制造业，生物医药器械，互联网科技公司，物流仓储可以都有，有现有厂房，专业定制方便灵活', '1506006063981', '49', '融资服务,生产服务,区域服务', '5', 'Y');
INSERT INTO `tbl_card` VALUES ('1154', 'upload_images/a0dc59c9-004a-48b1-9382-58f44d713a4c.jpg', '张雷', '13627247633', '执行董事', '武汉楚思米餐饮管理有限公司', '659716003@qq.com', 'www.chusimi.con', null, '成长期', '食堂承包', '专业承包企事业，园区食堂服务，专业人做专业事', '1506006311521', '49', '区域服务,融资服务,生产服务', '14', 'Y');
INSERT INTO `tbl_card` VALUES ('1155', 'upload_images/b13b2ce0-b6ba-4086-99dd-6ab46f99ceda.jpg', '胡成元', '18627964088', '经理', '武汉市伍联光电科技有限公司', '593978693@qq.com', 'www.wlgd.com', null, '成长期', 'LED电子屏租赁', '各类LED电子屏的租赁销售安装调试维护', '1509580771954', '57', '区域服务', '14', 'N');
INSERT INTO `tbl_card` VALUES ('1156', 'upload_images/c2f95433-81d4-492e-bafe-7fa28cadf3ac.jpg', '肖成林', '17798781122', '经理', '江苏省微领地广告有限公司', '619902668@qq.com', 'www.356778.com', null, '成熟期', '我是它', '在额前的我在一起', '1510158656739', '62', '生产服务', '8', 'N');
INSERT INTO `tbl_card` VALUES ('1157', 'upload_images/25ae7d2f-e882-4a51-ae38-6c01b70f6d31.jpg', '关紫新', '13751821541', '总经理', '广州市易灸宝贸易有限公司', '418637453@qq.com', 'http://a2.rabbitpre.com/m/VnVnNmFRE?lc=1&sui=yOBNGWFT&cnl=&from=singlemessage&isappinstalled=0#from=', null, '成长期', '中医艾灸', '国家对扩生素滥用有所控制之后，中医养生成了一个趋势。而中医艾灸好多人都知道好，但被很多放弃，因为麻烦而且耗时导致很难坚持。我公司做的是一款操作极为方便的艾灸用具，而且安全，小孩子使用也好安全！更重要是效果明显！想了解的，可以发试用装，免费体验再决定是否适合加盟合作！', '1514866865180', '73', '区域服务', '12', 'W');

-- ----------------------------
-- Table structure for tbl_domain
-- ----------------------------
DROP TABLE IF EXISTS `tbl_domain`;
CREATE TABLE `tbl_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `english_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `english_short` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `information` text CHARACTER SET utf8 COLLATE utf8_hungarian_ci,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tbl_domain
-- ----------------------------
INSERT INTO `tbl_domain` VALUES ('1', '药物', 'Pharmaceutical', 'Pharm', '', '1441099345880', null);
INSERT INTO `tbl_domain` VALUES ('2', '生物药', 'Biological Pharmaceutical', 'BP', '', '1441099559617', '1');
INSERT INTO `tbl_domain` VALUES ('3', '化药', 'Chemical Pharmaceutical', 'CP', '', '1441099582499', '1');
INSERT INTO `tbl_domain` VALUES ('4', '中草药', 'Chinese Traditional and Herbal drugs', 'THD', '', '1441099597330', '1');
INSERT INTO `tbl_domain` VALUES ('5', '医疗技术', 'Medical Technology', 'MT', '', '1441099606819', '1');
INSERT INTO `tbl_domain` VALUES ('6', '医疗器械', 'Medical Device', 'MD', '', '1441099621450', null);
INSERT INTO `tbl_domain` VALUES ('7', '诊断试剂', 'In Vitro Diagnostics', 'IVD', '', '1441099631300', '6');
INSERT INTO `tbl_domain` VALUES ('8', '医疗器械', 'Medical Device', 'MD', '', '1441099642801', '6');
INSERT INTO `tbl_domain` VALUES ('9', '移动医疗', 'Mobile Health', 'MH', '', '1441099653507', null);
INSERT INTO `tbl_domain` VALUES ('10', '移动医疗', 'Mobile Health', 'MH', '', '1441099667513', '9');
INSERT INTO `tbl_domain` VALUES ('11', '其他类别', 'Others', 'Others', '', '1441099678451', null);
INSERT INTO `tbl_domain` VALUES ('12', '生物环保', 'Biological Environmental', 'BE', '', '1441099701587', '11');
INSERT INTO `tbl_domain` VALUES ('13', '生物农业', 'Biological Agricultural', 'BA', '', '1441099711266', '11');
INSERT INTO `tbl_domain` VALUES ('14', '其他服务机构', 'Service', 'SEV', '', '1441099726953', '11');
INSERT INTO `tbl_domain` VALUES ('15', '联合会', 'Union', 'UNI', '', '1441099737489', '11');

-- ----------------------------
-- Table structure for tbl_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE `tbl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_group
-- ----------------------------
INSERT INTO `tbl_group` VALUES ('1', '超级管理', '0', '');

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `register_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_message
-- ----------------------------
INSERT INTO `tbl_message` VALUES ('17', '37', '1151', '恭喜您，名片[明锋]通过了审核。', '1503901880376', '0');
INSERT INTO `tbl_message` VALUES ('18', '48', '1152', '恭喜您，名片[聂金龙]通过了审核。', '1506578235879', '0');
INSERT INTO `tbl_message` VALUES ('19', '49', '1153', '恭喜您，名片[张雷]通过了审核。', '1506578346076', '0');
INSERT INTO `tbl_message` VALUES ('20', '49', '1154', '恭喜您，名片[张雷]通过了审核。', '1506578608414', '0');
INSERT INTO `tbl_message` VALUES ('21', '57', '1155', '名片[胡成元]未通过审核，原因：目前不属于医疗相关方向的，不予通过。', '1510020135809', '1');
INSERT INTO `tbl_message` VALUES ('22', '62', '1156', '名片[肖成林]未通过审核，原因：名片图片不符合要求。', '1514640119221', '1');

-- ----------------------------
-- Table structure for tbl_register
-- ----------------------------
DROP TABLE IF EXISTS `tbl_register`;
CREATE TABLE `tbl_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `park` varchar(500) DEFAULT NULL,
  `wechat_id` varchar(500) DEFAULT NULL,
  `remark` text,
  `create_time` varchar(50) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_register
-- ----------------------------
INSERT INTO `tbl_register` VALUES ('2', '张珅旿', '15171455782', '光谷生物城', 'olMcb0ZHK-X90z199DHw2A1KlPD4', null, '1496817352010', '0');
INSERT INTO `tbl_register` VALUES ('3', '红鱼', '13312345678', '硅谷', 'olMcb0SWMEbuiF-dUb0Zl4FAmR80', null, '1497337503842', '98');
INSERT INTO `tbl_register` VALUES ('4', '马昇', '15020005510', '百创汇', 'olMcb0egy-Gg6zoNLtEbRSV_o4tM', null, '1497948744515', '73');
INSERT INTO `tbl_register` VALUES ('5', '黄健', '13645786457', '生物医药园', 'olMcb0e3MRAWzUr02cGrogkHSp8k', null, '1498466963467', '99');
INSERT INTO `tbl_register` VALUES ('7', '曹巳彧', '15342208978', '生物医药园', 'olMcb0YuuNDBQTivFiEtfP-LqHhM', null, '1499328532511', '2');
INSERT INTO `tbl_register` VALUES ('8', '李小龙', '18207130715', '生物医药园', 'olMcb0bIhR8jBLHAHHDUUqBSfulE', null, '1499328640153', '2');
INSERT INTO `tbl_register` VALUES ('9', '李润清', '15972275415', '光谷生物城', 'olMcb0Y32kbK9Pd1pTNSI9hAMQX8', null, '1499329343351', '3');
INSERT INTO `tbl_register` VALUES ('10', '潘慧慧', '13597906141', '武汉', 'olMcb0QM03MHOC1ZjJ8tikj0uhho', null, '1499334022891', '1');
INSERT INTO `tbl_register` VALUES ('11', '陈琛', '18127968818', '宝盛国际大健康产业基地', 'olMcb0bYnDV4e5ZOvJckERQy3e4I', null, '1499575800178', '3');
INSERT INTO `tbl_register` VALUES ('12', '关炽森', '18617357818', '宝盛视光健康科技发展有限公司', 'olMcb0SXAbR4Zmf5s-NfRn3K193I', null, '1499577126087', '3');
INSERT INTO `tbl_register` VALUES ('14', '张', '13419680572', '生物园', 'olMcb0YWv5GmXdCcQBrWBXf33XBg', null, '1499695228489', '2');
INSERT INTO `tbl_register` VALUES ('15', '王志', '13560632010', '医疗器械园', 'olMcb0a_QWLJOWP2ka4X9wpj_k4I', null, '1499867265284', '3');
INSERT INTO `tbl_register` VALUES ('16', '胡立', '18086092270', '未来科技城', 'olMcb0TU86JILmLy6sx1Ym5o3lrU', null, '1500013519422', '3');
INSERT INTO `tbl_register` VALUES ('17', '吴毕祥', '15901493366', '东湖新技术开发区', 'olMcb0ZUfnzU9s8UpaaPKRoCYWlE', null, '1500038546476', '4');
INSERT INTO `tbl_register` VALUES ('18', '许生', '13822233951', '广州', 'olMcb0WiTRyZY-XUc5vg2mAnV9Vs', null, '1500073970109', '2');
INSERT INTO `tbl_register` VALUES ('19', '余杨', '13667210623', '光谷生物城', 'olMcb0XCugGfpNHaO3AE3HpBrgv8', null, '1500447573307', '3');
INSERT INTO `tbl_register` VALUES ('20', '李开放', '15972222645', '湖北省武汉市洪山区豹懈镇', 'olMcb0XarC5WD909CkJLOORuy8Ko', null, '1500459066402', '3');
INSERT INTO `tbl_register` VALUES ('21', '潘生', '18188732510', '重庆秀山', 'olMcb0Q8lzeQLO3I8Wim0O8QQNx8', null, '1500611206739', '2');
INSERT INTO `tbl_register` VALUES ('22', '糖玎玎', '13617252599', '不', 'olMcb0UxyJVRo9n1Ah48PDIfdPLg', null, '1501281784530', '2');
INSERT INTO `tbl_register` VALUES ('23', '杨生', '18520791338', '园区', 'olMcb0Qiia8P2W6J9_-iGjIH5W2w', null, '1501409073560', '3');
INSERT INTO `tbl_register` VALUES ('24', '郑辉', '13821519153', '北京', 'olMcb0VInF4TGklepP5Rt7O2YK4k', null, '1501463279941', '3');
INSERT INTO `tbl_register` VALUES ('25', '范财', '17762530130', '豹澥还建小区', 'olMcb0ZyavDMuROcfsxW3bmHKI8o', null, '1501559398057', '3');
INSERT INTO `tbl_register` VALUES ('26', '朱学谦', '18888792566', '高农生物圆', 'olMcb0R1obeI8xmcpEI_3XfpNymQ', null, '1501897933767', '2');
INSERT INTO `tbl_register` VALUES ('27', '姚先权', '15968098980', '桃花源', 'olMcb0ZicYgWfsO_7zogYpIU2voQ', null, '1501998780262', '2');
INSERT INTO `tbl_register` VALUES ('28', '杨世春', '18670038888', '南山科技园', 'olMcb0byBqDoCCZ2yLhqKt-7rmTg', null, '1502033258233', '3');
INSERT INTO `tbl_register` VALUES ('29', '杨林', '18086528610', '东湖技术开发区', 'olMcb0TEWY5fB3rfpV_8BEzt4Mto', null, '1502158856564', '3');
INSERT INTO `tbl_register` VALUES ('30', '潘春', '13163325657', '桃花源', 'olMcb0draFYkwVeTMB9M1duymLGA', null, '1502172191711', '3');
INSERT INTO `tbl_register` VALUES ('31', '徐胜卷', '15071006286', '张亮麻辣烫', 'olMcb0YHXHT-bZ90CD-Jlikgje8Q', null, '1502336140164', '3');
INSERT INTO `tbl_register` VALUES ('32', '田立禾', '15607120981', '生物医药远', 'olMcb0bBTEm2_vhg38h8eb6GL-hA', null, '1502359185821', '3');
INSERT INTO `tbl_register` VALUES ('33', '周群', '13419620961', '高农生物园', 'olMcb0XLDkjtB1-gWJZa0g-MbweM', null, '1502377257947', '3');
INSERT INTO `tbl_register` VALUES ('34', '燕薇', '15172419125', '生物医药园', 'olMcb0cUrD0plsC6tJgbgfr-o0es', null, '1502552951191', '3');
INSERT INTO `tbl_register` VALUES ('35', 'chenp', '13797053117', '华为园区', 'olMcb0QmXHoCDZR2JR5MaytbLwis', null, '1502678816921', '3');
INSERT INTO `tbl_register` VALUES ('36', '杨', '13653437287', '山西', 'olMcb0SCjN9jX1c69PpNa-NdTK7k', null, '1502717139036', '3');
INSERT INTO `tbl_register` VALUES ('37', '明锋', '15549406395', '医药园', 'olMcb0UZTKEwzslhOyNU5o4ShqRU', null, '1502956529372', '4');
INSERT INTO `tbl_register` VALUES ('38', '王文凯', '18555233522', '安徽省宣城市泾县', 'olMcb0QLe7NSHBfE_kN4X090vnho', null, '1502985789354', '3');
INSERT INTO `tbl_register` VALUES ('39', '小马', '18838187239', '科技园', '', null, '1503030223855', '3');
INSERT INTO `tbl_register` VALUES ('40', '二狗', '17585231649', '焦作', '', null, '1503113044353', '3');
INSERT INTO `tbl_register` VALUES ('41', '周欣乐', '13267686885', '火炬园', 'olMcb0c8z9BUPCu4yo62UDr6QoHw', null, '1503409405932', '2');
INSERT INTO `tbl_register` VALUES ('42', '林豹', '15971418564', '豹懈还建小区', 'olMcb0SErXTipPhc9GHgz9RyNLHk', null, '1503525945769', '3');
INSERT INTO `tbl_register` VALUES ('43', '周礼杰', '13037112362', '智造园', 'olMcb0QAYiu0Pp9WFMrbMiS_2dCY', null, '1503528952325', '3');
INSERT INTO `tbl_register` VALUES ('44', '段鑫磊', '13296660120', '生物城', 'olMcb0SFG6y963BVMdcSb6jXICuE', null, '1503984205456', '3');
INSERT INTO `tbl_register` VALUES ('45', '张严', '18920967925', '苏州', 'olMcb0eD0AuLn_TRZNk8IFaSYjdE', null, '1504532487848', '3');
INSERT INTO `tbl_register` VALUES ('46', '郑思辉', '15188627835', '中国地质大学长城学院', 'olMcb0UMXGMhKo70rVrB1JdpBRAU', null, '1505130931475', '3');
INSERT INTO `tbl_register` VALUES ('47', '江生', '18666388387', '广东省', 'olMcb0a1m8XWKUoduOqzzle2XCr4', null, '1505290527355', '3');
INSERT INTO `tbl_register` VALUES ('48', '聂金龙', '13329738805', '未来科技城', 'olMcb0axFGoT__wY_J83ofBgwTxE', null, '1506001407901', '4');
INSERT INTO `tbl_register` VALUES ('49', '张雷', '13627247633', '阳逻绿谷  生物医药园', 'olMcb0cZG9RmhHp5NYllAPMiqJPU', null, '1506005622470', '5');
INSERT INTO `tbl_register` VALUES ('50', '杨甲飞', '18202783461', '加速器', 'olMcb0Rdqia4wSjP6ulHPXElW3EQ', null, '1506225596298', '1');
INSERT INTO `tbl_register` VALUES ('51', '夏宗富', '13507226030', '朗诗里程', 'olMcb0Zj_jGDdi2ng_2Amp8MURco', null, '1506554669015', '1');
INSERT INTO `tbl_register` VALUES ('52', '陈家七小姐00', '13729933899', '广东东莞', 'olMcb0TMlwTBKg4_URAbyotKw2FE', null, '1507130536514', '3');
INSERT INTO `tbl_register` VALUES ('53', '杜林林', '15927616657', '桃花源', 'olMcb0ZbKCbOn16VZxTt83vSY9Is', null, '1507402522288', '3');
INSERT INTO `tbl_register` VALUES ('54', '曹瑀', '13986250453', '生物城', 'olMcb0TXhPVmCsOXMzRAJkYA4PRs', null, '1507693874260', '3');
INSERT INTO `tbl_register` VALUES ('55', '李', '17720568796', '高农生物园', 'olMcb0ZF2RB7oGf69baF3WqAxR9Y', null, '1507881130515', '3');
INSERT INTO `tbl_register` VALUES ('56', '桂稳', '13317117738', '光谷生物城', 'olMcb0ZdSlpts7qXC045sTL8aM5w', null, '1509358742262', '3');
INSERT INTO `tbl_register` VALUES ('57', '毛', '18972348395', '123', 'olMcb0Qs8AGOeQmM7OSuUYfWGoLI', null, '1509580406401', '3');
INSERT INTO `tbl_register` VALUES ('58', '牛振辉', '13339999024', '生物', 'olMcb0bTxupajTPyiUGuWNeewiDk', null, '1509592112385', '2');
INSERT INTO `tbl_register` VALUES ('59', '小周', '18825365536', '光谷', 'olMcb0b3ckcWJl2qe1Cqjax_SInA', null, '1510066495423', '3');
INSERT INTO `tbl_register` VALUES ('60', '叶学军', '18062786807', '兰园', 'olMcb0eluuHd2AL9cJL1q_lCcNqA', null, '1510095535515', '2');
INSERT INTO `tbl_register` VALUES ('61', '高晋', '15034150037', '山西吕梁市', 'olMcb0QNoyvPw3T-eWVSYY8VMMSA', null, '1510148593235', '3');
INSERT INTO `tbl_register` VALUES ('62', '肖成林', '17798781122', '江苏', 'olMcb0YephDHx8odsHZKZUC6ug9E', null, '1510158464907', '3');
INSERT INTO `tbl_register` VALUES ('63', '邓辉', '13135673331', '5期13栋1单元901', 'olMcb0Ujkwxo4gsh1-5EkTOVSfS8', null, '1510507455665', '3');
INSERT INTO `tbl_register` VALUES ('64', '小松', '18086040686', '未来科技城 ', 'olMcb0XrmjOnHTFa9RRyauvu277s', null, '1511653908250', '2');
INSERT INTO `tbl_register` VALUES ('65', '吴鹏', '13681865020', '张江高科', 'olMcb0XvDpqloe8gCz4tsk47sLpc', null, '1511968213858', '3');
INSERT INTO `tbl_register` VALUES ('66', '梁光荣', '18834818838', '光谷朗诗里程', 'olMcb0WEnnmM08hS5wEE-1Nlqgx4', null, '1512255736351', '0');
INSERT INTO `tbl_register` VALUES ('67', '刘军', '13851355971', '中关村科技园区', 'olMcb0cdJWWzjE72G2zWTdBDb20M', null, '1512399898480', '2');
INSERT INTO `tbl_register` VALUES ('68', '吴鹏', '13007149566', '光谷生物城医药园', 'olMcb0TxaJKT70-UcjVNmUT1Dj04', null, '1513568296624', '2');
INSERT INTO `tbl_register` VALUES ('69', '娄晓良', '13609847334', '大连', 'olMcb0YcYo2upV3E9NyZ_LrbpEMk', null, '1513794141585', '3');
INSERT INTO `tbl_register` VALUES ('70', '刘德威', '13017653927', '洪山区', 'olMcb0fbMtV6E8UZv0YZ7UOgrsSU', null, '1514216837638', '3');
INSERT INTO `tbl_register` VALUES ('71', '左畅', '18086530863', '汉阳区', 'olMcb0eOCpb2wwAoRI5ECyjI9F5E', null, '1514599566466', '3');
INSERT INTO `tbl_register` VALUES ('72', '木头', '13693130718', '中华', 'olMcb0ednzD95uihDtWd6oaaMZSA', null, '1514725807287', '2');
INSERT INTO `tbl_register` VALUES ('73', '关总', '13751821541', '广州', 'olMcb0Z95EIhYbSeICc5Gjwag4W4', null, '1514866171983', '3');
INSERT INTO `tbl_register` VALUES ('74', '赵威', '18986298093', '高新区', 'olMcb0esvyG9I4XiGca6xEPCsOmM', null, '1514992506739', '2');
INSERT INTO `tbl_register` VALUES ('75', '张雄', '18610934229', '现代服务园', 'olMcb0WKokmZca4hwEPduXv3_HiM', null, '1515169271759', '3');
INSERT INTO `tbl_register` VALUES ('76', '刘建元', '13971000537', '生物城', 'olMcb0cNvb85n9BTs9DsgfVXdmjs', null, '1515246934272', '3');
INSERT INTO `tbl_register` VALUES ('77', '胡朋', '15337153181', '高农生物园', 'olMcb0SDZNXJFTAqN7n4F2iOj0Qs', null, '1515798457314', '3');
INSERT INTO `tbl_register` VALUES ('78', '周周', '13797216270', '朗诗新里程', 'olMcb0eKWY6LYATMGaKURjS0478E', null, '1515965964080', '3');
INSERT INTO `tbl_register` VALUES ('79', '王一杰', '18601688568', '漕河泾', 'olMcb0VULJBTjkhuGwKz5HtNvXQE', null, '1516021973685', '0');
INSERT INTO `tbl_register` VALUES ('80', '桂群安', '15902722388', '东湖高新还建小区四期', 'olMcb0QgIO3RVo-TdwzpAKHYzTpg', null, '1516026256434', '3');
INSERT INTO `tbl_register` VALUES ('81', '四道桥', '18600341054', '嚄', 'olMcb0Sp9_2-FPFHFMI17JF0DfMQ', null, '1516062632312', '3');
INSERT INTO `tbl_register` VALUES ('82', '李卫军', '13265974083', '碧桂园凤雅苑', 'olMcb0QqNd92dQ0ASmzMj7HuiIVI', null, '1516138611225', '3');
INSERT INTO `tbl_register` VALUES ('83', '叶康', '18507134437', '豹澥', 'olMcb0ZskQeFvL7PMwnojhOI1Ehw', null, '1516204707185', '2');
INSERT INTO `tbl_register` VALUES ('84', '李志鹏', '13305915801', '李志鹏', 'olMcb0eHdEfJUo1KYiNmh3q3PJzQ', null, '1516289192707', '3');
INSERT INTO `tbl_register` VALUES ('85', '罗俊', '15827207090', '桂园', 'olMcb0UN-SbVhEr0ExbiJyXRQduc', null, '1516528197702', '3');
INSERT INTO `tbl_register` VALUES ('86', '周方林', '18907132955', '朗诗里程', 'olMcb0Z7tuagx2LNbRtGWbkUQuJE', null, '1516809792848', '2');
INSERT INTO `tbl_register` VALUES ('87', '桂涛', '15347066500', '武汉光谷产业', 'olMcb0W4Vx5I1HX8Uv4_wLLFBRPE', null, '1517164399584', '3');
INSERT INTO `tbl_register` VALUES ('88', '沈先生', '18968106330', '杭州创客医疗器械加速器', 'olMcb0YDIfXT-w3bzPfi4BX7Eadk', null, '1517361640838', '3');
INSERT INTO `tbl_register` VALUES ('89', '符洪川', '18980638769', '成都', 'olMcb0dCNemuW6gUUyYGlzQxDh-E', null, '1518067406322', '3');
INSERT INTO `tbl_register` VALUES ('90', '夏明楠', '18971289278', '生物医药企业加速器', 'olMcb0ZdXajVOVE7kYg6RLFfHI6w', null, '1518830726565', '3');
INSERT INTO `tbl_register` VALUES ('91', '孔令冰', '18271692282', 'A2', 'olMcb0R33b5dLH-LI6rozdhMiuY8', null, '1518878541111', '2');
INSERT INTO `tbl_register` VALUES ('92', 'jason', '13554326305', 'hh', 'olMcb0YvdIEAYYZIag5wHTqR8IJQ', null, '1519454233787', '3');
INSERT INTO `tbl_register` VALUES ('93', '鱿鱼', '18804728888', '哈哈哈哈', 'olMcb0RVE_C4n2Wu-Cy0jzfLCinw', null, '1519782761503', '3');
INSERT INTO `tbl_register` VALUES ('94', '金', '18765918797', '山东青岛', 'olMcb0QRCurA6_H0MlIUt5Dc_KLg', null, '1519994132684', '3');
INSERT INTO `tbl_register` VALUES ('95', '赖菁曦', '18302342235', '重庆', 'olMcb0dBgohDk1JDWxYDK1iyW73Q', null, '1520474293465', '3');
INSERT INTO `tbl_register` VALUES ('96', '赵金波', '18071129832', '生物医药园', 'olMcb0XtPzHjE_kKNWWPITaQgP0o', null, '1520923411135', '2');
INSERT INTO `tbl_register` VALUES ('97', '嫌疑人X', '13546152468', 'hahaha', 'olMcb0aaBdx5R4xCZg40w87NgxQQ', null, '1521041894626', '3');
INSERT INTO `tbl_register` VALUES ('98', '周波', '18971284186', '生物园', 'olMcb0TRI8RmB15SderKmdNWk69A', null, '1523235290444', '3');
INSERT INTO `tbl_register` VALUES ('99', '谢磊', '13892178185', '安塞工业园区', 'olMcb0dlpJCwU6HNUVdrMiqLjT48', null, '1523437668142', '3');
INSERT INTO `tbl_register` VALUES ('100', '言午', '13627148200', '东湖高新区', 'olMcb0XHdl9y9PMlmgw4zyKe2BKM', null, '1523882860362', '1');
INSERT INTO `tbl_register` VALUES ('101', '石磊', '17671229568', '洪山', 'olMcb0Xr8h9VTfTGrKIocyAZ9qt4', null, '1524758571317', '3');
INSERT INTO `tbl_register` VALUES ('102', '胡万腾', '13007147043', '高农生物城', 'olMcb0als1GHVbKyKGcDAz8W8jl0', null, '1525646583448', '0');
INSERT INTO `tbl_register` VALUES ('103', '李卉', '13818491169', '全国', 'olMcb0WWuMOXmENdH-cMZL_NAzYA', null, '1526872263227', '3');

-- ----------------------------
-- Table structure for tbl_search_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_search_log`;
CREATE TABLE `tbl_search_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `register_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_search_log
-- ----------------------------
INSERT INTO `tbl_search_log` VALUES ('42', '张珅旿查看了[熊春艳]的名片。', '2', '1149', '1501034799903');
INSERT INTO `tbl_search_log` VALUES ('43', '张珅旿查看了[吴萌]的名片。', '2', '1139', '1501034810291');
INSERT INTO `tbl_search_log` VALUES ('44', '张珅旿查看了[张伯科]的名片。', '2', '1121', '1501056595566');
INSERT INTO `tbl_search_log` VALUES ('45', '张珅旿查看了[何矿林]的名片。', '2', '1122', '1501056611868');
INSERT INTO `tbl_search_log` VALUES ('46', '张珅旿查看了[黄啸]的名片。', '2', '1143', '1501145772327');
INSERT INTO `tbl_search_log` VALUES ('47', '糖玎玎查看了[熊春艳]的名片。', '22', '1149', '1501281813854');
INSERT INTO `tbl_search_log` VALUES ('48', '马昇查看了[张伟]的名片。', '4', '1136', '1503136075099');
INSERT INTO `tbl_search_log` VALUES ('49', '马昇查看了[许文俊]的名片。', '4', '1150', '1503246422471');
INSERT INTO `tbl_search_log` VALUES ('50', '马昇查看了[唐焜]的名片。', '4', '1128', '1503246445047');
INSERT INTO `tbl_search_log` VALUES ('51', '马昇查看了[叶学敏]的名片。', '4', '1137', '1503396084763');
INSERT INTO `tbl_search_log` VALUES ('52', '张珅旿查看了[明锋]的名片。', '2', '1151', '1503901906517');
INSERT INTO `tbl_search_log` VALUES ('53', '张珅旿查看了[钱江]的名片。', '2', '1068', '1503902372251');
INSERT INTO `tbl_search_log` VALUES ('54', '张珅旿查看了[程夏楷]的名片。', '2', '1146', '1504743871497');
INSERT INTO `tbl_search_log` VALUES ('55', '杨甲飞查看了[苏欣]的名片。', '50', '1133', '1506225659274');
INSERT INTO `tbl_search_log` VALUES ('56', '夏宗富查看了[唐焜]的名片。', '51', '1128', '1506554745922');
INSERT INTO `tbl_search_log` VALUES ('57', '夏宗富查看了[明锋]的名片。', '51', '1151', '1506554779726');
INSERT INTO `tbl_search_log` VALUES ('58', '张珅旿查看了[聂金龙]的名片。', '2', '1152', '1506578275548');
INSERT INTO `tbl_search_log` VALUES ('59', '张珅旿查看了[张雷]的名片。', '2', '1153', '1506578356599');
INSERT INTO `tbl_search_log` VALUES ('60', '马昇查看了[张雷]的名片。', '4', '1154', '1507787068879');
INSERT INTO `tbl_search_log` VALUES ('61', '朱学谦查看了[张雷]的名片。', '26', '1154', '1507906335775');
INSERT INTO `tbl_search_log` VALUES ('62', '姚先权查看了[张雷]的名片。', '27', '1154', '1508894461638');
INSERT INTO `tbl_search_log` VALUES ('63', '牛振辉查看了[张雷]的名片。', '58', '1154', '1509592216040');
INSERT INTO `tbl_search_log` VALUES ('64', '叶学军查看了[张伯科]的名片。', '60', '1121', '1510095772315');
INSERT INTO `tbl_search_log` VALUES ('65', '小松查看了[陈利民]的名片。', '64', '1098', '1511654100954');
INSERT INTO `tbl_search_log` VALUES ('66', '梁光荣查看了[崔继红]的名片。', '66', '1145', '1512255858648');
INSERT INTO `tbl_search_log` VALUES ('67', '梁光荣查看了[张雷]的名片。', '66', '1154', '1512255902335');
INSERT INTO `tbl_search_log` VALUES ('68', '梁光荣查看了[明锋]的名片。', '66', '1151', '1512255939835');
INSERT INTO `tbl_search_log` VALUES ('69', '杨甲飞查看了[聂金龙]的名片。', '50', '1152', '1513151560199');
INSERT INTO `tbl_search_log` VALUES ('70', '吴鹏查看了[程夏楷]的名片。', '68', '1146', '1513568352457');
INSERT INTO `tbl_search_log` VALUES ('71', '木头查看了[张雷]的名片。', '72', '1154', '1514725832252');
INSERT INTO `tbl_search_log` VALUES ('72', '赵威查看了[张雷]的名片。', '74', '1154', '1514992581933');
INSERT INTO `tbl_search_log` VALUES ('73', '叶康查看了[张雷]的名片。', '83', '1154', '1516204728630');
INSERT INTO `tbl_search_log` VALUES ('74', '周欣乐查看了[John Patava]的名片。', '41', '1086', '1516717642315');
INSERT INTO `tbl_search_log` VALUES ('75', '刘军查看了[James Yip]的名片。', '67', '1118', '1516745696851');
INSERT INTO `tbl_search_log` VALUES ('76', '周方林查看了[聂金龙]的名片。', '86', '1152', '1516809918547');
INSERT INTO `tbl_search_log` VALUES ('77', '孔令冰查看了[张雷]的名片。', '91', '1153', '1518878564154');
INSERT INTO `tbl_search_log` VALUES ('78', '王一杰查看了[张雷]的名片。', '79', '1154', '1519097027492');
INSERT INTO `tbl_search_log` VALUES ('79', '王一杰查看了[张雷]的名片。', '79', '1153', '1519097049500');
INSERT INTO `tbl_search_log` VALUES ('80', '王一杰查看了[韦汉勋]的名片。', '79', '1140', '1519097074084');
INSERT INTO `tbl_search_log` VALUES ('81', '张查看了[聂金龙]的名片。', '14', '1152', '1519446504437');
INSERT INTO `tbl_search_log` VALUES ('82', '赵金波查看了[熊春艳]的名片。', '96', '1149', '1520923459851');
INSERT INTO `tbl_search_log` VALUES ('83', '言午查看了[张雷]的名片。', '100', '1154', '1523882965481');
INSERT INTO `tbl_search_log` VALUES ('84', '言午查看了[郭社鹏]的名片。', '100', '1058', '1523883215754');
INSERT INTO `tbl_search_log` VALUES ('85', '胡万腾查看了[张雷]的名片。', '102', '1154', '1525646692456');
INSERT INTO `tbl_search_log` VALUES ('86', '胡万腾查看了[明锋]的名片。', '102', '1151', '1525646741005');
INSERT INTO `tbl_search_log` VALUES ('87', '胡万腾查看了[赵漪华]的名片。', '102', '1002', '1525647143373');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portrait` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `is_admin` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', '1', '系统管理员', 'admin', 'b594510740d2ac4261c1b2fe87850d08', 'upload_images/admin.jpg', '', 'Y', '0');
