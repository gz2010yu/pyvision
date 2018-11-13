/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pocket

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-13 15:20:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) NOT NULL,
  `permission_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('1', '1', '17');
INSERT INTO `auth_group_permissions` VALUES ('2', '1', '18');
INSERT INTO `auth_group_permissions` VALUES ('3', '1', '19');
INSERT INTO `auth_group_permissions` VALUES ('4', '1', '20');
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '21');
INSERT INTO `auth_group_permissions` VALUES ('6', '1', '22');
INSERT INTO `auth_group_permissions` VALUES ('7', '1', '23');
INSERT INTO `auth_group_permissions` VALUES ('8', '1', '24');
INSERT INTO `auth_group_permissions` VALUES ('9', '1', '25');
INSERT INTO `auth_group_permissions` VALUES ('10', '1', '26');
INSERT INTO `auth_group_permissions` VALUES ('11', '1', '27');
INSERT INTO `auth_group_permissions` VALUES ('12', '1', '28');
INSERT INTO `auth_group_permissions` VALUES ('13', '1', '29');
INSERT INTO `auth_group_permissions` VALUES ('14', '1', '30');
INSERT INTO `auth_group_permissions` VALUES ('15', '1', '31');
INSERT INTO `auth_group_permissions` VALUES ('16', '1', '32');

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `codename` varchar(100) NOT NULL,
  `content_type_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add content type', 'add_contenttype', '1');
INSERT INTO `auth_permission` VALUES ('2', 'Can change content type', 'change_contenttype', '1');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete content type', 'delete_contenttype', '1');
INSERT INTO `auth_permission` VALUES ('4', 'Can view content type', 'view_contenttype', '1');
INSERT INTO `auth_permission` VALUES ('5', 'Can add session', 'add_session', '2');
INSERT INTO `auth_permission` VALUES ('6', 'Can change session', 'change_session', '2');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete session', 'delete_session', '2');
INSERT INTO `auth_permission` VALUES ('8', 'Can view session', 'view_session', '2');
INSERT INTO `auth_permission` VALUES ('9', 'Can add log entry', 'add_logentry', '3');
INSERT INTO `auth_permission` VALUES ('10', 'Can change log entry', 'change_logentry', '3');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete log entry', 'delete_logentry', '3');
INSERT INTO `auth_permission` VALUES ('12', 'Can view log entry', 'view_logentry', '3');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', 'add_user', '4');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', 'change_user', '4');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', 'delete_user', '4');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', 'view_user', '4');
INSERT INTO `auth_permission` VALUES ('17', 'Can add image', 'add_image', '5');
INSERT INTO `auth_permission` VALUES ('18', 'Can change image', 'change_image', '5');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete image', 'delete_image', '5');
INSERT INTO `auth_permission` VALUES ('20', 'Can view image', 'view_image', '5');
INSERT INTO `auth_permission` VALUES ('21', 'Can add internal message', 'add_internalmessage', '6');
INSERT INTO `auth_permission` VALUES ('22', 'Can change internal message', 'change_internalmessage', '6');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete internal message', 'delete_internalmessage', '6');
INSERT INTO `auth_permission` VALUES ('24', 'Can view internal message', 'view_internalmessage', '6');
INSERT INTO `auth_permission` VALUES ('25', 'Can add login record', 'add_loginrecord', '7');
INSERT INTO `auth_permission` VALUES ('26', 'Can change login record', 'change_loginrecord', '7');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete login record', 'delete_loginrecord', '7');
INSERT INTO `auth_permission` VALUES ('28', 'Can view login record', 'view_loginrecord', '7');
INSERT INTO `auth_permission` VALUES ('29', 'Can add unread group message', 'add_unreadgroupmessage', '8');
INSERT INTO `auth_permission` VALUES ('30', 'Can change unread group message', 'change_unreadgroupmessage', '8');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete unread group message', 'delete_unreadgroupmessage', '8');
INSERT INTO `auth_permission` VALUES ('32', 'Can view unread group message', 'view_unreadgroupmessage', '8');
INSERT INTO `auth_permission` VALUES ('33', 'Can add group', 'add_group', '9');
INSERT INTO `auth_permission` VALUES ('34', 'Can change group', 'change_group', '9');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete group', 'delete_group', '9');
INSERT INTO `auth_permission` VALUES ('36', 'Can view group', 'view_group', '9');
INSERT INTO `auth_permission` VALUES ('37', 'Can add permission', 'add_permission', '10');
INSERT INTO `auth_permission` VALUES ('38', 'Can change permission', 'change_permission', '10');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete permission', 'delete_permission', '10');
INSERT INTO `auth_permission` VALUES ('40', 'Can view permission', 'view_permission', '10');
INSERT INTO `auth_permission` VALUES ('41', 'Can add image recognition sequene', 'add_imagerecognitionsequene', '11');
INSERT INTO `auth_permission` VALUES ('42', 'Can change image recognition sequene', 'change_imagerecognitionsequene', '11');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete image recognition sequene', 'delete_imagerecognitionsequene', '11');
INSERT INTO `auth_permission` VALUES ('44', 'Can view image recognition sequene', 'view_imagerecognitionsequene', '11');
INSERT INTO `auth_permission` VALUES ('45', 'Can add synset words', 'add_synsetwords', '12');
INSERT INTO `auth_permission` VALUES ('46', 'Can change synset words', 'change_synsetwords', '12');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete synset words', 'delete_synsetwords', '12');
INSERT INTO `auth_permission` VALUES ('48', 'Can view synset words', 'view_synsetwords', '12');

