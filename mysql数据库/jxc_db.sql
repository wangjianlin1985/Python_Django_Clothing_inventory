/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.6
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : localhost:3306
 Source Schema         : jxc_db

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : 65001

 Date: 12/02/2022 22:00:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 客户', 7, 'add_customer');
INSERT INTO `auth_permission` VALUES (26, 'Can change 客户', 7, 'change_customer');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 客户', 7, 'delete_customer');
INSERT INTO `auth_permission` VALUES (28, 'Can view 客户', 7, 'view_customer');
INSERT INTO `auth_permission` VALUES (29, 'Can add 服装', 8, 'add_clothes');
INSERT INTO `auth_permission` VALUES (30, 'Can change 服装', 8, 'change_clothes');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 服装', 8, 'delete_clothes');
INSERT INTO `auth_permission` VALUES (32, 'Can view 服装', 8, 'view_clothes');
INSERT INTO `auth_permission` VALUES (33, 'Can add 用户', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change 用户', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 用户', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add 入库单', 10, 'add_inorder');
INSERT INTO `auth_permission` VALUES (38, 'Can change 入库单', 10, 'change_inorder');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 入库单', 10, 'delete_inorder');
INSERT INTO `auth_permission` VALUES (40, 'Can view 入库单', 10, 'view_inorder');
INSERT INTO `auth_permission` VALUES (41, 'Can add 出库单', 11, 'add_outorder');
INSERT INTO `auth_permission` VALUES (42, 'Can change 出库单', 11, 'change_outorder');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 出库单', 11, 'delete_outorder');
INSERT INTO `auth_permission` VALUES (44, 'Can view 出库单', 11, 'view_outorder');
INSERT INTO `auth_permission` VALUES (45, 'Can add 出库单详情', 12, 'add_outorderclothes');
INSERT INTO `auth_permission` VALUES (46, 'Can change 出库单详情', 12, 'change_outorderclothes');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 出库单详情', 12, 'delete_outorderclothes');
INSERT INTO `auth_permission` VALUES (48, 'Can view 出库单详情', 12, 'view_outorderclothes');
INSERT INTO `auth_permission` VALUES (49, 'Can add 入库单详情', 13, 'add_inorderclothes');
INSERT INTO `auth_permission` VALUES (50, 'Can change 入库单详情', 13, 'change_inorderclothes');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 入库单详情', 13, 'delete_inorderclothes');
INSERT INTO `auth_permission` VALUES (52, 'Can view 入库单详情', 13, 'view_inorderclothes');
INSERT INTO `auth_permission` VALUES (53, 'Can add captcha store', 14, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (54, 'Can change captcha store', 14, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (55, 'Can delete captcha store', 14, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (56, 'Can view captcha store', 14, 'view_captchastore');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$m7wwPxAKJRF1$MOX2a9JqVendn/SdG+3UVtIC1R/yZXVosU4qmagLqeo=', '2022-02-12 21:54:27.812986', 1, 'manage', '', '', 'manage@126.com', 1, 1, '2022-02-12 21:53:59.127173');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (3, 'XBLD', 'xbld', '0aabf1bcad1e4e25a56d227eb8b530fa282d0fab', '2022-02-12 21:59:55.628215');
INSERT INTO `captcha_captchastore` VALUES (4, 'VWBV', 'vwbv', '56c548435e888e12f037dcd1201bf0c8ac28305e', '2022-02-12 21:59:57.045486');

-- ----------------------------
-- Table structure for common_clothes
-- ----------------------------
DROP TABLE IF EXISTS `common_clothes`;
CREATE TABLE `common_clothes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `size` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `common_clothes_sn_63efe1ea_uniq`(`sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_clothes
-- ----------------------------
INSERT INTO `common_clothes` VALUES (1, '春季女生上衣', 'SY0001', 128.00, 'S', '黄色', '很好看的衣服哦！', '2022-02-12 21:56:21.453502', '2022-02-12 21:57:59.043161', '', 51);
INSERT INTO `common_clothes` VALUES (2, '男生春季裤子', 'KZ001', 188.00, 'M', '红色', '很时尚的裤子哦！', '2022-02-12 21:59:30.088264', '2022-02-12 21:59:38.247895', '', 62);

-- ----------------------------
-- Table structure for common_customer
-- ----------------------------
DROP TABLE IF EXISTS `common_customer`;
CREATE TABLE `common_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_customer
-- ----------------------------
INSERT INTO `common_customer` VALUES (1, '李霞', '13511112222', 'lixia@163.com', '2022-02-12 21:55:28.334941', '2022-02-12 21:55:28.334941');

-- ----------------------------
-- Table structure for common_inorder
-- ----------------------------
DROP TABLE IF EXISTS `common_inorder`;
CREATE TABLE `common_inorder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `common_inorder_customer_id_9ff3a565_fk_common_customer_id`(`customer_id`) USING BTREE,
  INDEX `common_inorder_user_id_2767baf9_fk_common_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `common_inorder_customer_id_9ff3a565_fk_common_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `common_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `common_inorder_user_id_2767baf9_fk_common_user_id` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_inorder
-- ----------------------------
INSERT INTO `common_inorder` VALUES (1, 'IN2022021221562887397', '2022-02-12 21:56:28.481313', 1, 1, '2022-02-12 21:56:28.481313');

-- ----------------------------
-- Table structure for common_inorderclothes
-- ----------------------------
DROP TABLE IF EXISTS `common_inorderclothes`;
CREATE TABLE `common_inorderclothes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clothes_id` int(11) NOT NULL,
  `inorder_id` int(11) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `common_inorderclothes_clothes_id_345b224e_fk_common_clothes_id`(`clothes_id`) USING BTREE,
  INDEX `common_inorderclothes_inorder_id_56fd1670_fk_common_inorder_id`(`inorder_id`) USING BTREE,
  CONSTRAINT `common_inorderclothes_clothes_id_345b224e_fk_common_clothes_id` FOREIGN KEY (`clothes_id`) REFERENCES `common_clothes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `common_inorderclothes_inorder_id_56fd1670_fk_common_inorder_id` FOREIGN KEY (`inorder_id`) REFERENCES `common_inorder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_inorderclothes
-- ----------------------------
INSERT INTO `common_inorderclothes` VALUES (1, 1, 1, 3);
INSERT INTO `common_inorderclothes` VALUES (2, 2, 1, 2);

-- ----------------------------
-- Table structure for common_outorder
-- ----------------------------
DROP TABLE IF EXISTS `common_outorder`;
CREATE TABLE `common_outorder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `common_outorder_customer_id_bd9b4db3_fk_common_customer_id`(`customer_id`) USING BTREE,
  INDEX `common_outorder_user_id_27b2386b_fk_common_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `common_outorder_customer_id_bd9b4db3_fk_common_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `common_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `common_outorder_user_id_27b2386b_fk_common_user_id` FOREIGN KEY (`user_id`) REFERENCES `common_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_outorder
-- ----------------------------
INSERT INTO `common_outorder` VALUES (1, 'IN2022021221565150342', '2022-02-12 21:56:51.069702', 1, 1, '2022-02-12 21:56:51.069702');

-- ----------------------------
-- Table structure for common_outorderclothes
-- ----------------------------
DROP TABLE IF EXISTS `common_outorderclothes`;
CREATE TABLE `common_outorderclothes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clothes_id` int(11) NOT NULL,
  `outorder_id` int(11) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `common_outorderclothes_clothes_id_1d72f44f_fk_common_clothes_id`(`clothes_id`) USING BTREE,
  INDEX `common_outordercloth_outorder_id_32a6498c_fk_common_ou`(`outorder_id`) USING BTREE,
  CONSTRAINT `common_outordercloth_outorder_id_32a6498c_fk_common_ou` FOREIGN KEY (`outorder_id`) REFERENCES `common_outorder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `common_outorderclothes_clothes_id_1d72f44f_fk_common_clothes_id` FOREIGN KEY (`clothes_id`) REFERENCES `common_clothes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_outorderclothes
-- ----------------------------
INSERT INTO `common_outorderclothes` VALUES (1, 1, 1, 2);

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `modify_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of common_user
-- ----------------------------
INSERT INTO `common_user` VALUES (1, '林哥哥', 'user1', 'd94d479f2c371ab210b600a95c40fe7a4bdef0568a7f7bad0b27b727fd648980', '操作员', '2022-02-12 21:51:04.234090', '2022-02-12 21:51:04.235592');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (14, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (8, 'common', 'clothes');
INSERT INTO `django_content_type` VALUES (7, 'common', 'customer');
INSERT INTO `django_content_type` VALUES (10, 'common', 'inorder');
INSERT INTO `django_content_type` VALUES (13, 'common', 'inorderclothes');
INSERT INTO `django_content_type` VALUES (11, 'common', 'outorder');
INSERT INTO `django_content_type` VALUES (12, 'common', 'outorderclothes');
INSERT INTO `django_content_type` VALUES (9, 'common', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-02-12 21:50:01.192597');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-02-12 21:50:01.679926');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-02-12 21:50:02.064949');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-02-12 21:50:02.127584');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-12 21:50:02.139114');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-02-12 21:50:02.214313');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-02-12 21:50:02.255424');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-02-12 21:50:02.310069');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-02-12 21:50:02.326613');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-02-12 21:50:02.380255');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-02-12 21:50:02.388277');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-02-12 21:50:02.405321');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-02-12 21:50:02.460469');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-02-12 21:50:02.509599');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-02-12 21:50:02.548202');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-02-12 21:50:02.559732');
INSERT INTO `django_migrations` VALUES (17, 'captcha', '0001_initial', '2022-02-12 21:50:02.656991');
INSERT INTO `django_migrations` VALUES (18, 'common', '0001_initial', '2022-02-12 21:50:02.739210');
INSERT INTO `django_migrations` VALUES (19, 'common', '0002_auto_20191025_1818', '2022-02-12 21:50:02.753247');
INSERT INTO `django_migrations` VALUES (20, 'common', '0003_clothes', '2022-02-12 21:50:02.881086');
INSERT INTO `django_migrations` VALUES (21, 'common', '0004_clothes_number', '2022-02-12 21:50:02.939744');
INSERT INTO `django_migrations` VALUES (22, 'common', '0005_user', '2022-02-12 21:50:03.050037');
INSERT INTO `django_migrations` VALUES (23, 'common', '0006_auto_20191026_1244', '2022-02-12 21:50:03.444084');
INSERT INTO `django_migrations` VALUES (24, 'common', '0007_auto_20191026_1253', '2022-02-12 21:50:03.708294');
INSERT INTO `django_migrations` VALUES (25, 'common', '0008_auto_20191026_1308', '2022-02-12 21:50:03.908344');
INSERT INTO `django_migrations` VALUES (26, 'common', '0009_auto_20191028_1844', '2022-02-12 21:50:03.995551');
INSERT INTO `django_migrations` VALUES (27, 'common', '0010_auto_20191028_2141', '2022-02-12 21:50:04.383583');
INSERT INTO `django_migrations` VALUES (28, 'common', '0011_auto_20191103_2253', '2022-02-12 21:50:05.329599');
INSERT INTO `django_migrations` VALUES (29, 'common', '0012_auto_20191106_0818', '2022-02-12 21:50:05.378227');
INSERT INTO `django_migrations` VALUES (30, 'common', '0013_auto_20191106_0818', '2022-02-12 21:50:05.461450');
INSERT INTO `django_migrations` VALUES (31, 'common', '0014_auto_20191106_0844', '2022-02-12 21:50:05.522110');
INSERT INTO `django_migrations` VALUES (32, 'common', '0015_auto_20220212_2149', '2022-02-12 21:50:05.539657');
INSERT INTO `django_migrations` VALUES (33, 'sessions', '0001_initial', '2022-02-12 21:50:05.618868');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2kh043bn2n6cvlbnq4xm2nv9ifb62kex', 'NzRhMjkxMGFkNjkxMGMwODE0YjQzNmFlYzFkMThmYzQ0Mzg3ZmZhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGJhNmJmNmNkNWI3MmFkZjlkOTdhYmFhN2UyYTI1MjVjNjc3NWI1IiwiaXNfbG9naW4iOnRydWUsInVzZXJfaWQiOjEsInVzZXJfbmFtZSI6Ilx1Njc5N1x1NTRlNVx1NTRlNSIsInVzZXJfcm9sZSI6Ilx1NjRjZFx1NGY1Y1x1NTQ1OCJ9', '2022-02-12 22:29:39.873720');

SET FOREIGN_KEY_CHECKS = 1;