-- ----------------------------
-- Table structure for `basic_image`
-- ----------------------------
DROP TABLE IF EXISTS `basic_image`;
CREATE TABLE `basic_image` (
  `image_id` int(10) NOT NULL AUTO_INCREMENT,
  `upload_time` datetime NOT NULL,
  `recognized_time` datetime NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `recognized` varchar(512) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `content_type` varchar(32) DEFAULT NULL,
  `file_size` int(10) NOT NULL,
  `remote_ip` char(39) DEFAULT NULL,
  `user_label` varchar(1023) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `file_path` (`file_path`),
  KEY `basic_image_user_id_ca772a13` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `basic_imagerecognitionsequene`
-- ----------------------------
DROP TABLE IF EXISTS `basic_imagerecognitionsequene`;
CREATE TABLE `basic_imagerecognitionsequene` (
  `sequene_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(254) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`sequene_id`),
  UNIQUE KEY `file_name` (`file_name`),
  KEY `basic_imagerecogniti_image_id_b701395f_fk_basic_ima` (`image_id`),
  CONSTRAINT `basic_imagerecogniti_image_id_b701395f_fk_basic_ima` FOREIGN KEY (`image_id`) REFERENCES `basic_image` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_imagerecognitionsequene
-- ----------------------------

-- ----------------------------
-- Table structure for `basic_internalmessage`
-- ----------------------------
DROP TABLE IF EXISTS `basic_internalmessage`;
CREATE TABLE `basic_internalmessage` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `to_user_id` int(10) unsigned NOT NULL,
  `send_time` datetime NOT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `message_title` varchar(255) NOT NULL,
  `message_body` varchar(1024) NOT NULL,
  `from_user_id` int(10) NOT NULL,
  `group_id` int(10) DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `basic_internalmessage_from_user_id_2efebb54` (`from_user_id`),
  KEY `basic_internalmessage_group_id_21f077cd` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `basic_loginrecord`
-- ----------------------------
DROP TABLE IF EXISTS `basic_loginrecord`;
CREATE TABLE `basic_loginrecord` (
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `login_time` datetime NOT NULL,
  `login_ip` char(39) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `basic_loginrecord_user_id_25d3031c` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `basic_synsetwords`
-- ----------------------------
DROP TABLE IF EXISTS `basic_synsetwords`;
CREATE TABLE `basic_synsetwords` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_key` varchar(16) NOT NULL,
  `label` varchar(512) NOT NULL,
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `basic_synsetwords_serial_key_3ec8bc31_uniq` (`serial_key`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_synsetwords
-- ----------------------------
INSERT INTO `basic_synsetwords` VALUES ('1', 'n01440764', '{\'tench\': \'丁鲷\', \'Tinca tinca\': \'丁鱥\'}');
INSERT INTO `basic_synsetwords` VALUES ('2', 'n01443537', '{\'goldfish\': \'金鱼\', \'Carassius auratus\': \'鲫鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('3', 'n01484850', '{\'great white shark\': \'大白鲨\', \'white shark\': \'白鲨\', \'man-eater\': \'食人者\', \'man-eating shark\': \'食人鲨\', \'Carcharodon carcharias\': \'大白鲨\'}');
INSERT INTO `basic_synsetwords` VALUES ('4', 'n01491361', '{\'tiger shark\': \'虎鲨\', \'Galeocerdo cuvieri\': \'鼬鲨\'}');
INSERT INTO `basic_synsetwords` VALUES ('5', 'n01494475', '{\'hammerhead\': \'锤头\', \'hammerhead shark\': \'锤头鲨\'}');
INSERT INTO `basic_synsetwords` VALUES ('6', 'n01496331', '{\'electric ray\': \'电射线\', \'crampfish\': \'螯虾\', \'numbfish\': \'电鳗\', \'torpedo\': \'鱼雷\'}');
INSERT INTO `basic_synsetwords` VALUES ('7', 'n01498041', '{\'stingray\': \'黄貂鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('8', 'n01514668', '{\'cock\': \'公鸡\'}');
INSERT INTO `basic_synsetwords` VALUES ('9', 'n01514859', '{\'hen\': \'母鸡\'}');
INSERT INTO `basic_synsetwords` VALUES ('10', 'n01518878', '{\'ostrich\': \'鸵鸟\', \'Struthio camelus\': \'非洲鸵鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('11', 'n01530575', '{\'brambling\': \'燕雀花鸡\', \'Fringilla montifringilla\': \'燕雀\'}');
INSERT INTO `basic_synsetwords` VALUES ('12', 'n01531178', '{\'goldfinch\': \'金翅雀\', \'Carduelis carduelis\': \'红额金翅雀\'}');
INSERT INTO `basic_synsetwords` VALUES ('13', 'n01532829', '{\'house finch\': \'家朱雀\', \'linnet\': \'红雀\', \'Carpodacus mexicanus\': \'家朱雀\'}');
INSERT INTO `basic_synsetwords` VALUES ('14', 'n01534433', '{\'junco\': \'灯芯草雀\', \'snowbird\': \'雪鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('15', 'n01537544', '{\'indigo bunting\': \'蓝鹀\', \'indigo finch\': \'靛蓝雀\', \'indigo bird\': \'靛蓝鸟\', \'Passerina cyanea\': \'紫云雀\'}');
INSERT INTO `basic_synsetwords` VALUES ('16', 'n01558993', '{\'robin\': \'鸫\', \'American robin\': \'美洲知更鸟\', \'Turdus migratorius\': \'旅鸫\'}');
INSERT INTO `basic_synsetwords` VALUES ('17', 'n01560419', '{\'bulbul\': \'夜莺\'}');
INSERT INTO `basic_synsetwords` VALUES ('18', 'n01580077', '{\'jay\': \'松鸦\'}');
INSERT INTO `basic_synsetwords` VALUES ('19', 'n01582220', '{\'magpie\': \'喜鹊\'}');
INSERT INTO `basic_synsetwords` VALUES ('20', 'n01592084', '{\'chickadee\': \'山雀\'}');
INSERT INTO `basic_synsetwords` VALUES ('21', 'n01601694', '{\'water ouzel\': \'黑鸫\', \'dipper\': \'河鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('22', 'n01608432', '{\'kite\': \'风筝\'}');
INSERT INTO `basic_synsetwords` VALUES ('23', 'n01614925', '{\'bald eagle\': \'秃鹰\', \'American eagle\': \'美国鹰\', \'Haliaeetus leucocephalus\': \'白头海雕\'}');
INSERT INTO `basic_synsetwords` VALUES ('24', 'n01616318', '{\'vulture\': \'秃鹫\'}');
INSERT INTO `basic_synsetwords` VALUES ('25', 'n01622779', '{\'great grey owl\': \'乌林鸮\', \'great gray owl\': \'大灰猫头鹰\', \'Strix nebulosa\': \'乌林鸮\'}');
INSERT INTO `basic_synsetwords` VALUES ('26', 'n01629819', '{\'European fire salamander\': \'欧洲火蜥蜴\', \'Salamandra salamandra\': \'火蝾螈\'}');
INSERT INTO `basic_synsetwords` VALUES ('27', 'n01630670', '{\'common newt\': \'普通蝾螈\', \'Triturus vulgaris\': \'普通三棱\'}');
INSERT INTO `basic_synsetwords` VALUES ('28', 'n01631663', '{\'eft\': \'EFT\'}');
INSERT INTO `basic_synsetwords` VALUES ('29', 'n01632458', '{\'spotted salamander\': \'斑点蝾螈\', \'Ambystoma maculatum\': \'斑点钝口螈\'}');
INSERT INTO `basic_synsetwords` VALUES ('30', 'n01632777', '{\'axolotl\': \'蝾螈\', \'mud puppy\': \'泥狗\', \'Ambystoma mexicanum\': \'墨西哥螈\'}');
INSERT INTO `basic_synsetwords` VALUES ('31', 'n01641577', '{\'bullfrog\': \'牛蛙\', \'Rana catesbeiana\': \'牛蛙\'}');
INSERT INTO `basic_synsetwords` VALUES ('32', 'n01644373', '{\'tree frog\': \'树蛙\', \'tree-frog\': \'树蛙\'}');
INSERT INTO `basic_synsetwords` VALUES ('33', 'n01644900', '{\'tailed frog\': \'尾蛙\', \'bell toad\': \'蝙蝠蟾蜍\', \'ribbed toad\': \'棱蛤蟆\', \'tailed toad\': \'尾蟾蜍\', \'Ascaphus trui\': \'尾蟾铃蟾\'}');
INSERT INTO `basic_synsetwords` VALUES ('34', 'n01664065', '{\'loggerhead\': \'乌龟\', \'loggerhead turtle\': \'乌龟\', \'Caretta caretta\': \'红海龟\'}');
INSERT INTO `basic_synsetwords` VALUES ('35', 'n01665541', '{\'leatherback turtle\': \'棱皮龟\', \'leatherback\': \'棱皮龟\', \'leathery turtle\': \'革龟\', \'Dermochelys coriacea\': \'皮毛龟\'}');
INSERT INTO `basic_synsetwords` VALUES ('36', 'n01667114', '{\'mud turtle\': \'泥龟\'}');
INSERT INTO `basic_synsetwords` VALUES ('37', 'n01667778', '{\'terrapin\': \'鳖\'}');
INSERT INTO `basic_synsetwords` VALUES ('38', 'n01669191', '{\'box turtle\': \'箱龟\', \'box tortoise\': \'箱龟\'}');
INSERT INTO `basic_synsetwords` VALUES ('39', 'n01675722', '{\'banded gecko\': \'条纹壁虎\'}');
INSERT INTO `basic_synsetwords` VALUES ('40', 'n01677366', '{\'common iguana\': \'普通鬣蜥\', \'iguana\': \'鬣蜥\', \'Iguana iguana\': \'绿鬣蜥\'}');
INSERT INTO `basic_synsetwords` VALUES ('41', 'n01682714', '{\'American chameleon\': \'美国变色龙\', \'anole\': \'变色龙\', \'Anolis carolinensis\': \'安乐蜥\'}');
INSERT INTO `basic_synsetwords` VALUES ('42', 'n01685808', '{\'whiptail\': \'鞭梢\', \'whiptail lizard\': \'鞭尾蜥蜴\'}');
INSERT INTO `basic_synsetwords` VALUES ('43', 'n01687978', '{\'agama\': \'飞蜥\'}');
INSERT INTO `basic_synsetwords` VALUES ('44', 'n01688243', '{\'frilled lizard\': \'皱褶蜥蜴\', \'Chlamydosaurus kingi\': \'斗篷蜥\'}');
INSERT INTO `basic_synsetwords` VALUES ('45', 'n01689811', '{\'alligator lizard\': \'鳄鱼蜥蜴\'}');
INSERT INTO `basic_synsetwords` VALUES ('46', 'n01692333', '{\'Gila monster\': \'吉拉毒蜥\', \'Heloderma suspectum\': \'钩虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('47', 'n01693334', '{\'green lizard\': \'绿蜥蜴\', \'Lacerta viridis\': \'绿色蜥蜴\'}');
INSERT INTO `basic_synsetwords` VALUES ('48', 'n01694178', '{\'African chameleon\': \'非洲变色龙\', \'Chamaeleo chamaeleon\': \'变色蜥蜴\'}');
INSERT INTO `basic_synsetwords` VALUES ('49', 'n01695060', '{\'Komodo dragon\': \'科摩多巨龙\', \'Komodo lizard\': \'科莫多蜥蜴\', \'dragon lizard\': \'龙蜥蜴\', \'giant lizard\': \'巨型蜥蜴\', \'Varanus komodoensis\': \'科摩多巨蜥\'}');
INSERT INTO `basic_synsetwords` VALUES ('50', 'n01697457', '{\'African crocodile\': \'非洲鳄鱼\', \'Nile crocodile\': \'尼罗鳄\', \'Crocodylus niloticus\': \'尼罗鳄\'}');
INSERT INTO `basic_synsetwords` VALUES ('51', 'n01698640', '{\'American alligator\': \'美洲短吻鳄\', \'Alligator mississipiensis\': \'密西西比扬子鳄\'}');
INSERT INTO `basic_synsetwords` VALUES ('52', 'n01704323', '{\'triceratops\': \'三角恐龙\'}');
INSERT INTO `basic_synsetwords` VALUES ('53', 'n01728572', '{\'thunder snake\': \'雷蛇\', \'worm snake\': \'蠕虫蛇\', \'Carphophis amoenus\': \'绵蚜\'}');
INSERT INTO `basic_synsetwords` VALUES ('54', 'n01728920', '{\'ringneck snake\': \'环颈蛇\', \'ring-necked snake\': \'环颈蛇\', \'ring snake\': \'环蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('55', 'n01729322', '{\'hognose snake\': \'猪鼻蛇\', \'puff adder\': \'喷吹式加法器\', \'sand viper\': \'沙蝰\'}');
INSERT INTO `basic_synsetwords` VALUES ('56', 'n01729977', '{\'green snake\': \'绿蛇\', \'grass snake\': \'草蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('57', 'n01734418', '{\'king snake\': \'王蛇\', \'kingsnake\': \'王蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('58', 'n01735189', '{\'garter snake\': \'吊袜带蛇\', \'grass snake\': \'草蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('59', 'n01737021', '{\'water snake\': \'水蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('60', 'n01739381', '{\'vine snake\': \'藤蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('61', 'n01740131', '{\'night snake\': \'夜蛇\', \'Hypsiglena torquata\': \'夜蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('62', 'n01742172', '{\'boa constrictor\': \'蟒蛇\', \'Constrictor constrictor\': \'巨蟒\'}');
INSERT INTO `basic_synsetwords` VALUES ('63', 'n01744401', '{\'rock python\': \'岩蟒\', \'rock snake\': \'岩蛇\', \'Python sebae\': \'非洲岩蟒\'}');
INSERT INTO `basic_synsetwords` VALUES ('64', 'n01748264', '{\'Indian cobra\': \'印度眼镜蛇\', \'Naja naja\': \'印度眼镜蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('65', 'n01749939', '{\'green mamba\': \'曼巴蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('66', 'n01751748', '{\'sea snake\': \'海蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('67', 'n01753488', '{\'horned viper\': \'角蝰蛇\', \'cerastes\': \'角蝰属\', \'sand viper\': \'沙蝰\', \'horned asp\': \'长角蛇\', \'Cerastes cornutus\': \'角蝰\'}');
INSERT INTO `basic_synsetwords` VALUES ('68', 'n01755581', '{\'diamondback\': \'小菜蛾\', \'diamondback rattlesnake\': \'小菜蛾响尾蛇\', \'Crotalus adamanteus\': \'东部菱斑响尾蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('69', 'n01756291', '{\'sidewinder\': \'响尾蛇\', \'horned rattlesnake\': \'角响尾蛇\', \'Crotalus cerastes\': \'角响尾蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('70', 'n01768244', '{\'trilobite\': \'三叶虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('71', 'n01770081', '{\'harvestman\': \'盲蜘蛛\', \'daddy longlegs\': \'长脚蛛\', \'Phalangium opilio\': \'盲蜘蛛\'}');
INSERT INTO `basic_synsetwords` VALUES ('72', 'n01770393', '{\'scorpion\': \'蝎子\'}');
INSERT INTO `basic_synsetwords` VALUES ('73', 'n01773157', '{\'black and gold garden spider\': \'黑金色花园蜘蛛\', \'Argiope aurantia\': \'黑和黄色花园蜘蛛\'}');
INSERT INTO `basic_synsetwords` VALUES ('74', 'n01773549', '{\'barn spider\': \'谷仓蜘蛛\', \'Araneus cavaticus\': \'洞穴蜘蛛\'}');
INSERT INTO `basic_synsetwords` VALUES ('75', 'n01773797', '{\'garden spider\': \'园丁蜘蛛\', \'Aranea diademata\': \'蜘蛛目\'}');
INSERT INTO `basic_synsetwords` VALUES ('76', 'n01774384', '{\'black widow\': \'黑寡妇\', \'Latrodectus mactans\': \'红斑寇蛛\'}');
INSERT INTO `basic_synsetwords` VALUES ('77', 'n01774750', '{\'tarantula\': \'狼蛛\'}');
INSERT INTO `basic_synsetwords` VALUES ('78', 'n01775062', '{\'wolf spider\': \'狼蛛\', \'hunting spider\': \'猎蜘蛛\'}');
INSERT INTO `basic_synsetwords` VALUES ('79', 'n01776313', '{\'tick\': \'壁虱\'}');
INSERT INTO `basic_synsetwords` VALUES ('80', 'n01784675', '{\'centipede\': \'蜈蚣\'}');
INSERT INTO `basic_synsetwords` VALUES ('81', 'n01795545', '{\'black grouse\': \'黑松鸡\'}');
INSERT INTO `basic_synsetwords` VALUES ('82', 'n01796340', '{\'ptarmigan\': \'松鸡\'}');
INSERT INTO `basic_synsetwords` VALUES ('83', 'n01797886', '{\'ruffed grouse\': \'皱褶松鸡\', \'partridge\': \'鹧鸪\', \'Bonasa umbellus\': \'披肩榛鸡\'}');
INSERT INTO `basic_synsetwords` VALUES ('84', 'n01798484', '{\'prairie chicken\': \'草原鸡\', \'prairie grouse\': \'草原松鸡\', \'prairie fowl\': \'草原鸡\'}');
INSERT INTO `basic_synsetwords` VALUES ('85', 'n01806143', '{\'peacock\': \'孔雀\'}');
INSERT INTO `basic_synsetwords` VALUES ('86', 'n01806567', '{\'quail\': \'鹌鹑\'}');
INSERT INTO `basic_synsetwords` VALUES ('87', 'n01807496', '{\'partridge\': \'鹧鸪\'}');
INSERT INTO `basic_synsetwords` VALUES ('88', 'n01817953', '{\'African grey\': \'非洲灰\', \'African gray\': \'非洲灰\', \'Psittacus erithacus\': \'非洲灰鹦鹉\'}');
INSERT INTO `basic_synsetwords` VALUES ('89', 'n01818515', '{\'macaw\': \'金刚鹦鹉\'}');
INSERT INTO `basic_synsetwords` VALUES ('90', 'n01819313', '{\'sulphur-crested cockatoo\': \'葵花鹦鹉\', \'Kakatoe galerita\': \'葵花鹦鹉\', \'Cacatua galerita\': \'葵花凤头鹦鹉\'}');
INSERT INTO `basic_synsetwords` VALUES ('91', 'n01820546', '{\'lorikeet\': \'吸蜜鹦鹉\'}');
INSERT INTO `basic_synsetwords` VALUES ('92', 'n01824575', '{\'coucal\': \'褐翅鸦鹃\'}');
INSERT INTO `basic_synsetwords` VALUES ('93', 'n01828970', '{\'bee eater\': \'食蜂者\'}');
INSERT INTO `basic_synsetwords` VALUES ('94', 'n01829413', '{\'hornbill\': \'犀鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('95', 'n01833805', '{\'hummingbird\': \'蜂鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('96', 'n01843065', '{\'jacamar\': \'鹟鴷\'}');
INSERT INTO `basic_synsetwords` VALUES ('97', 'n01843383', '{\'toucan\': \'巨嘴鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('98', 'n01847000', '{\'drake\': \'公鸭\'}');
INSERT INTO `basic_synsetwords` VALUES ('99', 'n01855032', '{\'red-breasted merganser\': \'红胸秋沙鸭\', \'Mergus serrator\': \'红胸秋沙鸭\'}');
INSERT INTO `basic_synsetwords` VALUES ('100', 'n01855672', '{\'goose\': \'鹅\'}');
INSERT INTO `basic_synsetwords` VALUES ('101', 'n01860187', '{\'black swan\': \'黑天鹅\', \'Cygnus atratus\': \'黑天鹅\'}');
INSERT INTO `basic_synsetwords` VALUES ('102', 'n01871265', '{\'tusker\': \'有长牙的动物\'}');
INSERT INTO `basic_synsetwords` VALUES ('103', 'n01872401', '{\'echidna\': \'针鼹\', \'spiny anteater\': \'刺蚁\', \'anteater\': \'食蚁兽\'}');
INSERT INTO `basic_synsetwords` VALUES ('104', 'n01873310', '{\'platypus\': \'鸭嘴兽属\', \'duckbill\': \'鸭嘴\', \'duckbilled platypus\': \'鸭嘴兽\', \'duck-billed platypus\': \'鸭嘴兽\', \'Ornithorhynchus anatinus\': \'鸭嘴兽\'}');
INSERT INTO `basic_synsetwords` VALUES ('105', 'n01877812', '{\'wallaby\': \'袋鼠\', \'brush kangaroo\': \'刷牙袋鼠\'}');
INSERT INTO `basic_synsetwords` VALUES ('106', 'n01882714', '{\'koala\': \'考拉\', \'koala bear\': \'考拉熊\', \'kangaroo bear\': \'袋鼠熊\', \'native bear\': \'本地熊\', \'Phascolarctos cinereus\': \'树袋熊\'}');
INSERT INTO `basic_synsetwords` VALUES ('107', 'n01883070', '{\'wombat\': \'袋熊\'}');
INSERT INTO `basic_synsetwords` VALUES ('108', 'n01910747', '{\'jellyfish\': \'海蜇\'}');
INSERT INTO `basic_synsetwords` VALUES ('109', 'n01914609', '{\'sea anemone\': \'海葵\', \'anemone\': \'银莲花\'}');
INSERT INTO `basic_synsetwords` VALUES ('110', 'n01917289', '{\'brain coral\': \'脑珊瑚\'}');
INSERT INTO `basic_synsetwords` VALUES ('111', 'n01924916', '{\'flatworm\': \'扁虫\', \'platyhelminth\': \'扁蠕虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('112', 'n01930112', '{\'nematode\': \'线虫\', \'nematode worm\': \'已知线虫\', \'roundworm\': \'蛔虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('113', 'n01943899', '{\'conch\': \'海螺\'}');
INSERT INTO `basic_synsetwords` VALUES ('114', 'n01944390', '{\'snail\': \'蜗牛\'}');
INSERT INTO `basic_synsetwords` VALUES ('115', 'n01945685', '{\'slug\': \'蛞蝓\'}');
INSERT INTO `basic_synsetwords` VALUES ('116', 'n01950731', '{\'sea slug\': \'海蛞蝓\', \'nudibranch\': \'裸鳃类\'}');
INSERT INTO `basic_synsetwords` VALUES ('117', 'n01955084', '{\'chiton\': \'甲壳质\', \'coat-of-mail shell\': \'贝壳\', \'sea cradle\': \'海洋摇篮\', \'polyplacophore\': \'多孢器\'}');
INSERT INTO `basic_synsetwords` VALUES ('118', 'n01968897', '{\'chambered nautilus\': \'珍珠鹦鹉螺\', \'pearly nautilus\': \'珍珠鹦鹉螺\', \'nautilus\': \'鹦鹉螺\'}');
INSERT INTO `basic_synsetwords` VALUES ('119', 'n01978287', '{\'Dungeness crab\': \'蟹爪蟹\', \'Cancer magister\': \'首长黄道蟹\'}');
INSERT INTO `basic_synsetwords` VALUES ('120', 'n01978455', '{\'rock crab\': \'岩蟹\', \'Cancer irroratus\': \'斑纹黄道蟹\'}');
INSERT INTO `basic_synsetwords` VALUES ('121', 'n01980166', '{\'fiddler crab\': \'招潮蟹\'}');
INSERT INTO `basic_synsetwords` VALUES ('122', 'n01981276', '{\'king crab\': \'帝王蟹\', \'Alaska crab\': \'阿拉斯加蟹\', \'Alaskan king crab\': \'阿拉斯加王蟹\', \'Alaska king crab\': \'阿拉斯加皇帝蟹\', \'Paralithodes camtschatica\': \'堪察加拟石蟹\'}');
INSERT INTO `basic_synsetwords` VALUES ('123', 'n01983481', '{\'American lobster\': \'美洲龙虾\', \'Northern lobster\': \'北方龙虾\', \'Maine lobster\': \'缅因大龙虾\', \'Homarus americanus\': \'美洲螯龙虾\'}');
INSERT INTO `basic_synsetwords` VALUES ('124', 'n01984695', '{\'spiny lobster\': \'龙虾\', \'langouste\': \'兰古斯特\', \'rock lobster\': \'岩龙虾\', \'crawfish\': \'小龙虾\', \'crayfish\': \'小龙虾\', \'sea crawfish\': \'海鲶\'}');
INSERT INTO `basic_synsetwords` VALUES ('125', 'n01985128', '{\'crayfish\': \'小龙虾\', \'crawfish\': \'小龙虾\', \'crawdad\': \'克劳德\', \'crawdaddy\': \'爬虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('126', 'n01986214', '{\'hermit crab\': \'寄居蟹\'}');
INSERT INTO `basic_synsetwords` VALUES ('127', 'n01990800', '{\'isopod\': \'等足类动物\'}');
INSERT INTO `basic_synsetwords` VALUES ('128', 'n02002556', '{\'white stork\': \'白鹳\', \'Ciconia ciconia\': \'花冠鹳\'}');
INSERT INTO `basic_synsetwords` VALUES ('129', 'n02002724', '{\'black stork\': \'黑鹳\', \'Ciconia nigra\': \'黑鹳\'}');
INSERT INTO `basic_synsetwords` VALUES ('130', 'n02006656', '{\'spoonbill\': \'琵鹭\'}');
INSERT INTO `basic_synsetwords` VALUES ('131', 'n02007558', '{\'flamingo\': \'火烈鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('132', 'n02009229', '{\'little blue heron\': \'小蓝鹭\', \'Egretta caerulea\': \'白鹭\'}');
INSERT INTO `basic_synsetwords` VALUES ('133', 'n02009912', '{\'American egret\': \'美洲白鹭\', \'great white heron\': \'大白鹭\', \'Egretta albus\': \'白鹭\'}');
INSERT INTO `basic_synsetwords` VALUES ('134', 'n02011460', '{\'bittern\': \'麻鸦\'}');
INSERT INTO `basic_synsetwords` VALUES ('135', 'n02012849', '{\'crane\': \'鹤\'}');
INSERT INTO `basic_synsetwords` VALUES ('136', 'n02013706', '{\'limpkin\': \'秧鹤\', \'Aramus pictus\': \'Aramus皮克斯\'}');
INSERT INTO `basic_synsetwords` VALUES ('137', 'n02017213', '{\'European gallinule\': \'欧洲鸡\', \'Porphyrio porphyrio\': \'紫水鸡\'}');
INSERT INTO `basic_synsetwords` VALUES ('138', 'n02018207', '{\'American coot\': \'水鸡\', \'marsh hen\': \'沼泽母鸡\', \'mud hen\': \'泥母鸡\', \'water hen\': \'水母鸡\', \'Fulica americana\': \'美洲骨顶\'}');
INSERT INTO `basic_synsetwords` VALUES ('139', 'n02018795', '{\'bustard\': \'鸨\'}');
INSERT INTO `basic_synsetwords` VALUES ('140', 'n02025239', '{\'ruddy turnstone\': \'红石轮\', \'Arenaria interpres\': \'翻石鹬\'}');
INSERT INTO `basic_synsetwords` VALUES ('141', 'n02027492', '{\'red-backed sandpiper\': \'红背矶鹬\', \'dunlin\': \'邓林\', \'Erolia alpina\': \'高山紫罗兰\'}');
INSERT INTO `basic_synsetwords` VALUES ('142', 'n02028035', '{\'redshank\': \'红脚鹬\', \'Tringa totanus\': \'红脚鹬\'}');
INSERT INTO `basic_synsetwords` VALUES ('143', 'n02033041', '{\'dowitcher\': \'长嘴半蹼鹬\'}');
INSERT INTO `basic_synsetwords` VALUES ('144', 'n02037110', '{\'oystercatcher\': \'牡蛎捕集器\', \'oyster catcher\': \'牡蛎捕集器\'}');
INSERT INTO `basic_synsetwords` VALUES ('145', 'n02051845', '{\'pelican\': \'鹈鹕\'}');
INSERT INTO `basic_synsetwords` VALUES ('146', 'n02056570', '{\'king penguin\': \'帝王企鹅\', \'Aptenodytes patagonica\': \'帕塔哥尼亚种\'}');
INSERT INTO `basic_synsetwords` VALUES ('147', 'n02058221', '{\'albatross\': \'信天翁\', \'mollymawk\': \'大海鸟\'}');
INSERT INTO `basic_synsetwords` VALUES ('148', 'n02066245', '{\'grey whale\': \'灰鲸\', \'gray whale\': \'灰鲸\', \'devilfish\': \'魔鬼鱼\', \'Eschrichtius gibbosus\': \'灰鲸\', \'Eschrichtius robustus\': \'灰鲸\'}');
INSERT INTO `basic_synsetwords` VALUES ('149', 'n02071294', '{\'killer whale\': \'虎鲸\', \'killer\': \'杀手\', \'orca\': \'虎鲸\', \'grampus\': \'灰海豚虎鲸\', \'sea wolf\': \'海狼\', \'Orcinus orca\': \'虎鲸\'}');
INSERT INTO `basic_synsetwords` VALUES ('150', 'n02074367', '{\'dugong\': \'儒艮海牛美人鱼\', \'Dugong dugon\': \'儒艮\'}');
INSERT INTO `basic_synsetwords` VALUES ('151', 'n02077923', '{\'sea lion\': \'海狮\'}');
INSERT INTO `basic_synsetwords` VALUES ('152', 'n02085620', '{\'Chihuahua\': \'奇瓦瓦狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('153', 'n02085782', '{\'Japanese spaniel\': \'日本猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('154', 'n02085936', '{\'Maltese dog\': \'马尔他犬\', \'Maltese terrier\': \'马耳他梗\', \'Maltese\': \'马尔他的\'}');
INSERT INTO `basic_synsetwords` VALUES ('155', 'n02086079', '{\'Pekinese\': \'北京人\', \'Pekingese\': \'北京犬\', \'Peke\': \'皮克\'}');
INSERT INTO `basic_synsetwords` VALUES ('156', 'n02086240', '{\'Shih-Tzu\': \'石子\'}');
INSERT INTO `basic_synsetwords` VALUES ('157', 'n02086646', '{\'Blenheim spaniel\': \'布莱尼姆猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('158', 'n02086910', '{\'papillon\': \'蝴蝶犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('159', 'n02087046', '{\'toy terrier\': \'曼彻斯特玩具梗,玩具梗\'}');
INSERT INTO `basic_synsetwords` VALUES ('160', 'n02087394', '{\'Rhodesian ridgeback\': \'罗得西亚脊背犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('161', 'n02088094', '{\'Afghan hound\': \'阿富汗猎犬\', \'Afghan\': \'阿富汗\'}');
INSERT INTO `basic_synsetwords` VALUES ('162', 'n02088238', '{\'basset\': \'巴塞特\', \'basset hound\': \'巴塞特猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('163', 'n02088364', '{\'beagle\': \'比格犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('164', 'n02088466', '{\'bloodhound\': \'猎犬\', \'sleuthhound\': \'猎猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('165', 'n02088632', '{\'bluetick\': \'蓝宝石\'}');
INSERT INTO `basic_synsetwords` VALUES ('166', 'n02089078', '{\'black-and-tan coonhound\': \'黑棕猎浣熊犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('167', 'n02089867', '{\'Walker hound\': \'沃克猎犬\', \'Walker foxhound\': \'沃克猎狐犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('168', 'n02089973', '{\'English foxhound\': \'英国猎狐犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('169', 'n02090379', '{\'redbone\': \'红骨\'}');
INSERT INTO `basic_synsetwords` VALUES ('170', 'n02090622', '{\'borzoi\': \'猎狼\', \'Russian wolfhound\': \'俄罗斯猎狼犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('171', 'n02090721', '{\'Irish wolfhound\': \'爱尔兰猎狼犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('172', 'n02091032', '{\'Italian greyhound\': \'意大利灵缇灰狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('173', 'n02091134', '{\'whippet\': \'小灵狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('174', 'n02091244', '{\'Ibizan hound\': \'伊比赞猎犬\', \'Ibizan Podenco\': \'伊比桑波登科\'}');
INSERT INTO `basic_synsetwords` VALUES ('175', 'n02091467', '{\'Norwegian elkhound\': \'挪威猎鹿犬\', \'elkhound\': \'猎鹿犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('176', 'n02091635', '{\'otterhound\': \'奥达猎犬\', \'otter hound\': \'水獭猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('177', 'n02091831', '{\'Saluki\': \'萨卢基\', \'gazelle hound\': \'瞪羚猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('178', 'n02092002', '{\'Scottish deerhound\': \'苏格兰猎鹿犬\', \'deerhound\': \'猎鹿犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('179', 'n02092339', '{\'Weimaraner\': \'魏玛猎头\'}');
INSERT INTO `basic_synsetwords` VALUES ('180', 'n02093256', '{\'Staffordshire bullterrier\': \'斯塔福德郡斗牛犬\', \'Staffordshire bull terrier\': \'斯塔福德郡斗牛犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('181', 'n02093428', '{\'American Staffordshire terrier\': \'美国斯塔福德郡梗\', \'Staffordshire terrier\': \'斯塔福德郡梗\', \'American pit bull terrier\': \'美国斗牛犬\', \'pit bull terrier\': \'斗牛犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('182', 'n02093647', '{\'Bedlington terrier\': \'贝德灵顿梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('183', 'n02093754', '{\'Border terrier\': \'边境猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('184', 'n02093859', '{\'Kerry blue terrier\': \'凯丽蓝梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('185', 'n02093991', '{\'Irish terrier\': \'爱尔兰梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('186', 'n02094114', '{\'Norfolk terrier\': \'诺福克梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('187', 'n02094258', '{\'Norwich terrier\': \'诺维奇梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('188', 'n02094433', '{\'Yorkshire terrier\': \'约克郡梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('189', 'n02095314', '{\'wire-haired fox terrier\': \'丝毛猎狐犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('190', 'n02095570', '{\'Lakeland terrier\': \'莱克兰梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('191', 'n02095889', '{\'Sealyham terrier\': \'塞利厄姆梗类犬\', \'Sealyham\': \'塞利厄姆\'}');
INSERT INTO `basic_synsetwords` VALUES ('192', 'n02096051', '{\'Airedale\': \'艾尔代尔\', \'Airedale terrier\': \'艾德莱尔梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('193', 'n02096177', '{\'cairn\': \'凯恩\', \'cairn terrier\': \'凯恩梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('194', 'n02096294', '{\'Australian terrier\': \'澳大利亚梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('195', 'n02096437', '{\'Dandie Dinmont\': \'丹迪迪蒙特\', \'Dandie Dinmont terrier\': \'丹迪迪蒙特梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('196', 'n02096585', '{\'Boston bull\': \'波士顿公牛\', \'Boston terrier\': \'波士顿梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('197', 'n02097047', '{\'miniature schnauzer\': \'迷你雪纳瑞\'}');
INSERT INTO `basic_synsetwords` VALUES ('198', 'n02097130', '{\'giant schnauzer\': \'巨型雪纳瑞\'}');
INSERT INTO `basic_synsetwords` VALUES ('199', 'n02097209', '{\'standard schnauzer\': \'标准雪纳瑞\'}');
INSERT INTO `basic_synsetwords` VALUES ('200', 'n02097298', '{\'Scotch terrier\': \'苏格兰猎犬\', \'Scottish terrier\': \'苏格兰猎犬\', \'Scottie\': \'斯科蒂\'}');
INSERT INTO `basic_synsetwords` VALUES ('201', 'n02097474', '{\'Tibetan terrier\': \'西藏梗类犬\', \'chrysanthemum dog\': \'菊花狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('202', 'n02097658', '{\'silky terrier\': \'丝毛梗\', \'Sydney silky\': \'悉尼丝质\'}');
INSERT INTO `basic_synsetwords` VALUES ('203', 'n02098105', '{\'soft-coated wheaten terrier\': \'软质小麦梗类犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('204', 'n02098286', '{\'West Highland white terrier\': \'西部高地白梗犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('205', 'n02098413', '{\'Lhasa\': \'拉萨\', \'Lhasa apso\': \'拉萨APSO\'}');
INSERT INTO `basic_synsetwords` VALUES ('206', 'n02099267', '{\'flat-coated retriever\': \'扁皮猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('207', 'n02099429', '{\'curly-coated retriever\': \'卷毛寻回犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('208', 'n02099601', '{\'golden retriever\': \'金毛猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('209', 'n02099712', '{\'Labrador retriever\': \'拉布拉多猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('210', 'n02099849', '{\'Chesapeake Bay retriever\': \'切萨皮克湾猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('211', 'n02100236', '{\'German short-haired pointer\': \'德国短毛指针\'}');
INSERT INTO `basic_synsetwords` VALUES ('212', 'n02100583', '{\'vizsla\': \'维兹拉\', \'Hungarian pointer\': \'匈牙利指针\'}');
INSERT INTO `basic_synsetwords` VALUES ('213', 'n02100735', '{\'English setter\': \'英国谍犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('214', 'n02100877', '{\'Irish setter\': \'爱尔兰猎犬\', \'red setter\': \'红色谍犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('215', 'n02101006', '{\'Gordon setter\': \'戈登谍犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('216', 'n02101388', '{\'Brittany spaniel\': \'布列塔尼犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('217', 'n02101556', '{\'clumber\': \'鸣笛者\', \'clumber spaniel\': \'克劳勃猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('218', 'n02102040', '{\'English springer\': \'英国斯普林格\', \'English springer spaniel\': \'英国斯宾格猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('219', 'n02102177', '{\'Welsh springer spaniel\': \'威尔士激飞猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('220', 'n02102318', '{\'cocker spaniel\': \'可卡猎犬\', \'English cocker spaniel\': \'英国可卡犬\', \'cocker\': \'可卡\'}');
INSERT INTO `basic_synsetwords` VALUES ('221', 'n02102480', '{\'Sussex spaniel\': \'萨塞克斯猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('222', 'n02102973', '{\'Irish water spaniel\': \'爱尔兰水猎犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('223', 'n02104029', '{\'kuvasz\': \'白警犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('224', 'n02104365', '{\'schipperke\': \'西伯格犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('225', 'n02105056', '{\'groenendael\': \'格罗安达犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('226', 'n02105162', '{\'malinois\': \'马里努阿犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('227', 'n02105251', '{\'briard\': \'布里犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('228', 'n02105412', '{\'kelpie\': \'澳大利亚卡尔比犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('229', 'n02105505', '{\'komondor\': \'可蒙犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('230', 'n02105641', '{\'Old English sheepdog\': \'古英国牧羊犬\', \'bobtail\': \'短尾\'}');
INSERT INTO `basic_synsetwords` VALUES ('231', 'n02105855', '{\'Shetland sheepdog\': \'设得兰牧羊犬\', \'Shetland sheep dog\': \'设得兰羊犬\', \'Shetland\': \'设得兰群岛犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('232', 'n02106030', '{\'collie\': \'牧羊犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('233', 'n02106166', '{\'Border collie\': \'边境牧羊犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('234', 'n02106382', '{\'Bouvier des Flandres\': \'弗兰德牧羊狗\', \'Bouviers des Flandres\': \'弗兰德斯\'}');
INSERT INTO `basic_synsetwords` VALUES ('235', 'n02106550', '{\'Rottweiler\': \'洛特维勒牧犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('236', 'n02106662', '{\'German shepherd\': \'德国牧羊犬\', \'German shepherd dog\': \'德国牧羊犬\', \'German police dog\': \'德国警犬\', \'alsatian\': \'阿尔萨斯的\'}');
INSERT INTO `basic_synsetwords` VALUES ('237', 'n02107142', '{\'Doberman\': \'杜宾犬\', \'Doberman pinscher\': \'杜宾犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('238', 'n02107312', '{\'miniature pinscher\': \'微型玩具犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('239', 'n02107574', '{\'Greater Swiss Mountain dog\': \'瑞士大山狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('240', 'n02107683', '{\'Bernese mountain dog\': \'伯纳斯山犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('241', 'n02107908', '{\'Appenzeller\': \'阿彭泽勒鸡犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('242', 'n02108000', '{\'EntleBucher\': \'恩特雷布赫牧牛犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('243', 'n02108089', '{\'boxer\': \'拳师犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('244', 'n02108422', '{\'bull mastiff\': \'斗牛獒犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('245', 'n02108551', '{\'Tibetan mastiff\': \'藏獒\'}');
INSERT INTO `basic_synsetwords` VALUES ('246', 'n02108915', '{\'French bulldog\': \'法国斗牛犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('247', 'n02109047', '{\'Great Dane\': \'大丹犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('248', 'n02109525', '{\'Saint Bernard\': \'圣伯纳犬\', \'St Bernard\': \'圣伯纳德\'}');
INSERT INTO `basic_synsetwords` VALUES ('249', 'n02109961', '{\'Eskimo dog\': \'爱斯基摩犬\', \'husky\': \'哈士奇犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('250', 'n02110063', '{\'malamute\': \'雪橇犬\', \'malemute\': \'雪橇犬\', \'Alaskan malamute\': \'阿拉斯加雪橇犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('251', 'n02110185', '{\'Siberian husky\': \'西伯利亚雪橇犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('252', 'n02110341', '{\'dalmatian\': \'达尔马提亚的\', \'coach dog\': \'教练犬\', \'carriage dog\': \'马车狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('253', 'n02110627', '{\'affenpinscher\': \'阿芬皮切尔\', \'monkey pinscher\': \'猴品\', \'monkey dog\': \'猴狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('254', 'n02110806', '{\'basenji\': \'巴仙吉犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('255', 'n02110958', '{\'pug\': \'帕格\', \'pug-dog\': \'帕格狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('256', 'n02111129', '{\'Leonberg\': \'德国莱昂贝格犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('257', 'n02111277', '{\'Newfoundland\': \'纽芬兰岛\', \'Newfoundland dog\': \'纽芬兰犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('258', 'n02111500', '{\'Great Pyrenees\': \'大白熊犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('259', 'n02111889', '{\'Samoyed\': \'萨摩耶犬\', \'Samoyede\': \'撒摩耶的\'}');
INSERT INTO `basic_synsetwords` VALUES ('260', 'n02112018', '{\'Pomeranian\': \'波美拉尼亚犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('261', 'n02112137', '{\'chow\': \'松狮犬\', \'chow chow\': \'松狮犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('262', 'n02112350', '{\'keeshond\': \'荷兰卷尾狮毛狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('263', 'n02112706', '{\'Brabancon griffon\': \'布鲁塞尔格里枫犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('264', 'n02113023', '{\'Pembroke\': \'彭布罗克\', \'Pembroke Welsh corgi\': \'潘布鲁克韦尔斯科基犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('265', 'n02113186', '{\'Cardigan\': \'开衫\', \'Cardigan Welsh corgi\': \'卡迪根威尔士柯基犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('266', 'n02113624', '{\'toy poodle\': \'玩具贵宾犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('267', 'n02113712', '{\'miniature poodle\': \'迷你贵宾犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('268', 'n02113799', '{\'standard poodle\': \'标准贵宾犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('269', 'n02113978', '{\'Mexican hairless\': \'墨西哥无毛犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('270', 'n02114367', '{\'timber wolf\': \'林狼\', \'grey wolf\': \'灰狼\', \'gray wolf\': \'灰狼\', \'Canis lupus\': \'灰狼\'}');
INSERT INTO `basic_synsetwords` VALUES ('271', 'n02114548', '{\'white wolf\': \'白狼\', \'Arctic wolf\': \'极地狼\', \'Canis lupus tundrarum\': \'犬冻疮\'}');
INSERT INTO `basic_synsetwords` VALUES ('272', 'n02114712', '{\'red wolf\': \'红狼\', \'maned wolf\': \'鬃狼\', \'Canis rufus\': \'红狼\', \'Canis niger\': \'尼日尔犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('273', 'n02114855', '{\'coyote\': \'郊狼\', \'prairie wolf\': \'草原狼\', \'brush wolf\': \'刷狼\', \'Canis latrans\': \'拉丁裔犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('274', 'n02115641', '{\'dingo\': \'澳洲野狗\', \'warrigal\': \'军国犬\', \'warragal\': \'瓦拉加尔\', \'Canis dingo\': \'澳大利亚野犬\'}');
INSERT INTO `basic_synsetwords` VALUES ('275', 'n02115913', '{\'dhole\': \'猱犬\', \'Cuon alpinus\': \'豺\'}');
INSERT INTO `basic_synsetwords` VALUES ('276', 'n02116738', '{\'African hunting dog\': \'非洲猎犬\', \'hyena dog\': \'鬣狗\', \'Cape hunting dog\': \'斗篷狗\', \'Lycaon pictus\': \'莱卡翁皮卡\'}');
INSERT INTO `basic_synsetwords` VALUES ('277', 'n02117135', '{\'hyena\': \'鬣狗\', \'hyaena\': \'鬣狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('278', 'n02119022', '{\'red fox\': \'红狐\', \'Vulpes vulpes\': \'狐狐\'}');
INSERT INTO `basic_synsetwords` VALUES ('279', 'n02119789', '{\'kit fox\': \'敏狐\', \'Vulpes macrotis\': \'敏狐\'}');
INSERT INTO `basic_synsetwords` VALUES ('280', 'n02120079', '{\'Arctic fox\': \'北极狐\', \'white fox\': \'白狐\', \'Alopex lagopus\': \'白狐\'}');
INSERT INTO `basic_synsetwords` VALUES ('281', 'n02120505', '{\'grey fox\': \'灰狐\', \'gray fox\': \'灰狐\', \'Urocyon cinereoargenteus\': \'灰狐\'}');
INSERT INTO `basic_synsetwords` VALUES ('282', 'n02123045', '{\'tabby\': \'斑猫\', \'tabby cat\': \'虎斑猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('283', 'n02123159', '{\'tiger cat\': \'虎猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('284', 'n02123394', '{\'Persian cat\': \'波斯猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('285', 'n02123597', '{\'Siamese cat\': \'暹罗猫\', \'Siamese\': \'暹罗猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('286', 'n02124075', '{\'Egyptian cat\': \'埃及猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('287', 'n02125311', '{\'cougar\': \'美洲狮\', \'puma\': \'彪马\', \'catamount\': \'猫科动物\', \'mountain lion\': \'山狮\', \'painter\': \'佛罗里达豹\', \'panther\': \'黑豹\', \'Felis concolor\': \'美洲狮\'}');
INSERT INTO `basic_synsetwords` VALUES ('288', 'n02127052', '{\'lynx\': \'猞猁\', \'catamount\': \'猫科动物\'}');
INSERT INTO `basic_synsetwords` VALUES ('289', 'n02128385', '{\'leopard\': \'豹\', \'Panthera pardus\': \'豹豹\'}');
INSERT INTO `basic_synsetwords` VALUES ('290', 'n02128757', '{\'snow leopard\': \'雪豹\', \'ounce\': \'雪豹\', \'Panthera uncia\': \'雪豹\'}');
INSERT INTO `basic_synsetwords` VALUES ('291', 'n02128925', '{\'jaguar\': \'美洲虎\', \'panther\': \'黑豹\', \'Panthera onca\': \'美洲虎\', \'Felis onca\': \'猫科动物\'}');
INSERT INTO `basic_synsetwords` VALUES ('292', 'n02129165', '{\'lion\': \'狮子\', \'king of beasts\': \'百兽之王\', \'Panthera leo\': \'豹狮\'}');
INSERT INTO `basic_synsetwords` VALUES ('293', 'n02129604', '{\'tiger\': \'老虎\', \'Panthera tigris\': \'虎皮豹\'}');
INSERT INTO `basic_synsetwords` VALUES ('294', 'n02130308', '{\'cheetah\': \'猎豹\', \'chetah\': \'猎豹\', \'Acinonyx jubatus\': \'猎豹\'}');
INSERT INTO `basic_synsetwords` VALUES ('295', 'n02132136', '{\'brown bear\': \'棕熊\', \'bruin\': \'熊\', \'Ursus arctos\': \'棕熊\'}');
INSERT INTO `basic_synsetwords` VALUES ('296', 'n02133161', '{\'American black bear\': \'美国黑熊\', \'black bear\': \'黑熊\', \'Ursus americanus\': \'美国黑熊\', \'Euarctos americanus\': \'美国疣猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('297', 'n02134084', '{\'ice bear\': \'冰熊\', \'polar bear\': \'北极熊\', \'Ursus Maritimus\': \'白熊\', \'Thalarctos maritimus\': \'北极熊\'}');
INSERT INTO `basic_synsetwords` VALUES ('298', 'n02134418', '{\'sloth bear\': \'懒熊\', \'Melursus ursinus\': \'懒熊\', \'Ursus ursinus\': \'懒熊\'}');
INSERT INTO `basic_synsetwords` VALUES ('299', 'n02137549', '{\'mongoose\': \'猫鼬\'}');
INSERT INTO `basic_synsetwords` VALUES ('300', 'n02138441', '{\'meerkat\': \'猫鼬\', \'mierkat\': \'海猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('301', 'n02165105', '{\'tiger beetle\': \'虎甲虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('302', 'n02165456', '{\'ladybug\': \'瓢虫\', \'ladybeetle\': \'瓢虫\', \'lady beetle\': \'瓢虫\', \'ladybird\': \'瓢虫\', \'ladybird beetle\': \'瓢虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('303', 'n02167151', '{\'ground beetle\': \'地甲虫\', \'carabid beetle\': \'步甲虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('304', 'n02168699', '{\'long-horned beetle\': \'长角甲虫\', \'longicorn\': \'长触角甲虫\', \'longicorn beetle\': \'天牛虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('305', 'n02169497', '{\'leaf beetle\': \'叶甲虫\', \'chrysomelid\': \'叶甲类\'}');
INSERT INTO `basic_synsetwords` VALUES ('306', 'n02172182', '{\'dung beetle\': \'粪甲虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('307', 'n02174001', '{\'rhinoceros beetle\': \'犀甲虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('308', 'n02177972', '{\'weevil\': \'象甲\'}');
INSERT INTO `basic_synsetwords` VALUES ('309', 'n02190166', '{\'fly\': \'苍蝇\'}');
INSERT INTO `basic_synsetwords` VALUES ('310', 'n02206856', '{\'bee\': \'蜜蜂\'}');
INSERT INTO `basic_synsetwords` VALUES ('311', 'n02219486', '{\'ant\': \'蚂蚁\', \'emmet\': \'蚂蚁\', \'pismire\': \'蚂蚁\'}');
INSERT INTO `basic_synsetwords` VALUES ('312', 'n02226429', '{\'grasshopper\': \'蚱蜢\', \'hopper\': \'跳虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('313', 'n02229544', '{\'cricket\': \'蟋蟀\'}');
INSERT INTO `basic_synsetwords` VALUES ('314', 'n02231487', '{\'walking stick\': \'竹节虫\', \'walkingstick\': \'竹节虫\', \'stick insect\': \'棒虫\'}');
INSERT INTO `basic_synsetwords` VALUES ('315', 'n02233338', '{\'cockroach\': \'蟑螂\', \'roach\': \'蟑螂\'}');
INSERT INTO `basic_synsetwords` VALUES ('316', 'n02236044', '{\'mantis\': \'螳螂属\', \'mantid\': \'螳螂\'}');
INSERT INTO `basic_synsetwords` VALUES ('317', 'n02256656', '{\'cicada\': \'蝉\', \'cicala\': \'蝉\'}');
INSERT INTO `basic_synsetwords` VALUES ('318', 'n02259212', '{\'leafhopper\': \'叶蝉\'}');
INSERT INTO `basic_synsetwords` VALUES ('319', 'n02264363', '{\'lacewing\': \'草蛉\', \'lacewing fly\': \'蜻蛉蝇\'}');
INSERT INTO `basic_synsetwords` VALUES ('320', 'n02268443', '{\'dragonfly\': \'蜻蜓\', \'darning needle\': \'蜻蜓\', \"devil\'s darning needle\": \'魔鬼蜻蜓\', \'sewing needle\': \'缝纫针\', \'snake feeder\': \'蜻蜓\', \'snake doctor\': \'蜻蜓\', \'mosquito hawk\': \'蚊鹰\', \'skeeter hawk\': \'蚊子\'}');
INSERT INTO `basic_synsetwords` VALUES ('321', 'n02268853', '{\'damselfly\': \'蜻蛉\'}');
INSERT INTO `basic_synsetwords` VALUES ('322', 'n02276258', '{\'admiral\': \'海军上将蛱蝶\'}');
INSERT INTO `basic_synsetwords` VALUES ('323', 'n02277742', '{\'ringlet\': \'小环蝶\', \'ringlet butterfly\': \'小环蝶\'}');
INSERT INTO `basic_synsetwords` VALUES ('324', 'n02279972', '{\'monarch\': \'帝王蝶\', \'monarch butterfly\': \'帝王蝶\', \'milkweed butterfly\': \'马利筋蝶\', \'Danaus plexippus\': \'黑脉金斑蝶\'}');
INSERT INTO `basic_synsetwords` VALUES ('325', 'n02280649', '{\'cabbage butterfly\': \'白菜蝴蝶\'}');
INSERT INTO `basic_synsetwords` VALUES ('326', 'n02281406', '{\'sulphur butterfly\': \'硫磺蝶\', \'sulfur butterfly\': \'硫磺蝶\'}');
INSERT INTO `basic_synsetwords` VALUES ('327', 'n02281787', '{\'lycaenid\': \'狼疮样的\', \'lycaenid butterfly\': \'灰蝶\'}');
INSERT INTO `basic_synsetwords` VALUES ('328', 'n02317335', '{\'starfish\': \'海星\', \'sea star\': \'海星\'}');
INSERT INTO `basic_synsetwords` VALUES ('329', 'n02319095', '{\'sea urchin\': \'海胆\'}');
INSERT INTO `basic_synsetwords` VALUES ('330', 'n02321529', '{\'sea cucumber\': \'海参\', \'holothurian\': \'海参\'}');
INSERT INTO `basic_synsetwords` VALUES ('331', 'n02325366', '{\'wood rabbit\': \'木兔\', \'cottontail\': \'棉尾\', \'cottontail rabbit\': \'棉尾兔\'}');
INSERT INTO `basic_synsetwords` VALUES ('332', 'n02326432', '{\'hare\': \'野兔\'}');
INSERT INTO `basic_synsetwords` VALUES ('333', 'n02328150', '{\'Angora\': \'安哥拉山羊\', \'Angora rabbit\': \'安哥拉兔\'}');
INSERT INTO `basic_synsetwords` VALUES ('334', 'n02342885', '{\'hamster\': \'仓鼠\'}');
INSERT INTO `basic_synsetwords` VALUES ('335', 'n02346627', '{\'porcupine\': \'豪猪\', \'hedgehog\': \'刺猬\'}');
INSERT INTO `basic_synsetwords` VALUES ('336', 'n02356798', '{\'fox squirrel\': \'狐松鼠\', \'eastern fox squirrel\': \'东美狐松鼠\', \'Sciurus niger\': \'黑松鼠\'}');
INSERT INTO `basic_synsetwords` VALUES ('337', 'n02361337', '{\'marmot\': \'旱獭\'}');
INSERT INTO `basic_synsetwords` VALUES ('338', 'n02363005', '{\'beaver\': \'海狸\'}');
INSERT INTO `basic_synsetwords` VALUES ('339', 'n02364673', '{\'guinea pig\': \'豚鼠\', \'Cavia cobaya\': \'荷兰猪\'}');
INSERT INTO `basic_synsetwords` VALUES ('340', 'n02389026', '{\'sorrel\': \'栗色马\'}');
INSERT INTO `basic_synsetwords` VALUES ('341', 'n02391049', '{\'zebra\': \'斑马\'}');
INSERT INTO `basic_synsetwords` VALUES ('342', 'n02395406', '{\'hog\': \'猪\', \'pig\': \'猪\', \'grunter\': \'猪\', \'squealer\': \'小鹌鹑\', \'Sus scrofa\': \'野猪属\'}');
INSERT INTO `basic_synsetwords` VALUES ('343', 'n02396427', '{\'wild boar\': \'野猪\', \'boar\': \'野猪\', \'Sus scrofa\': \'野猪属\'}');
INSERT INTO `basic_synsetwords` VALUES ('344', 'n02397096', '{\'warthog\': \'疣猪\'}');
INSERT INTO `basic_synsetwords` VALUES ('345', 'n02398521', '{\'hippopotamus\': \'河马\', \'hippo\': \'河马\', \'river horse\': \'河马\', \'Hippopotamus amphibius\': \'两栖河马\'}');
INSERT INTO `basic_synsetwords` VALUES ('346', 'n02403003', '{\'ox\': \'公牛\'}');
INSERT INTO `basic_synsetwords` VALUES ('347', 'n02408429', '{\'water buffalo\': \'水牛\', \'water ox\': \'水牛\', \'Asiatic buffalo\': \'亚洲水牛\', \'Bubalus bubalis\': \'亚洲水牛\'}');
INSERT INTO `basic_synsetwords` VALUES ('348', 'n02410509', '{\'bison\': \'野牛\'}');
INSERT INTO `basic_synsetwords` VALUES ('349', 'n02412080', '{\'ram\': \'山羊\', \'tup\': \'公羊\'}');
INSERT INTO `basic_synsetwords` VALUES ('350', 'n02415577', '{\'bighorn\': \'大角羊\', \'bighorn sheep\': \'大角羊\', \'Rocky Mountain bighorn\': \'落基山大角羊\', \'Rocky Mountain sheep\': \'落基山羊\', \'Ovis canadensis\': \'大角羊\'}');
INSERT INTO `basic_synsetwords` VALUES ('351', 'n02417914', '{\'ibex\': \'羊的\', \'Capra ibex\': \'北山羊\'}');
INSERT INTO `basic_synsetwords` VALUES ('352', 'n02422106', '{\'hartebeest\': \'羚羊\'}');
INSERT INTO `basic_synsetwords` VALUES ('353', 'n02422699', '{\'impala\': \'黑斑羚\', \'Aepyceros melampus\': \'黑斑羚\'}');
INSERT INTO `basic_synsetwords` VALUES ('354', 'n02423022', '{\'gazelle\': \'瞪羚\'}');
INSERT INTO `basic_synsetwords` VALUES ('355', 'n02437312', '{\'Arabian camel\': \'阿拉伯骆驼\', \'dromedary\': \'单峰骆驼\', \'Camelus dromedarius\': \'驼背骆驼\'}');
INSERT INTO `basic_synsetwords` VALUES ('356', 'n02437616', '{\'llama\': \'美洲驼\'}');
INSERT INTO `basic_synsetwords` VALUES ('357', 'n02441942', '{\'weasel\': \'黄鼠狼\'}');
INSERT INTO `basic_synsetwords` VALUES ('358', 'n02442845', '{\'mink\': \'水貂\'}');
INSERT INTO `basic_synsetwords` VALUES ('359', 'n02443114', '{\'polecat\': \'臭鼬\', \'fitch\': \'臭猫\', \'foulmart\': \'臭猫皮\', \'foumart\': \'臭猫毛\', \'Mustela putorius\': \'艾鼬\'}');
INSERT INTO `basic_synsetwords` VALUES ('360', 'n02443484', '{\'black-footed ferret\': \'黑脚貂\', \'ferret\': \'雪貂\', \'Mustela nigripes\': \'黑足鼬\'}');
INSERT INTO `basic_synsetwords` VALUES ('361', 'n02444819', '{\'otter\': \'水獭\'}');
INSERT INTO `basic_synsetwords` VALUES ('362', 'n02445715', '{\'skunk\': \'臭鼬\', \'polecat\': \'臭鼬\'}');
INSERT INTO `basic_synsetwords` VALUES ('363', 'n02447366', '{\'badger\': \'獾\'}');
INSERT INTO `basic_synsetwords` VALUES ('364', 'n02454379', '{\'armadillo\': \'犰狳\'}');
INSERT INTO `basic_synsetwords` VALUES ('365', 'n02457408', '{\'three-toed sloth\': \'树懒\', \'Bradypus tridactylus\': \'白喉三趾树懒\'}');
INSERT INTO `basic_synsetwords` VALUES ('366', 'n02480495', '{\'orangutan\': \'猩猩\', \'orang\': \'猩猩\', \'orangutang\': \'猩猩\', \'Pongo pygmaeus\': \'婆罗洲猩猩\'}');
INSERT INTO `basic_synsetwords` VALUES ('367', 'n02480855', '{\'gorilla\': \'大猩猩\', \'Gorilla gorilla\': \'大猩猩\'}');
INSERT INTO `basic_synsetwords` VALUES ('368', 'n02481823', '{\'chimpanzee\': \'黑猩猩\', \'chimp\': \'黑猩猩\', \'Pan troglodytes\': \'黑猩猩\'}');
INSERT INTO `basic_synsetwords` VALUES ('369', 'n02483362', '{\'gibbon\': \'长臂猿\', \'Hylobates lar\': \'白掌长臂猿\'}');
INSERT INTO `basic_synsetwords` VALUES ('370', 'n02483708', '{\'siamang\': \'合趾猿\', \'Hylobates syndactylus\': \'合趾长臂猿\', \'Symphalangus syndactylus\': \'合趾猿\'}');
INSERT INTO `basic_synsetwords` VALUES ('371', 'n02484975', '{\'guenon\': \'长尾猴\', \'guenon monkey\': \'企鹅猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('372', 'n02486261', '{\'patas\': \'赤猴\', \'hussar monkey\': \'轻骑兵猴\', \'Erythrocebus patas\': \'赤猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('373', 'n02486410', '{\'baboon\': \'狒狒\'}');
INSERT INTO `basic_synsetwords` VALUES ('374', 'n02487347', '{\'macaque\': \'猕猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('375', 'n02488291', '{\'langur\': \'叶猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('376', 'n02488702', '{\'colobus\': \'疣猴\', \'colobus monkey\': \'疣猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('377', 'n02489166', '{\'proboscis monkey\': \'长鼻猴\', \'Nasalis larvatus\': \'长鼻猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('378', 'n02490219', '{\'marmoset\': \'狨猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('379', 'n02492035', '{\'capuchin\': \'卷尾猴\', \'ringtail\': \'环尾猴\', \'Cebus capucinus\': \'卷尾猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('380', 'n02492660', '{\'howler monkey\': \'吼猴\', \'howler\': \'吼猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('381', 'n02493509', '{\'titi\': \'伶猴\', \'titi monkey\': \'伶猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('382', 'n02493793', '{\'spider monkey\': \'蜘蛛猴\', \'Ateles geoffroyi\': \'蜘蛛猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('383', 'n02494079', '{\'squirrel monkey\': \'松鼠猴\', \'Saimiri sciureus\': \'松鼠猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('384', 'n02497673', '{\'Madagascar cat\': \'马达加斯加猫\', \'ring-tailed lemur\': \'环尾狐猴\', \'Lemur catta\': \'环尾狐猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('385', 'n02500267', '{\'indri\': \'狐猴\', \'indris\': \'大狐猴\', \'Indri indri\': \'光面狐猴\', \'Indri brevicaudatus\': \'狐猴\'}');
INSERT INTO `basic_synsetwords` VALUES ('386', 'n02504013', '{\'Indian elephant\': \'印度象\', \'Elephas maximus\': \'亚洲象\'}');
INSERT INTO `basic_synsetwords` VALUES ('387', 'n02504458', '{\'African elephant\': \'非洲象\', \'Loxodonta africana\': \'非洲草原象\'}');
INSERT INTO `basic_synsetwords` VALUES ('388', 'n02509815', '{\'lesser panda\': \'小熊猫\', \'red panda\': \'小熊猫\', \'panda\': \'熊猫\', \'bear cat\': \'熊猫\', \'cat bear\': \'猫熊\', \'Ailurus fulgens\': \'小熊猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('389', 'n02510455', '{\'giant panda\': \'大熊猫\', \'panda\': \'熊猫\', \'panda bear\': \'熊猫熊\', \'coon bear\': \'浣熊\', \'Ailuropoda melanoleuca\': \'大熊猫\'}');
INSERT INTO `basic_synsetwords` VALUES ('390', 'n02514041', '{\'barracouta\': \'丈鱼\', \'snoek\': \'杖鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('391', 'n02526121', '{\'eel\': \'鳗鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('392', 'n02536864', '{\'coho\': \'鳕鱼\', \'cohoe\': \'鳕鱼\', \'coho salmon\': \'银大马哈鱼\', \'blue jack\': \'蓝色杰克马哈鱼\', \'silver salmon\': \'银鲑鱼\', \'Oncorhynchus kisutch\': \'银大麻哈鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('393', 'n02606052', '{\'rock beauty\': \'岩美鱼\', \'Holocanthus tricolor\': \'石美人鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('394', 'n02607072', '{\'anemone fish\': \'双锯鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('395', 'n02640242', '{\'sturgeon\': \'鲟鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('396', 'n02641379', '{\'gar\': \'雀鳝\', \'garfish\': \'眼镜鱼\', \'garpike\': \'雀鳝\', \'billfish\': \'比目鱼\', \'Lepisosteus osseus\': \'长吻雀鳝\'}');
INSERT INTO `basic_synsetwords` VALUES ('397', 'n02643566', '{\'lionfish\': \'狮子鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('398', 'n02655020', '{\'puffer\': \'河豚\', \'pufferfish\': \'河豚鱼\', \'blowfish\': \'河豚\', \'globefish\': \'河豚鱼\'}');
INSERT INTO `basic_synsetwords` VALUES ('399', 'n02666196', '{\'abacus\': \'算盘\'}');
INSERT INTO `basic_synsetwords` VALUES ('400', 'n02667093', '{\'abaya\': \'毛织物,长袍\'}');
INSERT INTO `basic_synsetwords` VALUES ('401', 'n02669723', '{\'academic gown\': \'学术长袍\', \'academic robe\': \'学术长袍\', \"judge\'s robe\": \'法官袍\'}');
INSERT INTO `basic_synsetwords` VALUES ('402', 'n02672831', '{\'accordion\': \'手风琴\', \'piano accordion\': \'钢琴手风琴\', \'squeeze box\': \'挤压箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('403', 'n02676566', '{\'acoustic guitar\': \'原声吉他\'}');
INSERT INTO `basic_synsetwords` VALUES ('404', 'n02687172', '{\'aircraft carrier\': \'航空母舰\', \'carrier\': \'航空母舰\', \'flattop\': \'航空母舰\', \'attack aircraft carrier\': \'攻击航空母舰\'}');
INSERT INTO `basic_synsetwords` VALUES ('405', 'n02690373', '{\'airliner\': \'客机\'}');
INSERT INTO `basic_synsetwords` VALUES ('406', 'n02692877', '{\'airship\': \'飞艇\', \'dirigible\': \'飞船\'}');
INSERT INTO `basic_synsetwords` VALUES ('407', 'n02699494', '{\'altar\': \'祭坛圣坛\'}');
INSERT INTO `basic_synsetwords` VALUES ('408', 'n02701002', '{\'ambulance\': \'救护车\'}');
INSERT INTO `basic_synsetwords` VALUES ('409', 'n02704792', '{\'amphibian\': \'两栖的\', \'amphibious vehicle\': \'水陆两用车辆\'}');
INSERT INTO `basic_synsetwords` VALUES ('410', 'n02708093', '{\'analog clock\': \'模拟时钟\'}');
INSERT INTO `basic_synsetwords` VALUES ('411', 'n02727426', '{\'apiary\': \'养蜂场\', \'bee house\': \'蜜蜂屋\'}');
INSERT INTO `basic_synsetwords` VALUES ('412', 'n02730930', '{\'apron\': \'围裙\'}');
INSERT INTO `basic_synsetwords` VALUES ('413', 'n02747177', '{\'ashcan\': \'烟灰盒\', \'trash can\': \'垃圾桶\', \'garbage can\': \'垃圾桶\', \'wastebin\': \'垃圾桶\', \'ash bin\': \'贮灰箱\', \'ash-bin\': \'贮灰箱\', \'ashbin\': \'烟灰缸\', \'dustbin\': \'垃圾桶\', \'trash barrel\': \'垃圾桶\', \'trash bin\': \'垃圾桶\'}');
INSERT INTO `basic_synsetwords` VALUES ('414', 'n02749479', '{\'assault rifle\': \'突击步枪\', \'assault gun\': \'突击炮\'}');
INSERT INTO `basic_synsetwords` VALUES ('415', 'n02769748', '{\'backpack\': \'背包\', \'back pack\': \'背包\', \'knapsack\': \'背包\', \'packsack\': \'背包\', \'rucksack\': \'帆布背包\', \'haversack\': \'背包\'}');
INSERT INTO `basic_synsetwords` VALUES ('416', 'n02776631', '{\'bakery\': \'面包店\', \'bakeshop\': \'面包房\', \'bakehouse\': \'烘焙室\'}');
INSERT INTO `basic_synsetwords` VALUES ('417', 'n02777292', '{\'balance beam\': \'平衡梁\', \'beam\': \'梁\'}');
INSERT INTO `basic_synsetwords` VALUES ('418', 'n02782093', '{\'balloon\': \'气球\'}');
INSERT INTO `basic_synsetwords` VALUES ('419', 'n02783161', '{\'ballpoint\': \'圆珠笔\', \'ballpoint pen\': \'圆珠笔\', \'ballpen\': \'圆珠笔\', \'Biro\': \'圆珠笔的一种biro\'}');
INSERT INTO `basic_synsetwords` VALUES ('420', 'n02786058', '{\'Band Aid\': \'创可贴\'}');
INSERT INTO `basic_synsetwords` VALUES ('421', 'n02787622', '{\'banjo\': \'班卓琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('422', 'n02788148', '{\'bannister\': \'班尼斯特\', \'banister\': \'栏杆\', \'balustrade\': \'栏杆\', \'balusters\': \'栏杆\', \'handrail\': \'扶手\'}');
INSERT INTO `basic_synsetwords` VALUES ('423', 'n02790996', '{\'barbell\': \'杠铃\'}');
INSERT INTO `basic_synsetwords` VALUES ('424', 'n02791124', '{\'barber chair\': \'理发椅\'}');
INSERT INTO `basic_synsetwords` VALUES ('425', 'n02791270', '{\'barbershop\': \'理发店\'}');
INSERT INTO `basic_synsetwords` VALUES ('426', 'n02793495', '{\'barn\': \'谷仓\'}');
INSERT INTO `basic_synsetwords` VALUES ('427', 'n02794156', '{\'barometer\': \'气压计\'}');
INSERT INTO `basic_synsetwords` VALUES ('428', 'n02795169', '{\'barrel\': \'桶\', \'cask\': \'木桶\'}');
INSERT INTO `basic_synsetwords` VALUES ('429', 'n02797295', '{\'barrow\': \'手推车\', \'garden cart\': \'园地小车\', \'lawn cart\': \'草坪车\', \'wheelbarrow\': \'独轮手推车\'}');
INSERT INTO `basic_synsetwords` VALUES ('430', 'n02799071', '{\'baseball\': \'棒球运动\'}');
INSERT INTO `basic_synsetwords` VALUES ('431', 'n02802426', '{\'basketball\': \'篮球\'}');
INSERT INTO `basic_synsetwords` VALUES ('432', 'n02804414', '{\'bassinet\': \'摇篮\'}');
INSERT INTO `basic_synsetwords` VALUES ('433', 'n02804610', '{\'bassoon\': \'巴松管\'}');
INSERT INTO `basic_synsetwords` VALUES ('434', 'n02807133', '{\'bathing cap\': \'浴帽\', \'swimming cap\': \'游泳帽\'}');
INSERT INTO `basic_synsetwords` VALUES ('435', 'n02808304', '{\'bath towel\': \'浴巾\'}');
INSERT INTO `basic_synsetwords` VALUES ('436', 'n02808440', '{\'bathtub\': \'浴缸\', \'bathing tub\': \'浴缸\', \'bath\': \'洗澡\', \'tub\': \'桶\'}');
INSERT INTO `basic_synsetwords` VALUES ('437', 'n02814533', '{\'beach wagon\': \'沙滩车\', \'station wagon\': \'客货两用车\', \'wagon\': \'货车\', \'estate car\': \'房地产车\', \'beach waggon\': \'沙滩车\', \'station waggon\': \'车站货车\', \'waggon\': \'四轮运货马车\'}');
INSERT INTO `basic_synsetwords` VALUES ('438', 'n02814860', '{\'beacon\': \'信标\', \'lighthouse\': \'灯塔\', \'beacon light\': \'信标灯\', \'pharos\': \'灯塔\'}');
INSERT INTO `basic_synsetwords` VALUES ('439', 'n02815834', '{\'beaker\': \'烧杯\'}');
INSERT INTO `basic_synsetwords` VALUES ('440', 'n02817516', '{\'bearskin\': \'熊皮高帽\', \'busby\': \'毛皮制高帽子\', \'shako\': \'顶有羽毛饰物的有檐平顶筒状军帽\'}');
INSERT INTO `basic_synsetwords` VALUES ('441', 'n02823428', '{\'beer bottle\': \'啤酒瓶\'}');
INSERT INTO `basic_synsetwords` VALUES ('442', 'n02823750', '{\'beer glass\': \'啤酒杯\'}');
INSERT INTO `basic_synsetwords` VALUES ('443', 'n02825657', '{\'bell cote\': \'架子\', \'bell cot\': \'钟架\'}');
INSERT INTO `basic_synsetwords` VALUES ('444', 'n02834397', '{\'bib\': \'围兜\'}');
INSERT INTO `basic_synsetwords` VALUES ('445', 'n02835271', '{\'bicycle-built-for-two\': \'双人自行车\', \'tandem bicycle\': \'串联自行车\', \'tandem\': \'双人自行车\'}');
INSERT INTO `basic_synsetwords` VALUES ('446', 'n02837789', '{\'bikini\': \'比基尼\', \'two-piece\': \'两件式\'}');
INSERT INTO `basic_synsetwords` VALUES ('447', 'n02840245', '{\'binder\': \'文件夹\', \'ring-binder\': \'打孔文件夹\'}');
INSERT INTO `basic_synsetwords` VALUES ('448', 'n02841315', '{\'binoculars\': \'双筒望远镜\', \'field glasses\': \'野战眼镜\', \'opera glasses\': \'歌剧院眼镜\'}');
INSERT INTO `basic_synsetwords` VALUES ('449', 'n02843684', '{\'birdhouse\': \'鸟舍\'}');
INSERT INTO `basic_synsetwords` VALUES ('450', 'n02859443', '{\'boathouse\': \'船坞\'}');
INSERT INTO `basic_synsetwords` VALUES ('451', 'n02860847', '{\'bobsled\': \'雪橇\', \'bobsleigh\': \'雪橇\', \'bob\': \'雪橇\'}');
INSERT INTO `basic_synsetwords` VALUES ('452', 'n02865351', '{\'bolo tie\': \'博洛领带\', \'bolo\': \'博洛领带\', \'bola tie\': \'博拉领带\', \'bola\': \'博拉领带\'}');
INSERT INTO `basic_synsetwords` VALUES ('453', 'n02869837', '{\'bonnet\': \'帽边朝前撑起的阔边女帽\', \'poke bonnet\': \'捅帽子\'}');
INSERT INTO `basic_synsetwords` VALUES ('454', 'n02870880', '{\'bookcase\': \'书柜\'}');
INSERT INTO `basic_synsetwords` VALUES ('455', 'n02871525', '{\'bookshop\': \'书店\', \'bookstore\': \'书店\', \'bookstall\': \'书摊\'}');
INSERT INTO `basic_synsetwords` VALUES ('456', 'n02877765', '{\'bottlecap\': \'瓶盖\'}');
INSERT INTO `basic_synsetwords` VALUES ('457', 'n02879718', '{\'bow\': \'弓,衣领结\'}');
INSERT INTO `basic_synsetwords` VALUES ('458', 'n02883205', '{\'bow tie\': \'蝴蝶结领结\', \'bow-tie\': \'蝴蝶结领结\', \'bowtie\': \'领结\'}');
INSERT INTO `basic_synsetwords` VALUES ('459', 'n02892201', '{\'brass\': \'黄铜饰品\', \'memorial tablet\': \'牌位\', \'plaque\': \'徽章匾\'}');
INSERT INTO `basic_synsetwords` VALUES ('460', 'n02892767', '{\'brassiere\': \'胸罩\', \'bra\': \'文胸\', \'bandeau\': \'胸衣\'}');
INSERT INTO `basic_synsetwords` VALUES ('461', 'n02894605', '{\'breakwater\': \'防波堤\', \'groin\': \'堤坝\', \'groyne\': \'防波堤\', \'mole\': \'防波堤\', \'bulwark\': \'舷墙\', \'seawall\': \'海堤\', \'jetty\': \'码头\'}');
INSERT INTO `basic_synsetwords` VALUES ('462', 'n02895154', '{\'breastplate\': \'胸甲\', \'aegis\': \'宙斯盾\', \'egis\': \'保护甲\'}');
INSERT INTO `basic_synsetwords` VALUES ('463', 'n02906734', '{\'broom\': \'扫帚\'}');
INSERT INTO `basic_synsetwords` VALUES ('464', 'n02909870', '{\'bucket\': \'水桶\', \'pail\': \'桶\'}');
INSERT INTO `basic_synsetwords` VALUES ('465', 'n02910353', '{\'buckle\': \'搭扣\'}');
INSERT INTO `basic_synsetwords` VALUES ('466', 'n02916936', '{\'bulletproof vest\': \'防弹背心\'}');
INSERT INTO `basic_synsetwords` VALUES ('467', 'n02917067', '{\'bullet train\': \'子弹头列车\', \'bullet\': \'子弹头高铁\'}');
INSERT INTO `basic_synsetwords` VALUES ('468', 'n02927161', '{\'butcher shop\': \'肉铺\', \'meat market\': \'肉类市场\'}');
INSERT INTO `basic_synsetwords` VALUES ('469', 'n02930766', '{\'cab\': \'出租车\', \'hack\': \'出租车\', \'taxi\': \'出租车\', \'taxicab\': \'出租汽车\'}');
INSERT INTO `basic_synsetwords` VALUES ('470', 'n02939185', '{\'caldron\': \'釜\', \'cauldron\': \'大锅\'}');
INSERT INTO `basic_synsetwords` VALUES ('471', 'n02948072', '{\'candle\': \'蜡烛\', \'taper\': \'细蜡烛\', \'wax light\': \'蜡灯\'}');
INSERT INTO `basic_synsetwords` VALUES ('472', 'n02950826', '{\'cannon\': \'大炮\'}');
INSERT INTO `basic_synsetwords` VALUES ('473', 'n02951358', '{\'canoe\': \'独木舟\'}');
INSERT INTO `basic_synsetwords` VALUES ('474', 'n02951585', '{\'can opener\': \'开罐器\', \'tin opener\': \'开罐器\'}');
INSERT INTO `basic_synsetwords` VALUES ('475', 'n02963159', '{\'cardigan\': \'羊毛衫,羊毛背心\'}');
INSERT INTO `basic_synsetwords` VALUES ('476', 'n02965783', '{\'car mirror\': \'汽车后视镜\'}');
INSERT INTO `basic_synsetwords` VALUES ('477', 'n02966193', '{\'carousel\': \'旋转木马\', \'carrousel\': \' 旋转木马\', \'merry-go-round\': \'旋转木马\', \'roundabout\': \' 旋转木马\', \'whirligig\': \' 旋转木马\'}');
INSERT INTO `basic_synsetwords` VALUES ('478', 'n02966687', '{\"carpenter\'s kit\": \'木工工具包\', \'tool kit\': \'工具箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('479', 'n02971356', '{\'carton\': \'纸箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('480', 'n02974003', '{\'car wheel\': \'汽车车轮\'}');
INSERT INTO `basic_synsetwords` VALUES ('481', 'n02977058', '{\'cash machine\': \'提现机\', \'cash dispenser\': \'提现机\', \'automated teller machine\': \'自动柜员机\', \'automatic teller machine\': \'自动柜员机\', \'automated teller\': \'自动柜员机\', \'automatic teller\': \'自动出纳机\', \'ATM\': \'自动取款机\'}');
INSERT INTO `basic_synsetwords` VALUES ('482', 'n02978881', '{\'cassette\': \'盒式录音带\'}');
INSERT INTO `basic_synsetwords` VALUES ('483', 'n02979186', '{\'cassette player\': \'盒式磁带播放机\'}');
INSERT INTO `basic_synsetwords` VALUES ('484', 'n02980441', '{\'castle\': \'城堡\'}');
INSERT INTO `basic_synsetwords` VALUES ('485', 'n02981792', '{\'catamaran\': \'双体船\'}');
INSERT INTO `basic_synsetwords` VALUES ('486', 'n02988304', '{\'CD player\': \'光盘播放机\'}');
INSERT INTO `basic_synsetwords` VALUES ('487', 'n02992211', '{\'cello\': \'大提琴\', \'violoncello\': \'大提琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('488', 'n02992529', '{\'cellular telephone\': \'蜂窝电话\', \'cellular phone\': \'蜂窝电话\', \'cellphone\': \'手机\', \'cell\': \'手机\', \'mobile phone\': \'移动电话\'}');
INSERT INTO `basic_synsetwords` VALUES ('489', 'n02999410', '{\'chain\': \'链\'}');
INSERT INTO `basic_synsetwords` VALUES ('490', 'n03000134', '{\'chainlink fence\': \'链环栅栏\'}');
INSERT INTO `basic_synsetwords` VALUES ('491', 'n03000247', '{\'chain mail\': \'链条甲\', \'ring mail\': \'锁子甲\', \'mail\': \'链甲\', \'chain armor\': \'链状装甲\', \'chain armour\': \'链甲\', \'ring armor\': \'环甲\', \'ring armour\': \'环甲\'}');
INSERT INTO `basic_synsetwords` VALUES ('492', 'n03000684', '{\'chain saw\': \'链锯\', \'chainsaw\': \'链锯\'}');
INSERT INTO `basic_synsetwords` VALUES ('493', 'n03014705', '{\'chest\': \'箱子\'}');
INSERT INTO `basic_synsetwords` VALUES ('494', 'n03016953', '{\'chiffonier\': \'衣橱\', \'commode\': \'有抽屉的小柜\'}');
INSERT INTO `basic_synsetwords` VALUES ('495', 'n03017168', '{\'chime\': \'编钟\', \'bell\': \'钟\', \'gong\': \'锣\'}');
INSERT INTO `basic_synsetwords` VALUES ('496', 'n03018349', '{\'china cabinet\': \'瓷器橱柜\', \'china closet\': \'瓷器柜\'}');
INSERT INTO `basic_synsetwords` VALUES ('497', 'n03026506', '{\'Christmas stocking\': \'圣诞袜\'}');
INSERT INTO `basic_synsetwords` VALUES ('498', 'n03028079', '{\'church\': \'教堂\', \'church building\': \'教堂建筑\'}');
INSERT INTO `basic_synsetwords` VALUES ('499', 'n03032252', '{\'cinema\': \'电影院\', \'movie theater\': \'电影院\', \'movie theatre\': \'电影院\', \'movie house\': \'电影屋\', \'picture palace\': \'电影院\'}');
INSERT INTO `basic_synsetwords` VALUES ('500', 'n03041632', '{\'cleaver\': \'切肉刀\', \'meat cleaver\': \'切肉刀\', \'chopper\': \'切肉刀\'}');
INSERT INTO `basic_synsetwords` VALUES ('501', 'n03042490', '{\'cliff dwelling\': \'悬崖住宅\'}');
INSERT INTO `basic_synsetwords` VALUES ('502', 'n03045698', '{\'cloak\': \'斗篷\'}');
INSERT INTO `basic_synsetwords` VALUES ('503', 'n03047690', '{\'clog\': \'木底鞋\', \'geta\': \'日本式木屐\', \'patten\': \'木屐\', \'sabot\': \'木鞋\'}');
INSERT INTO `basic_synsetwords` VALUES ('504', 'n03062245', '{\'cocktail shaker\': \'鸡尾酒摇摇筛\'}');
INSERT INTO `basic_synsetwords` VALUES ('505', 'n03063599', '{\'coffee mug\': \'咖啡杯\'}');
INSERT INTO `basic_synsetwords` VALUES ('506', 'n03063689', '{\'coffeepot\': \'咖啡壶\'}');
INSERT INTO `basic_synsetwords` VALUES ('507', 'n03065424', '{\'coil\': \'线圈\', \'spiral\': \'螺旋形的\', \'volute\': \'蜗壳\', \'whorl\': \'螺纹\', \'helix\': \'螺旋线\'}');
INSERT INTO `basic_synsetwords` VALUES ('508', 'n03075370', '{\'combination lock\': \'组合锁\'}');
INSERT INTO `basic_synsetwords` VALUES ('509', 'n03085013', '{\'computer keyboard\': \'计算机键盘\', \'keypad\': \'键盘\'}');
INSERT INTO `basic_synsetwords` VALUES ('510', 'n03089624', '{\'confectionery\': \'糕点糖果\', \'confectionary\': \'糖果糕点\', \'candy store\': \'糖果店\'}');
INSERT INTO `basic_synsetwords` VALUES ('511', 'n03095699', '{\'container ship\': \'集装箱船\', \'containership\': \'集装箱船\', \'container vessel\': \'集装箱船\'}');
INSERT INTO `basic_synsetwords` VALUES ('512', 'n03100240', '{\'convertible\': \'敞篷车\'}');
INSERT INTO `basic_synsetwords` VALUES ('513', 'n03109150', '{\'corkscrew\': \'开酒瓶盖器\', \'bottle screw\': \'瓶螺丝\'}');
INSERT INTO `basic_synsetwords` VALUES ('514', 'n03110669', '{\'cornet\': \'短号\', \'horn\': \'喇叭\', \'trumpet\': \'小号\', \'trump\': \'喇叭\'}');
INSERT INTO `basic_synsetwords` VALUES ('515', 'n03124043', '{\'cowboy boot\': \'牛仔靴\'}');
INSERT INTO `basic_synsetwords` VALUES ('516', 'n03124170', '{\'cowboy hat\': \'牛仔帽\', \'ten-gallon hat\': \'十加仑帽\'}');
INSERT INTO `basic_synsetwords` VALUES ('517', 'n03125729', '{\'cradle\': \'摇篮\'}');
INSERT INTO `basic_synsetwords` VALUES ('518', 'n03126707', '{\'crane\': \'起重机\'}');
INSERT INTO `basic_synsetwords` VALUES ('519', 'n03127747', '{\'crash helmet\': \'防撞头盔\'}');
INSERT INTO `basic_synsetwords` VALUES ('520', 'n03127925', '{\'crate\': \'板条箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('521', 'n03131574', '{\'crib\': \'婴儿床\', \'cot\': \'小床\'}');
INSERT INTO `basic_synsetwords` VALUES ('522', 'n03133878', '{\'Crock Pot\': \'瓦罐\'}');
INSERT INTO `basic_synsetwords` VALUES ('523', 'n03134739', '{\'croquet ball\': \'槌球\'}');
INSERT INTO `basic_synsetwords` VALUES ('524', 'n03141823', '{\'crutch\': \'拐杖\'}');
INSERT INTO `basic_synsetwords` VALUES ('525', 'n03146219', '{\'cuirass\': \'胸甲\'}');
INSERT INTO `basic_synsetwords` VALUES ('526', 'n03160309', '{\'dam\': \'水坝\', \'dike\': \'堤\', \'dyke\': \'堤\'}');
INSERT INTO `basic_synsetwords` VALUES ('527', 'n03179701', '{\'desk\': \'书桌\'}');
INSERT INTO `basic_synsetwords` VALUES ('528', 'n03180011', '{\'desktop computer\': \'台式计算机\'}');
INSERT INTO `basic_synsetwords` VALUES ('529', 'n03187595', '{\'dial telephone\': \'拨号电话\', \'dial phone\': \'拨号电话\'}');
INSERT INTO `basic_synsetwords` VALUES ('530', 'n03188531', '{\'diaper\': \'尿布\', \'nappy\': \'尿布\', \'napkin\': \'尿片\'}');
INSERT INTO `basic_synsetwords` VALUES ('531', 'n03196217', '{\'digital clock\': \'数字钟\'}');
INSERT INTO `basic_synsetwords` VALUES ('532', 'n03197337', '{\'digital watch\': \'数字手表\'}');
INSERT INTO `basic_synsetwords` VALUES ('533', 'n03201208', '{\'dining table\': \'餐桌\', \'board\': \'餐桌\'}');
INSERT INTO `basic_synsetwords` VALUES ('534', 'n03207743', '{\'dishrag\': \'洗碟用布\', \'dishcloth\': \'抹布\'}');
INSERT INTO `basic_synsetwords` VALUES ('535', 'n03207941', '{\'dishwasher\': \'洗碗机\', \'dish washer\': \'洗碗机\', \'dishwashing machine\': \'洗碗机\'}');
INSERT INTO `basic_synsetwords` VALUES ('536', 'n03208938', '{\'disk brake\': \'碟刹\', \'disc brake\': \'盘式制动器\'}');
INSERT INTO `basic_synsetwords` VALUES ('537', 'n03216828', '{\'dock\': \'码头\', \'dockage\': \'船坞\', \'docking facility\': \'泊船设施\'}');
INSERT INTO `basic_synsetwords` VALUES ('538', 'n03218198', '{\'dogsled\': \'狗橇\', \'dog sled\': \'狗雪橇\', \'dog sleigh\': \'狗雪橇\'}');
INSERT INTO `basic_synsetwords` VALUES ('539', 'n03220513', '{\'dome\': \'穹顶\'}');
INSERT INTO `basic_synsetwords` VALUES ('540', 'n03223299', '{\'doormat\': \'门垫\', \'welcome mat\': \'欢迎脚垫\'}');
INSERT INTO `basic_synsetwords` VALUES ('541', 'n03240683', '{\'drilling platform\': \'钻井平台\', \'offshore rig\': \'海上钻机\'}');
INSERT INTO `basic_synsetwords` VALUES ('542', 'n03249569', '{\'drum\': \'鼓\', \'membranophone\': \'膜乐器\', \'tympan\': \'鼓室\'}');
INSERT INTO `basic_synsetwords` VALUES ('543', 'n03250847', '{\'drumstick\': \'鼓槌\'}');
INSERT INTO `basic_synsetwords` VALUES ('544', 'n03255030', '{\'dumbbell\': \'哑铃\'}');
INSERT INTO `basic_synsetwords` VALUES ('545', 'n03259280', '{\'Dutch oven\': \'荷兰烤箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('546', 'n03271574', '{\'electric fan\': \'电风扇\', \'blower\': \'鼓风机\'}');
INSERT INTO `basic_synsetwords` VALUES ('547', 'n03272010', '{\'electric guitar\': \'电吉他\'}');
INSERT INTO `basic_synsetwords` VALUES ('548', 'n03272562', '{\'electric locomotive\': \'电力机车\'}');
INSERT INTO `basic_synsetwords` VALUES ('549', 'n03290653', '{\'entertainment center\': \'娱乐中心\'}');
INSERT INTO `basic_synsetwords` VALUES ('550', 'n03291819', '{\'envelope\': \'信封\'}');
INSERT INTO `basic_synsetwords` VALUES ('551', 'n03297495', '{\'espresso maker\': \'咖啡机\'}');
INSERT INTO `basic_synsetwords` VALUES ('552', 'n03314780', '{\'face powder\': \'扑面粉\'}');
INSERT INTO `basic_synsetwords` VALUES ('553', 'n03325584', '{\'feather boa\': \'羽蟒\', \'boa\': \'蟒蛇\'}');
INSERT INTO `basic_synsetwords` VALUES ('554', 'n03337140', '{\'file\': \'文件柜\', \'file cabinet\': \'文件柜\', \'filing cabinet\': \'文件柜\'}');
INSERT INTO `basic_synsetwords` VALUES ('555', 'n03344393', '{\'fireboat\': \'消防艇\'}');
INSERT INTO `basic_synsetwords` VALUES ('556', 'n03345487', '{\'fire engine\': \'消防车\', \'fire truck\': \'消防车\'}');
INSERT INTO `basic_synsetwords` VALUES ('557', 'n03347037', '{\'fire screen\': \'防火屏\', \'fireguard\': \'消防队员\'}');
INSERT INTO `basic_synsetwords` VALUES ('558', 'n03355925', '{\'flagpole\': \'旗杆\', \'flagstaff\': \'旗杆\'}');
INSERT INTO `basic_synsetwords` VALUES ('559', 'n03372029', '{\'flute\': \'长笛\', \'transverse flute\': \'横笛\'}');
INSERT INTO `basic_synsetwords` VALUES ('560', 'n03376595', '{\'folding chair\': \'折叠椅\'}');
INSERT INTO `basic_synsetwords` VALUES ('561', 'n03379051', '{\'football helmet\': \'橄榄球头盔\'}');
INSERT INTO `basic_synsetwords` VALUES ('562', 'n03384352', '{\'forklift\': \'叉车\'}');
INSERT INTO `basic_synsetwords` VALUES ('563', 'n03388043', '{\'fountain\': \'喷泉\'}');
INSERT INTO `basic_synsetwords` VALUES ('564', 'n03388183', '{\'fountain pen\': \'钢笔\'}');
INSERT INTO `basic_synsetwords` VALUES ('565', 'n03388549', '{\'four-poster\': \'有四根帷柱的床\'}');
INSERT INTO `basic_synsetwords` VALUES ('566', 'n03393912', '{\'freight car\': \'货车\'}');
INSERT INTO `basic_synsetwords` VALUES ('567', 'n03394916', '{\'French horn\': \'法式号子\', \'horn\': \'喇叭\'}');
INSERT INTO `basic_synsetwords` VALUES ('568', 'n03400231', '{\'frying pan\': \'煎锅\', \'frypan\': \'煎锅\', \'skillet\': \'锅\'}');
INSERT INTO `basic_synsetwords` VALUES ('569', 'n03404251', '{\'fur coat\': \'裘皮大衣\'}');
INSERT INTO `basic_synsetwords` VALUES ('570', 'n03417042', '{\'garbage truck\': \'垃圾车\', \'dustcart\': \'垃圾车\'}');
INSERT INTO `basic_synsetwords` VALUES ('571', 'n03424325', '{\'gasmask\': \'防毒面具\', \'respirator\': \'防毒面具\', \'gas helmet\': \'防毒面具\'}');
INSERT INTO `basic_synsetwords` VALUES ('572', 'n03425413', '{\'gas pump\': \'加油枪\', \'gasoline pump\': \'汽油泵\', \'petrol pump\': \'汽油泵\', \'island dispenser\': \'岛式加油站\'}');
INSERT INTO `basic_synsetwords` VALUES ('573', 'n03443371', '{\'goblet\': \'酒杯\'}');
INSERT INTO `basic_synsetwords` VALUES ('574', 'n03444034', '{\'go-kart\': \'无车体小型汽车,卡丁车\'}');
INSERT INTO `basic_synsetwords` VALUES ('575', 'n03445777', '{\'golf ball\': \'高尔夫球\'}');
INSERT INTO `basic_synsetwords` VALUES ('576', 'n03445924', '{\'golfcart\': \'高尔夫球车\', \'golf cart\': \'高尔夫球车\'}');
INSERT INTO `basic_synsetwords` VALUES ('577', 'n03447447', '{\'gondola\': \'货架,狭长小船\'}');
INSERT INTO `basic_synsetwords` VALUES ('578', 'n03447721', '{\'gong\': \'锣\', \'tam-tam\': \'唐唐鼓\'}');
INSERT INTO `basic_synsetwords` VALUES ('579', 'n03450230', '{\'gown\': \'长袍\'}');
INSERT INTO `basic_synsetwords` VALUES ('580', 'n03452741', '{\'grand piano\': \'钢琴\', \'grand\': \'大钢琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('581', 'n03457902', '{\'greenhouse\': \'温室\', \'nursery\': \'温床\', \'glasshouse\': \'温室\'}');
INSERT INTO `basic_synsetwords` VALUES ('582', 'n03459775', '{\'grille\': \'散热片\', \'radiator grille\': \'散热器水箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('583', 'n03461385', '{\'grocery store\': \'杂货店\', \'grocery\': \'杂货店\', \'food market\': \'食品市场\', \'market\': \'市场\'}');
INSERT INTO `basic_synsetwords` VALUES ('584', 'n03467068', '{\'guillotine\': \'断头台\'}');
INSERT INTO `basic_synsetwords` VALUES ('585', 'n03476684', '{\'hair slide\': \'毛发幻灯片\'}');
INSERT INTO `basic_synsetwords` VALUES ('586', 'n03476991', '{\'hair spray\': \'发胶\'}');
INSERT INTO `basic_synsetwords` VALUES ('587', 'n03478589', '{\'half track\': \'半履带\'}');
INSERT INTO `basic_synsetwords` VALUES ('588', 'n03481172', '{\'hammer\': \'铁锤\'}');
INSERT INTO `basic_synsetwords` VALUES ('589', 'n03482405', '{\'hamper\': \'大篮子\'}');
INSERT INTO `basic_synsetwords` VALUES ('590', 'n03483316', '{\'hand blower\': \'手提吹风机\', \'blow dryer\': \'吹风干燥器\', \'blow drier\': \'吹风干燥机\', \'hair dryer\': \'吹风机\', \'hair drier\': \'吹风机\'}');
INSERT INTO `basic_synsetwords` VALUES ('591', 'n03485407', '{\'hand-held computer\': \'手持式计算机\', \'hand-held microcomputer\': \'手持式微型计算机\'}');
INSERT INTO `basic_synsetwords` VALUES ('592', 'n03485794', '{\'handkerchief\': \'手帕\', \'hankie\': \'手帕\', \'hanky\': \'手帕\', \'hankey\': \'手帕\'}');
INSERT INTO `basic_synsetwords` VALUES ('593', 'n03492542', '{\'hard disc\': \'硬盘\', \'hard disk\': \'硬盘\', \'fixed disk\': \'固定磁盘\'}');
INSERT INTO `basic_synsetwords` VALUES ('594', 'n03494278', '{\'harmonica\': \'口琴\', \'mouth organ\': \'口琴\', \'harp\': \'竖琴\', \'mouth harp\': \'口琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('595', 'n03495258', '{\'harp\': \'竖琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('596', 'n03496892', '{\'harvester\': \'收割机\', \'reaper\': \'收割机\'}');
INSERT INTO `basic_synsetwords` VALUES ('597', 'n03498962', '{\'hatchet\': \'斧头\'}');
INSERT INTO `basic_synsetwords` VALUES ('598', 'n03527444', '{\'holster\': \'枪套\'}');
INSERT INTO `basic_synsetwords` VALUES ('599', 'n03529860', '{\'home theater\': \'家庭影院\', \'home theatre\': \'家庭影院\'}');
INSERT INTO `basic_synsetwords` VALUES ('600', 'n03530642', '{\'honeycomb\': \'蜂巢\'}');
INSERT INTO `basic_synsetwords` VALUES ('601', 'n03532672', '{\'hook\': \'钩\', \'claw\': \'爪\'}');
INSERT INTO `basic_synsetwords` VALUES ('602', 'n03534580', '{\'hoopskirt\': \'鞋裙\', \'crinoline\': \'带衬的裙,四周鼓出的裙\'}');
INSERT INTO `basic_synsetwords` VALUES ('603', 'n03535780', '{\'horizontal bar\': \'水平栏杆\', \'high bar\': \'高栏\'}');
INSERT INTO `basic_synsetwords` VALUES ('604', 'n03538406', '{\'horse cart\': \'马车\', \'horse-cart\': \'马车\'}');
INSERT INTO `basic_synsetwords` VALUES ('605', 'n03544143', '{\'hourglass\': \'沙漏\'}');
INSERT INTO `basic_synsetwords` VALUES ('606', 'n03584254', '{\'iPod\': \'苹果iPod\'}');
INSERT INTO `basic_synsetwords` VALUES ('607', 'n03584829', '{\'iron\': \'熨斗\', \'smoothing iron\': \'熨斗\'}');
INSERT INTO `basic_synsetwords` VALUES ('608', 'n03590841', '{\"jack-o\'-lantern\": \'万圣节南瓜灯\'}');
INSERT INTO `basic_synsetwords` VALUES ('609', 'n03594734', '{\'jean\': \'牛仔裤\', \'blue jean\': \'牛仔裤\', \'denim\': \'工装裤\'}');
INSERT INTO `basic_synsetwords` VALUES ('610', 'n03594945', '{\'jeep\': \'吉普车\', \'landrover\': \'越野车\'}');
INSERT INTO `basic_synsetwords` VALUES ('611', 'n03595614', '{\'jersey\': \'衬衣\', \'T-shirt\': \'T恤\', \'tee shirt\': \'T恤\'}');
INSERT INTO `basic_synsetwords` VALUES ('612', 'n03598930', '{\'jigsaw puzzle\': \'拼图游戏\'}');
INSERT INTO `basic_synsetwords` VALUES ('613', 'n03599486', '{\'jinrikisha\': \'黄包车\', \'ricksha\': \'人力车\', \'rickshaw\': \'人力车\'}');
INSERT INTO `basic_synsetwords` VALUES ('614', 'n03602883', '{\'joystick\': \'操纵杆,游戏杆\'}');
INSERT INTO `basic_synsetwords` VALUES ('615', 'n03617480', '{\'kimono\': \'和服\'}');
INSERT INTO `basic_synsetwords` VALUES ('616', 'n03623198', '{\'knee pad\': \'护膝\'}');
INSERT INTO `basic_synsetwords` VALUES ('617', 'n03627232', '{\'knot\': \'结\'}');
INSERT INTO `basic_synsetwords` VALUES ('618', 'n03630383', '{\'lab coat\': \'实验衣\', \'laboratory coat\': \'实验衣\'}');
INSERT INTO `basic_synsetwords` VALUES ('619', 'n03633091', '{\'ladle\': \'长柄勺\'}');
INSERT INTO `basic_synsetwords` VALUES ('620', 'n03637318', '{\'lampshade\': \'灯罩\', \'lamp shade\': \'灯罩\'}');
INSERT INTO `basic_synsetwords` VALUES ('621', 'n03642806', '{\'laptop\': \'笔记本电脑\', \'laptop computer\': \'膝上计算机\'}');
INSERT INTO `basic_synsetwords` VALUES ('622', 'n03649909', '{\'lawn mower\': \'割草机\', \'mower\': \'割草机\'}');
INSERT INTO `basic_synsetwords` VALUES ('623', 'n03657121', '{\'lens cap\': \'镜头盖\', \'lens cover\': \'镜头盖\'}');
INSERT INTO `basic_synsetwords` VALUES ('624', 'n03658185', '{\'letter opener\': \'开信器\', \'paper knife\': \'纸刀\', \'paperknife\': \'纸刀\'}');
INSERT INTO `basic_synsetwords` VALUES ('625', 'n03661043', '{\'library\': \'图书馆\'}');
INSERT INTO `basic_synsetwords` VALUES ('626', 'n03662601', '{\'lifeboat\': \'救生艇\'}');
INSERT INTO `basic_synsetwords` VALUES ('627', 'n03666591', '{\'lighter\': \'打火机\', \'light\': \'火机\', \'igniter\': \'点火器\', \'ignitor\': \'点火器\'}');
INSERT INTO `basic_synsetwords` VALUES ('628', 'n03670208', '{\'limousine\': \'豪华轿车\', \'limo\': \'豪华轿车\'}');
INSERT INTO `basic_synsetwords` VALUES ('629', 'n03673027', '{\'liner\': \'远洋定期客轮,邮船\', \'ocean liner\': \'远洋班轮\'}');
INSERT INTO `basic_synsetwords` VALUES ('630', 'n03676483', '{\'lipstick\': \'唇膏\', \'lip rouge\': \'口红\'}');
INSERT INTO `basic_synsetwords` VALUES ('631', 'n03680355', '{\'Loafer\': \'游手好闲者\'}');
INSERT INTO `basic_synsetwords` VALUES ('632', 'n03690938', '{\'lotion\': \'沐浴露,润肤膏\'}');
INSERT INTO `basic_synsetwords` VALUES ('633', 'n03691459', '{\'loudspeaker\': \'扬声器\', \'speaker\': \'音箱\', \'speaker unit\': \'扬声器\', \'loudspeaker system\': \'扬声器系统\', \'speaker system\': \'扬声器系统\'}');
INSERT INTO `basic_synsetwords` VALUES ('634', 'n03692522', '{\'loupe\': \'放大镜\', \"jeweler\'s loupe\": \'珠宝商放大镜\'}');
INSERT INTO `basic_synsetwords` VALUES ('635', 'n03697007', '{\'lumbermill\': \'伐木机\', \'sawmill\': \'锯木厂\'}');
INSERT INTO `basic_synsetwords` VALUES ('636', 'n03706229', '{\'magnetic compass\': \'磁罗盘\'}');
INSERT INTO `basic_synsetwords` VALUES ('637', 'n03709823', '{\'mailbag\': \'邮袋\', \'postbag\': \'邮袋\'}');
INSERT INTO `basic_synsetwords` VALUES ('638', 'n03710193', '{\'mailbox\': \'信箱\', \'letter box\': \'信箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('639', 'n03710637', '{\'maillot\': \'女浴衣,女游泳衣\'}');
INSERT INTO `basic_synsetwords` VALUES ('640', 'n03710721', '{\'maillot\': \'女浴衣,女游泳衣\', \'tank suit\': \'有肩带浴衣\'}');
INSERT INTO `basic_synsetwords` VALUES ('641', 'n03717622', '{\'manhole cover\': \'人孔盖,探井盖,沙井盖\'}');
INSERT INTO `basic_synsetwords` VALUES ('642', 'n03720891', '{\'maraca\': \'打击乐器沙球\'}');
INSERT INTO `basic_synsetwords` VALUES ('643', 'n03721384', '{\'marimba\': \'马林巴琴\', \'xylophone\': \'木琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('644', 'n03724870', '{\'mask\': \'面具\'}');
INSERT INTO `basic_synsetwords` VALUES ('645', 'n03729826', '{\'matchstick\': \'火柴棍\'}');
INSERT INTO `basic_synsetwords` VALUES ('646', 'n03733131', '{\'maypole\': \'庆典用的五月柱\'}');
INSERT INTO `basic_synsetwords` VALUES ('647', 'n03733281', '{\'maze\': \'迷宫\', \'labyrinth\': \'迷宫\'}');
INSERT INTO `basic_synsetwords` VALUES ('648', 'n03733805', '{\'measuring cup\': \'量杯\'}');
INSERT INTO `basic_synsetwords` VALUES ('649', 'n03742115', '{\'medicine chest\': \'药箱\', \'medicine cabinet\': \'药柜\'}');
INSERT INTO `basic_synsetwords` VALUES ('650', 'n03743016', '{\'megalith\': \'巨石\', \'megalithic structure\': \'巨石构造\'}');
INSERT INTO `basic_synsetwords` VALUES ('651', 'n03759954', '{\'microphone\': \'麦克风\', \'mike\': \'麦克风\'}');
INSERT INTO `basic_synsetwords` VALUES ('652', 'n03761084', '{\'microwave\': \'微波炉\', \'microwave oven\': \'微波炉\'}');
INSERT INTO `basic_synsetwords` VALUES ('653', 'n03763968', '{\'military uniform\': \'军服\'}');
INSERT INTO `basic_synsetwords` VALUES ('654', 'n03764736', '{\'milk can\': \'牛奶罐头\'}');
INSERT INTO `basic_synsetwords` VALUES ('655', 'n03769881', '{\'minibus\': \'微型客车\'}');
INSERT INTO `basic_synsetwords` VALUES ('656', 'n03770439', '{\'miniskirt\': \'迷你裙\', \'mini\': \'迷你裙\'}');
INSERT INTO `basic_synsetwords` VALUES ('657', 'n03770679', '{\'minivan\': \'小型货车\'}');
INSERT INTO `basic_synsetwords` VALUES ('658', 'n03773504', '{\'missile\': \'导弹\'}');
INSERT INTO `basic_synsetwords` VALUES ('659', 'n03775071', '{\'mitten\': \'手套\'}');
INSERT INTO `basic_synsetwords` VALUES ('660', 'n03775546', '{\'mixing bowl\': \'搅拌碗\'}');
INSERT INTO `basic_synsetwords` VALUES ('661', 'n03776460', '{\'mobile home\': \'活动房层\', \'manufactured home\': \'预制装配式房屋\'}');
INSERT INTO `basic_synsetwords` VALUES ('662', 'n03777568', '{\'Model T\': \'老爷车\'}');
INSERT INTO `basic_synsetwords` VALUES ('663', 'n03777754', '{\'modem\': \'调制解调器\'}');
INSERT INTO `basic_synsetwords` VALUES ('664', 'n03781244', '{\'monastery\': \'修道院\'}');
INSERT INTO `basic_synsetwords` VALUES ('665', 'n03782006', '{\'monitor\': \'显示器\'}');
INSERT INTO `basic_synsetwords` VALUES ('666', 'n03785016', '{\'moped\': \'轻便摩托车\'}');
INSERT INTO `basic_synsetwords` VALUES ('667', 'n03786901', '{\'mortar\': \'砂浆,迫击炮,房产,研钵\'}');
INSERT INTO `basic_synsetwords` VALUES ('668', 'n03787032', '{\'mortarboard\': \'砂浆板,学位帽\'}');
INSERT INTO `basic_synsetwords` VALUES ('669', 'n03788195', '{\'mosque\': \'清真寺\'}');
INSERT INTO `basic_synsetwords` VALUES ('670', 'n03788365', '{\'mosquito net\': \'蚊帐\'}');
INSERT INTO `basic_synsetwords` VALUES ('671', 'n03791053', '{\'motor scooter\': \'电动滑板车\', \'scooter\': \'小型摩托车\'}');
INSERT INTO `basic_synsetwords` VALUES ('672', 'n03792782', '{\'mountain bike\': \'山地自行车\', \'all-terrain bike\': \'全地形自行车\', \'off-roader\': \'越野车\'}');
INSERT INTO `basic_synsetwords` VALUES ('673', 'n03792972', '{\'mountain tent\': \'登山帐\'}');
INSERT INTO `basic_synsetwords` VALUES ('674', 'n03793489', '{\'mouse\': \'鼠标\', \'computer mouse\': \'电脑鼠标\'}');
INSERT INTO `basic_synsetwords` VALUES ('675', 'n03794056', '{\'mousetrap\': \'捕鼠器\'}');
INSERT INTO `basic_synsetwords` VALUES ('676', 'n03796401', '{\'moving van\': \'移动厢式货车\'}');
INSERT INTO `basic_synsetwords` VALUES ('677', 'n03803284', '{\'muzzle\': \'炮口,鼻口部\'}');
INSERT INTO `basic_synsetwords` VALUES ('678', 'n03804744', '{\'nail\': \'指甲\'}');
INSERT INTO `basic_synsetwords` VALUES ('679', 'n03814639', '{\'neck brace\': \'颈撑,颈支具,颈托\'}');
INSERT INTO `basic_synsetwords` VALUES ('680', 'n03814906', '{\'necklace\': \'项链\'}');
INSERT INTO `basic_synsetwords` VALUES ('681', 'n03825788', '{\'nipple\': \'乳头\'}');
INSERT INTO `basic_synsetwords` VALUES ('682', 'n03832673', '{\'notebook\': \'笔记本\', \'notebook computer\': \'笔记本电脑\'}');
INSERT INTO `basic_synsetwords` VALUES ('683', 'n03837869', '{\'obelisk\': \'方尖碑\'}');
INSERT INTO `basic_synsetwords` VALUES ('684', 'n03838899', '{\'oboe\': \'双簧管\', \'hautboy\': \'豪特曼\', \'hautbois\': \'哈特博伊斯\'}');
INSERT INTO `basic_synsetwords` VALUES ('685', 'n03840681', '{\'ocarina\': \'陶笛\', \'sweet potato\': \'甘薯\'}');
INSERT INTO `basic_synsetwords` VALUES ('686', 'n03841143', '{\'odometer\': \'里程计\', \'hodometer\': \'车速计\', \'mileometer\': \'里程计\', \'milometer\': \'里程表\'}');
INSERT INTO `basic_synsetwords` VALUES ('687', 'n03843555', '{\'oil filter\': \'滤油器\'}');
INSERT INTO `basic_synsetwords` VALUES ('688', 'n03854065', '{\'organ\': \'风琴\', \'pipe organ\': \'管风琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('689', 'n03857828', '{\'oscilloscope\': \'示波器\', \'scope\': \'阴极射线示波器\', \'cathode-ray oscilloscope\': \'阴极射线示波器\', \'CRO\': \'阴极射线示波器\'}');
INSERT INTO `basic_synsetwords` VALUES ('690', 'n03866082', '{\'overskirt\': \'罩裙,套裙\'}');
INSERT INTO `basic_synsetwords` VALUES ('691', 'n03868242', '{\'oxcart\': \'牛车\'}');
INSERT INTO `basic_synsetwords` VALUES ('692', 'n03868863', '{\'oxygen mask\': \'氧气面罩\'}');
INSERT INTO `basic_synsetwords` VALUES ('693', 'n03871628', '{\'packet\': \'小包裹\'}');
INSERT INTO `basic_synsetwords` VALUES ('694', 'n03873416', '{\'paddle\': \'桨\', \'boat paddle\': \'船桨\'}');
INSERT INTO `basic_synsetwords` VALUES ('695', 'n03874293', '{\'paddlewheel\': \'轮桨\', \'paddle wheel\': \'桨轮\'}');
INSERT INTO `basic_synsetwords` VALUES ('696', 'n03874599', '{\'padlock\': \'挂锁\'}');
INSERT INTO `basic_synsetwords` VALUES ('697', 'n03876231', '{\'paintbrush\': \'画笔\'}');
INSERT INTO `basic_synsetwords` VALUES ('698', 'n03877472', '{\'pajama\': \'睡衣\', \'pyjama\': \'睡衣\', \"pj\'s\": \'睡衣\', \'jammies\': \'睡衣裤\'}');
INSERT INTO `basic_synsetwords` VALUES ('699', 'n03877845', '{\'palace\': \'宫殿\'}');
INSERT INTO `basic_synsetwords` VALUES ('700', 'n03884397', '{\'panpipe\': \'盘管\', \'pandean pipe\': \'潘迪恩管\', \'syrinx\': \'鸣管\'}');
INSERT INTO `basic_synsetwords` VALUES ('701', 'n03887697', '{\'paper towel\': \'纸巾\'}');
INSERT INTO `basic_synsetwords` VALUES ('702', 'n03888257', '{\'parachute\': \'降落伞\', \'chute\': \'降落伞状物\'}');
INSERT INTO `basic_synsetwords` VALUES ('703', 'n03888605', '{\'parallel bars\': \'双杠\', \'bars\': \'双杠\'}');
INSERT INTO `basic_synsetwords` VALUES ('704', 'n03891251', '{\'park bench\': \'公园长椅\'}');
INSERT INTO `basic_synsetwords` VALUES ('705', 'n03891332', '{\'parking meter\': \'停车收费表\'}');
INSERT INTO `basic_synsetwords` VALUES ('706', 'n03895866', '{\'passenger car\': \'乘用车\', \'coach\': \'客车\', \'carriage\': \'客车车厢\'}');
INSERT INTO `basic_synsetwords` VALUES ('707', 'n03899768', '{\'patio\': \'院子\', \'terrace\': \'门廊\'}');
INSERT INTO `basic_synsetwords` VALUES ('708', 'n03902125', '{\'pay-phone\': \'付费电话\', \'pay-station\': \'电话亭\'}');
INSERT INTO `basic_synsetwords` VALUES ('709', 'n03903868', '{\'pedestal\': \'底座,支脚架\', \'plinth\': \'柱基\', \'footstall\': \'脚凳\'}');
INSERT INTO `basic_synsetwords` VALUES ('710', 'n03908618', '{\'pencil box\': \'铅笔盒\', \'pencil case\': \'铅笔盒\'}');
INSERT INTO `basic_synsetwords` VALUES ('711', 'n03908714', '{\'pencil sharpener\': \'卷笔刀\'}');
INSERT INTO `basic_synsetwords` VALUES ('712', 'n03916031', '{\'perfume\': \'香水\', \'essence\': \'男用香水\'}');
INSERT INTO `basic_synsetwords` VALUES ('713', 'n03920288', '{\'Petri dish\': \'培养皿\'}');
INSERT INTO `basic_synsetwords` VALUES ('714', 'n03924679', '{\'photocopier\': \'影印机\'}');
INSERT INTO `basic_synsetwords` VALUES ('715', 'n03929660', '{\'pick\': \'琴拨\', \'plectrum\': \'拨弦乐器\', \'plectron\': \'弹奏弦乐器用的拨子,琴拨\'}');
INSERT INTO `basic_synsetwords` VALUES ('716', 'n03929855', '{\'pickelhaube\': \'普鲁士尖顶皮头盔\'}');
INSERT INTO `basic_synsetwords` VALUES ('717', 'n03930313', '{\'picket fence\': \'栅栏\', \'paling\': \'围栏\'}');
INSERT INTO `basic_synsetwords` VALUES ('718', 'n03930630', '{\'pickup\': \'皮卡\', \'pickup truck\': \'皮卡车\'}');
INSERT INTO `basic_synsetwords` VALUES ('719', 'n03933933', '{\'pier\': \'码头\'}');
INSERT INTO `basic_synsetwords` VALUES ('720', 'n03935335', '{\'piggy bank\': \'储蓄罐\', \'penny bank\': \'便士银行\'}');
INSERT INTO `basic_synsetwords` VALUES ('721', 'n03937543', '{\'pill bottle\': \'药丸瓶\'}');
INSERT INTO `basic_synsetwords` VALUES ('722', 'n03938244', '{\'pillow\': \'枕头\'}');
INSERT INTO `basic_synsetwords` VALUES ('723', 'n03942813', '{\'ping-pong ball\': \'乒乓球\'}');
INSERT INTO `basic_synsetwords` VALUES ('724', 'n03944341', '{\'pinwheel\': \'风车\'}');
INSERT INTO `basic_synsetwords` VALUES ('725', 'n03947888', '{\'pirate\': \'海盗\', \'pirate ship\': \'海盗船\'}');
INSERT INTO `basic_synsetwords` VALUES ('726', 'n03950228', '{\'pitcher\': \'大水罐\', \'ewer\': \'水壶\'}');
INSERT INTO `basic_synsetwords` VALUES ('727', 'n03954731', '{\'plane\': \'木工刨\', \"carpenter\'s plane\": \'木工刨\', \'woodworking plane\': \'木工刨\'}');
INSERT INTO `basic_synsetwords` VALUES ('728', 'n03956157', '{\'planetarium\': \'天文馆\'}');
INSERT INTO `basic_synsetwords` VALUES ('729', 'n03958227', '{\'plastic bag\': \'塑料袋\'}');
INSERT INTO `basic_synsetwords` VALUES ('730', 'n03961711', '{\'plate rack\': \'板架,架子\'}');
INSERT INTO `basic_synsetwords` VALUES ('731', 'n03967562', '{\'plow\': \'犁\', \'plough\': \'犁\'}');
INSERT INTO `basic_synsetwords` VALUES ('732', 'n03970156', '{\'plunger\': \'手压皮碗泵\', \"plumber\'s helper\": \'下水道手压皮碗泵\'}');
INSERT INTO `basic_synsetwords` VALUES ('733', 'n03976467', '{\'Polaroid camera\': \'胶片照相机\', \'Polaroid Land camera\': \'宝丽来相机\'}');
INSERT INTO `basic_synsetwords` VALUES ('734', 'n03976657', '{\'pole\': \'杆\'}');
INSERT INTO `basic_synsetwords` VALUES ('735', 'n03977966', '{\'police van\': \'警车\', \'police wagon\': \'警车\', \'paddy wagon\': \'警车\', \'patrol wagon\': \'巡逻车\', \'wagon\': \'警车\', \'black Maria\': \'囚车\'}');
INSERT INTO `basic_synsetwords` VALUES ('736', 'n03980874', '{\'poncho\': \'雨披\'}');
INSERT INTO `basic_synsetwords` VALUES ('737', 'n03982430', '{\'pool table\': \'台球桌\', \'billiard table\': \'台球桌\', \'snooker table\': \'台球桌\'}');
INSERT INTO `basic_synsetwords` VALUES ('738', 'n03983396', '{\'pop bottle\': \'汽水瓶\', \'soda bottle\': \'汽水瓶\'}');
INSERT INTO `basic_synsetwords` VALUES ('739', 'n03991062', '{\'pot\': \'花盆\', \'flowerpot\': \'花盆\'}');
INSERT INTO `basic_synsetwords` VALUES ('740', 'n03992509', '{\"potter\'s wheel\": \'陶钧,制陶用的转轮\'}');
INSERT INTO `basic_synsetwords` VALUES ('741', 'n03995372', '{\'power drill\': \'电钻\'}');
INSERT INTO `basic_synsetwords` VALUES ('742', 'n03998194', '{\'prayer rug\': \'祈祷毯\', \'prayer mat\': \'祈祷席\'}');
INSERT INTO `basic_synsetwords` VALUES ('743', 'n04004767', '{\'printer\': \'打印机\'}');
INSERT INTO `basic_synsetwords` VALUES ('744', 'n04005630', '{\'prison\': \'监狱\', \'prison house\': \'监狱\'}');
INSERT INTO `basic_synsetwords` VALUES ('745', 'n04008634', '{\'projectile\': \'抛射体\', \'missile\': \'导弹\'}');
INSERT INTO `basic_synsetwords` VALUES ('746', 'n04009552', '{\'projector\': \'投影机\'}');
INSERT INTO `basic_synsetwords` VALUES ('747', 'n04019541', '{\'puck\': \'冰球\', \'hockey puck\': \'曲棍球\'}');
INSERT INTO `basic_synsetwords` VALUES ('748', 'n04023962', '{\'punching bag\': \'打孔袋\', \'punch bag\': \'打孔袋\', \'punching ball\': \'冲孔球\', \'punchball\': \'冲孔球\'}');
INSERT INTO `basic_synsetwords` VALUES ('749', 'n04026417', '{\'purse\': \'钱包\'}');
INSERT INTO `basic_synsetwords` VALUES ('750', 'n04033901', '{\'quill\': \'羽毛笔\', \'quill pen\': \'羽毛笔\'}');
INSERT INTO `basic_synsetwords` VALUES ('751', 'n04033995', '{\'quilt\': \'被子\', \'comforter\': \'小被子\', \'comfort\': \'小被子\', \'puff\': \'小被子\'}');
INSERT INTO `basic_synsetwords` VALUES ('752', 'n04037443', '{\'racer\': \'赛车\', \'race car\': \'赛车\', \'racing car\': \'赛车\'}');
INSERT INTO `basic_synsetwords` VALUES ('753', 'n04039381', '{\'racket\': \'网球拍\', \'racquet\': \'网球拍\'}');
INSERT INTO `basic_synsetwords` VALUES ('754', 'n04040759', '{\'radiator\': \'散热器\'}');
INSERT INTO `basic_synsetwords` VALUES ('755', 'n04041544', '{\'radio\': \'收音机\', \'wireless\': \'收音机\'}');
INSERT INTO `basic_synsetwords` VALUES ('756', 'n04044716', '{\'radio telescope\': \'射电望远镜\', \'radio reflector\': \'无线电反射器\'}');
INSERT INTO `basic_synsetwords` VALUES ('757', 'n04049303', '{\'rain barrel\': \'雨桶\'}');
INSERT INTO `basic_synsetwords` VALUES ('758', 'n04065272', '{\'recreational vehicle\': \'休闲车\', \'RV\': \'游艺车\', \'R.V.\': \'R.V.\'}');
INSERT INTO `basic_synsetwords` VALUES ('759', 'n04067472', '{\'reel\': \'卷轴\'}');
INSERT INTO `basic_synsetwords` VALUES ('760', 'n04069434', '{\'reflex camera\': \'反射式照相机\'}');
INSERT INTO `basic_synsetwords` VALUES ('761', 'n04070727', '{\'refrigerator\': \'冰箱\', \'icebox\': \'冰箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('762', 'n04074963', '{\'remote control\': \'遥控器\', \'remote\': \'遥控器\'}');
INSERT INTO `basic_synsetwords` VALUES ('763', 'n04081281', '{\'restaurant\': \'餐厅\', \'eating house\': \'饭厅\', \'eating place\': \'饮食场所\', \'eatery\': \'食堂\'}');
INSERT INTO `basic_synsetwords` VALUES ('764', 'n04086273', '{\'revolver\': \'左轮手枪\', \'six-gun\': \'左轮手枪\', \'six-shooter\': \'左轮手枪\'}');
INSERT INTO `basic_synsetwords` VALUES ('765', 'n04090263', '{\'rifle\': \'步枪\'}');
INSERT INTO `basic_synsetwords` VALUES ('766', 'n04099969', '{\'rocking chair\': \'摇椅\', \'rocker\': \'摇椅\'}');
INSERT INTO `basic_synsetwords` VALUES ('767', 'n04111531', '{\'rotisserie\': \'烤肉店\'}');
INSERT INTO `basic_synsetwords` VALUES ('768', 'n04116512', '{\'rubber eraser\': \'橡皮擦\', \'rubber\': \'橡胶\', \'pencil eraser\': \'铅笔橡皮擦\'}');
INSERT INTO `basic_synsetwords` VALUES ('769', 'n04118538', '{\'rugby ball\': \'橄榄球\'}');
INSERT INTO `basic_synsetwords` VALUES ('770', 'n04118776', '{\'rule\': \'尺子\', \'ruler\': \'尺子\'}');
INSERT INTO `basic_synsetwords` VALUES ('771', 'n04120489', '{\'running shoe\': \'跑鞋\'}');
INSERT INTO `basic_synsetwords` VALUES ('772', 'n04125021', '{\'safe\': \'保险柜\'}');
INSERT INTO `basic_synsetwords` VALUES ('773', 'n04127249', '{\'safety pin\': \'安全别针\'}');
INSERT INTO `basic_synsetwords` VALUES ('774', 'n04131690', '{\'saltshaker\': \'盐瓶\', \'salt shaker\': \'盐瓶\'}');
INSERT INTO `basic_synsetwords` VALUES ('775', 'n04133789', '{\'sandal\': \'凉鞋\'}');
INSERT INTO `basic_synsetwords` VALUES ('776', 'n04136333', '{\'sarong\': \'纱笼\'}');
INSERT INTO `basic_synsetwords` VALUES ('777', 'n04141076', '{\'sax\': \'萨克斯\', \'saxophone\': \'萨克斯\'}');
INSERT INTO `basic_synsetwords` VALUES ('778', 'n04141327', '{\'scabbard\': \'鞘\'}');
INSERT INTO `basic_synsetwords` VALUES ('779', 'n04141975', '{\'scale\': \'电子秤\', \'weighing machine\': \'称重机\'}');
INSERT INTO `basic_synsetwords` VALUES ('780', 'n04146614', '{\'school bus\': \'校车\'}');
INSERT INTO `basic_synsetwords` VALUES ('781', 'n04147183', '{\'schooner\': \'纵帆船\'}');
INSERT INTO `basic_synsetwords` VALUES ('782', 'n04149813', '{\'scoreboard\': \'记分牌\'}');
INSERT INTO `basic_synsetwords` VALUES ('783', 'n04152593', '{\'screen\': \'屏幕\', \'CRT screen\': \'阴极射线管屏\'}');
INSERT INTO `basic_synsetwords` VALUES ('784', 'n04153751', '{\'screw\': \'螺丝钉\'}');
INSERT INTO `basic_synsetwords` VALUES ('785', 'n04154565', '{\'screwdriver\': \'螺丝起子\'}');
INSERT INTO `basic_synsetwords` VALUES ('786', 'n04162706', '{\'seat belt\': \'座椅安全带\', \'seatbelt\': \'安全带\'}');
INSERT INTO `basic_synsetwords` VALUES ('787', 'n04179913', '{\'sewing machine\': \'缝纫机\'}');
INSERT INTO `basic_synsetwords` VALUES ('788', 'n04192698', '{\'shield\': \'盾\', \'buckler\': \'防御物\'}');
INSERT INTO `basic_synsetwords` VALUES ('789', 'n04200800', '{\'shoe shop\': \'鞋店\', \'shoe-shop\': \'鞋店\', \'shoe store\': \'鞋店\'}');
INSERT INTO `basic_synsetwords` VALUES ('790', 'n04201297', '{\'shoji\': \'障子,日本房屋用的纸糊木框\'}');
INSERT INTO `basic_synsetwords` VALUES ('791', 'n04204238', '{\'shopping basket\': \'购物篮\'}');
INSERT INTO `basic_synsetwords` VALUES ('792', 'n04204347', '{\'shopping cart\': \'购物车\'}');
INSERT INTO `basic_synsetwords` VALUES ('793', 'n04208210', '{\'shovel\': \'铲子\'}');
INSERT INTO `basic_synsetwords` VALUES ('794', 'n04209133', '{\'shower cap\': \'淋浴帽\'}');
INSERT INTO `basic_synsetwords` VALUES ('795', 'n04209239', '{\'shower curtain\': \'浴帘\'}');
INSERT INTO `basic_synsetwords` VALUES ('796', 'n04228054', '{\'ski\': \'滑雪板,滑水橇\'}');
INSERT INTO `basic_synsetwords` VALUES ('797', 'n04229816', '{\'ski mask\': \'滑雪面罩\'}');
INSERT INTO `basic_synsetwords` VALUES ('798', 'n04235860', '{\'sleeping bag\': \'睡袋\'}');
INSERT INTO `basic_synsetwords` VALUES ('799', 'n04238763', '{\'slide rule\': \'计算尺\', \'slipstick\': \'计算尺\'}');
INSERT INTO `basic_synsetwords` VALUES ('800', 'n04239074', '{\'sliding door\': \'推拉门\'}');
INSERT INTO `basic_synsetwords` VALUES ('801', 'n04243546', '{\'slot\': \'老虎机\', \'one-armed bandit\': \'赌博机\'}');
INSERT INTO `basic_synsetwords` VALUES ('802', 'n04251144', '{\'snorkel\': \'通气管,水下呼吸管\'}');
INSERT INTO `basic_synsetwords` VALUES ('803', 'n04252077', '{\'snowmobile\': \'雪车,雪上摩托车\'}');
INSERT INTO `basic_synsetwords` VALUES ('804', 'n04252225', '{\'snowplow\': \'除雪机\', \'snowplough\': \'除雪机\'}');
INSERT INTO `basic_synsetwords` VALUES ('805', 'n04254120', '{\'soap dispenser\': \'肥皂分配器,给皂水器\'}');
INSERT INTO `basic_synsetwords` VALUES ('806', 'n04254680', '{\'soccer ball\': \'足球\'}');
INSERT INTO `basic_synsetwords` VALUES ('807', 'n04254777', '{\'sock\': \'短袜\'}');
INSERT INTO `basic_synsetwords` VALUES ('808', 'n04258138', '{\'solar dish\': \'太阳能炤\', \'solar collector\': \'太阳能集热器\', \'solar furnace\': \'太阳炉\'}');
INSERT INTO `basic_synsetwords` VALUES ('809', 'n04259630', '{\'sombrero\': \'墨西哥的宽边帽\'}');
INSERT INTO `basic_synsetwords` VALUES ('810', 'n04263257', '{\'soup bowl\': \'汤碗\'}');
INSERT INTO `basic_synsetwords` VALUES ('811', 'n04264628', '{\'space bar\': \'空格键\'}');
INSERT INTO `basic_synsetwords` VALUES ('812', 'n04265275', '{\'space heater\': \'取暖器,小型供暖器\'}');
INSERT INTO `basic_synsetwords` VALUES ('813', 'n04266014', '{\'space shuttle\': \'航天飞机\'}');
INSERT INTO `basic_synsetwords` VALUES ('814', 'n04270147', '{\'spatula\': \'铲\'}');
INSERT INTO `basic_synsetwords` VALUES ('815', 'n04273569', '{\'speedboat\': \'快艇\'}');
INSERT INTO `basic_synsetwords` VALUES ('816', 'n04275548', '{\'spider web\': \'蜘蛛网\', \"spider\'s web\": \'蜘蛛网\'}');
INSERT INTO `basic_synsetwords` VALUES ('817', 'n04277352', '{\'spindle\': \'主轴\'}');
INSERT INTO `basic_synsetwords` VALUES ('818', 'n04285008', '{\'sports car\': \'跑车\', \'sport car\': \'跑车\'}');
INSERT INTO `basic_synsetwords` VALUES ('819', 'n04286575', '{\'spotlight\': \'聚光灯\', \'spot\': \'聚光灯\'}');
INSERT INTO `basic_synsetwords` VALUES ('820', 'n04296562', '{\'stage\': \'舞台\'}');
INSERT INTO `basic_synsetwords` VALUES ('821', 'n04310018', '{\'steam locomotive\': \'蒸汽机车\'}');
INSERT INTO `basic_synsetwords` VALUES ('822', 'n04311004', '{\'steel arch bridge\': \'钢拱桥\'}');
INSERT INTO `basic_synsetwords` VALUES ('823', 'n04311174', '{\'steel drum\': \'钢鼓\'}');
INSERT INTO `basic_synsetwords` VALUES ('824', 'n04317175', '{\'stethoscope\': \'听诊器\'}');
INSERT INTO `basic_synsetwords` VALUES ('825', 'n04325704', '{\'stole\': \'女用披肩\'}');
INSERT INTO `basic_synsetwords` VALUES ('826', 'n04326547', '{\'stone wall\': \'石墙\'}');
INSERT INTO `basic_synsetwords` VALUES ('827', 'n04328186', '{\'stopwatch\': \'秒表\', \'stop watch\': \'秒表\'}');
INSERT INTO `basic_synsetwords` VALUES ('828', 'n04330267', '{\'stove\': \'火炉\'}');
INSERT INTO `basic_synsetwords` VALUES ('829', 'n04332243', '{\'strainer\': \'过滤器\'}');
INSERT INTO `basic_synsetwords` VALUES ('830', 'n04335435', '{\'streetcar\': \'有轨电车\', \'tram\': \'有轨电车\', \'tramcar\': \'有轨电车\', \'trolley\': \'空中吊运车\', \'trolley car\': \'无轨电车\'}');
INSERT INTO `basic_synsetwords` VALUES ('831', 'n04336792', '{\'stretcher\': \'担架\'}');
INSERT INTO `basic_synsetwords` VALUES ('832', 'n04344873', '{\'studio couch\': \'工作室沙发\', \'day bed\': \'日间床\'}');
INSERT INTO `basic_synsetwords` VALUES ('833', 'n04346328', '{\'stupa\': \'佛塔\', \'tope\': \'佛塔\'}');
INSERT INTO `basic_synsetwords` VALUES ('834', 'n04347754', '{\'submarine\': \'潜艇\', \'pigboat\': \'潜艇\', \'sub\': \'潜艇\', \'U-boat\': \'潜水艇\'}');
INSERT INTO `basic_synsetwords` VALUES ('835', 'n04350905', '{\'suit\': \'套装\', \'suit of clothes\': \'服装套装\'}');
INSERT INTO `basic_synsetwords` VALUES ('836', 'n04355338', '{\'sundial\': \'日晷\'}');
INSERT INTO `basic_synsetwords` VALUES ('837', 'n04355933', '{\'sunglass\': \'太阳镜\'}');
INSERT INTO `basic_synsetwords` VALUES ('838', 'n04356056', '{\'sunglasses\': \'太阳镜\', \'dark glasses\': \'墨镜\', \'shades\': \'深色镜\'}');
INSERT INTO `basic_synsetwords` VALUES ('839', 'n04357314', '{\'sunscreen\': \'防晒霜\', \'sunblock\': \'防晒霜\', \'sun blocker\': \'防晒剂\'}');
INSERT INTO `basic_synsetwords` VALUES ('840', 'n04366367', '{\'suspension bridge\': \'悬索桥\'}');
INSERT INTO `basic_synsetwords` VALUES ('841', 'n04367480', '{\'swab\': \'拖把\', \'swob\': \'海绵拖把\', \'mop\': \'拖把\'}');
INSERT INTO `basic_synsetwords` VALUES ('842', 'n04370456', '{\'sweatshirt\': \'运动衫\'}');
INSERT INTO `basic_synsetwords` VALUES ('843', 'n04371430', '{\'swimming trunks\': \'泳裤\', \'bathing trunks\': \'游泳裤\'}');
INSERT INTO `basic_synsetwords` VALUES ('844', 'n04371774', '{\'swing\': \'秋千\'}');
INSERT INTO `basic_synsetwords` VALUES ('845', 'n04372370', '{\'switch\': \'开关\', \'electric switch\': \'电气开关\', \'electrical switch\': \'电气开关\'}');
INSERT INTO `basic_synsetwords` VALUES ('846', 'n04376876', '{\'syringe\': \'注射器\'}');
INSERT INTO `basic_synsetwords` VALUES ('847', 'n04380533', '{\'table lamp\': \'台灯\'}');
INSERT INTO `basic_synsetwords` VALUES ('848', 'n04389033', '{\'tank\': \'坦克\', \'army tank\': \'军用坦克\', \'armored combat vehicle\': \'装甲战车\', \'armoured combat vehicle\': \'装甲战斗车\'}');
INSERT INTO `basic_synsetwords` VALUES ('849', 'n04392985', '{\'tape player\': \'磁带播放机\'}');
INSERT INTO `basic_synsetwords` VALUES ('850', 'n04398044', '{\'teapot\': \'茶壶\'}');
INSERT INTO `basic_synsetwords` VALUES ('851', 'n04399382', '{\'teddy\': \'泰迪\', \'teddy bear\': \'泰迪熊\'}');
INSERT INTO `basic_synsetwords` VALUES ('852', 'n04404412', '{\'television\': \'电视\', \'television system\': \'电视系统\'}');
INSERT INTO `basic_synsetwords` VALUES ('853', 'n04409515', '{\'tennis ball\': \'网球\'}');
INSERT INTO `basic_synsetwords` VALUES ('854', 'n04417672', '{\'thatch\': \'茅草屋顶\', \'thatched roof\': \'茅草屋顶\'}');
INSERT INTO `basic_synsetwords` VALUES ('855', 'n04418357', '{\'theater curtain\': \'剧场帷幕\', \'theatre curtain\': \'剧场帷幕\'}');
INSERT INTO `basic_synsetwords` VALUES ('856', 'n04423845', '{\'thimble\': \'缝纫用的顶针\'}');
INSERT INTO `basic_synsetwords` VALUES ('857', 'n04428191', '{\'thresher\': \'脱粒机\', \'thrasher\': \'脱粒机\', \'threshing machine\': \'脱粒机\'}');
INSERT INTO `basic_synsetwords` VALUES ('858', 'n04429376', '{\'throne\': \'宝座\'}');
INSERT INTO `basic_synsetwords` VALUES ('859', 'n04435653', '{\'tile roof\': \'瓦屋顶\'}');
INSERT INTO `basic_synsetwords` VALUES ('860', 'n04442312', '{\'toaster\': \'烤面包机\'}');
INSERT INTO `basic_synsetwords` VALUES ('861', 'n04443257', '{\'tobacco shop\': \'烟草店\', \'tobacconist shop\': \'烟草店\', \'tobacconist\': \'烟草制品零售店\'}');
INSERT INTO `basic_synsetwords` VALUES ('862', 'n04447861', '{\'toilet seat\': \'马桶座,坐厕\'}');
INSERT INTO `basic_synsetwords` VALUES ('863', 'n04456115', '{\'torch\': \'火炬\'}');
INSERT INTO `basic_synsetwords` VALUES ('864', 'n04458633', '{\'totem pole\': \'图腾柱\'}');
INSERT INTO `basic_synsetwords` VALUES ('865', 'n04461696', '{\'tow truck\': \'拖车\', \'tow car\': \'拖车\', \'wrecker\': \'清障车\'}');
INSERT INTO `basic_synsetwords` VALUES ('866', 'n04462240', '{\'toyshop\': \'玩具店\'}');
INSERT INTO `basic_synsetwords` VALUES ('867', 'n04465501', '{\'tractor\': \'拖拉机\'}');
INSERT INTO `basic_synsetwords` VALUES ('868', 'n04467665', '{\'trailer truck\': \'拖车\', \'tractor trailer\': \'拖拉机挂车\', \'trucking rig\': \'铰链式拖车卡车\', \'rig\': \'拖车\', \'articulated lorry\': \'铰接式拖车卡车\', \'semi\': \'半拖车\'}');
INSERT INTO `basic_synsetwords` VALUES ('869', 'n04476259', '{\'tray\': \'托盘\'}');
INSERT INTO `basic_synsetwords` VALUES ('870', 'n04479046', '{\'trench coat\': \'风衣\'}');
INSERT INTO `basic_synsetwords` VALUES ('871', 'n04482393', '{\'tricycle\': \'三轮车\', \'trike\': \'三轮车\', \'velocipede\': \'脚踏车\'}');
INSERT INTO `basic_synsetwords` VALUES ('872', 'n04483307', '{\'trimaran\': \'三体船\'}');
INSERT INTO `basic_synsetwords` VALUES ('873', 'n04485082', '{\'tripod\': \'三脚架\'}');
INSERT INTO `basic_synsetwords` VALUES ('874', 'n04486054', '{\'triumphal arch\': \'凯旋门\'}');
INSERT INTO `basic_synsetwords` VALUES ('875', 'n04487081', '{\'trolleybus\': \'无轨电车\', \'trolley coach\': \'电车公车\', \'trackless trolley\': \'无轨电车\'}');
INSERT INTO `basic_synsetwords` VALUES ('876', 'n04487394', '{\'trombone\': \'长号\'}');
INSERT INTO `basic_synsetwords` VALUES ('877', 'n04493381', '{\'tub\': \'桶\', \'vat\': \'大桶\'}');
INSERT INTO `basic_synsetwords` VALUES ('878', 'n04501370', '{\'turnstile\': \'旋转栅门\'}');
INSERT INTO `basic_synsetwords` VALUES ('879', 'n04505470', '{\'typewriter keyboard\': \'打字机键盘\'}');
INSERT INTO `basic_synsetwords` VALUES ('880', 'n04507155', '{\'umbrella\': \'雨伞\'}');
INSERT INTO `basic_synsetwords` VALUES ('881', 'n04509417', '{\'unicycle\': \'独轮车\', \'monocycle\': \'独轮车\'}');
INSERT INTO `basic_synsetwords` VALUES ('882', 'n04515003', '{\'upright\': \'直立式钢琴\', \'upright piano\': \'直立钢琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('883', 'n04517823', '{\'vacuum\': \'吸尘器\', \'vacuum cleaner\': \'真空吸尘器\'}');
INSERT INTO `basic_synsetwords` VALUES ('884', 'n04522168', '{\'vase\': \'花瓶\'}');
INSERT INTO `basic_synsetwords` VALUES ('885', 'n04523525', '{\'vault\': \'拱顶\'}');
INSERT INTO `basic_synsetwords` VALUES ('886', 'n04525038', '{\'velvet\': \'天鹅绒,丝绒\'}');
INSERT INTO `basic_synsetwords` VALUES ('887', 'n04525305', '{\'vending machine\': \'自动售货机\'}');
INSERT INTO `basic_synsetwords` VALUES ('888', 'n04532106', '{\'vestment\': \'衣裳\'}');
INSERT INTO `basic_synsetwords` VALUES ('889', 'n04532670', '{\'viaduct\': \'高架桥\'}');
INSERT INTO `basic_synsetwords` VALUES ('890', 'n04536866', '{\'violin\': \'小提琴\', \'fiddle\': \'小提琴\'}');
INSERT INTO `basic_synsetwords` VALUES ('891', 'n04540053', '{\'volleyball\': \'排球\'}');
INSERT INTO `basic_synsetwords` VALUES ('892', 'n04542943', '{\'waffle iron\': \'华夫铁,用于制作华夫饼的对开式铁心\'}');
INSERT INTO `basic_synsetwords` VALUES ('893', 'n04548280', '{\'wall clock\': \'挂钟\'}');
INSERT INTO `basic_synsetwords` VALUES ('894', 'n04548362', '{\'wallet\': \'钱包\', \'billfold\': \'皮夹\', \'notecase\': \'钱包\', \'pocketbook\': \'钱包\'}');
INSERT INTO `basic_synsetwords` VALUES ('895', 'n04550184', '{\'wardrobe\': \'衣柜\', \'closet\': \'衣柜\', \'press\': \'衣箱\'}');
INSERT INTO `basic_synsetwords` VALUES ('896', 'n04552348', '{\'warplane\': \'军用飞机\', \'military plane\': \'军用飞机\'}');
INSERT INTO `basic_synsetwords` VALUES ('897', 'n04553703', '{\'washbasin\': \'洗脸盆\', \'handbasin\': \'手盆\', \'washbowl\': \'洗脸盆\', \'lavabo\': \'洗手盆\', \'wash-hand basin\': \'洗手盆\'}');
INSERT INTO `basic_synsetwords` VALUES ('898', 'n04554684', '{\'washer\': \'洗衣机\', \'automatic washer\': \'自动洗衣机\', \'washing machine\': \'洗衣机\'}');
INSERT INTO `basic_synsetwords` VALUES ('899', 'n04557648', '{\'water bottle\': \'水瓶\'}');
INSERT INTO `basic_synsetwords` VALUES ('900', 'n04560804', '{\'water jug\': \'水壶\'}');
INSERT INTO `basic_synsetwords` VALUES ('901', 'n04562935', '{\'water tower\': \'水塔\'}');
INSERT INTO `basic_synsetwords` VALUES ('902', 'n04579145', '{\'whiskey jug\': \'威士忌壶\'}');
INSERT INTO `basic_synsetwords` VALUES ('903', 'n04579432', '{\'whistle\': \'口哨\'}');
INSERT INTO `basic_synsetwords` VALUES ('904', 'n04584207', '{\'wig\': \'假发\'}');
INSERT INTO `basic_synsetwords` VALUES ('905', 'n04589890', '{\'window screen\': \'纱窗\'}');
INSERT INTO `basic_synsetwords` VALUES ('906', 'n04590129', '{\'window shade\': \'窗帘\'}');
INSERT INTO `basic_synsetwords` VALUES ('907', 'n04591157', '{\'Windsor tie\': \'温莎领带\'}');
INSERT INTO `basic_synsetwords` VALUES ('908', 'n04591713', '{\'wine bottle\': \'酒瓶\'}');
INSERT INTO `basic_synsetwords` VALUES ('909', 'n04592741', '{\'wing\': \'翼\'}');
INSERT INTO `basic_synsetwords` VALUES ('910', 'n04596742', '{\'wok\': \'炒锅\'}');
INSERT INTO `basic_synsetwords` VALUES ('911', 'n04597913', '{\'wooden spoon\': \'木勺\'}');
INSERT INTO `basic_synsetwords` VALUES ('912', 'n04599235', '{\'wool\': \'羊毛\', \'woolen\': \'毛纺\', \'woollen\': \'羊毛制的\'}');
INSERT INTO `basic_synsetwords` VALUES ('913', 'n04604644', '{\'worm fence\': \'蜗杆篱笆\', \'snake fence\': \'蛇篱笆\', \'snake-rail fence\': \'蛇栏围栏\', \'Virginia fence\': \'犬牙形篱笆\'}');
INSERT INTO `basic_synsetwords` VALUES ('914', 'n04606251', '{\'wreck\': \'残骸\'}');
INSERT INTO `basic_synsetwords` VALUES ('915', 'n04612504', '{\'yawl\': \'快艇,小帆船\'}');
INSERT INTO `basic_synsetwords` VALUES ('916', 'n04613696', '{\'yurt\': \'蒙古包\'}');
INSERT INTO `basic_synsetwords` VALUES ('917', 'n06359193', '{\'web site\': \'网站\', \'website\': \'网站\', \'internet site\': \'互联网站点\', \'site\': \'网站\'}');
INSERT INTO `basic_synsetwords` VALUES ('918', 'n06596364', '{\'comic book\': \'漫画书\'}');
INSERT INTO `basic_synsetwords` VALUES ('919', 'n06785654', '{\'crossword puzzle\': \'纵横字谜\', \'crossword\': \'纵横字谜\'}');
INSERT INTO `basic_synsetwords` VALUES ('920', 'n06794110', '{\'street sign\': \'路标\'}');
INSERT INTO `basic_synsetwords` VALUES ('921', 'n06874185', '{\'traffic light\': \'交通灯\', \'traffic signal\': \'交通信号灯\', \'stoplight\': \'信号灯\'}');
INSERT INTO `basic_synsetwords` VALUES ('922', 'n07248320', '{\'book jacket\': \'护封,书皮,皮书套\', \'dust cover\': \'防尘罩\', \'dust jacket\': \'防尘套\', \'dust wrapper\': \'防尘罩\'}');
INSERT INTO `basic_synsetwords` VALUES ('923', 'n07565083', '{\'menu\': \'菜单\'}');
INSERT INTO `basic_synsetwords` VALUES ('924', 'n07579787', '{\'plate\': \'盘子\'}');
INSERT INTO `basic_synsetwords` VALUES ('925', 'n07583066', '{\'guacamole\': \'鳄梨酱\'}');
INSERT INTO `basic_synsetwords` VALUES ('926', 'n07584110', '{\'consomme\': \'清汤\'}');
INSERT INTO `basic_synsetwords` VALUES ('927', 'n07590611', '{\'hot pot\': \'火锅\', \'hotpot\': \'火锅\'}');
INSERT INTO `basic_synsetwords` VALUES ('928', 'n07613480', '{\'trifle\': \'蛋糕\'}');
INSERT INTO `basic_synsetwords` VALUES ('929', 'n07614500', '{\'ice cream\': \'冰淇淋\', \'icecream\': \'冰淇淋\'}');
INSERT INTO `basic_synsetwords` VALUES ('930', 'n07615774', '{\'ice lolly\': \'冰棒棒糖\', \'lolly\': \'棒棒糖\', \'lollipop\': \'棒棒糖\', \'popsicle\': \'冰棒\'}');
INSERT INTO `basic_synsetwords` VALUES ('931', 'n07684084', '{\'French loaf\': \'法式面包\'}');
INSERT INTO `basic_synsetwords` VALUES ('932', 'n07693725', '{\'bagel\': \'百吉饼,硬面包圈\', \'beigel\': \'贝格尔条形饼干\'}');
INSERT INTO `basic_synsetwords` VALUES ('933', 'n07695742', '{\'pretzel\': \'椒盐脆饼\'}');
INSERT INTO `basic_synsetwords` VALUES ('934', 'n07697313', '{\'cheeseburger\': \'奶酪汉堡,芝士汉堡\'}');
INSERT INTO `basic_synsetwords` VALUES ('935', 'n07697537', '{\'hotdog\': \'热狗\', \'hot dog\': \'热狗\', \'red hot\': \'热狗\'}');
INSERT INTO `basic_synsetwords` VALUES ('936', 'n07711569', '{\'mashed potato\': \'马铃薯泥\'}');
INSERT INTO `basic_synsetwords` VALUES ('937', 'n07714571', '{\'head cabbage\': \'结球甘蓝\'}');
INSERT INTO `basic_synsetwords` VALUES ('938', 'n07714990', '{\'broccoli\': \'西兰花\'}');
INSERT INTO `basic_synsetwords` VALUES ('939', 'n07715103', '{\'cauliflower\': \'花椰菜\'}');
INSERT INTO `basic_synsetwords` VALUES ('940', 'n07716358', '{\'zucchini\': \'西葫芦\', \'courgette\': \'小胡瓜\'}');
INSERT INTO `basic_synsetwords` VALUES ('941', 'n07716906', '{\'spaghetti squash\': \'意大利面条南瓜\'}');
INSERT INTO `basic_synsetwords` VALUES ('942', 'n07717410', '{\'acorn squash\': \'小青南瓜\'}');
INSERT INTO `basic_synsetwords` VALUES ('943', 'n07717556', '{\'butternut squash\': \'胡瓜南瓜\'}');
INSERT INTO `basic_synsetwords` VALUES ('944', 'n07718472', '{\'cucumber\': \'黄瓜\', \'cuke\': \'小黄瓜\'}');
INSERT INTO `basic_synsetwords` VALUES ('945', 'n07718747', '{\'artichoke\': \'朝鲜蓟\', \'globe artichoke\': \'洋蓟\'}');
INSERT INTO `basic_synsetwords` VALUES ('946', 'n07720875', '{\'bell pepper\': \'甜椒\'}');
INSERT INTO `basic_synsetwords` VALUES ('947', 'n07730033', '{\'cardoon\': \'刺棘蓟,菜蓟\'}');
INSERT INTO `basic_synsetwords` VALUES ('948', 'n07734744', '{\'mushroom\': \'蘑菇\'}');
INSERT INTO `basic_synsetwords` VALUES ('949', 'n07742313', '{\'Granny Smith\': \'史密斯奶奶游戏\'}');
INSERT INTO `basic_synsetwords` VALUES ('950', 'n07745940', '{\'strawberry\': \'草莓\'}');
INSERT INTO `basic_synsetwords` VALUES ('951', 'n07747607', '{\'orange\': \'橙\'}');
INSERT INTO `basic_synsetwords` VALUES ('952', 'n07749582', '{\'lemon\': \'柠檬\'}');
INSERT INTO `basic_synsetwords` VALUES ('953', 'n07753113', '{\'fig\': \'无花果\'}');
INSERT INTO `basic_synsetwords` VALUES ('954', 'n07753275', '{\'pineapple\': \'菠萝\', \'ananas\': \'菠萝\'}');
INSERT INTO `basic_synsetwords` VALUES ('955', 'n07753592', '{\'banana\': \'香蕉\'}');
INSERT INTO `basic_synsetwords` VALUES ('956', 'n07754684', '{\'jackfruit\': \'菠萝蜜\', \'jak\': \'德诚榴莲干\', \'jack\': \'菠萝蜜\'}');
INSERT INTO `basic_synsetwords` VALUES ('957', 'n07760859', '{\'custard apple\': \'释迦凤梨\'}');
INSERT INTO `basic_synsetwords` VALUES ('958', 'n07768694', '{\'pomegranate\': \'石榴\'}');
INSERT INTO `basic_synsetwords` VALUES ('959', 'n07802026', '{\'hay\': \'干草\'}');
INSERT INTO `basic_synsetwords` VALUES ('960', 'n07831146', '{\'carbonara\': \'意大利烤面条加干酪沙司\'}');
INSERT INTO `basic_synsetwords` VALUES ('961', 'n07836838', '{\'chocolate sauce\': \'巧克力酱\', \'chocolate syrup\': \'巧克力糖浆\'}');
INSERT INTO `basic_synsetwords` VALUES ('962', 'n07860988', '{\'dough\': \'面团\'}');
INSERT INTO `basic_synsetwords` VALUES ('963', 'n07871810', '{\'meat loaf\': \'肉面包\', \'meatloaf\': \'肉饼\'}');
INSERT INTO `basic_synsetwords` VALUES ('964', 'n07873807', '{\'pizza\': \'披萨\', \'pizza pie\': \'比萨饼\'}');
INSERT INTO `basic_synsetwords` VALUES ('965', 'n07875152', '{\'potpie\': \'馅饼\'}');
INSERT INTO `basic_synsetwords` VALUES ('966', 'n07880968', '{\'burrito\': \'墨西哥煎饼\'}');
INSERT INTO `basic_synsetwords` VALUES ('967', 'n07892512', '{\'red wine\': \'红葡萄酒\'}');
INSERT INTO `basic_synsetwords` VALUES ('968', 'n07920052', '{\'espresso\': \'意大利浓咖啡\'}');
INSERT INTO `basic_synsetwords` VALUES ('969', 'n07930864', '{\'cup\': \'杯子\'}');
INSERT INTO `basic_synsetwords` VALUES ('970', 'n07932039', '{\'eggnog\': \'蛋奶酒\'}');
INSERT INTO `basic_synsetwords` VALUES ('971', 'n09193705', '{\'alp\': \'碱性磷酸酶染色试剂盒\'}');
INSERT INTO `basic_synsetwords` VALUES ('972', 'n09229709', '{\'bubble\': \'气泡\'}');
INSERT INTO `basic_synsetwords` VALUES ('973', 'n09246464', '{\'cliff\': \'悬崖\', \'drop\': \'悬崖\', \'drop-off\': \'悬崖\'}');
INSERT INTO `basic_synsetwords` VALUES ('974', 'n09256479', '{\'coral reef\': \'珊瑚礁\'}');
INSERT INTO `basic_synsetwords` VALUES ('975', 'n09288635', '{\'geyser\': \'间歇泉\'}');
INSERT INTO `basic_synsetwords` VALUES ('976', 'n09332890', '{\'lakeside\': \'湖滨\', \'lakeshore\': \'湖岸\'}');
INSERT INTO `basic_synsetwords` VALUES ('977', 'n09399592', '{\'promontory\': \'岬角\', \'headland\': \'岬角\', \'head\': \'前沿地\', \'foreland\': \'低岬,前陆\'}');
INSERT INTO `basic_synsetwords` VALUES ('978', 'n09421951', '{\'sandbar\': \'沙洲\', \'sand bar\': \'沙坝\'}');
INSERT INTO `basic_synsetwords` VALUES ('979', 'n09428293', '{\'seashore\': \'海滨\', \'coast\': \'海岸\', \'seacoast\': \'海岸线\', \'sea-coast\': \'海岸\'}');
INSERT INTO `basic_synsetwords` VALUES ('980', 'n09468604', '{\'valley\': \'山谷\', \'vale\': \'溪谷\'}');
INSERT INTO `basic_synsetwords` VALUES ('981', 'n09472597', '{\'volcano\': \'火山\'}');
INSERT INTO `basic_synsetwords` VALUES ('982', 'n09835506', '{\'ballplayer\': \'棒球运动员\', \'baseball player\': \'棒球运动员\'}');
INSERT INTO `basic_synsetwords` VALUES ('983', 'n10148035', '{\'groom\': \'新郎\', \'bridegroom\': \'新郎\'}');
INSERT INTO `basic_synsetwords` VALUES ('984', 'n10565667', '{\'scuba diver\': \'带水肺的潜水员\'}');
INSERT INTO `basic_synsetwords` VALUES ('985', 'n11879895', '{\'rapeseed\': \'油菜籽\'}');
INSERT INTO `basic_synsetwords` VALUES ('986', 'n11939491', '{\'daisy\': \'雏菊\'}');
INSERT INTO `basic_synsetwords` VALUES ('987', 'n12057211', '{\"yellow lady\'s slipper\": \'杓兰\', \'yellow lady-slipper\': \'杓兰\', \'Cypripedium calceolus\': \'杓兰\', \'Cypripedium parviflorum\': \'小花杓兰\'}');
INSERT INTO `basic_synsetwords` VALUES ('988', 'n12144580', '{\'corn\': \'玉米\'}');
INSERT INTO `basic_synsetwords` VALUES ('989', 'n12267677', '{\'acorn\': \'橡子\'}');
INSERT INTO `basic_synsetwords` VALUES ('990', 'n12620546', '{\'hip\': \'蔷薇果\', \'rose hip\': \'玫瑰果\', \'rosehip\': \'蔷薇果\'}');
INSERT INTO `basic_synsetwords` VALUES ('991', 'n12768682', '{\'buckeye\': \'七叶树\', \'horse chestnut\': \'马蹄栗\', \'conker\': \'七叶树果实\'}');
INSERT INTO `basic_synsetwords` VALUES ('992', 'n12985857', '{\'coral fungus\': \'珊瑚真菌\'}');
INSERT INTO `basic_synsetwords` VALUES ('993', 'n12998815', '{\'agaric\': \'木耳\'}');
INSERT INTO `basic_synsetwords` VALUES ('994', 'n13037406', '{\'gyromitra\': \'鹿花菌,大脑蘑菇\'}');
INSERT INTO `basic_synsetwords` VALUES ('995', 'n13040303', '{\'stinkhorn\': \'鬼笔菌\', \'carrion fungus\': \'腐肉真菌\'}');
INSERT INTO `basic_synsetwords` VALUES ('996', 'n13044778', '{\'earthstar\': \'地星真菌\'}');
INSERT INTO `basic_synsetwords` VALUES ('997', 'n13052670', '{\'hen-of-the-woods\': \'贝叶多孔菌\', \'hen of the woods\': \'贝叶多孔菌\', \'Polyporus frondosus\': \'贝叶多孔菌\', \'Grifola frondosa\': \'灰树花\'}');
INSERT INTO `basic_synsetwords` VALUES ('998', 'n13054560', '{\'bolete\': \'牛肝菌\'}');
INSERT INTO `basic_synsetwords` VALUES ('999', 'n13133613', '{\'ear\': \'耳朵\', \'spike\': \'道钉\', \'capitulum\': \'头状花序,骨小头\'}');
INSERT INTO `basic_synsetwords` VALUES ('1000', 'n15075141', '{\'toilet tissue\': \'厕纸\', \'toilet paper\': \'厕纸\', \'bathroom tissue\': \'浴室纸巾\'}');

-- ----------------------------
-- Table structure for `basic_unreadgroupmessage`
-- ----------------------------
DROP TABLE IF EXISTS `basic_unreadgroupmessage`;
CREATE TABLE `basic_unreadgroupmessage` (
  `unread_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`unread_id`),
  KEY `basic_unreadgroupmessage_message_id_0ef71639` (`message_id`),
  KEY `basic_unreadgroupmessage_user_id_45f42d08` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `basic_user`
-- ----------------------------
DROP TABLE IF EXISTS `basic_user`;
CREATE TABLE `basic_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `mobile` varchar(24) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `wechat_openid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `wechat_openid` (`wechat_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `basic_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `basic_user_groups`;
CREATE TABLE `basic_user_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `group_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basic_user_groups_user_id_group_id_86b4edd1_uniq` (`user_id`,`group_id`),
  KEY `basic_user_groups_user_id_ba9725c5` (`user_id`),
  KEY `basic_user_groups_group_id_25356540` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `basic_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `basic_user_user_permissions`;
CREATE TABLE `basic_user_user_permissions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `permission_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basic_user_user_permissions_user_id_permission_id_5a4e771a_uniq` (`user_id`,`permission_id`),
  KEY `basic_user_user_permissions_user_id_d426e311` (`user_id`),
  KEY `basic_user_user_permissions_permission_id_4fde920f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` text,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` text NOT NULL,
  `content_type_id` int(10) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` text NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
