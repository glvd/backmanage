/*
 Navicat Premium Data Transfer

 Source Server         : localdocker
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : GoAdminGroup

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 03/01/2020 16:46:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adm_menu
-- ----------------------------
DROP TABLE IF EXISTS `adm_menu`;
CREATE TABLE `adm_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_menu
-- ----------------------------
INSERT INTO `adm_menu` VALUES (1, 0, 1, 2, 'Admin', NULL, 'fa-tasks', '', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_menu` VALUES (2, 1, 1, 2, 'Users', NULL, 'fa-users', '/info/manager', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_menu` VALUES (3, 1, 1, 3, 'Roles', NULL, 'fa-user', '/info/roles', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_menu` VALUES (4, 1, 1, 4, 'Permission', NULL, 'fa-ban', '/info/permission', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_menu` VALUES (5, 1, 1, 5, 'Menu', NULL, 'fa-bars', '/menu', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_menu` VALUES (6, 1, 1, 6, 'Operation log', NULL, 'fa-history', '/info/op', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_menu` VALUES (7, 0, 1, 1, 'Dashboard', '', 'fa-bar-chart', '/', '2019-09-10 00:00:00', '2019-12-31 17:58:50');
INSERT INTO `adm_menu` VALUES (8, 15, 0, 7, '视频信息', '', 'fa-wpforms', '/info/videos', '2019-09-12 07:14:18', '2019-12-31 17:57:02');
INSERT INTO `adm_menu` VALUES (9, 0, 0, 10, '用户', NULL, 'fa-user', '/info/user', '2019-09-12 07:15:07', '2019-09-12 07:15:07');
INSERT INTO `adm_menu` VALUES (10, 0, 0, 11, '作者', NULL, 'fa-users', '/info/authors', '2019-09-12 07:16:04', '2019-09-12 07:16:04');
INSERT INTO `adm_menu` VALUES (11, 0, 0, 12, '文章', NULL, 'fa-file-powerpoint-o', '/info/posts', '2019-09-12 07:16:32', '2019-09-12 07:16:32');
INSERT INTO `adm_menu` VALUES (12, 0, 0, 13, 'Echarts', NULL, 'fa-area-chart', '/echarts', '2019-09-12 07:16:32', '2019-09-12 07:16:32');
INSERT INTO `adm_menu` VALUES (13, 0, 0, 14, '视频', '', 'fa-bars', '/video', '2019-12-19 06:34:58', '2019-12-19 06:34:58');
INSERT INTO `adm_menu` VALUES (14, 16, 0, 8, '节点状态', '', 'fa-automobile', '/info/nodes', '2019-12-24 06:45:24', '2019-12-31 17:57:13');
INSERT INTO `adm_menu` VALUES (15, 0, 0, 7, '视频管理', '', 'fa-video-camera', '', '2019-12-27 08:16:01', '2019-12-27 08:16:01');
INSERT INTO `adm_menu` VALUES (16, 0, 0, 8, '节点管理', '', 'fa-chain', '', '2019-12-27 08:17:12', '2019-12-27 08:17:12');
INSERT INTO `adm_menu` VALUES (17, 0, 0, 9, '文件管理', '', 'fa-bars', '', '2019-12-30 09:30:30', '2019-12-30 09:30:30');
INSERT INTO `adm_menu` VALUES (18, 17, 0, 9, '文件上传', '', 'fa-file-video-o', '/info/files', '2019-12-30 09:36:43', '2019-12-30 17:37:29');
INSERT INTO `adm_menu` VALUES (19, 15, 0, 1, '视频切片', '', 'fa-file-video-o', '/info/slices', '2019-12-31 09:56:08', '2019-12-31 09:56:08');

-- ----------------------------
-- Table structure for adm_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `adm_operation_log`;
CREATE TABLE `adm_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1474 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_operation_log
-- ----------------------------
INSERT INTO `adm_operation_log` VALUES (1, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-09-12 06:57:28', '2019-09-12 06:57:28');
INSERT INTO `adm_operation_log` VALUES (2, 1, '/admin/info/manager/new', 'GET', '127.0.0.1', '', '2019-09-12 06:57:30', '2019-09-12 06:57:30');
INSERT INTO `adm_operation_log` VALUES (3, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:13:53', '2019-09-12 07:13:53');
INSERT INTO `adm_operation_log` VALUES (4, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"icon\":[\"fa-wpforms\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"Form\"],\"uri\":[\"/form1\"]}', '2019-09-12 07:14:19', '2019-09-12 07:14:19');
INSERT INTO `adm_operation_log` VALUES (5, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"icon\":[\"fa-user\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"Users\"],\"uri\":[\"/info/user\"]}', '2019-09-12 07:15:07', '2019-09-12 07:15:07');
INSERT INTO `adm_operation_log` VALUES (6, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"icon\":[\"fa-users\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"Authors\"],\"uri\":[\"/info/authors\"]}', '2019-09-12 07:16:04', '2019-09-12 07:16:04');
INSERT INTO `adm_operation_log` VALUES (7, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"icon\":[\"fa-file-powerpoint-o\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"Posts\"],\"uri\":[\"/info/posts\"]}', '2019-09-12 07:16:32', '2019-09-12 07:16:32');
INSERT INTO `adm_operation_log` VALUES (8, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:35', '2019-09-12 07:16:35');
INSERT INTO `adm_operation_log` VALUES (9, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:36', '2019-09-12 07:16:36');
INSERT INTO `adm_operation_log` VALUES (10, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-09-12 07:16:37', '2019-09-12 07:16:37');
INSERT INTO `adm_operation_log` VALUES (11, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:37', '2019-09-12 07:16:37');
INSERT INTO `adm_operation_log` VALUES (12, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-09-12 07:16:39', '2019-09-12 07:16:39');
INSERT INTO `adm_operation_log` VALUES (13, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:39', '2019-09-12 07:16:39');
INSERT INTO `adm_operation_log` VALUES (14, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-09-12 07:16:40', '2019-09-12 07:16:40');
INSERT INTO `adm_operation_log` VALUES (15, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:40', '2019-09-12 07:16:40');
INSERT INTO `adm_operation_log` VALUES (16, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-09-12 07:16:41', '2019-09-12 07:16:41');
INSERT INTO `adm_operation_log` VALUES (17, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:41', '2019-09-12 07:16:41');
INSERT INTO `adm_operation_log` VALUES (18, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:43', '2019-09-12 07:16:43');
INSERT INTO `adm_operation_log` VALUES (19, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:47', '2019-09-12 07:16:47');
INSERT INTO `adm_operation_log` VALUES (20, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-12 07:16:47', '2019-09-12 07:16:47');
INSERT INTO `adm_operation_log` VALUES (21, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-09-12 07:16:58', '2019-09-12 07:16:58');
INSERT INTO `adm_operation_log` VALUES (22, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-09-12 07:16:59', '2019-09-12 07:16:59');
INSERT INTO `adm_operation_log` VALUES (23, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-09-12 07:17:05', '2019-09-12 07:17:05');
INSERT INTO `adm_operation_log` VALUES (24, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-09-12 07:17:06', '2019-09-12 07:17:06');
INSERT INTO `adm_operation_log` VALUES (25, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-09-12 07:17:07', '2019-09-12 07:17:07');
INSERT INTO `adm_operation_log` VALUES (26, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-09-12 07:17:10', '2019-09-12 07:17:10');
INSERT INTO `adm_operation_log` VALUES (27, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-09-12 07:17:11', '2019-09-12 07:17:11');
INSERT INTO `adm_operation_log` VALUES (28, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-09-12 07:17:12', '2019-09-12 07:17:12');
INSERT INTO `adm_operation_log` VALUES (29, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-09-19 21:38:47', '2019-09-19 21:38:47');
INSERT INTO `adm_operation_log` VALUES (30, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-09-19 21:39:14', '2019-09-19 21:39:14');
INSERT INTO `adm_operation_log` VALUES (31, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-09-19 21:39:27', '2019-09-19 21:39:27');
INSERT INTO `adm_operation_log` VALUES (32, 1, '/admin/info/roles', 'GET', '127.0.0.1', '', '2019-09-19 21:40:08', '2019-09-19 21:40:08');
INSERT INTO `adm_operation_log` VALUES (33, 1, '/admin/info/roles/edit', 'GET', '127.0.0.1', '', '2019-09-19 21:40:11', '2019-09-19 21:40:11');
INSERT INTO `adm_operation_log` VALUES (34, 1, '/admin/info/permission', 'GET', '127.0.0.1', '', '2019-09-19 21:40:15', '2019-09-19 21:40:15');
INSERT INTO `adm_operation_log` VALUES (35, 1, '/admin/info/permission/edit', 'GET', '127.0.0.1', '', '2019-09-19 21:40:18', '2019-09-19 21:40:18');
INSERT INTO `adm_operation_log` VALUES (36, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-19 21:40:21', '2019-09-19 21:40:21');
INSERT INTO `adm_operation_log` VALUES (37, 1, '/admin/info/permission', 'GET', '127.0.0.1', '', '2019-09-19 21:40:29', '2019-09-19 21:40:29');
INSERT INTO `adm_operation_log` VALUES (38, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-19 21:40:31', '2019-09-19 21:40:31');
INSERT INTO `adm_operation_log` VALUES (39, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-09-19 21:40:40', '2019-09-19 21:40:40');
INSERT INTO `adm_operation_log` VALUES (40, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-19 21:49:42', '2019-09-19 21:49:42');
INSERT INTO `adm_operation_log` VALUES (41, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"header\":[\"\"],\"icon\":[\"fa-bar-chart\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"E-Commerce\"],\"uri\":[\"\"]}', '2019-09-19 21:50:53', '2019-09-19 21:50:53');
INSERT INTO `adm_operation_log` VALUES (42, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"header\":[\"\"],\"icon\":[\"fa-area-chart\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"E-Commerce\"],\"uri\":[\"\"]}', '2019-09-19 21:53:50', '2019-09-19 21:53:50');
INSERT INTO `adm_operation_log` VALUES (43, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-19 21:58:39', '2019-09-19 21:58:39');
INSERT INTO `adm_operation_log` VALUES (44, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"header\":[\"\"],\"icon\":[\"fa-area-chart\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"E-Commerce\"],\"uri\":[\"\"]}', '2019-09-19 21:59:28', '2019-09-19 21:59:28');
INSERT INTO `adm_operation_log` VALUES (45, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"\"],\"header\":[\"\"],\"icon\":[\"fa-area-chart\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"E-Commerce\"],\"uri\":[\"\"]}', '2019-09-19 22:00:13', '2019-09-19 22:00:13');
INSERT INTO `adm_operation_log` VALUES (46, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-19 22:00:17', '2019-09-19 22:00:17');
INSERT INTO `adm_operation_log` VALUES (47, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-09-19 22:00:27', '2019-09-19 22:00:27');
INSERT INTO `adm_operation_log` VALUES (48, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-18 10:49:03', '2019-12-18 10:49:03');
INSERT INTO `adm_operation_log` VALUES (49, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-18 10:49:04', '2019-12-18 10:49:04');
INSERT INTO `adm_operation_log` VALUES (50, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-18 10:49:07', '2019-12-18 10:49:07');
INSERT INTO `adm_operation_log` VALUES (51, 1, '/admin/info/roles', 'GET', '127.0.0.1', '', '2019-12-18 10:55:21', '2019-12-18 10:55:21');
INSERT INTO `adm_operation_log` VALUES (52, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-18 10:55:22', '2019-12-18 10:55:22');
INSERT INTO `adm_operation_log` VALUES (53, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-18 10:55:24', '2019-12-18 10:55:24');
INSERT INTO `adm_operation_log` VALUES (54, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-18 10:55:27', '2019-12-18 10:55:27');
INSERT INTO `adm_operation_log` VALUES (55, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:08:37', '2019-12-19 06:08:37');
INSERT INTO `adm_operation_log` VALUES (56, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:09:00', '2019-12-19 06:09:00');
INSERT INTO `adm_operation_log` VALUES (57, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:09:27', '2019-12-19 06:09:27');
INSERT INTO `adm_operation_log` VALUES (58, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:09:27', '2019-12-19 06:09:27');
INSERT INTO `adm_operation_log` VALUES (59, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:09:29', '2019-12-19 06:09:29');
INSERT INTO `adm_operation_log` VALUES (60, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:09:30', '2019-12-19 06:09:30');
INSERT INTO `adm_operation_log` VALUES (61, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:13:29', '2019-12-19 06:13:29');
INSERT INTO `adm_operation_log` VALUES (62, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:13:33', '2019-12-19 06:13:33');
INSERT INTO `adm_operation_log` VALUES (63, 1, '/admin/info/op', 'GET', '127.0.0.1', '', '2019-12-19 06:13:34', '2019-12-19 06:13:34');
INSERT INTO `adm_operation_log` VALUES (64, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:13:36', '2019-12-19 06:13:36');
INSERT INTO `adm_operation_log` VALUES (65, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:13:38', '2019-12-19 06:13:38');
INSERT INTO `adm_operation_log` VALUES (66, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:13:38', '2019-12-19 06:13:38');
INSERT INTO `adm_operation_log` VALUES (67, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:25:22', '2019-12-19 06:25:22');
INSERT INTO `adm_operation_log` VALUES (68, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:25:35', '2019-12-19 06:25:35');
INSERT INTO `adm_operation_log` VALUES (69, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:25:35', '2019-12-19 06:25:35');
INSERT INTO `adm_operation_log` VALUES (70, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"90b7f852-4346-4691-80b6-cdfdad550a06\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"title\":[\"abc\"],\"uri\":[\"\"]}', '2019-12-19 06:34:44', '2019-12-19 06:34:44');
INSERT INTO `adm_operation_log` VALUES (71, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:34:53', '2019-12-19 06:34:53');
INSERT INTO `adm_operation_log` VALUES (72, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"21bba55b-4858-488a-ba06-e64c0e2f9a12\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"title\":[\"aaaaa\"],\"uri\":[\"\"]}', '2019-12-19 06:34:58', '2019-12-19 06:34:58');
INSERT INTO `adm_operation_log` VALUES (73, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:35:02', '2019-12-19 06:35:02');
INSERT INTO `adm_operation_log` VALUES (74, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:35:03', '2019-12-19 06:35:03');
INSERT INTO `adm_operation_log` VALUES (75, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:35:13', '2019-12-19 06:35:13');
INSERT INTO `adm_operation_log` VALUES (76, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:35:27', '2019-12-19 06:35:27');
INSERT INTO `adm_operation_log` VALUES (77, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:35:27', '2019-12-19 06:35:27');
INSERT INTO `adm_operation_log` VALUES (78, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:35:34', '2019-12-19 06:35:34');
INSERT INTO `adm_operation_log` VALUES (79, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:51:34', '2019-12-19 06:51:34');
INSERT INTO `adm_operation_log` VALUES (80, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:51:36', '2019-12-19 06:51:36');
INSERT INTO `adm_operation_log` VALUES (81, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:51:36', '2019-12-19 06:51:36');
INSERT INTO `adm_operation_log` VALUES (82, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:56:14', '2019-12-19 06:56:14');
INSERT INTO `adm_operation_log` VALUES (83, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:56:16', '2019-12-19 06:56:16');
INSERT INTO `adm_operation_log` VALUES (84, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:56:19', '2019-12-19 06:56:19');
INSERT INTO `adm_operation_log` VALUES (85, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"e3a6db09-ed1b-4bb6-b1d7-eb80bc408870\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"id\":[\"13\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"功能\"],\"uri\":[\"/admin/plugin\"]}', '2019-12-19 06:56:40', '2019-12-19 06:56:40');
INSERT INTO `adm_operation_log` VALUES (86, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:56:43', '2019-12-19 06:56:43');
INSERT INTO `adm_operation_log` VALUES (87, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"11077b1f-1f30-4a18-91bc-f6011290bea6\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"id\":[\"13\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"功能\"],\"uri\":[\"plugin\"]}', '2019-12-19 06:56:48', '2019-12-19 06:56:48');
INSERT INTO `adm_operation_log` VALUES (88, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 06:56:51', '2019-12-19 06:56:51');
INSERT INTO `adm_operation_log` VALUES (89, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"201937d6-5109-448d-a74d-725ee7a59c25\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"id\":[\"13\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"功能\"],\"uri\":[\"/plugin\"]}', '2019-12-19 06:56:55', '2019-12-19 06:56:55');
INSERT INTO `adm_operation_log` VALUES (90, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:57:12', '2019-12-19 06:57:12');
INSERT INTO `adm_operation_log` VALUES (91, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:57:14', '2019-12-19 06:57:14');
INSERT INTO `adm_operation_log` VALUES (92, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:57:20', '2019-12-19 06:57:20');
INSERT INTO `adm_operation_log` VALUES (93, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:57:22', '2019-12-19 06:57:22');
INSERT INTO `adm_operation_log` VALUES (94, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 06:57:28', '2019-12-19 06:57:28');
INSERT INTO `adm_operation_log` VALUES (95, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 07:01:29', '2019-12-19 07:01:29');
INSERT INTO `adm_operation_log` VALUES (96, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 07:01:34', '2019-12-19 07:01:34');
INSERT INTO `adm_operation_log` VALUES (97, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 07:01:37', '2019-12-19 07:01:37');
INSERT INTO `adm_operation_log` VALUES (98, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 07:01:38', '2019-12-19 07:01:38');
INSERT INTO `adm_operation_log` VALUES (99, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 07:01:43', '2019-12-19 07:01:43');
INSERT INTO `adm_operation_log` VALUES (100, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 07:01:55', '2019-12-19 07:01:55');
INSERT INTO `adm_operation_log` VALUES (101, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 07:06:48', '2019-12-19 07:06:48');
INSERT INTO `adm_operation_log` VALUES (102, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 07:31:02', '2019-12-19 07:31:02');
INSERT INTO `adm_operation_log` VALUES (103, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-19 07:31:04', '2019-12-19 07:31:04');
INSERT INTO `adm_operation_log` VALUES (104, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"06190059-6636-4609-b6b9-d8e14574596b\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"id\":[\"13\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"视频\"],\"uri\":[\"/video\"]}', '2019-12-19 07:31:14', '2019-12-19 07:31:14');
INSERT INTO `adm_operation_log` VALUES (105, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 07:53:01', '2019-12-19 07:53:01');
INSERT INTO `adm_operation_log` VALUES (106, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:45:07', '2019-12-19 10:45:07');
INSERT INTO `adm_operation_log` VALUES (107, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:45:15', '2019-12-19 10:45:15');
INSERT INTO `adm_operation_log` VALUES (108, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:45:16', '2019-12-19 10:45:16');
INSERT INTO `adm_operation_log` VALUES (109, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:45:17', '2019-12-19 10:45:17');
INSERT INTO `adm_operation_log` VALUES (110, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:46:21', '2019-12-19 10:46:21');
INSERT INTO `adm_operation_log` VALUES (111, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:46:46', '2019-12-19 10:46:46');
INSERT INTO `adm_operation_log` VALUES (112, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 10:46:52', '2019-12-19 10:46:52');
INSERT INTO `adm_operation_log` VALUES (113, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:46:54', '2019-12-19 10:46:54');
INSERT INTO `adm_operation_log` VALUES (114, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:46:55', '2019-12-19 10:46:55');
INSERT INTO `adm_operation_log` VALUES (115, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:46:56', '2019-12-19 10:46:56');
INSERT INTO `adm_operation_log` VALUES (116, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 10:46:57', '2019-12-19 10:46:57');
INSERT INTO `adm_operation_log` VALUES (117, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:46:57', '2019-12-19 10:46:57');
INSERT INTO `adm_operation_log` VALUES (118, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:46:58', '2019-12-19 10:46:58');
INSERT INTO `adm_operation_log` VALUES (119, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:46:59', '2019-12-19 10:46:59');
INSERT INTO `adm_operation_log` VALUES (120, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 10:46:59', '2019-12-19 10:46:59');
INSERT INTO `adm_operation_log` VALUES (121, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-12-19 10:48:52', '2019-12-19 10:48:52');
INSERT INTO `adm_operation_log` VALUES (122, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:48:54', '2019-12-19 10:48:54');
INSERT INTO `adm_operation_log` VALUES (123, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 10:48:56', '2019-12-19 10:48:56');
INSERT INTO `adm_operation_log` VALUES (124, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:48:57', '2019-12-19 10:48:57');
INSERT INTO `adm_operation_log` VALUES (125, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:48:58', '2019-12-19 10:48:58');
INSERT INTO `adm_operation_log` VALUES (126, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:49:05', '2019-12-19 10:49:05');
INSERT INTO `adm_operation_log` VALUES (127, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-12-19 10:49:09', '2019-12-19 10:49:09');
INSERT INTO `adm_operation_log` VALUES (128, 1, '/admin/info/roles', 'GET', '127.0.0.1', '', '2019-12-19 10:49:10', '2019-12-19 10:49:10');
INSERT INTO `adm_operation_log` VALUES (129, 1, '/admin/info/permission', 'GET', '127.0.0.1', '', '2019-12-19 10:49:11', '2019-12-19 10:49:11');
INSERT INTO `adm_operation_log` VALUES (130, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 10:49:11', '2019-12-19 10:49:11');
INSERT INTO `adm_operation_log` VALUES (131, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 10:49:13', '2019-12-19 10:49:13');
INSERT INTO `adm_operation_log` VALUES (132, 1, '/admin/info/permission', 'GET', '127.0.0.1', '', '2019-12-19 10:49:13', '2019-12-19 10:49:13');
INSERT INTO `adm_operation_log` VALUES (133, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 10:49:39', '2019-12-19 10:49:39');
INSERT INTO `adm_operation_log` VALUES (134, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:49:44', '2019-12-19 10:49:44');
INSERT INTO `adm_operation_log` VALUES (135, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 10:51:34', '2019-12-19 10:51:34');
INSERT INTO `adm_operation_log` VALUES (136, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 10:51:40', '2019-12-19 10:51:40');
INSERT INTO `adm_operation_log` VALUES (137, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:51:41', '2019-12-19 10:51:41');
INSERT INTO `adm_operation_log` VALUES (138, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 10:51:57', '2019-12-19 10:51:57');
INSERT INTO `adm_operation_log` VALUES (139, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:52:06', '2019-12-19 10:52:06');
INSERT INTO `adm_operation_log` VALUES (140, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-19 10:52:43', '2019-12-19 10:52:43');
INSERT INTO `adm_operation_log` VALUES (141, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:55:03', '2019-12-19 10:55:03');
INSERT INTO `adm_operation_log` VALUES (142, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:55:13', '2019-12-19 10:55:13');
INSERT INTO `adm_operation_log` VALUES (143, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:55:17', '2019-12-19 10:55:17');
INSERT INTO `adm_operation_log` VALUES (144, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:56:19', '2019-12-19 10:56:19');
INSERT INTO `adm_operation_log` VALUES (145, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:56:30', '2019-12-19 10:56:30');
INSERT INTO `adm_operation_log` VALUES (146, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:56:35', '2019-12-19 10:56:35');
INSERT INTO `adm_operation_log` VALUES (147, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:56:36', '2019-12-19 10:56:36');
INSERT INTO `adm_operation_log` VALUES (148, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:56:37', '2019-12-19 10:56:37');
INSERT INTO `adm_operation_log` VALUES (149, 1, '/admin/info/roles', 'GET', '127.0.0.1', '', '2019-12-19 10:58:25', '2019-12-19 10:58:25');
INSERT INTO `adm_operation_log` VALUES (150, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:58:26', '2019-12-19 10:58:26');
INSERT INTO `adm_operation_log` VALUES (151, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:58:28', '2019-12-19 10:58:28');
INSERT INTO `adm_operation_log` VALUES (152, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 10:58:29', '2019-12-19 10:58:29');
INSERT INTO `adm_operation_log` VALUES (153, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-19 10:58:30', '2019-12-19 10:58:30');
INSERT INTO `adm_operation_log` VALUES (154, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-19 10:58:30', '2019-12-19 10:58:30');
INSERT INTO `adm_operation_log` VALUES (155, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-19 10:58:30', '2019-12-19 10:58:30');
INSERT INTO `adm_operation_log` VALUES (156, 1, '/admin/info/permission', 'GET', '127.0.0.1', '', '2019-12-19 10:58:32', '2019-12-19 10:58:32');
INSERT INTO `adm_operation_log` VALUES (157, 1, '/admin/info/roles', 'GET', '127.0.0.1', '', '2019-12-19 10:58:33', '2019-12-19 10:58:33');
INSERT INTO `adm_operation_log` VALUES (158, 1, '/admin/info/op', 'GET', '127.0.0.1', '', '2019-12-19 10:58:34', '2019-12-19 10:58:34');
INSERT INTO `adm_operation_log` VALUES (159, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-20 05:03:19', '2019-12-20 05:03:19');
INSERT INTO `adm_operation_log` VALUES (160, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-20 05:03:29', '2019-12-20 05:03:29');
INSERT INTO `adm_operation_log` VALUES (161, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"1aecb354-bc92-4164-ac92-899d10517e45\"],\"header\":[\"\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频\"],\"uri\":[\"/videos\"]}', '2019-12-20 05:03:42', '2019-12-20 05:03:42');
INSERT INTO `adm_operation_log` VALUES (162, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-20 05:04:52', '2019-12-20 05:04:52');
INSERT INTO `adm_operation_log` VALUES (163, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-20 05:04:54', '2019-12-20 05:04:54');
INSERT INTO `adm_operation_log` VALUES (164, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"b8564ceb-4957-4675-81d1-4b44a1b4ebe2\"],\"header\":[\"\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频\"],\"uri\":[\"/info/videos\"]}', '2019-12-20 05:04:59', '2019-12-20 05:04:59');
INSERT INTO `adm_operation_log` VALUES (165, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:05:01', '2019-12-20 05:05:01');
INSERT INTO `adm_operation_log` VALUES (166, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:05:45', '2019-12-20 05:05:45');
INSERT INTO `adm_operation_log` VALUES (167, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-20 05:05:50', '2019-12-20 05:05:50');
INSERT INTO `adm_operation_log` VALUES (168, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:05:51', '2019-12-20 05:05:51');
INSERT INTO `adm_operation_log` VALUES (169, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-20 05:05:52', '2019-12-20 05:05:52');
INSERT INTO `adm_operation_log` VALUES (170, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:05:57', '2019-12-20 05:05:57');
INSERT INTO `adm_operation_log` VALUES (171, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 05:06:06', '2019-12-20 05:06:06');
INSERT INTO `adm_operation_log` VALUES (172, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:06:12', '2019-12-20 05:06:12');
INSERT INTO `adm_operation_log` VALUES (173, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 05:06:30', '2019-12-20 05:06:30');
INSERT INTO `adm_operation_log` VALUES (174, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:06:59', '2019-12-20 05:06:59');
INSERT INTO `adm_operation_log` VALUES (175, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:07:01', '2019-12-20 05:07:01');
INSERT INTO `adm_operation_log` VALUES (176, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:07:03', '2019-12-20 05:07:03');
INSERT INTO `adm_operation_log` VALUES (177, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:07:04', '2019-12-20 05:07:04');
INSERT INTO `adm_operation_log` VALUES (178, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:07:04', '2019-12-20 05:07:04');
INSERT INTO `adm_operation_log` VALUES (179, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 05:09:43', '2019-12-20 05:09:43');
INSERT INTO `adm_operation_log` VALUES (180, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:11:53', '2019-12-20 05:11:53');
INSERT INTO `adm_operation_log` VALUES (181, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 05:11:55', '2019-12-20 05:11:55');
INSERT INTO `adm_operation_log` VALUES (182, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6f1f20b2-d5cb-4875-883e-12252c5f16b1\"],\"added\":[\"1981-08-05 00:34:46\"],\"birthdate\":[\"1987-04-12\"],\"email\":[\"hilario.padberg@example.org\"],\"id\":[\"100\"],\"last_name\":[\"Walker\"]}', '2019-12-20 05:12:18', '2019-12-20 05:12:18');
INSERT INTO `adm_operation_log` VALUES (183, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9fe498f3-aaf4-4597-83e4-3dbf9a3a06e5\"],\"added\":[\"1981-08-05 00:34:46\"],\"birthdate\":[\"1987-04-12\"],\"email\":[\"hilario.padberg@example.org\"],\"id\":[\"100\"],\"last_name\":[\"Walker\"],\"poster\":[\"1efe00f9-4f73-4266-88e6-961b7726ce1f.jpg\"]}', '2019-12-20 05:13:03', '2019-12-20 05:13:03');
INSERT INTO `adm_operation_log` VALUES (184, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:13:10', '2019-12-20 05:13:10');
INSERT INTO `adm_operation_log` VALUES (185, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 05:13:12', '2019-12-20 05:13:12');
INSERT INTO `adm_operation_log` VALUES (186, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"132f5560-1d03-4671-8f58-7459ab08e79a\"],\"added\":[\"1981-08-05 00:34:46\"],\"birthdate\":[\"1987-04-12\"],\"email\":[\"hilario.padberg@example.org\"],\"id\":[\"100\"],\"last_name\":[\"Walker\"],\"poster\":[\"4c356164-f714-45d9-b247-37c1ae828530.jpg\"]}', '2019-12-20 05:13:18', '2019-12-20 05:13:18');
INSERT INTO `adm_operation_log` VALUES (187, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e31bc487-bfb7-4670-aef6-bce961b7ef85\"],\"added\":[\"1981-08-05 00:34:46\"],\"birthdate\":[\"1987-04-12\"],\"email\":[\"hilario.padberg@example.org\"],\"id\":[\"100\"],\"last_name\":[\"Walker\"],\"poster\":[\"\"]}', '2019-12-20 05:13:20', '2019-12-20 05:13:20');
INSERT INTO `adm_operation_log` VALUES (188, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"0a1a14e7-9d82-48f0-b04d-332da41a16c7\"],\"added\":[\"1981-08-05 00:34:46\"],\"birthdate\":[\"1987-04-12\"],\"email\":[\"hilario.padberg@example.org\"],\"id\":[\"100\"],\"last_name\":[\"Walker\"],\"poster\":[\"\"]}', '2019-12-20 05:13:20', '2019-12-20 05:13:20');
INSERT INTO `adm_operation_log` VALUES (189, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f5be0ec8-89de-48c6-8f78-85ef18ee575a\"],\"added\":[\"1981-08-05 00:34:46\"],\"birthdate\":[\"1987-04-12\"],\"email\":[\"hilario.padberg@example.org\"],\"id\":[\"100\"],\"last_name\":[\"Walker\"],\"poster\":[\"\"]}', '2019-12-20 05:13:21', '2019-12-20 05:13:21');
INSERT INTO `adm_operation_log` VALUES (190, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"4b3b109c-2b9e-4846-96c8-daa3510f546a\"],\"added\":[\"1981-08-05 00:34:46\"],\"birthdate\":[\"1987-04-12\"],\"email\":[\"hilario.padberg@example.org\"],\"id\":[\"100\"],\"last_name\":[\"Walker\"],\"poster\":[\"dcea8c17-00fe-4c15-8336-3dfaa189f861.jpg\"]}', '2019-12-20 05:15:00', '2019-12-20 05:15:00');
INSERT INTO `adm_operation_log` VALUES (191, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:15:20', '2019-12-20 05:15:20');
INSERT INTO `adm_operation_log` VALUES (192, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 05:50:12', '2019-12-20 05:50:12');
INSERT INTO `adm_operation_log` VALUES (193, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b76d8ce2-a73e-471a-898e-c3b6a8c0e9c8\"],\"added\":[\"1971-09-03 23:24:33\"],\"birthdate\":[\"1981-11-21\"],\"email\":[\"xleannon@example.org\"],\"id\":[\"99\"],\"last_name\":[\"Barton\"],\"poster\":[\"818b4ca6-bf5b-4bad-84b3-df913c240bca.jpg\"]}', '2019-12-20 05:50:19', '2019-12-20 05:50:19');
INSERT INTO `adm_operation_log` VALUES (194, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:51:40', '2019-12-20 05:51:40');
INSERT INTO `adm_operation_log` VALUES (195, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:51:43', '2019-12-20 05:51:43');
INSERT INTO `adm_operation_log` VALUES (196, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:52:07', '2019-12-20 05:52:07');
INSERT INTO `adm_operation_log` VALUES (197, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:52:14', '2019-12-20 05:52:14');
INSERT INTO `adm_operation_log` VALUES (198, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:52:42', '2019-12-20 05:52:42');
INSERT INTO `adm_operation_log` VALUES (199, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 05:52:45', '2019-12-20 05:52:45');
INSERT INTO `adm_operation_log` VALUES (200, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 05:52:54', '2019-12-20 05:52:54');
INSERT INTO `adm_operation_log` VALUES (201, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 06:14:34', '2019-12-20 06:14:34');
INSERT INTO `adm_operation_log` VALUES (202, 1, '/admin/info/818b4ca6-bf5b-4bad-84b3-df913c240bca.jpg', 'GET', '127.0.0.1', '', '2019-12-20 06:14:34', '2019-12-20 06:14:34');
INSERT INTO `adm_operation_log` VALUES (203, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 06:14:55', '2019-12-20 06:14:55');
INSERT INTO `adm_operation_log` VALUES (204, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 06:16:09', '2019-12-20 06:16:09');
INSERT INTO `adm_operation_log` VALUES (205, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 06:18:37', '2019-12-20 06:18:37');
INSERT INTO `adm_operation_log` VALUES (206, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 06:18:53', '2019-12-20 06:18:53');
INSERT INTO `adm_operation_log` VALUES (207, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 06:19:17', '2019-12-20 06:19:17');
INSERT INTO `adm_operation_log` VALUES (208, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:39:21', '2019-12-20 06:39:21');
INSERT INTO `adm_operation_log` VALUES (209, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f2912890-eac7-4861-8110-2f666abfccee\"],\"added\":[\"\"],\"poster\":[\"f3c45d39-3c94-41c9-b946-9dabd6988721.jpg\"]}', '2019-12-20 06:40:08', '2019-12-20 06:40:08');
INSERT INTO `adm_operation_log` VALUES (210, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"d517279c-caf5-4f30-8c17-f5db7733a031\"],\"added\":[\"1981-08-05 00:34:46\"],\"poster\":[\"\"]}', '2019-12-20 06:40:14', '2019-12-20 06:40:14');
INSERT INTO `adm_operation_log` VALUES (211, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:41:59', '2019-12-20 06:41:59');
INSERT INTO `adm_operation_log` VALUES (212, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c3dce8b0-36b9-40ce-aeff-e786f58c191b\"],\"added\":[\"\"],\"poster\":[\"cbf2683a-769d-4d7f-982a-542d80dadacc.jpg\"]}', '2019-12-20 06:42:05', '2019-12-20 06:42:05');
INSERT INTO `adm_operation_log` VALUES (213, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"88ead4c1-fe2d-4fcd-b432-e72db01945f8\"],\"added\":[\"1981-08-05 00:34:46\"],\"poster\":[\"cc73a074-ca29-4f29-8b15-f61ab0250337.jpg\"]}', '2019-12-20 06:42:15', '2019-12-20 06:42:15');
INSERT INTO `adm_operation_log` VALUES (214, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:42:54', '2019-12-20 06:42:54');
INSERT INTO `adm_operation_log` VALUES (215, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:43:22', '2019-12-20 06:43:22');
INSERT INTO `adm_operation_log` VALUES (216, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:43:37', '2019-12-20 06:43:37');
INSERT INTO `adm_operation_log` VALUES (217, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:44:14', '2019-12-20 06:44:14');
INSERT INTO `adm_operation_log` VALUES (218, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:44:15', '2019-12-20 06:44:15');
INSERT INTO `adm_operation_log` VALUES (219, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:47:10', '2019-12-20 06:47:10');
INSERT INTO `adm_operation_log` VALUES (220, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:47:45', '2019-12-20 06:47:45');
INSERT INTO `adm_operation_log` VALUES (221, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e001da51-d7a5-428d-84a7-b8a190d919c3\"],\"added\":[\"2019-12-20 14:47:51\"],\"poster\":[\"cdd03c19-5136-4937-9814-5ee55134913d.jpg\"]}', '2019-12-20 06:47:58', '2019-12-20 06:47:58');
INSERT INTO `adm_operation_log` VALUES (222, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:49:55', '2019-12-20 06:49:55');
INSERT INTO `adm_operation_log` VALUES (223, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:50:20', '2019-12-20 06:50:20');
INSERT INTO `adm_operation_log` VALUES (224, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 06:50:22', '2019-12-20 06:50:22');
INSERT INTO `adm_operation_log` VALUES (225, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:50:25', '2019-12-20 06:50:25');
INSERT INTO `adm_operation_log` VALUES (226, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:51:37', '2019-12-20 06:51:37');
INSERT INTO `adm_operation_log` VALUES (227, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"0f29da6a-304b-4ffb-84e0-e3f68e95d242\"],\"added\":[\"2019-12-20 14:51:42\"],\"poster\":[\"5b98a6d5-81bf-456f-9e16-e1c26d15568c.jpg\"]}', '2019-12-20 06:51:44', '2019-12-20 06:51:44');
INSERT INTO `adm_operation_log` VALUES (228, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:52:23', '2019-12-20 06:52:23');
INSERT INTO `adm_operation_log` VALUES (229, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:55:49', '2019-12-20 06:55:49');
INSERT INTO `adm_operation_log` VALUES (230, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:56:40', '2019-12-20 06:56:40');
INSERT INTO `adm_operation_log` VALUES (231, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 06:57:34', '2019-12-20 06:57:34');
INSERT INTO `adm_operation_log` VALUES (232, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:00:12', '2019-12-20 07:00:12');
INSERT INTO `adm_operation_log` VALUES (233, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:00:16', '2019-12-20 07:00:16');
INSERT INTO `adm_operation_log` VALUES (234, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:00:33', '2019-12-20 07:00:33');
INSERT INTO `adm_operation_log` VALUES (235, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-20 07:22:22', '2019-12-20 07:22:22');
INSERT INTO `adm_operation_log` VALUES (236, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:22:25', '2019-12-20 07:22:25');
INSERT INTO `adm_operation_log` VALUES (237, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:22:27', '2019-12-20 07:22:27');
INSERT INTO `adm_operation_log` VALUES (238, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"70be8d0e-36b6-42ec-8dbc-ff276bf579b8\"],\"added\":[\"2019-12-20 15:22:33\"],\"poster\":[\"dba23288-68c0-4c51-8912-20e6d776075b.jpg\"]}', '2019-12-20 07:22:35', '2019-12-20 07:22:35');
INSERT INTO `adm_operation_log` VALUES (239, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:23:28', '2019-12-20 07:23:28');
INSERT INTO `adm_operation_log` VALUES (240, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"http://localhost:9033/admin/new/videos\"],\"_t\":[\"b83059a7-2ad8-478a-9ac0-314e493338ba\"],\"added\":[\"2019-12-20 15:23:34\"],\"id\":[\"9e1db564-22f9-11ea-a9f3-00155d012d1c\",\"9e1db564-22f9-11ea-a9f3-00155d012d1c\"],\"poster\":[\"b2c1f286-950f-4dc0-8919-f97314c2c376.jpg\"]}', '2019-12-20 07:23:36', '2019-12-20 07:23:36');
INSERT INTO `adm_operation_log` VALUES (241, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:24:17', '2019-12-20 07:24:17');
INSERT INTO `adm_operation_log` VALUES (242, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:24:56', '2019-12-20 07:24:56');
INSERT INTO `adm_operation_log` VALUES (243, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"http://localhost:9033/admin/new/videos\"],\"_t\":[\"f5a6af1c-51ea-4882-a52b-aa663fbf2130\"],\"added\":[\"2019-12-20 15:25:01\"],\"id\":[\"d2a041c7-22f9-11ea-a06b-00155d012d1c\",\"d2a041c7-22f9-11ea-a06b-00155d012d1c\"],\"poster\":[\"b38a479a-95ea-4ca4-b31f-b648de3ca69c.jpg\"]}', '2019-12-20 07:25:02', '2019-12-20 07:25:02');
INSERT INTO `adm_operation_log` VALUES (244, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:25:48', '2019-12-20 07:25:48');
INSERT INTO `adm_operation_log` VALUES (245, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"http://localhost:9033/admin/new/videos\"],\"_t\":[\"5caa2092-c891-4889-afda-1edd51245493\"],\"added\":[\"2019-12-20 15:25:53\"],\"id\":[\"f16d1551-22f9-11ea-8348-00155d012d1c\",\"f16d1551-22f9-11ea-8348-00155d012d1c\"],\"poster\":[\"99241377-0fd4-439e-902d-262c3837d863.jpg\"]}', '2019-12-20 07:25:55', '2019-12-20 07:25:55');
INSERT INTO `adm_operation_log` VALUES (246, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:29:07', '2019-12-20 07:29:07');
INSERT INTO `adm_operation_log` VALUES (247, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"http://localhost:9033/admin/new/videos\"],\"_t\":[\"b7181ebb-f887-4e1a-88e3-9ca209e7b4f9\"],\"added\":[\"2019-12-20 15:29:13\"],\"id\":[\"686e41f9-22fa-11ea-b67d-00155d012d1c\",\"686e41f9-22fa-11ea-b67d-00155d012d1c\"],\"poster\":[\"4b337e9c-ddde-4b2e-a132-0bb877874b81.jpg\"]}', '2019-12-20 07:29:14', '2019-12-20 07:29:14');
INSERT INTO `adm_operation_log` VALUES (248, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=\\u0026__pageSize=\\u0026__sort=\\u0026__sort_type=\"],\"_t\":[\"cc607119-280c-4c70-a07e-0f126084af97\"],\"added\":[\"2019-12-20 15:29:40\"],\"id\":[\"0\"],\"poster\":[\"dc4ab696-8cff-46b9-8a22-5211dcd53b4a.jpg\"]}', '2019-12-20 07:29:42', '2019-12-20 07:29:42');
INSERT INTO `adm_operation_log` VALUES (249, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:29:45', '2019-12-20 07:29:45');
INSERT INTO `adm_operation_log` VALUES (250, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:29:54', '2019-12-20 07:29:54');
INSERT INTO `adm_operation_log` VALUES (251, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a285b78c-1ac8-48fb-a224-c2befc1b8e2b\"],\"added\":[\"2019-12-20 15:29:59\"],\"id\":[\"0\"],\"poster\":[\"99a9e380-20c5-49fe-8d70-d8dc5827611e.jpg\"]}', '2019-12-20 07:30:00', '2019-12-20 07:30:00');
INSERT INTO `adm_operation_log` VALUES (252, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:30:02', '2019-12-20 07:30:02');
INSERT INTO `adm_operation_log` VALUES (253, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:30:03', '2019-12-20 07:30:03');
INSERT INTO `adm_operation_log` VALUES (254, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:30:03', '2019-12-20 07:30:03');
INSERT INTO `adm_operation_log` VALUES (255, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:30:05', '2019-12-20 07:30:05');
INSERT INTO `adm_operation_log` VALUES (256, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:35:39', '2019-12-20 07:35:39');
INSERT INTO `adm_operation_log` VALUES (257, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7b49017a-1c16-4bf7-b7a3-e26b52fe6f8c\"],\"added\":[\"2019-12-20 15:35:44\"],\"id\":[\"56007cde-22fb-11ea-980f-00155d012d1c\"],\"poster\":[\"35ba385f-3984-412b-8464-ad8e6c63c99a.jpg\"]}', '2019-12-20 07:35:46', '2019-12-20 07:35:46');
INSERT INTO `adm_operation_log` VALUES (258, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:35:48', '2019-12-20 07:35:48');
INSERT INTO `adm_operation_log` VALUES (259, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1ff9fcde-fc05-4dde-8447-efc0addc5ae6\"],\"added\":[\"\"],\"id\":[\"5a4ca592-22fb-11ea-980f-00155d012d1c\"],\"poster\":[\"02958e1d-0bb4-46e4-9459-11a905b91ba2.jpg\"]}', '2019-12-20 07:35:53', '2019-12-20 07:35:53');
INSERT INTO `adm_operation_log` VALUES (260, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:35:55', '2019-12-20 07:35:55');
INSERT INTO `adm_operation_log` VALUES (261, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:37:37', '2019-12-20 07:37:37');
INSERT INTO `adm_operation_log` VALUES (262, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:37:43', '2019-12-20 07:37:43');
INSERT INTO `adm_operation_log` VALUES (263, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:38:09', '2019-12-20 07:38:09');
INSERT INTO `adm_operation_log` VALUES (264, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:39:23', '2019-12-20 07:39:23');
INSERT INTO `adm_operation_log` VALUES (265, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:39:27', '2019-12-20 07:39:27');
INSERT INTO `adm_operation_log` VALUES (266, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:39:28', '2019-12-20 07:39:28');
INSERT INTO `adm_operation_log` VALUES (267, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:43:01', '2019-12-20 07:43:01');
INSERT INTO `adm_operation_log` VALUES (268, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:43:03', '2019-12-20 07:43:03');
INSERT INTO `adm_operation_log` VALUES (269, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=tid\\u0026__sort_type=asc\"],\"_t\":[\"2118ddba-c705-455d-803a-817270de9cf4\"],\"added\":[\"2019-12-20 15:43:08\"],\"poster\":[\"5184cf67-d7a4-4d3b-a128-9be1d1326cbe.jpg\"],\"tid\":[\"0\"]}', '2019-12-20 07:43:09', '2019-12-20 07:43:09');
INSERT INTO `adm_operation_log` VALUES (270, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:44:16', '2019-12-20 07:44:16');
INSERT INTO `adm_operation_log` VALUES (271, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:44:18', '2019-12-20 07:44:18');
INSERT INTO `adm_operation_log` VALUES (272, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=tid\\u0026__sort_type=asc\"],\"_t\":[\"b49f2d89-4134-4bb3-8d83-8614fd326436\"],\"added\":[\"2019-12-20 15:44:23\"],\"poster\":[\"f02751cf-48fd-4f39-a226-46739b2b1928.jpg\"],\"tid\":[\"8b1214d6-22fc-11ea-9fa4-00155d012d1c\"]}', '2019-12-20 07:44:24', '2019-12-20 07:44:24');
INSERT INTO `adm_operation_log` VALUES (273, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 07:44:26', '2019-12-20 07:44:26');
INSERT INTO `adm_operation_log` VALUES (274, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:46:08', '2019-12-20 07:46:08');
INSERT INTO `adm_operation_log` VALUES (275, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=tid\\u0026__sort_type=asc\"],\"_t\":[\"8fb06ef6-d2a3-4635-b261-a8a99adc9998\"],\"added\":[\"\"],\"poster\":[\"aa4f5d62-e11b-48a8-b3b9-20bb0daeb5c4.jpg\"]}', '2019-12-20 07:46:14', '2019-12-20 07:46:14');
INSERT INTO `adm_operation_log` VALUES (276, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=tid\\u0026__sort_type=asc\"],\"_t\":[\"c447eaf7-72c5-4715-9af5-8d968b5fb015\"],\"added\":[\"2019-12-20 15:46:19\"],\"poster\":[\"56591d90-2fcc-4079-8678-da1038525589.jpg\"]}', '2019-12-20 07:46:24', '2019-12-20 07:46:24');
INSERT INTO `adm_operation_log` VALUES (277, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 07:46:48', '2019-12-20 07:46:48');
INSERT INTO `adm_operation_log` VALUES (278, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"http://localhost:9033/admin/new/videos\"],\"_t\":[\"4e072662-443d-460f-b60c-11e1d168bdba\"],\"added\":[\"2019-12-20 15:46:53\"],\"id\":[\"e05d389b-22fc-11ea-beff-00155d012d1c\",\"e05d389b-22fc-11ea-beff-00155d012d1c\"],\"poster\":[\"707b3572-56af-4c90-a621-cfe1e0775441.jpg\"]}', '2019-12-20 07:46:54', '2019-12-20 07:46:54');
INSERT INTO `adm_operation_log` VALUES (279, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:05:16', '2019-12-20 08:05:16');
INSERT INTO `adm_operation_log` VALUES (280, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:05:18', '2019-12-20 08:05:18');
INSERT INTO `adm_operation_log` VALUES (281, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"44eb77c0-f05b-4061-9fa8-05f19ba39e33\"],\"added\":[\"2019-12-20 16:05:18\"],\"poster\":[\"9cbebfa2-5782-4628-b34f-35aefa749eb9.jpg\"],\"vid\":[\"762b182f-22ff-11ea-80df-00155d012d1c\"]}', '2019-12-20 08:05:23', '2019-12-20 08:05:23');
INSERT INTO `adm_operation_log` VALUES (282, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1edf1044-914a-4af4-8708-f0418a0a6d52\"],\"added\":[\"2019-12-20 16:05:23\"],\"poster\":[\"c0ab091e-263b-4e98-a67c-c215538e2b78.jpg\"],\"vid\":[\"793e27f7-22ff-11ea-80df-00155d012d1c\"]}', '2019-12-20 08:05:46', '2019-12-20 08:05:46');
INSERT INTO `adm_operation_log` VALUES (283, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:05:50', '2019-12-20 08:05:50');
INSERT INTO `adm_operation_log` VALUES (284, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:06:02', '2019-12-20 08:06:02');
INSERT INTO `adm_operation_log` VALUES (285, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"http://localhost:9033/admin/new/videos\"],\"_t\":[\"e603911b-e628-4353-ac6f-df31fef3574b\"],\"added\":[\"2019-12-20 16:06:02\"],\"id\":[\"2\"],\"poster\":[\"058d70fa-ec80-40dc-80a7-af09269b4d3f.jpg\"],\"vid\":[\"907d7180-22ff-11ea-80df-00155d012d1c\"]}', '2019-12-20 08:06:08', '2019-12-20 08:06:08');
INSERT INTO `adm_operation_log` VALUES (286, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:06:19', '2019-12-20 08:06:19');
INSERT INTO `adm_operation_log` VALUES (287, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:06:23', '2019-12-20 08:06:23');
INSERT INTO `adm_operation_log` VALUES (288, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7356b3c0-b30b-423c-9bfe-5e4267cea189\"],\"added\":[\"2019-12-20 16:06:23\"],\"id\":[\"3\"],\"poster\":[\"90bbc501-42b8-4cce-90e7-08c5066ae35d.jpg\"],\"vid\":[\"9d1bd5ff-22ff-11ea-80df-00155d012d1c\"]}', '2019-12-20 08:06:31', '2019-12-20 08:06:31');
INSERT INTO `adm_operation_log` VALUES (289, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:06:35', '2019-12-20 08:06:35');
INSERT INTO `adm_operation_log` VALUES (290, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:06:35', '2019-12-20 08:06:35');
INSERT INTO `adm_operation_log` VALUES (291, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:06:37', '2019-12-20 08:06:37');
INSERT INTO `adm_operation_log` VALUES (292, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"73058731-348a-46f0-a093-4e888553eb35\"],\"added\":[\"2019-12-20 16:06:37\"],\"id\":[\"4\"],\"poster\":[\"ab8369fa-e041-408d-97cd-293cfefde864.jpg\"],\"vid\":[\"a5584b8d-22ff-11ea-80df-00155d012d1c\"]}', '2019-12-20 08:06:42', '2019-12-20 08:06:42');
INSERT INTO `adm_operation_log` VALUES (293, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:09:46', '2019-12-20 08:09:46');
INSERT INTO `adm_operation_log` VALUES (294, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:11:20', '2019-12-20 08:11:20');
INSERT INTO `adm_operation_log` VALUES (295, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:11:23', '2019-12-20 08:11:23');
INSERT INTO `adm_operation_log` VALUES (296, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-20 08:11:31', '2019-12-20 08:11:31');
INSERT INTO `adm_operation_log` VALUES (297, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:11:31', '2019-12-20 08:11:31');
INSERT INTO `adm_operation_log` VALUES (298, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:11:33', '2019-12-20 08:11:33');
INSERT INTO `adm_operation_log` VALUES (299, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"d836dc3e-cce4-41b1-bc9a-71dd545622ad\"],\"id\":[\"5\"],\"poster\":[\"526352cd-ab8c-478d-a455-82bccda8a6f2.jpg\"],\"vid\":[\"55e845fc-2300-11ea-8e25-00155d012d1c\"]}', '2019-12-20 08:11:38', '2019-12-20 08:11:38');
INSERT INTO `adm_operation_log` VALUES (300, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:12:00', '2019-12-20 08:12:00');
INSERT INTO `adm_operation_log` VALUES (301, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5e1cd1f1-d4c1-4ba4-b4a6-bb3921d14bdb\"],\"created_at\":[\"2020-02-15 08:11:38\"],\"id\":[\"5\"],\"poster\":[\"\"],\"updated_at\":[\"2019-12-20 08:11:38\"],\"vid\":[\"55e845fc-2300-11ea-8e25-00155d012d1c\"]}', '2019-12-20 08:12:28', '2019-12-20 08:12:28');
INSERT INTO `adm_operation_log` VALUES (302, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:12:33', '2019-12-20 08:12:33');
INSERT INTO `adm_operation_log` VALUES (303, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:12:34', '2019-12-20 08:12:34');
INSERT INTO `adm_operation_log` VALUES (304, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:14:57', '2019-12-20 08:14:57');
INSERT INTO `adm_operation_log` VALUES (305, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:15:12', '2019-12-20 08:15:12');
INSERT INTO `adm_operation_log` VALUES (306, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:15:14', '2019-12-20 08:15:14');
INSERT INTO `adm_operation_log` VALUES (307, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"eaafadee-7723-40a4-a585-9d1ac2e37c89\"],\"id\":[\"6\"],\"poster\":[\"8af9951d-205c-4977-bb53-79347bb91943.jpg\"],\"vid\":[\"d9994156-2300-11ea-a3ef-00155d012d1c\"]}', '2019-12-20 08:15:33', '2019-12-20 08:15:33');
INSERT INTO `adm_operation_log` VALUES (308, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:15:45', '2019-12-20 08:15:45');
INSERT INTO `adm_operation_log` VALUES (309, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:15:48', '2019-12-20 08:15:48');
INSERT INTO `adm_operation_log` VALUES (310, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:15:49', '2019-12-20 08:15:49');
INSERT INTO `adm_operation_log` VALUES (311, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:15:55', '2019-12-20 08:15:55');
INSERT INTO `adm_operation_log` VALUES (312, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:16:28', '2019-12-20 08:16:28');
INSERT INTO `adm_operation_log` VALUES (313, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:20:06', '2019-12-20 08:20:06');
INSERT INTO `adm_operation_log` VALUES (314, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:20:28', '2019-12-20 08:20:28');
INSERT INTO `adm_operation_log` VALUES (315, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"57651dec-c5be-45d1-b252-4fcc48034c0b\"],\"id\":[\"7\"],\"poster\":[\"80db0955-b00f-4295-93b1-6a0d79dece05.jpg\"],\"vid\":[\"94f84fcd-2301-11ea-b011-00155d012d1c\"],\"video_info\":[\"{\\r\\n  \\\"database\\\": {\\r\\n    \\\"default\\\": {\\r\\n      \\\"host\\\": \\\"127.0.0.1\\\",\\r\\n      \\\"port\\\": \\\"3306\\\",\\r\\n      \\\"user\\\": \\\"root\\\",\\r\\n      \\\"pwd\\\": \\\"111111\\\",\\r\\n      \\\"name\\\": \\\"GoAdminGroup\\\",\\r\\n      \\\"max_idle_con\\\": 50,\\r\\n      \\\"max_open_con\\\": 150,\\r\\n      \\\"driver\\\": \\\"mysql\\\"\\r\\n    }\\r\\n  },\\r\\n  \\\"domain\\\": \\\"localhost\\\",\\r\\n  \\\"prefix\\\": \\\"admin\\\",\\r\\n  \\\"store\\\": {\\r\\n    \\\"path\\\": \\\"./uploads\\\",\\r\\n    \\\"prefix\\\": \\\"uploads\\\"\\r\\n  },\\r\\n  \\\"language\\\": \\\"cn\\\",\\r\\n  \\\"index\\\": \\\"/\\\",\\r\\n  \\\"debug\\\": true,\\r\\n  \\\"color_scheme\\\": \\\"skin-black\\\"\\r\\n}\"]}', '2019-12-20 08:20:38', '2019-12-20 08:20:38');
INSERT INTO `adm_operation_log` VALUES (316, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:21:49', '2019-12-20 08:21:49');
INSERT INTO `adm_operation_log` VALUES (317, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3a63b326-e90a-46d8-b327-02d611c45b52\"],\"created_at\":[\"2019-12-20 08:20:38\"],\"id\":[\"7\"],\"poster\":[\"\"],\"updated_at\":[\"2019-12-20 08:20:38\"],\"video_info\":[\"{\\r\\n  \\\"database1\\\": {\\r\\n    \\\"default\\\": {\\r\\n      \\\"host\\\": \\\"127.0.0.1\\\",\\r\\n      \\\"port\\\": \\\"3306\\\",\\r\\n      \\\"user\\\": \\\"root\\\",\\r\\n      \\\"pwd\\\": \\\"111111\\\",\\r\\n      \\\"name\\\": \\\"GoAdminGroup\\\",\\r\\n      \\\"max_idle_con\\\": 50,\\r\\n      \\\"max_open_con\\\": 150,\\r\\n      \\\"driver\\\": \\\"mysql\\\"\\r\\n    }\\r\\n  },\\r\\n  \\\"domain\\\": \\\"localhost\\\",\\r\\n  \\\"prefix\\\": \\\"admin\\\",\\r\\n  \\\"store\\\": {\\r\\n    \\\"path\\\": \\\"./uploads\\\",\\r\\n    \\\"prefix\\\": \\\"uploads\\\"\\r\\n  },\\r\\n  \\\"language\\\": \\\"cn\\\",\\r\\n  \\\"index\\\": \\\"/\\\",\\r\\n  \\\"debug\\\": true,\\r\\n  \\\"color_scheme\\\": \\\"skin-black\\\"\\r\\n}\"]}', '2019-12-20 08:21:55', '2019-12-20 08:21:55');
INSERT INTO `adm_operation_log` VALUES (318, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:21:59', '2019-12-20 08:21:59');
INSERT INTO `adm_operation_log` VALUES (319, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:22:01', '2019-12-20 08:22:01');
INSERT INTO `adm_operation_log` VALUES (320, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:23:11', '2019-12-20 08:23:11');
INSERT INTO `adm_operation_log` VALUES (321, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:28:42', '2019-12-20 08:28:42');
INSERT INTO `adm_operation_log` VALUES (322, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:28:44', '2019-12-20 08:28:44');
INSERT INTO `adm_operation_log` VALUES (323, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:28:51', '2019-12-20 08:28:51');
INSERT INTO `adm_operation_log` VALUES (324, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:28:53', '2019-12-20 08:28:53');
INSERT INTO `adm_operation_log` VALUES (325, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:28:53', '2019-12-20 08:28:53');
INSERT INTO `adm_operation_log` VALUES (326, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:28:54', '2019-12-20 08:28:54');
INSERT INTO `adm_operation_log` VALUES (327, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5b9ef222-8628-4d22-b284-abef00095578\"],\"created_at\":[\"2019-12-20 08:20:38\"],\"id\":[\"7\"],\"poster\":[\"\"],\"updated_at\":[\"2019-12-20 08:20:38\"],\"vid\":[\"94f84fcd-2301-11ea-b011-00155d012d1c\"],\"video_info\":[\"{\\r\\n  \\\"database\\\": {\\r\\n    \\\"default\\\": {\\r\\n      \\\"host\\\": \\\"127.0.0.1\\\",\\r\\n      \\\"port\\\": \\\"3306\\\",\\r\\n      \\\"user\\\": \\\"root\\\",\\r\\n      \\\"pwd\\\": \\\"111111\\\",\\r\\n      \\\"name\\\": \\\"GoAdminGroup\\\",\\r\\n      \\\"max_idle_con\\\": 50,\\r\\n      \\\"max_open_con\\\": 150,\\r\\n      \\\"driver\\\": \\\"mysql\\\"\\r\\n    }\\r\\n  },\\r\\n  \\\"domain\\\": \\\"localhost\\\",\\r\\n  \\\"prefix\\\": \\\"admin\\\",\\r\\n  \\\"store\\\": {\\r\\n    \\\"path\\\": \\\"./uploads\\\",\\r\\n    \\\"prefix\\\": \\\"uploads\\\"\\r\\n  },\\r\\n  \\\"language\\\": \\\"cn\\\",\\r\\n  \\\"index\\\": \\\"/\\\",\\r\\n  \\\"debug\\\": true,\\r\\n  \\\"color_scheme\\\": \\\"skin-black\\\"\\r\\n}\"]}', '2019-12-20 08:28:56', '2019-12-20 08:28:56');
INSERT INTO `adm_operation_log` VALUES (328, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:28:58', '2019-12-20 08:28:58');
INSERT INTO `adm_operation_log` VALUES (329, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:29:01', '2019-12-20 08:29:01');
INSERT INTO `adm_operation_log` VALUES (330, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:29:04', '2019-12-20 08:29:04');
INSERT INTO `adm_operation_log` VALUES (331, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c6e54967-748f-4a2d-bf56-8ec2233ca780\"],\"created_at\":[\"2019-12-20 08:15:33\"],\"id\":[\"6\"],\"poster\":[\"\"],\"updated_at\":[\"2019-12-20 08:19:49\"],\"vid\":[\"d9994156-2300-11ea-a3ef-00155d012d1c\"],\"video_info\":[\" ddddddddddddddddddd\"]}', '2019-12-20 08:29:07', '2019-12-20 08:29:07');
INSERT INTO `adm_operation_log` VALUES (332, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:29:29', '2019-12-20 08:29:29');
INSERT INTO `adm_operation_log` VALUES (333, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:29:31', '2019-12-20 08:29:31');
INSERT INTO `adm_operation_log` VALUES (334, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-20 08:29:32', '2019-12-20 08:29:32');
INSERT INTO `adm_operation_log` VALUES (335, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"fe7b79bd-6c28-40de-a761-c7dac467b554\"],\"created_at\":[\"2019-12-20 08:20:38\"],\"id\":[\"7\"],\"poster\":[\"\"],\"updated_at\":[\"2019-12-20 08:20:38\"],\"vid\":[\"94f84fcd-2301-11ea-b011-00155d012d1c\"],\"video_info\":[\"{\\r\\n  \\\"database\\\": {\\r\\n    \\\"default\\\": {\\r\\n      \\\"host\\\": \\\"127.0.0.1\\\",\\r\\n      \\\"port\\\": \\\"3306\\\",\\r\\n      \\\"user\\\": \\\"root\\\",\\r\\n      \\\"pwd\\\": \\\"111111\\\",\\r\\n      \\\"name\\\": \\\"GoAdminGroup\\\",\\r\\n      \\\"max_idle_con\\\": 50,\\r\\n      \\\"max_open_con\\\": 150,\\r\\n      \\\"driver\\\": \\\"mysql\\\"\\r\\n    }\\r\\n  },\\r\\n  \\\"domain\\\": \\\"localhost\\\",\\r\\n  \\\"prefix\\\": \\\"admin\\\",\\r\\n  \\\"store\\\": {\\r\\n    \\\"path\\\": \\\"./uploads\\\",\\r\\n    \\\"prefix\\\": \\\"uploads\\\"\\r\\n  },\\r\\n  \\\"language\\\": \\\"cn\\\",\\r\\n  \\\"index\\\": \\\"/\\\",\\r\\n  \\\"debug\\\": true,\\r\\n  \\\"color_scheme\\\": \\\"skin-black\\\"\\r\\n}dddd\"]}', '2019-12-20 08:31:00', '2019-12-20 08:31:00');
INSERT INTO `adm_operation_log` VALUES (336, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:31:07', '2019-12-20 08:31:07');
INSERT INTO `adm_operation_log` VALUES (337, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:31:09', '2019-12-20 08:31:09');
INSERT INTO `adm_operation_log` VALUES (338, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"981796d6-bc91-4730-b44e-bbc70106dfd3\"],\"poster\":[\"08feb626-1b37-4b3b-850e-1ad440ff0e1e.jpg\"],\"vid\":[\"160ce5c4-2303-11ea-a8fd-00155d012d1c\"],\"video_info\":[\"ddddddddddddddd\"]}', '2019-12-20 08:31:15', '2019-12-20 08:31:15');
INSERT INTO `adm_operation_log` VALUES (339, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:31:21', '2019-12-20 08:31:21');
INSERT INTO `adm_operation_log` VALUES (340, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:31:27', '2019-12-20 08:31:27');
INSERT INTO `adm_operation_log` VALUES (341, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:31:27', '2019-12-20 08:31:27');
INSERT INTO `adm_operation_log` VALUES (342, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:31:30', '2019-12-20 08:31:30');
INSERT INTO `adm_operation_log` VALUES (343, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:31:30', '2019-12-20 08:31:30');
INSERT INTO `adm_operation_log` VALUES (344, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:31:33', '2019-12-20 08:31:33');
INSERT INTO `adm_operation_log` VALUES (345, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:31:33', '2019-12-20 08:31:33');
INSERT INTO `adm_operation_log` VALUES (346, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:31:36', '2019-12-20 08:31:36');
INSERT INTO `adm_operation_log` VALUES (347, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"81d06b13-88dd-479c-bc71-0f529dfc485d\"],\"poster\":[\"e8742dfa-5f66-42ed-afcc-b9f7479efc1c.jpg\"],\"vid\":[\"26abdae1-2303-11ea-a8fd-00155d012d1c\"],\"video_info\":[\"ssssssssssssssss\"]}', '2019-12-20 08:31:42', '2019-12-20 08:31:42');
INSERT INTO `adm_operation_log` VALUES (348, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:31:44', '2019-12-20 08:31:44');
INSERT INTO `adm_operation_log` VALUES (349, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:32:28', '2019-12-20 08:32:28');
INSERT INTO `adm_operation_log` VALUES (350, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:32:31', '2019-12-20 08:32:31');
INSERT INTO `adm_operation_log` VALUES (351, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:32:31', '2019-12-20 08:32:31');
INSERT INTO `adm_operation_log` VALUES (352, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:32:37', '2019-12-20 08:32:37');
INSERT INTO `adm_operation_log` VALUES (353, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e2fea30b-5822-4d55-b11a-2e0b97aa38a3\"],\"poster\":[\"291efce4-de0a-461b-ad58-c27ac6a9d099.jpg\"],\"vid\":[\"4ba1013e-2303-11ea-96f2-00155d012d1c\"],\"video_info\":[\"dddddddddddddd\"]}', '2019-12-20 08:32:44', '2019-12-20 08:32:44');
INSERT INTO `adm_operation_log` VALUES (354, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:32:47', '2019-12-20 08:32:47');
INSERT INTO `adm_operation_log` VALUES (355, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:33:21', '2019-12-20 08:33:21');
INSERT INTO `adm_operation_log` VALUES (356, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1ceeb9dd-2c38-403e-8669-a4102d4b8171\"],\"poster\":[\"63b59d68-734f-42d2-a9ec-c6f10d0f35d1.jpg\"],\"vid\":[\"6565741a-2303-11ea-8c47-00155d012d1c\"],\"video_info\":[\"ssssssssssss\"]}', '2019-12-20 08:33:28', '2019-12-20 08:33:28');
INSERT INTO `adm_operation_log` VALUES (357, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:33:30', '2019-12-20 08:33:30');
INSERT INTO `adm_operation_log` VALUES (358, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"582c0049-41e8-4e89-88eb-a84385322ec8\"],\"poster\":[\"b39601e1-201c-4c5c-994c-ed7724086fa2.jpg\"],\"vid\":[\"6a5443e6-2303-11ea-8c47-00155d012d1c\"],\"video_info\":[\"vvvvvvvvvvvvvvvvvvvvvvv\"]}', '2019-12-20 08:33:36', '2019-12-20 08:33:36');
INSERT INTO `adm_operation_log` VALUES (359, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:33:38', '2019-12-20 08:33:38');
INSERT INTO `adm_operation_log` VALUES (360, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:33:52', '2019-12-20 08:33:52');
INSERT INTO `adm_operation_log` VALUES (361, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"02a5dfcc-e303-4b87-9478-4bd67081f967\"],\"id\":[\"8\"],\"poster\":[\"0641b35d-79d4-48b4-9bba-5b5b481b8689.jpg\"],\"vid\":[\"\"],\"video_info\":[\"ssssssssssssss\"]}', '2019-12-20 08:33:58', '2019-12-20 08:33:58');
INSERT INTO `adm_operation_log` VALUES (362, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:36:31', '2019-12-20 08:36:31');
INSERT INTO `adm_operation_log` VALUES (363, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a12cab6d-c315-4feb-a358-a3d6613f4b98\"],\"id\":[\"9\"],\"poster\":[\"b1efa3b5-2f2f-4bbe-b164-4046bc407f88.jpg\"],\"video_info\":[\"dddddddddddddddddddddddddddddddddddddd\"]}', '2019-12-20 08:36:38', '2019-12-20 08:36:38');
INSERT INTO `adm_operation_log` VALUES (364, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:36:43', '2019-12-20 08:36:43');
INSERT INTO `adm_operation_log` VALUES (365, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:36:58', '2019-12-20 08:36:58');
INSERT INTO `adm_operation_log` VALUES (366, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"bd2be22d-a149-427d-9dd9-d70cfa328dff\"],\"id\":[\"10\"],\"poster\":[\"a8b39eab-3e24-497e-9863-4b14c30eec0f.jpg\"],\"vid\":[\"\"],\"video_info\":[\"xxxxxxxxxxxxxxxxxxxxxxxxxxxxx\"]}', '2019-12-20 08:37:08', '2019-12-20 08:37:08');
INSERT INTO `adm_operation_log` VALUES (367, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:38:08', '2019-12-20 08:38:08');
INSERT INTO `adm_operation_log` VALUES (368, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:38:10', '2019-12-20 08:38:10');
INSERT INTO `adm_operation_log` VALUES (369, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"78ce54eb-c275-47ad-bb93-a5d05cdf42c8\"],\"id\":[\"11\"],\"poster\":[\"c454fa4d-d88d-4934-bcf7-41a2cd190ed2.jpg\"],\"vid\":[\"12e03610-2304-11ea-8449-00155d012d1c\"],\"video_info\":[\"cccccccccccccccccccccxxxxxxxxxxxxxxxxxxxxxxxxxxx\"]}', '2019-12-20 08:38:19', '2019-12-20 08:38:19');
INSERT INTO `adm_operation_log` VALUES (370, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:41:04', '2019-12-20 08:41:04');
INSERT INTO `adm_operation_log` VALUES (371, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"cd281e3c-16fe-4ef5-9fc9-9561124e33fd\"],\"id\":[\"12\"],\"poster\":[\"81ec32cd-06df-4a1d-b34a-632374740ce5.jpg\"],\"vid\":[\"794b8c2d-2304-11ea-8022-00155d012d1c\"],\"video_info\":[\"csdfsa\"]}', '2019-12-20 08:41:11', '2019-12-20 08:41:11');
INSERT INTO `adm_operation_log` VALUES (372, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:42:25', '2019-12-20 08:42:25');
INSERT INTO `adm_operation_log` VALUES (373, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"18467573-05d1-4a2e-803d-e80aad157622\"],\"poster\":[\"378f5706-e158-4681-8a4d-0637a8e28cd9.jpg\"],\"vid\":[\"aa0c559b-2304-11ea-8b91-00155d012d1c\"],\"video_info\":[\"dsdfdasdfdsafsafdsa\"]}', '2019-12-20 08:42:32', '2019-12-20 08:42:32');
INSERT INTO `adm_operation_log` VALUES (374, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-20 08:54:51', '2019-12-20 08:54:51');
INSERT INTO `adm_operation_log` VALUES (375, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"94ff1733-4588-482c-87df-3c428d1dc1b2\"],\"id\":[\"13\"],\"poster\":[\"267ceac8-3b2f-418a-8778-a6c01319524e.jpg\"],\"vid\":[\"66e2433e-2306-11ea-8321-00155d012d1c\"],\"video_info\":[\"xcccccccccccccccccc\"]}', '2019-12-20 08:54:59', '2019-12-20 08:54:59');
INSERT INTO `adm_operation_log` VALUES (376, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:55:03', '2019-12-20 08:55:03');
INSERT INTO `adm_operation_log` VALUES (377, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:55:03', '2019-12-20 08:55:03');
INSERT INTO `adm_operation_log` VALUES (378, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:55:11', '2019-12-20 08:55:11');
INSERT INTO `adm_operation_log` VALUES (379, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:55:11', '2019-12-20 08:55:11');
INSERT INTO `adm_operation_log` VALUES (380, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:55:15', '2019-12-20 08:55:15');
INSERT INTO `adm_operation_log` VALUES (381, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:55:15', '2019-12-20 08:55:15');
INSERT INTO `adm_operation_log` VALUES (382, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:55:17', '2019-12-20 08:55:17');
INSERT INTO `adm_operation_log` VALUES (383, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:55:17', '2019-12-20 08:55:17');
INSERT INTO `adm_operation_log` VALUES (384, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:55:19', '2019-12-20 08:55:19');
INSERT INTO `adm_operation_log` VALUES (385, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:55:20', '2019-12-20 08:55:20');
INSERT INTO `adm_operation_log` VALUES (386, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:55:23', '2019-12-20 08:55:23');
INSERT INTO `adm_operation_log` VALUES (387, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:55:23', '2019-12-20 08:55:23');
INSERT INTO `adm_operation_log` VALUES (388, 1, '/admin/delete/videos', 'POST', '127.0.0.1', '', '2019-12-20 08:55:25', '2019-12-20 08:55:25');
INSERT INTO `adm_operation_log` VALUES (389, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-20 08:55:26', '2019-12-20 08:55:26');
INSERT INTO `adm_operation_log` VALUES (390, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-24 06:22:45', '2019-12-24 06:22:45');
INSERT INTO `adm_operation_log` VALUES (391, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-24 06:22:48', '2019-12-24 06:22:48');
INSERT INTO `adm_operation_log` VALUES (392, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-24 06:22:48', '2019-12-24 06:22:48');
INSERT INTO `adm_operation_log` VALUES (393, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:23:02', '2019-12-24 06:23:02');
INSERT INTO `adm_operation_log` VALUES (394, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 06:23:12', '2019-12-24 06:23:12');
INSERT INTO `adm_operation_log` VALUES (395, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:34:38', '2019-12-24 06:34:38');
INSERT INTO `adm_operation_log` VALUES (396, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:34:43', '2019-12-24 06:34:43');
INSERT INTO `adm_operation_log` VALUES (397, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 06:34:45', '2019-12-24 06:34:45');
INSERT INTO `adm_operation_log` VALUES (398, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 06:34:47', '2019-12-24 06:34:47');
INSERT INTO `adm_operation_log` VALUES (399, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-24 06:34:49', '2019-12-24 06:34:49');
INSERT INTO `adm_operation_log` VALUES (400, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"82d347cf-ea1a-4d7f-aea8-1a333a73bda5\"],\"id\":[\"1\"],\"poster\":[\"8844a669-fec3-49c5-9a12-173f550bbf35.jpg\"],\"vid\":[\"81274111-2617-11ea-a6a5-00155d012d1c\"],\"video_info\":[\"dddddddddddddddddddddddddddddddddd\"]}', '2019-12-24 06:34:58', '2019-12-24 06:34:58');
INSERT INTO `adm_operation_log` VALUES (401, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 06:36:20', '2019-12-24 06:36:20');
INSERT INTO `adm_operation_log` VALUES (402, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-24 06:36:26', '2019-12-24 06:36:26');
INSERT INTO `adm_operation_log` VALUES (403, 1, '/admin/new/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5dd25105-1fcb-43e4-9c8f-2ba609f47944\"],\"id\":[\"2\"],\"poster\":[\"f6d6af08-5049-4d9e-a65c-972a39550cc9.jpg\"],\"vid\":[\"ba661d10-2617-11ea-a6a5-00155d012d1c\"],\"video_info\":[\"ccccccccccccccc\"]}', '2019-12-24 06:36:34', '2019-12-24 06:36:34');
INSERT INTO `adm_operation_log` VALUES (404, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:44:20', '2019-12-24 06:44:20');
INSERT INTO `adm_operation_log` VALUES (405, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-24 06:44:28', '2019-12-24 06:44:28');
INSERT INTO `adm_operation_log` VALUES (406, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:44:32', '2019-12-24 06:44:32');
INSERT INTO `adm_operation_log` VALUES (407, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"5110b40e-a89e-4706-9c95-0ef3d2677aed\"],\"header\":[\"管理\"],\"icon\":[\"fa-automobile\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"节点\"],\"uri\":[\"/info/nodes\"]}', '2019-12-24 06:45:24', '2019-12-24 06:45:24');
INSERT INTO `adm_operation_log` VALUES (408, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 06:45:31', '2019-12-24 06:45:31');
INSERT INTO `adm_operation_log` VALUES (409, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:45:33', '2019-12-24 06:45:33');
INSERT INTO `adm_operation_log` VALUES (410, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-24 06:45:35', '2019-12-24 06:45:35');
INSERT INTO `adm_operation_log` VALUES (411, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"4567d421-cdaf-49c7-ab7c-b7a17ccce14e\"],\"header\":[\"管理\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频\"],\"uri\":[\"/info/videos\"]}', '2019-12-24 06:45:42', '2019-12-24 06:45:42');
INSERT INTO `adm_operation_log` VALUES (412, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:45:44', '2019-12-24 06:45:44');
INSERT INTO `adm_operation_log` VALUES (413, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:45:49', '2019-12-24 06:45:49');
INSERT INTO `adm_operation_log` VALUES (414, 1, '/admin/menu/order', 'POST', '127.0.0.1', '', '2019-12-24 06:46:02', '2019-12-24 06:46:02');
INSERT INTO `adm_operation_log` VALUES (415, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:46:02', '2019-12-24 06:46:02');
INSERT INTO `adm_operation_log` VALUES (416, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:46:04', '2019-12-24 06:46:04');
INSERT INTO `adm_operation_log` VALUES (417, 1, '/admin/menu/edit/show', 'GET', '127.0.0.1', '', '2019-12-24 06:46:19', '2019-12-24 06:46:19');
INSERT INTO `adm_operation_log` VALUES (418, 1, '/admin/menu/edit', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"d78bf5ca-289c-4322-b026-f9b7e12fafd9\"],\"header\":[\"\"],\"icon\":[\"fa-automobile\"],\"id\":[\"14\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"节点\"],\"uri\":[\"/info/nodes\"]}', '2019-12-24 06:46:23', '2019-12-24 06:46:23');
INSERT INTO `adm_operation_log` VALUES (419, 1, '/admin/menu/new', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"6b268378-f89e-4e57-af09-b2ba102e028d\"],\"header\":[\"管理\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"title\":[\"\"],\"uri\":[\"\"]}', '2019-12-24 06:46:36', '2019-12-24 06:46:36');
INSERT INTO `adm_operation_log` VALUES (420, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:46:44', '2019-12-24 06:46:44');
INSERT INTO `adm_operation_log` VALUES (421, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:46:48', '2019-12-24 06:46:48');
INSERT INTO `adm_operation_log` VALUES (422, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:49:01', '2019-12-24 06:49:01');
INSERT INTO `adm_operation_log` VALUES (423, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 06:49:04', '2019-12-24 06:49:04');
INSERT INTO `adm_operation_log` VALUES (424, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 06:51:16', '2019-12-24 06:51:16');
INSERT INTO `adm_operation_log` VALUES (425, 1, '/admin/menu', 'GET', '127.0.0.1', '', '2019-12-24 06:51:21', '2019-12-24 06:51:21');
INSERT INTO `adm_operation_log` VALUES (426, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:52:53', '2019-12-24 06:52:53');
INSERT INTO `adm_operation_log` VALUES (427, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 06:52:55', '2019-12-24 06:52:55');
INSERT INTO `adm_operation_log` VALUES (428, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"28e9470f-9b83-4cb8-8208-c2018c7bc7ea\"],\"config_path\":[\"d:\\\\workspace\\\\ipfs\"]}', '2019-12-24 06:53:06', '2019-12-24 06:53:06');
INSERT INTO `adm_operation_log` VALUES (429, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"91fd77e7-de7e-4651-bb43-713cfe9d8805\"],\"config_path\":[\"d:\\\\w\"]}', '2019-12-24 06:54:11', '2019-12-24 06:54:11');
INSERT INTO `adm_operation_log` VALUES (430, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:54:29', '2019-12-24 06:54:29');
INSERT INTO `adm_operation_log` VALUES (431, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 06:54:31', '2019-12-24 06:54:31');
INSERT INTO `adm_operation_log` VALUES (432, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"186d3ffd-25d9-42b3-810c-d65de01988d8\"],\"config_path\":[\"d;\\\\\"],\"id\":[\"3e977b57-261a-11ea-81a8-00155d012d1c\"]}', '2019-12-24 06:54:34', '2019-12-24 06:54:34');
INSERT INTO `adm_operation_log` VALUES (433, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1f64682a-2abb-4f32-9795-7d3f3d614018\"],\"config_path\":[\"\"],\"id\":[\"40335120-261a-11ea-81a8-00155d012d1c\"]}', '2019-12-24 06:54:37', '2019-12-24 06:54:37');
INSERT INTO `adm_operation_log` VALUES (434, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"4bb080bc-2872-4459-adfa-00e042c529b2\"],\"config_path\":[\"\"],\"id\":[\"407bf2d9-261a-11ea-81a8-00155d012d1c\"]}', '2019-12-24 06:54:38', '2019-12-24 06:54:38');
INSERT INTO `adm_operation_log` VALUES (435, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"457b2608-c858-48a5-ab46-6511acc487d8\"],\"config_path\":[\"\"],\"id\":[\"40a6fa55-261a-11ea-81a8-00155d012d1c\"]}', '2019-12-24 06:54:38', '2019-12-24 06:54:38');
INSERT INTO `adm_operation_log` VALUES (436, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6f960984-6468-47ae-bf25-14dd8c6a89f7\"],\"config_path\":[\"\"],\"id\":[\"4110dfea-261a-11ea-81a8-00155d012d1c\"]}', '2019-12-24 06:54:39', '2019-12-24 06:54:39');
INSERT INTO `adm_operation_log` VALUES (437, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:54:41', '2019-12-24 06:54:41');
INSERT INTO `adm_operation_log` VALUES (438, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:57:19', '2019-12-24 06:57:19');
INSERT INTO `adm_operation_log` VALUES (439, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 06:57:22', '2019-12-24 06:57:22');
INSERT INTO `adm_operation_log` VALUES (440, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:57:23', '2019-12-24 06:57:23');
INSERT INTO `adm_operation_log` VALUES (441, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 06:57:25', '2019-12-24 06:57:25');
INSERT INTO `adm_operation_log` VALUES (442, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b2847503-f979-444c-acc1-089720f9384a\"],\"config_path\":[\"d:\\\\w\"]}', '2019-12-24 06:57:29', '2019-12-24 06:57:29');
INSERT INTO `adm_operation_log` VALUES (443, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:58:33', '2019-12-24 06:58:33');
INSERT INTO `adm_operation_log` VALUES (444, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:58:34', '2019-12-24 06:58:34');
INSERT INTO `adm_operation_log` VALUES (445, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 06:58:35', '2019-12-24 06:58:35');
INSERT INTO `adm_operation_log` VALUES (446, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 06:58:36', '2019-12-24 06:58:36');
INSERT INTO `adm_operation_log` VALUES (447, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"68c282a3-9d5e-46ad-8aab-f8efb6245ee1\"],\"config_path\":[\"dcdddddddd\"]}', '2019-12-24 06:58:39', '2019-12-24 06:58:39');
INSERT INTO `adm_operation_log` VALUES (448, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"347aad75-352f-4e4c-863c-cc1ff6729969\"],\"config_path\":[\"dddddddddd\"]}', '2019-12-24 07:00:02', '2019-12-24 07:00:02');
INSERT INTO `adm_operation_log` VALUES (449, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"96955163-867b-4da5-a110-5ca5d8fd5ecd\"],\"config_path\":[\"ddddddddddd\"],\"id\":[\"1\"]}', '2019-12-24 07:00:19', '2019-12-24 07:00:19');
INSERT INTO `adm_operation_log` VALUES (450, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-12-24 07:13:42', '2019-12-24 07:13:42');
INSERT INTO `adm_operation_log` VALUES (451, 1, '/admin/info/permission', 'GET', '127.0.0.1', '', '2019-12-24 07:13:43', '2019-12-24 07:13:43');
INSERT INTO `adm_operation_log` VALUES (452, 1, '/admin/info/permission/edit', 'GET', '127.0.0.1', '', '2019-12-24 07:13:57', '2019-12-24 07:13:57');
INSERT INTO `adm_operation_log` VALUES (453, 1, '/admin/info/permission', 'GET', '127.0.0.1', '', '2019-12-24 07:14:52', '2019-12-24 07:14:52');
INSERT INTO `adm_operation_log` VALUES (454, 1, '/admin/info/roles', 'GET', '127.0.0.1', '', '2019-12-24 07:15:06', '2019-12-24 07:15:06');
INSERT INTO `adm_operation_log` VALUES (455, 1, '/admin/info/manager', 'GET', '127.0.0.1', '', '2019-12-24 07:15:08', '2019-12-24 07:15:08');
INSERT INTO `adm_operation_log` VALUES (456, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 07:15:13', '2019-12-24 07:15:13');
INSERT INTO `adm_operation_log` VALUES (457, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:15:14', '2019-12-24 07:15:14');
INSERT INTO `adm_operation_log` VALUES (458, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:46:16', '2019-12-24 07:46:16');
INSERT INTO `adm_operation_log` VALUES (459, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 07:46:19', '2019-12-24 07:46:19');
INSERT INTO `adm_operation_log` VALUES (460, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"44da4b8e-d52c-467b-8707-74aed5848ea5\"],\"node_addr\":[\"\"]}', '2019-12-24 07:46:23', '2019-12-24 07:46:23');
INSERT INTO `adm_operation_log` VALUES (461, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"86194a06-7003-4940-a887-15abafafdc7e\"],\"node_addr\":[\"\"]}', '2019-12-24 07:46:30', '2019-12-24 07:46:30');
INSERT INTO `adm_operation_log` VALUES (462, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:46:33', '2019-12-24 07:46:33');
INSERT INTO `adm_operation_log` VALUES (463, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 07:49:11', '2019-12-24 07:49:11');
INSERT INTO `adm_operation_log` VALUES (464, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"4554404a-c280-4eed-a406-d3654ec787dd\"],\"id\":[\"2\"],\"node_addr\":[\"\"],\"node_id\":[\"QmbHutBd33cgTTrTrkkXuoVwNh9hytcYLphPyKM1HB4Civ\"],\"node_status\":[\"1\"]}', '2019-12-24 07:49:15', '2019-12-24 07:49:15');
INSERT INTO `adm_operation_log` VALUES (465, 1, '/admin/delete/nodes', 'POST', '127.0.0.1', '', '2019-12-24 07:50:01', '2019-12-24 07:50:01');
INSERT INTO `adm_operation_log` VALUES (466, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:50:01', '2019-12-24 07:50:01');
INSERT INTO `adm_operation_log` VALUES (467, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 07:50:05', '2019-12-24 07:50:05');
INSERT INTO `adm_operation_log` VALUES (468, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5982cc95-3dd8-434d-ab89-0b2be71c51f6\"],\"id\":[\"3\"],\"node_addr\":[\"\"],\"node_id\":[\"QmbHutBd33cgTTrTrkkXuoVwNh9hytcYLphPyKM1HB4Civ\"],\"node_status\":[\"1\"]}', '2019-12-24 07:50:06', '2019-12-24 07:50:06');
INSERT INTO `adm_operation_log` VALUES (469, 1, '/admin/delete/nodes', 'POST', '127.0.0.1', '', '2019-12-24 07:50:10', '2019-12-24 07:50:10');
INSERT INTO `adm_operation_log` VALUES (470, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:50:10', '2019-12-24 07:50:10');
INSERT INTO `adm_operation_log` VALUES (471, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 07:50:16', '2019-12-24 07:50:16');
INSERT INTO `adm_operation_log` VALUES (472, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1a7b92fc-650a-41ca-b015-1f2a8e9479bb\"],\"id\":[\"4\"],\"node_addr\":[\"\"],\"node_id\":[\"QmbHutBd33cgTTrTrkkXuoVwNh9hytcYLphPyKM1HB4Civ\"],\"node_status\":[\"1\"]}', '2019-12-24 07:50:18', '2019-12-24 07:50:18');
INSERT INTO `adm_operation_log` VALUES (473, 1, '/admin/delete/nodes', 'POST', '127.0.0.1', '', '2019-12-24 07:50:20', '2019-12-24 07:50:20');
INSERT INTO `adm_operation_log` VALUES (474, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:50:20', '2019-12-24 07:50:20');
INSERT INTO `adm_operation_log` VALUES (475, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 07:52:07', '2019-12-24 07:52:07');
INSERT INTO `adm_operation_log` VALUES (476, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b46b54c2-323d-4195-a8d4-6d3c069accdd\"],\"id\":[\"5\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"QmbHutBd33cgTTrTrkkXuoVwNh9hytcYLphPyKM1HB4Civ\"],\"node_status\":[\"1\"]}', '2019-12-24 07:52:08', '2019-12-24 07:52:08');
INSERT INTO `adm_operation_log` VALUES (477, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 07:54:47', '2019-12-24 07:54:47');
INSERT INTO `adm_operation_log` VALUES (478, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c580d257-f9ce-4e51-941d-e3d9a71cf56b\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"1\"]}', '2019-12-24 07:55:40', '2019-12-24 07:55:40');
INSERT INTO `adm_operation_log` VALUES (479, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e775a0bf-f886-46f9-bb63-22cd6b958cb3\"],\"node_addr\":[\"/ip4/0.0.0.0/tcp/15001\"],\"node_status\":[\"1\"]}', '2019-12-24 07:55:53', '2019-12-24 07:55:53');
INSERT INTO `adm_operation_log` VALUES (480, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:55:57', '2019-12-24 07:55:57');
INSERT INTO `adm_operation_log` VALUES (481, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 07:56:00', '2019-12-24 07:56:00');
INSERT INTO `adm_operation_log` VALUES (482, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7eecb490-7694-4457-9787-dc1c2b92f0d8\"],\"node_addr\":[\"/ip4/0.0.0.0/tcp/15001\"],\"node_status\":[\"1\"]}', '2019-12-24 07:56:03', '2019-12-24 07:56:03');
INSERT INTO `adm_operation_log` VALUES (483, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"efcdfee1-a5d7-4cf8-9d03-0cde4108941f\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"1\"]}', '2019-12-24 07:56:24', '2019-12-24 07:56:24');
INSERT INTO `adm_operation_log` VALUES (484, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"127f41dd-b65d-4932-800d-3fe33c383090\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"1\"]}', '2019-12-24 07:57:11', '2019-12-24 07:57:11');
INSERT INTO `adm_operation_log` VALUES (485, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 07:57:17', '2019-12-24 07:57:17');
INSERT INTO `adm_operation_log` VALUES (486, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 08:04:09', '2019-12-24 08:04:09');
INSERT INTO `adm_operation_log` VALUES (487, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ad183693-c07d-408b-b8c7-c387bfafa3ec\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"]}', '2019-12-24 08:04:25', '2019-12-24 08:04:25');
INSERT INTO `adm_operation_log` VALUES (488, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b3de975b-5790-42c7-907d-6ea488f93216\"],\"id\":[\"6\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"]}', '2019-12-24 08:05:41', '2019-12-24 08:05:41');
INSERT INTO `adm_operation_log` VALUES (489, 1, '/admin/info/nodes/new', 'GET', '127.0.0.1', '', '2019-12-24 08:05:48', '2019-12-24 08:05:48');
INSERT INTO `adm_operation_log` VALUES (490, 1, '/admin/new/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5205186a-641a-4bbb-8196-61bd85ad5d40\"],\"id\":[\"7\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"]}', '2019-12-24 08:05:52', '2019-12-24 08:05:52');
INSERT INTO `adm_operation_log` VALUES (491, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:06:30', '2019-12-24 08:06:30');
INSERT INTO `adm_operation_log` VALUES (492, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"cd9b2aa8-afff-480a-9fac-852ea6775e03\"],\"created_at\":[\"2019-12-24 08:05:52\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"updated_at\":[\"2019-12-24 08:05:52\"]}', '2019-12-24 08:06:43', '2019-12-24 08:06:43');
INSERT INTO `adm_operation_log` VALUES (493, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:06:48', '2019-12-24 08:06:48');
INSERT INTO `adm_operation_log` VALUES (494, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-24 08:06:49', '2019-12-24 08:06:49');
INSERT INTO `adm_operation_log` VALUES (495, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:06:50', '2019-12-24 08:06:50');
INSERT INTO `adm_operation_log` VALUES (496, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:07:01', '2019-12-24 08:07:01');
INSERT INTO `adm_operation_log` VALUES (497, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:07:53', '2019-12-24 08:07:53');
INSERT INTO `adm_operation_log` VALUES (498, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:08:02', '2019-12-24 08:08:02');
INSERT INTO `adm_operation_log` VALUES (499, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:08:05', '2019-12-24 08:08:05');
INSERT INTO `adm_operation_log` VALUES (500, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"0601498e-52f3-48d7-9bea-5caa718aa856\"],\"created_at\":[\"2019-12-24 08:05:41\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"updated_at\":[\"2019-12-24 08:05:41\"]}', '2019-12-24 08:08:13', '2019-12-24 08:08:13');
INSERT INTO `adm_operation_log` VALUES (501, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-24 08:08:16', '2019-12-24 08:08:16');
INSERT INTO `adm_operation_log` VALUES (502, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:08:17', '2019-12-24 08:08:17');
INSERT INTO `adm_operation_log` VALUES (503, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:08:53', '2019-12-24 08:08:53');
INSERT INTO `adm_operation_log` VALUES (504, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:08:55', '2019-12-24 08:08:55');
INSERT INTO `adm_operation_log` VALUES (505, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c3797207-b20d-47ae-9b05-c5a748be190e\"],\"created_at\":[\"2019-12-24 08:05:41\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"updated_at\":[\"2019-12-24 08:05:41\"]}', '2019-12-24 08:09:04', '2019-12-24 08:09:04');
INSERT INTO `adm_operation_log` VALUES (506, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:09:22', '2019-12-24 08:09:22');
INSERT INTO `adm_operation_log` VALUES (507, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:09:25', '2019-12-24 08:09:25');
INSERT INTO `adm_operation_log` VALUES (508, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ee4e8aa6-34e1-45e9-9b72-942e460c631b\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"]}', '2019-12-24 08:09:30', '2019-12-24 08:09:30');
INSERT INTO `adm_operation_log` VALUES (509, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ee4e8aa6-34e1-45e9-9b72-942e460c631b\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"]}', '2019-12-24 08:09:32', '2019-12-24 08:09:32');
INSERT INTO `adm_operation_log` VALUES (510, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:09:35', '2019-12-24 08:09:35');
INSERT INTO `adm_operation_log` VALUES (511, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:09:38', '2019-12-24 08:09:38');
INSERT INTO `adm_operation_log` VALUES (512, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:09:42', '2019-12-24 08:09:42');
INSERT INTO `adm_operation_log` VALUES (513, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"8c9b326f-9720-446d-9676-187d729fbf7e\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"]}', '2019-12-24 08:09:47', '2019-12-24 08:09:47');
INSERT INTO `adm_operation_log` VALUES (514, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"8c9b326f-9720-446d-9676-187d729fbf7e\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"]}', '2019-12-24 08:09:49', '2019-12-24 08:09:49');
INSERT INTO `adm_operation_log` VALUES (515, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:09:51', '2019-12-24 08:09:51');
INSERT INTO `adm_operation_log` VALUES (516, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:11:59', '2019-12-24 08:11:59');
INSERT INTO `adm_operation_log` VALUES (517, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:12:05', '2019-12-24 08:12:05');
INSERT INTO `adm_operation_log` VALUES (518, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"46f2cb44-c946-4dc9-80b9-4d71cedf92be\"],\"id\":[\"6\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"]}', '2019-12-24 08:12:14', '2019-12-24 08:12:14');
INSERT INTO `adm_operation_log` VALUES (519, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:12:17', '2019-12-24 08:12:17');
INSERT INTO `adm_operation_log` VALUES (520, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6790ca24-6ccc-4b0a-9653-e06842d4c12f\"],\"id\":[\"6\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"]}', '2019-12-24 08:12:22', '2019-12-24 08:12:22');
INSERT INTO `adm_operation_log` VALUES (521, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:12:43', '2019-12-24 08:12:43');
INSERT INTO `adm_operation_log` VALUES (522, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:13:04', '2019-12-24 08:13:04');
INSERT INTO `adm_operation_log` VALUES (523, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:13:05', '2019-12-24 08:13:05');
INSERT INTO `adm_operation_log` VALUES (524, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:13:06', '2019-12-24 08:13:06');
INSERT INTO `adm_operation_log` VALUES (525, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:17:35', '2019-12-24 08:17:35');
INSERT INTO `adm_operation_log` VALUES (526, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:18:12', '2019-12-24 08:18:12');
INSERT INTO `adm_operation_log` VALUES (527, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:18:16', '2019-12-24 08:18:16');
INSERT INTO `adm_operation_log` VALUES (528, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:19:28', '2019-12-24 08:19:28');
INSERT INTO `adm_operation_log` VALUES (529, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:19:32', '2019-12-24 08:19:32');
INSERT INTO `adm_operation_log` VALUES (530, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"51cb3f45-a970-458f-9fb1-550e6d7b9157\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"QmbHutBd33cgTTrTrkkXuoVwNh9hytcYLphPyKM1HB4Civ\"],\"node_status\":[\"1\"]}', '2019-12-24 08:19:36', '2019-12-24 08:19:36');
INSERT INTO `adm_operation_log` VALUES (531, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:20:24', '2019-12-24 08:20:24');
INSERT INTO `adm_operation_log` VALUES (532, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:20:42', '2019-12-24 08:20:42');
INSERT INTO `adm_operation_log` VALUES (533, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:21:45', '2019-12-24 08:21:45');
INSERT INTO `adm_operation_log` VALUES (534, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:22:50', '2019-12-24 08:22:50');
INSERT INTO `adm_operation_log` VALUES (535, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:22:51', '2019-12-24 08:22:51');
INSERT INTO `adm_operation_log` VALUES (536, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:22:52', '2019-12-24 08:22:52');
INSERT INTO `adm_operation_log` VALUES (537, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:23:15', '2019-12-24 08:23:15');
INSERT INTO `adm_operation_log` VALUES (538, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:23:28', '2019-12-24 08:23:28');
INSERT INTO `adm_operation_log` VALUES (539, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:23:39', '2019-12-24 08:23:39');
INSERT INTO `adm_operation_log` VALUES (540, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:24:20', '2019-12-24 08:24:20');
INSERT INTO `adm_operation_log` VALUES (541, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:33:52', '2019-12-24 08:33:52');
INSERT INTO `adm_operation_log` VALUES (542, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:33:53', '2019-12-24 08:33:53');
INSERT INTO `adm_operation_log` VALUES (543, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5664ac76-2f8d-45c2-8e10-8ba580d8cbf3\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"1\"]}', '2019-12-24 08:33:56', '2019-12-24 08:33:56');
INSERT INTO `adm_operation_log` VALUES (544, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"391a928b-0467-4420-9e2d-de7df899be68\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"]}', '2019-12-24 08:36:55', '2019-12-24 08:36:55');
INSERT INTO `adm_operation_log` VALUES (545, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:36:57', '2019-12-24 08:36:57');
INSERT INTO `adm_operation_log` VALUES (546, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:36:59', '2019-12-24 08:36:59');
INSERT INTO `adm_operation_log` VALUES (547, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"2aca78fd-5e4b-49af-a81b-4710c67e3c33\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"1\"]}', '2019-12-24 08:37:02', '2019-12-24 08:37:02');
INSERT INTO `adm_operation_log` VALUES (548, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ae29ec48-da0e-475c-ae84-e4a56e0ad95a\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"]}', '2019-12-24 08:39:44', '2019-12-24 08:39:44');
INSERT INTO `adm_operation_log` VALUES (549, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:39:45', '2019-12-24 08:39:45');
INSERT INTO `adm_operation_log` VALUES (550, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:39:47', '2019-12-24 08:39:47');
INSERT INTO `adm_operation_log` VALUES (551, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"2843e7c5-a191-4ea5-861c-bbe009bc7546\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"1\"]}', '2019-12-24 08:39:51', '2019-12-24 08:39:51');
INSERT INTO `adm_operation_log` VALUES (552, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"46b845d4-f164-45c7-b5da-81ceb71c1caa\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"1\"]}', '2019-12-24 08:40:02', '2019-12-24 08:40:02');
INSERT INTO `adm_operation_log` VALUES (553, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:40:36', '2019-12-24 08:40:36');
INSERT INTO `adm_operation_log` VALUES (554, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:40:38', '2019-12-24 08:40:38');
INSERT INTO `adm_operation_log` VALUES (555, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:40:40', '2019-12-24 08:40:40');
INSERT INTO `adm_operation_log` VALUES (556, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"20651518-bed6-4ab5-a1c2-266554771148\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"1\"]}', '2019-12-24 08:40:44', '2019-12-24 08:40:44');
INSERT INTO `adm_operation_log` VALUES (557, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:42:28', '2019-12-24 08:42:28');
INSERT INTO `adm_operation_log` VALUES (558, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:42:31', '2019-12-24 08:42:31');
INSERT INTO `adm_operation_log` VALUES (559, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6a9b2f17-1e6e-4a5d-9920-c084493e44f0\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"]}', '2019-12-24 08:42:34', '2019-12-24 08:42:34');
INSERT INTO `adm_operation_log` VALUES (560, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9c961fe2-5aea-4daa-aa81-8d8f55eb1c4e\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"]}', '2019-12-24 08:44:19', '2019-12-24 08:44:19');
INSERT INTO `adm_operation_log` VALUES (561, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7b0738ff-ca58-478e-bc6e-4f1477246404\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"]}', '2019-12-24 08:45:23', '2019-12-24 08:45:23');
INSERT INTO `adm_operation_log` VALUES (562, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 08:45:24', '2019-12-24 08:45:24');
INSERT INTO `adm_operation_log` VALUES (563, 1, '/admin/info/nodes/edit', 'GET', '127.0.0.1', '', '2019-12-24 08:45:26', '2019-12-24 08:45:26');
INSERT INTO `adm_operation_log` VALUES (564, 1, '/admin/edit/nodes', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6f8ce5c4-0a51-4b60-b755-f386f9e66d42\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"]}', '2019-12-24 08:45:29', '2019-12-24 08:45:29');
INSERT INTO `adm_operation_log` VALUES (565, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 08:46:34', '2019-12-24 08:46:34');
INSERT INTO `adm_operation_log` VALUES (566, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:03:01', '2019-12-24 09:03:01');
INSERT INTO `adm_operation_log` VALUES (567, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:03:06', '2019-12-24 09:03:06');
INSERT INTO `adm_operation_log` VALUES (568, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:03:07', '2019-12-24 09:03:07');
INSERT INTO `adm_operation_log` VALUES (569, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:03:07', '2019-12-24 09:03:07');
INSERT INTO `adm_operation_log` VALUES (570, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-24 09:03:08', '2019-12-24 09:03:08');
INSERT INTO `adm_operation_log` VALUES (571, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:03:39', '2019-12-24 09:03:39');
INSERT INTO `adm_operation_log` VALUES (572, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:03:41', '2019-12-24 09:03:41');
INSERT INTO `adm_operation_log` VALUES (573, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:03:45', '2019-12-24 09:03:45');
INSERT INTO `adm_operation_log` VALUES (574, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:05:05', '2019-12-24 09:05:05');
INSERT INTO `adm_operation_log` VALUES (575, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:08:07', '2019-12-24 09:08:07');
INSERT INTO `adm_operation_log` VALUES (576, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:08:09', '2019-12-24 09:08:09');
INSERT INTO `adm_operation_log` VALUES (577, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:08:10', '2019-12-24 09:08:10');
INSERT INTO `adm_operation_log` VALUES (578, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:08:11', '2019-12-24 09:08:11');
INSERT INTO `adm_operation_log` VALUES (579, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:08:29', '2019-12-24 09:08:29');
INSERT INTO `adm_operation_log` VALUES (580, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:10:21', '2019-12-24 09:10:21');
INSERT INTO `adm_operation_log` VALUES (581, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:10:28', '2019-12-24 09:10:28');
INSERT INTO `adm_operation_log` VALUES (582, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:11:04', '2019-12-24 09:11:04');
INSERT INTO `adm_operation_log` VALUES (583, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:11:05', '2019-12-24 09:11:05');
INSERT INTO `adm_operation_log` VALUES (584, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:12:14', '2019-12-24 09:12:14');
INSERT INTO `adm_operation_log` VALUES (585, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:12:17', '2019-12-24 09:12:17');
INSERT INTO `adm_operation_log` VALUES (586, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a865fa8f-b4bf-47ee-b619-e4d33e8fc367\"],\"poster\":[\"\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:12:28', '2019-12-24 09:12:28');
INSERT INTO `adm_operation_log` VALUES (587, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a865fa8f-b4bf-47ee-b619-e4d33e8fc367\"],\"poster\":[\"\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:12:31', '2019-12-24 09:12:31');
INSERT INTO `adm_operation_log` VALUES (588, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:12:33', '2019-12-24 09:12:33');
INSERT INTO `adm_operation_log` VALUES (589, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:12:36', '2019-12-24 09:12:36');
INSERT INTO `adm_operation_log` VALUES (590, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b43c4b87-9c4f-4a73-9698-781cdb8f00db\"],\"poster\":[\"\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:12:41', '2019-12-24 09:12:41');
INSERT INTO `adm_operation_log` VALUES (591, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:13:34', '2019-12-24 09:13:34');
INSERT INTO `adm_operation_log` VALUES (592, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:13:34', '2019-12-24 09:13:34');
INSERT INTO `adm_operation_log` VALUES (593, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:13:36', '2019-12-24 09:13:36');
INSERT INTO `adm_operation_log` VALUES (594, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"01e6eb88-9d25-4b73-beab-c40ed5857009\"],\"id\":[\"2\"],\"poster\":[\"\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:13:42', '2019-12-24 09:13:42');
INSERT INTO `adm_operation_log` VALUES (595, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:13:52', '2019-12-24 09:13:52');
INSERT INTO `adm_operation_log` VALUES (596, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e9927571-980b-4c97-b58d-75a6cfbaa24f\"],\"id\":[\"1\"],\"poster\":[\"\"],\"video_no\":[\"bbb321\"]}', '2019-12-24 09:13:58', '2019-12-24 09:13:58');
INSERT INTO `adm_operation_log` VALUES (597, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:16:46', '2019-12-24 09:16:46');
INSERT INTO `adm_operation_log` VALUES (598, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:16:49', '2019-12-24 09:16:49');
INSERT INTO `adm_operation_log` VALUES (599, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"cfa8f632-899a-490f-b377-b2b2ef41e99f\"],\"id\":[\"2\"],\"poster\":[\"841410c5-3195-4abb-b776-b461d3dafc2d.jpg\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:16:55', '2019-12-24 09:16:55');
INSERT INTO `adm_operation_log` VALUES (600, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:17:00', '2019-12-24 09:17:00');
INSERT INTO `adm_operation_log` VALUES (601, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b93292ea-ce6d-4c83-a448-ce6fbcb3fd51\"],\"id\":[\"2\"],\"poster\":[\"\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:17:02', '2019-12-24 09:17:02');
INSERT INTO `adm_operation_log` VALUES (602, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:18:25', '2019-12-24 09:18:25');
INSERT INTO `adm_operation_log` VALUES (603, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"828fd322-07cd-499c-a9d9-dadcc642e574\"],\"id\":[\"2\"],\"poster\":[\"dcf78630-afa0-4709-bcd6-f1d576e3dd18.jpg\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:18:31', '2019-12-24 09:18:31');
INSERT INTO `adm_operation_log` VALUES (604, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:18:32', '2019-12-24 09:18:32');
INSERT INTO `adm_operation_log` VALUES (605, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"2e2404f2-e05c-487c-978d-c4ae884e88dd\"],\"id\":[\"2\"],\"video_no\":[\"abp-874\"]}', '2019-12-24 09:18:33', '2019-12-24 09:18:33');
INSERT INTO `adm_operation_log` VALUES (606, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f2eec578-32f7-4dfc-8c93-e4990dc4af88\"],\"id\":[\"2\"],\"video_no\":[\"abp-874222\"]}', '2019-12-24 09:18:41', '2019-12-24 09:18:41');
INSERT INTO `adm_operation_log` VALUES (607, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:18:44', '2019-12-24 09:18:44');
INSERT INTO `adm_operation_log` VALUES (608, 1, '/admin/edit/videos', 'POST', '127.0.0.1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b1f025dc-0750-4caf-938e-c286c228d81c\"],\"id\":[\"2\"],\"video_no\":[\"abp-8742333333\"]}', '2019-12-24 09:18:46', '2019-12-24 09:18:46');
INSERT INTO `adm_operation_log` VALUES (609, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:19:28', '2019-12-24 09:19:28');
INSERT INTO `adm_operation_log` VALUES (610, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:19:41', '2019-12-24 09:19:41');
INSERT INTO `adm_operation_log` VALUES (611, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:19:57', '2019-12-24 09:19:57');
INSERT INTO `adm_operation_log` VALUES (612, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:21:29', '2019-12-24 09:21:29');
INSERT INTO `adm_operation_log` VALUES (613, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:21:33', '2019-12-24 09:21:33');
INSERT INTO `adm_operation_log` VALUES (614, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:22:21', '2019-12-24 09:22:21');
INSERT INTO `adm_operation_log` VALUES (615, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:22:26', '2019-12-24 09:22:26');
INSERT INTO `adm_operation_log` VALUES (616, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:24:09', '2019-12-24 09:24:09');
INSERT INTO `adm_operation_log` VALUES (617, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:24:18', '2019-12-24 09:24:18');
INSERT INTO `adm_operation_log` VALUES (618, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:24:20', '2019-12-24 09:24:20');
INSERT INTO `adm_operation_log` VALUES (619, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:29:31', '2019-12-24 09:29:31');
INSERT INTO `adm_operation_log` VALUES (620, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:29:34', '2019-12-24 09:29:34');
INSERT INTO `adm_operation_log` VALUES (621, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:29:34', '2019-12-24 09:29:34');
INSERT INTO `adm_operation_log` VALUES (622, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:29:49', '2019-12-24 09:29:49');
INSERT INTO `adm_operation_log` VALUES (623, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:29:51', '2019-12-24 09:29:51');
INSERT INTO `adm_operation_log` VALUES (624, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:29:51', '2019-12-24 09:29:51');
INSERT INTO `adm_operation_log` VALUES (625, 1, '/admin/info/videos/edit', 'GET', '127.0.0.1', '', '2019-12-24 09:30:09', '2019-12-24 09:30:09');
INSERT INTO `adm_operation_log` VALUES (626, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:30:12', '2019-12-24 09:30:12');
INSERT INTO `adm_operation_log` VALUES (627, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:31:05', '2019-12-24 09:31:05');
INSERT INTO `adm_operation_log` VALUES (628, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 09:31:57', '2019-12-24 09:31:57');
INSERT INTO `adm_operation_log` VALUES (629, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 09:53:12', '2019-12-24 09:53:12');
INSERT INTO `adm_operation_log` VALUES (630, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:16:17', '2019-12-24 10:16:17');
INSERT INTO `adm_operation_log` VALUES (631, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:39:41', '2019-12-24 10:39:41');
INSERT INTO `adm_operation_log` VALUES (632, 1, '/admin/export/videos', 'POST', '127.0.0.1', '', '2019-12-24 10:39:44', '2019-12-24 10:39:44');
INSERT INTO `adm_operation_log` VALUES (633, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:50:21', '2019-12-24 10:50:21');
INSERT INTO `adm_operation_log` VALUES (634, 1, '/admin/info/videos/new', 'GET', '127.0.0.1', '', '2019-12-24 10:50:23', '2019-12-24 10:50:23');
INSERT INTO `adm_operation_log` VALUES (635, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:51:50', '2019-12-24 10:51:50');
INSERT INTO `adm_operation_log` VALUES (636, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:52:17', '2019-12-24 10:52:17');
INSERT INTO `adm_operation_log` VALUES (637, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-24 10:52:17', '2019-12-24 10:52:17');
INSERT INTO `adm_operation_log` VALUES (638, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:52:18', '2019-12-24 10:52:18');
INSERT INTO `adm_operation_log` VALUES (639, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:55:35', '2019-12-24 10:55:35');
INSERT INTO `adm_operation_log` VALUES (640, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:55:41', '2019-12-24 10:55:41');
INSERT INTO `adm_operation_log` VALUES (641, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:55:43', '2019-12-24 10:55:43');
INSERT INTO `adm_operation_log` VALUES (642, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:55:44', '2019-12-24 10:55:44');
INSERT INTO `adm_operation_log` VALUES (643, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:56:00', '2019-12-24 10:56:00');
INSERT INTO `adm_operation_log` VALUES (644, 1, '/admin/update/videos', 'POST', '127.0.0.1', '', '2019-12-24 10:56:05', '2019-12-24 10:56:05');
INSERT INTO `adm_operation_log` VALUES (645, 1, '/admin/update/videos', 'POST', '127.0.0.1', '', '2019-12-24 10:56:12', '2019-12-24 10:56:12');
INSERT INTO `adm_operation_log` VALUES (646, 1, '/admin/update/videos', 'POST', '127.0.0.1', '', '2019-12-24 10:56:13', '2019-12-24 10:56:13');
INSERT INTO `adm_operation_log` VALUES (647, 1, '/admin/update/videos', 'POST', '127.0.0.1', '', '2019-12-24 10:56:13', '2019-12-24 10:56:13');
INSERT INTO `adm_operation_log` VALUES (648, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:56:19', '2019-12-24 10:56:19');
INSERT INTO `adm_operation_log` VALUES (649, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:56:22', '2019-12-24 10:56:22');
INSERT INTO `adm_operation_log` VALUES (650, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:31', '2019-12-24 10:57:31');
INSERT INTO `adm_operation_log` VALUES (651, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:37', '2019-12-24 10:57:37');
INSERT INTO `adm_operation_log` VALUES (652, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:40', '2019-12-24 10:57:40');
INSERT INTO `adm_operation_log` VALUES (653, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:43', '2019-12-24 10:57:43');
INSERT INTO `adm_operation_log` VALUES (654, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:45', '2019-12-24 10:57:45');
INSERT INTO `adm_operation_log` VALUES (655, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:48', '2019-12-24 10:57:48');
INSERT INTO `adm_operation_log` VALUES (656, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:51', '2019-12-24 10:57:51');
INSERT INTO `adm_operation_log` VALUES (657, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:53', '2019-12-24 10:57:53');
INSERT INTO `adm_operation_log` VALUES (658, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-24 10:57:56', '2019-12-24 10:57:56');
INSERT INTO `adm_operation_log` VALUES (659, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-25 07:27:24', '2019-12-25 07:27:24');
INSERT INTO `adm_operation_log` VALUES (660, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-25 07:27:58', '2019-12-25 07:27:58');
INSERT INTO `adm_operation_log` VALUES (661, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-25 07:47:51', '2019-12-25 07:47:51');
INSERT INTO `adm_operation_log` VALUES (662, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-25 07:48:02', '2019-12-25 07:48:02');
INSERT INTO `adm_operation_log` VALUES (663, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-25 07:48:04', '2019-12-25 07:48:04');
INSERT INTO `adm_operation_log` VALUES (664, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-25 07:59:29', '2019-12-25 07:59:29');
INSERT INTO `adm_operation_log` VALUES (665, 1, '/admin/info/user', 'GET', '127.0.0.1', '', '2019-12-25 07:59:43', '2019-12-25 07:59:43');
INSERT INTO `adm_operation_log` VALUES (666, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-25 07:59:44', '2019-12-25 07:59:44');
INSERT INTO `adm_operation_log` VALUES (667, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-25 07:59:45', '2019-12-25 07:59:45');
INSERT INTO `adm_operation_log` VALUES (668, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-25 08:00:47', '2019-12-25 08:00:47');
INSERT INTO `adm_operation_log` VALUES (669, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-25 08:00:49', '2019-12-25 08:00:49');
INSERT INTO `adm_operation_log` VALUES (670, 1, '/admin/info/authors', 'GET', '127.0.0.1', '', '2019-12-25 08:00:50', '2019-12-25 08:00:50');
INSERT INTO `adm_operation_log` VALUES (671, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-25 08:00:52', '2019-12-25 08:00:52');
INSERT INTO `adm_operation_log` VALUES (672, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-25 08:00:56', '2019-12-25 08:00:56');
INSERT INTO `adm_operation_log` VALUES (673, 1, '/admin/info/posts', 'GET', '127.0.0.1', '', '2019-12-25 08:00:58', '2019-12-25 08:00:58');
INSERT INTO `adm_operation_log` VALUES (674, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-25 08:02:21', '2019-12-25 08:02:21');
INSERT INTO `adm_operation_log` VALUES (675, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-25 08:02:24', '2019-12-25 08:02:24');
INSERT INTO `adm_operation_log` VALUES (676, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-25 08:02:27', '2019-12-25 08:02:27');
INSERT INTO `adm_operation_log` VALUES (677, 1, '/admin/info/nodes', 'GET', '127.0.0.1', '', '2019-12-25 08:02:29', '2019-12-25 08:02:29');
INSERT INTO `adm_operation_log` VALUES (678, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-25 08:50:52', '2019-12-25 08:50:52');
INSERT INTO `adm_operation_log` VALUES (679, 1, '/admin/menu', 'GET', '::1', '', '2019-12-25 08:51:19', '2019-12-25 08:51:19');
INSERT INTO `adm_operation_log` VALUES (680, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-25 08:51:24', '2019-12-25 08:51:24');
INSERT INTO `adm_operation_log` VALUES (681, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"b16cb42d-7a54-4b72-a68b-dc2feee0e2ef\"],\"header\":[\"管理\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频\"],\"uri\":[\"/info/infos\"]}', '2019-12-25 08:51:29', '2019-12-25 08:51:29');
INSERT INTO `adm_operation_log` VALUES (682, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 08:51:31', '2019-12-25 08:51:31');
INSERT INTO `adm_operation_log` VALUES (683, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 08:53:55', '2019-12-25 08:53:55');
INSERT INTO `adm_operation_log` VALUES (684, 1, '/admin/info/infos/new', 'GET', '::1', '', '2019-12-25 08:54:04', '2019-12-25 08:54:04');
INSERT INTO `adm_operation_log` VALUES (685, 1, '/admin/new/infos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/infos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7fca1102-aaa5-4245-ba35-9eebba6fb23c\"],\"file\":[\"c0903247-9a80-414f-aec2-7e33f65ad439.jpg\"]}', '2019-12-25 08:54:21', '2019-12-25 08:54:21');
INSERT INTO `adm_operation_log` VALUES (686, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 09:01:19', '2019-12-25 09:01:19');
INSERT INTO `adm_operation_log` VALUES (687, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 09:01:22', '2019-12-25 09:01:22');
INSERT INTO `adm_operation_log` VALUES (688, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-25 09:01:28', '2019-12-25 09:01:28');
INSERT INTO `adm_operation_log` VALUES (689, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 09:01:36', '2019-12-25 09:01:36');
INSERT INTO `adm_operation_log` VALUES (690, 1, '/admin/info/infos/new', 'GET', '::1', '', '2019-12-25 09:01:50', '2019-12-25 09:01:50');
INSERT INTO `adm_operation_log` VALUES (691, 1, '/admin/info/infos/new', 'GET', '::1', '', '2019-12-25 09:43:49', '2019-12-25 09:43:49');
INSERT INTO `adm_operation_log` VALUES (692, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 09:43:52', '2019-12-25 09:43:52');
INSERT INTO `adm_operation_log` VALUES (693, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 09:58:42', '2019-12-25 09:58:42');
INSERT INTO `adm_operation_log` VALUES (694, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 09:59:59', '2019-12-25 09:59:59');
INSERT INTO `adm_operation_log` VALUES (695, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:00:59', '2019-12-25 10:00:59');
INSERT INTO `adm_operation_log` VALUES (696, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:02:31', '2019-12-25 10:02:31');
INSERT INTO `adm_operation_log` VALUES (697, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:03:50', '2019-12-25 10:03:50');
INSERT INTO `adm_operation_log` VALUES (698, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:09:00', '2019-12-25 10:09:00');
INSERT INTO `adm_operation_log` VALUES (699, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:10:04', '2019-12-25 10:10:04');
INSERT INTO `adm_operation_log` VALUES (700, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:11:25', '2019-12-25 10:11:25');
INSERT INTO `adm_operation_log` VALUES (701, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:11:27', '2019-12-25 10:11:27');
INSERT INTO `adm_operation_log` VALUES (702, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:11:28', '2019-12-25 10:11:28');
INSERT INTO `adm_operation_log` VALUES (703, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:11:33', '2019-12-25 10:11:33');
INSERT INTO `adm_operation_log` VALUES (704, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:14:38', '2019-12-25 10:14:38');
INSERT INTO `adm_operation_log` VALUES (705, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:16:21', '2019-12-25 10:16:21');
INSERT INTO `adm_operation_log` VALUES (706, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:16:40', '2019-12-25 10:16:40');
INSERT INTO `adm_operation_log` VALUES (707, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:17:27', '2019-12-25 10:17:27');
INSERT INTO `adm_operation_log` VALUES (708, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:20:23', '2019-12-25 10:20:23');
INSERT INTO `adm_operation_log` VALUES (709, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:27:46', '2019-12-25 10:27:46');
INSERT INTO `adm_operation_log` VALUES (710, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:28:37', '2019-12-25 10:28:37');
INSERT INTO `adm_operation_log` VALUES (711, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:29:00', '2019-12-25 10:29:00');
INSERT INTO `adm_operation_log` VALUES (712, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:29:03', '2019-12-25 10:29:03');
INSERT INTO `adm_operation_log` VALUES (713, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:29:36', '2019-12-25 10:29:36');
INSERT INTO `adm_operation_log` VALUES (714, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-25 10:30:10', '2019-12-25 10:30:10');
INSERT INTO `adm_operation_log` VALUES (715, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:30:28', '2019-12-25 10:30:28');
INSERT INTO `adm_operation_log` VALUES (716, 1, '/admin/info/infos/new', 'GET', '::1', '', '2019-12-25 10:30:44', '2019-12-25 10:30:44');
INSERT INTO `adm_operation_log` VALUES (717, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:37:17', '2019-12-25 10:37:17');
INSERT INTO `adm_operation_log` VALUES (718, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:40:12', '2019-12-25 10:40:12');
INSERT INTO `adm_operation_log` VALUES (719, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-25 10:42:04', '2019-12-25 10:42:04');
INSERT INTO `adm_operation_log` VALUES (720, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:20:54', '2019-12-26 05:20:54');
INSERT INTO `adm_operation_log` VALUES (721, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:21:02', '2019-12-26 05:21:02');
INSERT INTO `adm_operation_log` VALUES (722, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:21:03', '2019-12-26 05:21:03');
INSERT INTO `adm_operation_log` VALUES (723, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:21:04', '2019-12-26 05:21:04');
INSERT INTO `adm_operation_log` VALUES (724, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:21:05', '2019-12-26 05:21:05');
INSERT INTO `adm_operation_log` VALUES (725, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:21:06', '2019-12-26 05:21:06');
INSERT INTO `adm_operation_log` VALUES (726, 1, '/admin/update/infos', 'POST', '::1', '', '2019-12-26 05:21:58', '2019-12-26 05:21:58');
INSERT INTO `adm_operation_log` VALUES (727, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:22:04', '2019-12-26 05:22:04');
INSERT INTO `adm_operation_log` VALUES (728, 1, '/admin/update/infos', 'POST', '::1', '', '2019-12-26 05:22:12', '2019-12-26 05:22:12');
INSERT INTO `adm_operation_log` VALUES (729, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:22:20', '2019-12-26 05:22:20');
INSERT INTO `adm_operation_log` VALUES (730, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:22:23', '2019-12-26 05:22:23');
INSERT INTO `adm_operation_log` VALUES (731, 1, '/admin/info/vudeos', 'GET', '::1', '', '2019-12-26 05:32:56', '2019-12-26 05:32:56');
INSERT INTO `adm_operation_log` VALUES (732, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 05:33:03', '2019-12-26 05:33:03');
INSERT INTO `adm_operation_log` VALUES (733, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 05:33:28', '2019-12-26 05:33:28');
INSERT INTO `adm_operation_log` VALUES (734, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 05:37:46', '2019-12-26 05:37:46');
INSERT INTO `adm_operation_log` VALUES (735, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:37:58', '2019-12-26 05:37:58');
INSERT INTO `adm_operation_log` VALUES (736, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-26 05:37:59', '2019-12-26 05:37:59');
INSERT INTO `adm_operation_log` VALUES (737, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:38:00', '2019-12-26 05:38:00');
INSERT INTO `adm_operation_log` VALUES (738, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:38:01', '2019-12-26 05:38:01');
INSERT INTO `adm_operation_log` VALUES (739, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:38:01', '2019-12-26 05:38:01');
INSERT INTO `adm_operation_log` VALUES (740, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:38:01', '2019-12-26 05:38:01');
INSERT INTO `adm_operation_log` VALUES (741, 1, '/admin/menu', 'GET', '::1', '', '2019-12-26 05:38:06', '2019-12-26 05:38:06');
INSERT INTO `adm_operation_log` VALUES (742, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-26 05:38:09', '2019-12-26 05:38:09');
INSERT INTO `adm_operation_log` VALUES (743, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"44e9f2bb-33b1-43e8-9dae-b44bfe14d9fd\"],\"header\":[\"管理\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频\"],\"uri\":[\"/info/videos\"]}', '2019-12-26 05:38:13', '2019-12-26 05:38:13');
INSERT INTO `adm_operation_log` VALUES (744, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:38:15', '2019-12-26 05:38:15');
INSERT INTO `adm_operation_log` VALUES (745, 1, '/admin/info/infos', 'GET', '::1', '', '2019-12-26 05:38:17', '2019-12-26 05:38:17');
INSERT INTO `adm_operation_log` VALUES (746, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 05:38:19', '2019-12-26 05:38:19');
INSERT INTO `adm_operation_log` VALUES (747, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 05:38:24', '2019-12-26 05:38:24');
INSERT INTO `adm_operation_log` VALUES (748, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 05:38:25', '2019-12-26 05:38:25');
INSERT INTO `adm_operation_log` VALUES (749, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 06:36:44', '2019-12-26 06:36:44');
INSERT INTO `adm_operation_log` VALUES (750, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=no\\u0026__sort_type=asc\"],\"_t\":[\"79ca7528-2268-4015-8521-ae5625488a32\"],\"banno\":[\"abp-874\"]}', '2019-12-26 06:36:49', '2019-12-26 06:36:49');
INSERT INTO `adm_operation_log` VALUES (751, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=no\\u0026__sort_type=asc\"],\"_t\":[\"369aea67-66f7-456c-bf20-88e1deeaaed7\"],\"banno\":[\"abp-874\"]}', '2019-12-26 06:37:44', '2019-12-26 06:37:44');
INSERT INTO `adm_operation_log` VALUES (752, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"554966a2-37d4-422d-9d81-18a96dc729e4\"],\"banno\":[\"abp-874\"]}', '2019-12-26 06:41:06', '2019-12-26 06:41:06');
INSERT INTO `adm_operation_log` VALUES (753, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 06:41:09', '2019-12-26 06:41:09');
INSERT INTO `adm_operation_log` VALUES (754, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 06:41:10', '2019-12-26 06:41:10');
INSERT INTO `adm_operation_log` VALUES (755, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b608116f-7148-4712-9031-3b2da73d3494\"],\"banno\":[\"abp-874\"]}', '2019-12-26 06:41:13', '2019-12-26 06:41:13');
INSERT INTO `adm_operation_log` VALUES (756, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c59d9e5c-5bb4-4faa-9d6a-9bcbc8d8521e\"],\"banno\":[\"abp-874\"]}', '2019-12-26 06:41:17', '2019-12-26 06:41:17');
INSERT INTO `adm_operation_log` VALUES (757, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 06:42:30', '2019-12-26 06:42:30');
INSERT INTO `adm_operation_log` VALUES (758, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 06:42:31', '2019-12-26 06:42:31');
INSERT INTO `adm_operation_log` VALUES (759, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e781eeaa-8abf-47eb-8cb9-28a0e8644887\"],\"banno\":[\"abp-874\"]}', '2019-12-26 06:42:34', '2019-12-26 06:42:34');
INSERT INTO `adm_operation_log` VALUES (760, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c65f377f-07c2-403a-add7-7a2fffee5851\"],\"banno\":[\"abp-874\"]}', '2019-12-26 06:42:40', '2019-12-26 06:42:40');
INSERT INTO `adm_operation_log` VALUES (761, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 07:02:20', '2019-12-26 07:02:20');
INSERT INTO `adm_operation_log` VALUES (762, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 07:02:21', '2019-12-26 07:02:21');
INSERT INTO `adm_operation_log` VALUES (763, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"60eab061-1f89-411f-bcb4-2ab22f865fdb\"],\"banno\":[\"abp-874\"]}', '2019-12-26 07:02:49', '2019-12-26 07:02:49');
INSERT INTO `adm_operation_log` VALUES (764, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 07:03:51', '2019-12-26 07:03:51');
INSERT INTO `adm_operation_log` VALUES (765, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 07:03:53', '2019-12-26 07:03:53');
INSERT INTO `adm_operation_log` VALUES (766, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b8309982-9f2c-431a-833f-5dc27ea4c6f2\"],\"banno\":[\"snis-647\"]}', '2019-12-26 07:04:37', '2019-12-26 07:04:37');
INSERT INTO `adm_operation_log` VALUES (767, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 07:09:46', '2019-12-26 07:09:46');
INSERT INTO `adm_operation_log` VALUES (768, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"54284492-2ead-41a3-8cdc-5be0e4ad35f8\"],\"banno\":[\"abp-871\"]}', '2019-12-26 07:10:28', '2019-12-26 07:10:28');
INSERT INTO `adm_operation_log` VALUES (769, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 07:35:58', '2019-12-26 07:35:58');
INSERT INTO `adm_operation_log` VALUES (770, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-26 07:36:24', '2019-12-26 07:36:24');
INSERT INTO `adm_operation_log` VALUES (771, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 07:36:28', '2019-12-26 07:36:28');
INSERT INTO `adm_operation_log` VALUES (772, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"576d2b9f-0736-4589-b2e5-3fa2d5151f60\"],\"id\":[\"3\"],\"source_path\":[\"/list\"],\"video_no\":[\"abp-874\"]}', '2019-12-26 07:36:35', '2019-12-26 07:36:35');
INSERT INTO `adm_operation_log` VALUES (773, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 07:37:36', '2019-12-26 07:37:36');
INSERT INTO `adm_operation_log` VALUES (774, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"0c3de7bd-2d36-4fbb-914c-115edd4b3896\"],\"actors\":[\"園田みおん\"],\"id\":[\"4\"],\"info_path\":[\"data\\\\info\\\\ABP-874\\\\.info\"],\"intro\":[\"僕とみおんの異世界性活 最強セクシー装備でエロさ限界突破！！！ 園田みおん\"],\"poster_path\":[\"data\\\\info\\\\ABP-874\\\\image.jpg\"],\"source_path\":[\"/dir/list\"],\"tags\":[\"コスプレ,3P・4P,巨乳,単体作品,パイズリ,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-874\\\\thumb.jpg\"],\"video_id\":[\"9d4b60b2-27b2-11ea-94c2-00155d012d1c\"],\"video_no\":[\"abp-874\"]}', '2019-12-26 07:37:48', '2019-12-26 07:37:48');
INSERT INTO `adm_operation_log` VALUES (775, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 07:41:19', '2019-12-26 07:41:19');
INSERT INTO `adm_operation_log` VALUES (776, 1, '/admin/delete/videos', 'POST', '::1', '', '2019-12-26 07:41:23', '2019-12-26 07:41:23');
INSERT INTO `adm_operation_log` VALUES (777, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 07:41:23', '2019-12-26 07:41:23');
INSERT INTO `adm_operation_log` VALUES (778, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 07:45:03', '2019-12-26 07:45:03');
INSERT INTO `adm_operation_log` VALUES (779, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-26 07:45:43', '2019-12-26 07:45:43');
INSERT INTO `adm_operation_log` VALUES (780, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:03:35', '2019-12-26 08:03:35');
INSERT INTO `adm_operation_log` VALUES (781, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:03:35', '2019-12-26 08:03:35');
INSERT INTO `adm_operation_log` VALUES (782, 1, '/admin/delete/videos', 'POST', '::1', '', '2019-12-26 08:03:42', '2019-12-26 08:03:42');
INSERT INTO `adm_operation_log` VALUES (783, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:03:42', '2019-12-26 08:03:42');
INSERT INTO `adm_operation_log` VALUES (784, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 08:03:45', '2019-12-26 08:03:45');
INSERT INTO `adm_operation_log` VALUES (785, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"76d1dba0-2f12-4f56-a5ee-05e33d32710c\"],\"actors\":[\"園田みおん\"],\"id\":[\"5\"],\"info_path\":[\"data\\\\info\\\\ABP-874\\\\.info\"],\"intro\":[\"僕とみおんの異世界性活 最強セクシー装備でエロさ限界突破！！！ 園田みおん\"],\"poster_path\":[\"data\\\\info\\\\ABP-874\\\\image.jpg\"],\"source_path\":[\"list\"],\"tags\":[\"コスプレ,3P・4P,巨乳,単体作品,パイズリ,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-874\\\\thumb.jpg\"],\"video_id\":[\"43bbb4d0-27b6-11ea-be04-00155d012d1c\"],\"video_no\":[\"ABP-874\"]}', '2019-12-26 08:03:56', '2019-12-26 08:03:56');
INSERT INTO `adm_operation_log` VALUES (786, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:05:17', '2019-12-26 08:05:17');
INSERT INTO `adm_operation_log` VALUES (787, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:05:17', '2019-12-26 08:05:17');
INSERT INTO `adm_operation_log` VALUES (788, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:06:16', '2019-12-26 08:06:16');
INSERT INTO `adm_operation_log` VALUES (789, 1, '/admin/info/data\\info\\ABP-874\\image.jpg', 'GET', '::1', '', '2019-12-26 08:06:16', '2019-12-26 08:06:16');
INSERT INTO `adm_operation_log` VALUES (790, 1, '/admin/update/videos', 'POST', '::1', '', '2019-12-26 08:06:33', '2019-12-26 08:06:33');
INSERT INTO `adm_operation_log` VALUES (791, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:06:35', '2019-12-26 08:06:35');
INSERT INTO `adm_operation_log` VALUES (792, 1, '/admin/info/data\\info\\ABP-874\\image.jpg', 'GET', '::1', '', '2019-12-26 08:06:35', '2019-12-26 08:06:35');
INSERT INTO `adm_operation_log` VALUES (793, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:08:13', '2019-12-26 08:08:13');
INSERT INTO `adm_operation_log` VALUES (794, 1, '/admin/info/data\\info\\ABP-874\\image.jpg', 'GET', '::1', '', '2019-12-26 08:08:14', '2019-12-26 08:08:14');
INSERT INTO `adm_operation_log` VALUES (795, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:08:34', '2019-12-26 08:08:34');
INSERT INTO `adm_operation_log` VALUES (796, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:09:17', '2019-12-26 08:09:17');
INSERT INTO `adm_operation_log` VALUES (797, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 08:09:24', '2019-12-26 08:09:24');
INSERT INTO `adm_operation_log` VALUES (798, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\\u0026intro__operator__=like\\u0026intro=みおん\"],\"_t\":[\"bfccf7a1-fa65-4881-8825-85c43c14521b\"],\"actors\":[\"ABSOLUTELY PERFECT\"],\"id\":[\"6\"],\"info_path\":[\"data\\\\info\\\\ABP-888\\\\.info\"],\"intro\":[\"伝説の超高級サロン 究極のM性感 秘密倶楽部 乙都さきのが責めて責めて責めまくる！！\"],\"poster_path\":[\"data\\\\info\\\\ABP-888\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"プレステージ\"],\"thumb_path\":[\"data\\\\info\\\\ABP-888\\\\thumb.jpg\"],\"video_id\":[\"1efe32d9-27b7-11ea-8511-00155d012d1c\"],\"video_no\":[\"ABP-888\"]}', '2019-12-26 08:10:04', '2019-12-26 08:10:04');
INSERT INTO `adm_operation_log` VALUES (799, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:10:27', '2019-12-26 08:10:27');
INSERT INTO `adm_operation_log` VALUES (800, 1, '/admin/delete/videos', 'POST', '::1', '', '2019-12-26 08:53:03', '2019-12-26 08:53:03');
INSERT INTO `adm_operation_log` VALUES (801, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:53:03', '2019-12-26 08:53:03');
INSERT INTO `adm_operation_log` VALUES (802, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 08:53:06', '2019-12-26 08:53:06');
INSERT INTO `adm_operation_log` VALUES (803, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=asc\"],\"_t\":[\"93b13336-c3db-46a1-8ea4-97b561a299b8\"],\"actors\":[\"ABSOLUTELY PERFECT\"],\"id\":[\"7\"],\"info_path\":[\"data\\\\info\\\\ABP-888\\\\.info\"],\"intro\":[\"伝説の超高級サロン 究極のM性感 秘密倶楽部 乙都さきのが責めて責めて責めまくる！！\"],\"poster_path\":[\"data\\\\info\\\\ABP-888\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"プレステージ\"],\"thumb_path\":[\"data\\\\info\\\\ABP-888\\\\thumb.jpg\"],\"video_id\":[\"25f029b5-27bd-11ea-bf54-00155d012d1c\"],\"video_no\":[\"ABP-888\"]}', '2019-12-26 08:53:12', '2019-12-26 08:53:12');
INSERT INTO `adm_operation_log` VALUES (804, 1, '/admin/delete/videos', 'POST', '::1', '', '2019-12-26 08:53:51', '2019-12-26 08:53:51');
INSERT INTO `adm_operation_log` VALUES (805, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:53:51', '2019-12-26 08:53:51');
INSERT INTO `adm_operation_log` VALUES (806, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 08:54:21', '2019-12-26 08:54:21');
INSERT INTO `adm_operation_log` VALUES (807, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=asc\"],\"_t\":[\"38e6f884-9a54-4e6f-b97a-980ccd12a10e\"],\"source_path\":[\"\"],\"video_no\":[\"ABP-888\\t\"]}', '2019-12-26 08:54:25', '2019-12-26 08:54:25');
INSERT INTO `adm_operation_log` VALUES (808, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=asc\"],\"_t\":[\"56da0b63-a146-4efc-9291-023893e1d926\"],\"source_path\":[\"\"],\"video_no\":[\"ABP-888\\t\"]}', '2019-12-26 08:55:25', '2019-12-26 08:55:25');
INSERT INTO `adm_operation_log` VALUES (809, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 08:55:29', '2019-12-26 08:55:29');
INSERT INTO `adm_operation_log` VALUES (810, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 08:55:31', '2019-12-26 08:55:31');
INSERT INTO `adm_operation_log` VALUES (811, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9e66fd88-4abe-4115-b2d6-af3869018517\"],\"actors\":[\"乙都さきの\"],\"id\":[\"8\"],\"info_path\":[\"data\\\\info\\\\ABP-888\\\\.info\"],\"intro\":[\"伝説の超高級サロン 究極のM性感 秘密倶楽部 乙都さきのが責めて責めて責めまくる！！\"],\"poster_path\":[\"data\\\\info\\\\ABP-888\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"ハイビジョン,顔射,おもちゃ,男の潮吹き,単体作品,M男\"],\"thumb_path\":[\"data\\\\info\\\\ABP-888\\\\thumb.jpg\"],\"video_id\":[\"7972ce0b-27bd-11ea-92bd-00155d012d1c\"],\"video_no\":[\"ABP-888\"]}', '2019-12-26 08:55:32', '2019-12-26 08:55:32');
INSERT INTO `adm_operation_log` VALUES (812, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 08:55:38', '2019-12-26 08:55:38');
INSERT INTO `adm_operation_log` VALUES (813, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"730cdbb0-593b-422b-86ea-560dd975c8fc\"],\"actors\":[\"ABSOLUTELY PERFECT\"],\"id\":[\"9\"],\"info_path\":[\"data\\\\info\\\\ABP-889\\\\.info\"],\"intro\":[\"スポコス汗だくSEX4本番！ 体育会系・涼森れむ act.23 弾ける汗×スポーツウェアフェチズム\"],\"poster_path\":[\"data\\\\info\\\\ABP-889\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"プレステージ\"],\"thumb_path\":[\"data\\\\info\\\\ABP-889\\\\thumb.jpg\"],\"video_id\":[\"88003cf8-27bd-11ea-92bd-00155d012d1c\"],\"video_no\":[\"ABP-889\"]}', '2019-12-26 08:55:57', '2019-12-26 08:55:57');
INSERT INTO `adm_operation_log` VALUES (814, 1, '/admin/delete/videos', 'POST', '::1', '', '2019-12-26 09:02:16', '2019-12-26 09:02:16');
INSERT INTO `adm_operation_log` VALUES (815, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:02:16', '2019-12-26 09:02:16');
INSERT INTO `adm_operation_log` VALUES (816, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:02:20', '2019-12-26 09:02:20');
INSERT INTO `adm_operation_log` VALUES (817, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5d135980-1780-4cf9-9ed3-c62c164da020\"],\"actors\":[\"\"],\"id\":[\"10\"],\"info_path\":[\"data\\\\info\\\\ABP-889\\\\.info\"],\"intro\":[\"スポコス汗だくSEX4本番！ 体育会系・涼森れむ act.23 弾ける汗×スポーツウェアフェチズム\"],\"poster_path\":[\"data\\\\info\\\\ABP-889\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"\"],\"thumb_path\":[\"data\\\\info\\\\ABP-889\\\\thumb.jpg\"],\"video_id\":[\"7259de74-27be-11ea-9e4d-00155d012d1c\"],\"video_no\":[\"ABP-889\"]}', '2019-12-26 09:02:30', '2019-12-26 09:02:30');
INSERT INTO `adm_operation_log` VALUES (818, 1, '/admin/delete/videos', 'POST', '::1', '', '2019-12-26 09:06:46', '2019-12-26 09:06:46');
INSERT INTO `adm_operation_log` VALUES (819, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:06:46', '2019-12-26 09:06:46');
INSERT INTO `adm_operation_log` VALUES (820, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:06:48', '2019-12-26 09:06:48');
INSERT INTO `adm_operation_log` VALUES (821, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"d31333e0-61cc-4ae1-ab73-a98af2192a2e\"],\"actors\":[\"涼森れむ\"],\"id\":[\"11\"],\"info_path\":[\"data\\\\info\\\\ABP-889\\\\.info\"],\"intro\":[\"スポコス汗だくSEX4本番！ 体育会系・涼森れむ act.23 弾ける汗×スポーツウェアフェチズム\"],\"poster_path\":[\"data\\\\info\\\\ABP-889\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"ハイビジョン,汗だく,スポーツ,巨乳,コスプレ,フェラ,顔射,単体作品,競泳・スクール水着\"],\"thumb_path\":[\"data\\\\info\\\\ABP-889\\\\thumb.jpg\"],\"video_id\":[\"1fce79b1-27bf-11ea-b031-00155d012d1c\"],\"video_no\":[\"ABP-889\"]}', '2019-12-26 09:07:21', '2019-12-26 09:07:21');
INSERT INTO `adm_operation_log` VALUES (822, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:07:42', '2019-12-26 09:07:42');
INSERT INTO `adm_operation_log` VALUES (823, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:07:44', '2019-12-26 09:07:44');
INSERT INTO `adm_operation_log` VALUES (824, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:07:45', '2019-12-26 09:07:45');
INSERT INTO `adm_operation_log` VALUES (825, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:07:48', '2019-12-26 09:07:48');
INSERT INTO `adm_operation_log` VALUES (826, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:07:57', '2019-12-26 09:07:57');
INSERT INTO `adm_operation_log` VALUES (827, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:07:59', '2019-12-26 09:07:59');
INSERT INTO `adm_operation_log` VALUES (828, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:09:00', '2019-12-26 09:09:00');
INSERT INTO `adm_operation_log` VALUES (829, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1af16482-570b-477e-926a-01a7465e6742\"],\"actors\":[\"葵つかさ\"],\"id\":[\"12\"],\"info_path\":[\"data\\\\info\\\\SNIS-658\\\\.info\"],\"intro\":[\"盗撮リアルドキュメント！密着44日、葵つかさのプライベートを激撮し、カメラマンを装ったベテランナンパ師に引っ掛かって、SEXまでしちゃった一部始終\"],\"poster_path\":[\"data\\\\info\\\\SNIS-658\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"単体作品,独占配信,ナンパ,スレンダー,盗撮・のぞき,美少女,ギリモザ,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\SNIS-658\\\\thumb.jpg\"],\"video_id\":[\"6f8a8c75-27bf-11ea-b031-00155d012d1c\"],\"video_no\":[\"SNIS-658\"]}', '2019-12-26 09:09:35', '2019-12-26 09:09:35');
INSERT INTO `adm_operation_log` VALUES (830, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:15:25', '2019-12-26 09:15:25');
INSERT INTO `adm_operation_log` VALUES (831, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1237fb9f-20bd-429b-a5e9-11707b2de016\"],\"source_path\":[\"\"],\"video_no\":[\"ABP777\"]}', '2019-12-26 09:15:32', '2019-12-26 09:15:32');
INSERT INTO `adm_operation_log` VALUES (832, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3f62d1f3-46f0-4063-bf77-04880801a44f\"],\"actors\":[\"河合あすな\"],\"id\":[\"13\"],\"info_path\":[\"data\\\\info\\\\ABP-777\\\\.info\"],\"intro\":[\"絶対的鉄板シチュエーション 13 完全主観！！！河合あすなが贈るとてもHな3シチュエーション\"],\"poster_path\":[\"data\\\\info\\\\ABP-777\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"巨乳,単体作品,フェラ,パイズリ,妄想,主観,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-777\\\\thumb.jpg\"],\"video_id\":[\"581a2bb5-27c0-11ea-b031-00155d012d1c\"],\"video_no\":[\"ABP-777\"]}', '2019-12-26 09:16:05', '2019-12-26 09:16:05');
INSERT INTO `adm_operation_log` VALUES (833, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:16:32', '2019-12-26 09:16:32');
INSERT INTO `adm_operation_log` VALUES (834, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:16:32', '2019-12-26 09:16:32');
INSERT INTO `adm_operation_log` VALUES (835, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"fce857ef-a597-4cb9-9855-1e183ef0a138\"],\"actors\":[\"里美ゆりあ\"],\"id\":[\"14\"],\"info_path\":[\"data\\\\info\\\\ABP-666\\\\.info\"],\"intro\":[\"焦らし寸止め小悪魔ソープ 3 人生史上最高の射精をあなたに。 里美ゆりあ\"],\"poster_path\":[\"data\\\\info\\\\ABP-666\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"巨乳,単体作品,アナル,フェラ,潮吹き,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-666\\\\thumb.jpg\"],\"video_id\":[\"813f9e41-27c0-11ea-b031-00155d012d1c\"],\"video_no\":[\"ABP-666\"]}', '2019-12-26 09:17:14', '2019-12-26 09:17:14');
INSERT INTO `adm_operation_log` VALUES (836, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:17:29', '2019-12-26 09:17:29');
INSERT INTO `adm_operation_log` VALUES (837, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:17:38', '2019-12-26 09:17:38');
INSERT INTO `adm_operation_log` VALUES (838, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:17:47', '2019-12-26 09:17:47');
INSERT INTO `adm_operation_log` VALUES (839, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:17:53', '2019-12-26 09:17:53');
INSERT INTO `adm_operation_log` VALUES (840, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:17:54', '2019-12-26 09:17:54');
INSERT INTO `adm_operation_log` VALUES (841, 1, '/admin/update/videos', 'POST', '::1', '', '2019-12-26 09:18:02', '2019-12-26 09:18:02');
INSERT INTO `adm_operation_log` VALUES (842, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:18:05', '2019-12-26 09:18:05');
INSERT INTO `adm_operation_log` VALUES (843, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:18:12', '2019-12-26 09:18:12');
INSERT INTO `adm_operation_log` VALUES (844, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:18:15', '2019-12-26 09:18:15');
INSERT INTO `adm_operation_log` VALUES (845, 1, '/admin/delete/videos', 'POST', '::1', '', '2019-12-26 09:19:20', '2019-12-26 09:19:20');
INSERT INTO `adm_operation_log` VALUES (846, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:19:20', '2019-12-26 09:19:20');
INSERT INTO `adm_operation_log` VALUES (847, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:19:22', '2019-12-26 09:19:22');
INSERT INTO `adm_operation_log` VALUES (848, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"711bf417-7b04-4b68-8a78-f19062d1eb6a\"],\"actors\":[\"河合あすな\"],\"id\":[\"15\"],\"info_path\":[\"data\\\\info\\\\ABP-777\\\\.info\"],\"intro\":[\"絶対的鉄板シチュエーション 13 完全主観！！！河合あすなが贈るとてもHな3シチュエーション\"],\"poster_path\":[\"data\\\\info\\\\ABP-777\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"巨乳,単体作品,フェラ,パイズリ,妄想,主観,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-777\\\\thumb.jpg\"],\"video_id\":[\"cf2ece38-27c0-11ea-b031-00155d012d1c\"],\"video_no\":[\"ABP-777\"]}', '2019-12-26 09:19:25', '2019-12-26 09:19:25');
INSERT INTO `adm_operation_log` VALUES (849, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:22:07', '2019-12-26 09:22:07');
INSERT INTO `adm_operation_log` VALUES (850, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6c7244f6-3aab-4d80-9312-579976dbc624\"],\"actors\":[\"乙都さきの\"],\"id\":[\"16\"],\"info_path\":[\"data\\\\info\\\\ABP-847\\\\.info\"],\"intro\":[\"ボクの妹・乙都さきのとエッチなふたりぐらし 近親相姦シリーズNo.005 いたずら大好きっ娘。完全主観SEX\"],\"poster_path\":[\"data\\\\info\\\\ABP-847\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"顔射,単体作品,フェラ,近親相姦,姉・妹,主観,ハイビジョン,童貞\"],\"thumb_path\":[\"data\\\\info\\\\ABP-847\\\\thumb.jpg\"],\"video_id\":[\"44c7543a-27c1-11ea-95ff-00155d012d1c\"],\"video_no\":[\"ABP-847\"]}', '2019-12-26 09:22:42', '2019-12-26 09:22:42');
INSERT INTO `adm_operation_log` VALUES (851, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:30:10', '2019-12-26 09:30:10');
INSERT INTO `adm_operation_log` VALUES (852, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 09:31:04', '2019-12-26 09:31:04');
INSERT INTO `adm_operation_log` VALUES (853, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"06922f2e-c06b-4a4a-8534-d3e97d8be341\"],\"actors\":[\"野々浦暖\"],\"id\":[\"17\"],\"info_path\":[\"data\\\\info\\\\ABP-886\\\\.info\"],\"intro\":[\"本番オーケー！？噂の裏ピンサロ 11 AV界随一のアイドル級ルックスを味わい尽くせ！ 野々浦暖\"],\"poster_path\":[\"data\\\\info\\\\ABP-886\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"ハイビジョン,パイパン,コスプレ,フェラ,顔射,単体作品\"],\"thumb_path\":[\"data\\\\info\\\\ABP-886\\\\thumb.jpg\"],\"video_id\":[\"8671b589-27c2-11ea-9df2-00155d012d1c\"],\"video_no\":[\"ABP-886\"]}', '2019-12-26 09:31:42', '2019-12-26 09:31:42');
INSERT INTO `adm_operation_log` VALUES (854, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:31:59', '2019-12-26 09:31:59');
INSERT INTO `adm_operation_log` VALUES (855, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:33:46', '2019-12-26 09:33:46');
INSERT INTO `adm_operation_log` VALUES (856, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:33:48', '2019-12-26 09:33:48');
INSERT INTO `adm_operation_log` VALUES (857, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:34:27', '2019-12-26 09:34:27');
INSERT INTO `adm_operation_log` VALUES (858, 1, '/admin/logout', 'GET', '::1', '', '2019-12-26 09:49:27', '2019-12-26 09:49:27');
INSERT INTO `adm_operation_log` VALUES (859, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 09:55:20', '2019-12-26 09:55:20');
INSERT INTO `adm_operation_log` VALUES (860, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 10:16:38', '2019-12-26 10:16:38');
INSERT INTO `adm_operation_log` VALUES (861, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5509486f-ca28-49db-8cc2-e3b15b53fe01\"],\"actors\":[\"三上悠亜\"],\"id\":[\"18\"],\"info_path\":[\"data\\\\info\\\\SSNI-644\\\\.info\"],\"intro\":[\"【※異常なる大絶頂】エロス最大覚醒！性欲が尽き果てるまで怒涛のノンストップ本気性交 三上悠亜\"],\"poster_path\":[\"data\\\\info\\\\SSNI-644\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"ハイビジョン,独占配信,巨乳,ドキュメンタリー,アイドル・芸能人,潮吹き,単体作品,ギリモザ\"],\"thumb_path\":[\"data\\\\info\\\\SSNI-644\\\\thumb.jpg\"],\"video_id\":[\"def46531-27c8-11ea-9df2-00155d012d1c\"],\"video_no\":[\"SSNI-644\"]}', '2019-12-26 10:17:07', '2019-12-26 10:17:07');
INSERT INTO `adm_operation_log` VALUES (862, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-26 10:18:01', '2019-12-26 10:18:01');
INSERT INTO `adm_operation_log` VALUES (863, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9bdd63d7-018a-4165-8bae-c9871c46142c\"],\"actors\":[\"三上悠亜,天使もえ,葵つかさ,筧ジュン,橋本ありな,坂道みる,架乃ゆら,伊賀まこ,ひなたまりん\"],\"id\":[\"19\"],\"info_path\":[\"data\\\\info\\\\SSNI-658\\\\.info\"],\"intro\":[\"S1豪華絢爛ドリーム大共演2019 ファン感謝祭！大大大乱交！夢のハーレムソープ！超豪華3本立て伝説の270分\"],\"poster_path\":[\"data\\\\info\\\\SSNI-658\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"巨乳,美少女,乱交,ファン感謝・訪問,ヘルス・ソープ,ギリモザ,独占配信,ハイビジョン,4時間以上作品\"],\"thumb_path\":[\"data\\\\info\\\\SSNI-658\\\\thumb.jpg\"],\"video_id\":[\"1192899a-27c9-11ea-9df2-00155d012d1c\"],\"video_no\":[\"SSNI-658\"]}', '2019-12-26 10:18:32', '2019-12-26 10:18:32');
INSERT INTO `adm_operation_log` VALUES (864, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:23:20', '2019-12-26 10:23:20');
INSERT INTO `adm_operation_log` VALUES (865, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:23:57', '2019-12-26 10:23:57');
INSERT INTO `adm_operation_log` VALUES (866, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:24:42', '2019-12-26 10:24:42');
INSERT INTO `adm_operation_log` VALUES (867, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:25:20', '2019-12-26 10:25:20');
INSERT INTO `adm_operation_log` VALUES (868, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-26 10:26:19', '2019-12-26 10:26:19');
INSERT INTO `adm_operation_log` VALUES (869, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-26 10:26:47', '2019-12-26 10:26:47');
INSERT INTO `adm_operation_log` VALUES (870, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:27:29', '2019-12-26 10:27:29');
INSERT INTO `adm_operation_log` VALUES (871, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:28:51', '2019-12-26 10:28:51');
INSERT INTO `adm_operation_log` VALUES (872, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:29:33', '2019-12-26 10:29:33');
INSERT INTO `adm_operation_log` VALUES (873, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:30:19', '2019-12-26 10:30:19');
INSERT INTO `adm_operation_log` VALUES (874, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:30:54', '2019-12-26 10:30:54');
INSERT INTO `adm_operation_log` VALUES (875, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-26 10:31:31', '2019-12-26 10:31:31');
INSERT INTO `adm_operation_log` VALUES (876, 1, '/admin/info/videos', 'GET', '127.0.0.1', '', '2019-12-26 10:31:56', '2019-12-26 10:31:56');
INSERT INTO `adm_operation_log` VALUES (877, 1, '/admin/info/user', 'GET', '::1', '', '2019-12-26 10:32:17', '2019-12-26 10:32:17');
INSERT INTO `adm_operation_log` VALUES (878, 1, '/admin/info/authors', 'GET', '::1', '', '2019-12-26 10:32:18', '2019-12-26 10:32:18');
INSERT INTO `adm_operation_log` VALUES (879, 1, '/admin/info/posts', 'GET', '::1', '', '2019-12-26 10:32:19', '2019-12-26 10:32:19');
INSERT INTO `adm_operation_log` VALUES (880, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:36:00', '2019-12-26 10:36:00');
INSERT INTO `adm_operation_log` VALUES (881, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:38:15', '2019-12-26 10:38:15');
INSERT INTO `adm_operation_log` VALUES (882, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:39:33', '2019-12-26 10:39:33');
INSERT INTO `adm_operation_log` VALUES (883, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:41:30', '2019-12-26 10:41:30');
INSERT INTO `adm_operation_log` VALUES (884, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:42:47', '2019-12-26 10:42:47');
INSERT INTO `adm_operation_log` VALUES (885, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:43:15', '2019-12-26 10:43:15');
INSERT INTO `adm_operation_log` VALUES (886, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:48:37', '2019-12-26 10:48:37');
INSERT INTO `adm_operation_log` VALUES (887, 1, '/admin/logout', 'GET', '::1', '', '2019-12-26 10:48:42', '2019-12-26 10:48:42');
INSERT INTO `adm_operation_log` VALUES (888, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:49:26', '2019-12-26 10:49:26');
INSERT INTO `adm_operation_log` VALUES (889, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:49:41', '2019-12-26 10:49:41');
INSERT INTO `adm_operation_log` VALUES (890, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:49:46', '2019-12-26 10:49:46');
INSERT INTO `adm_operation_log` VALUES (891, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-26 10:52:00', '2019-12-26 10:52:00');
INSERT INTO `adm_operation_log` VALUES (892, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 05:32:16', '2019-12-27 05:32:16');
INSERT INTO `adm_operation_log` VALUES (893, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-27 05:32:18', '2019-12-27 05:32:18');
INSERT INTO `adm_operation_log` VALUES (894, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"07ad95d8-76a9-4cfa-959f-1000acd669ac\"],\"actors\":[\"吉岡ひより\"],\"id\":[\"20\"],\"info_path\":[\"data\\\\info\\\\SSNI-656\\\\.info\"],\"intro\":[\"激イキ181回！痙攣6012回！イキ潮8706cc！超敏感スリムボディ エロス覚醒 はじめての大・痙・攣スペシャル 吉岡ひより\"],\"poster_path\":[\"data\\\\info\\\\SSNI-656\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"潮吹き,美少女,美乳,3P・4P,単体作品,ギリモザ,独占配信,ハイビジョン,スレンダー\"],\"thumb_path\":[\"data\\\\info\\\\SSNI-656\\\\thumb.jpg\"],\"video_id\":[\"55240085-286a-11ea-9db3-00155d012d1c\"],\"video_no\":[\"SSNI-656\"]}', '2019-12-27 05:32:54', '2019-12-27 05:32:54');
INSERT INTO `adm_operation_log` VALUES (895, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-27 05:37:30', '2019-12-27 05:37:30');
INSERT INTO `adm_operation_log` VALUES (896, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f4e67f12-16a7-4ea4-bda7-52d69744e4dc\"],\"actors\":[\"夢乃あいか\"],\"id\":[\"21\"],\"info_path\":[\"data\\\\info\\\\SSNI-646\\\\.info\"],\"intro\":[\"絶・対・領・域 ハリのあるムチムチ太ももで無意識に誘惑 着衣巨乳ニーハイ美少女 夢乃あいか\"],\"poster_path\":[\"data\\\\info\\\\SSNI-646\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"ハイビジョン,独占配信,足コキ,巨乳,女子校生,ギリモザ,単体作品\"],\"thumb_path\":[\"data\\\\info\\\\SSNI-646\\\\thumb.jpg\"],\"video_id\":[\"0f74afdb-286b-11ea-8520-00155d012d1c\"],\"video_no\":[\"SSNI-646\"]}', '2019-12-27 05:38:07', '2019-12-27 05:38:07');
INSERT INTO `adm_operation_log` VALUES (897, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:44:47', '2019-12-27 06:44:47');
INSERT INTO `adm_operation_log` VALUES (898, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:45:19', '2019-12-27 06:45:19');
INSERT INTO `adm_operation_log` VALUES (899, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:05', '2019-12-27 06:57:05');
INSERT INTO `adm_operation_log` VALUES (900, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:16', '2019-12-27 06:57:16');
INSERT INTO `adm_operation_log` VALUES (901, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:19', '2019-12-27 06:57:19');
INSERT INTO `adm_operation_log` VALUES (902, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:22', '2019-12-27 06:57:22');
INSERT INTO `adm_operation_log` VALUES (903, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:23', '2019-12-27 06:57:23');
INSERT INTO `adm_operation_log` VALUES (904, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:29', '2019-12-27 06:57:29');
INSERT INTO `adm_operation_log` VALUES (905, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:31', '2019-12-27 06:57:31');
INSERT INTO `adm_operation_log` VALUES (906, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:33', '2019-12-27 06:57:33');
INSERT INTO `adm_operation_log` VALUES (907, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 06:57:34', '2019-12-27 06:57:34');
INSERT INTO `adm_operation_log` VALUES (908, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:35', '2019-12-27 06:57:35');
INSERT INTO `adm_operation_log` VALUES (909, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:36', '2019-12-27 06:57:36');
INSERT INTO `adm_operation_log` VALUES (910, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:36', '2019-12-27 06:57:36');
INSERT INTO `adm_operation_log` VALUES (911, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:57:38', '2019-12-27 06:57:38');
INSERT INTO `adm_operation_log` VALUES (912, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 06:58:35', '2019-12-27 06:58:35');
INSERT INTO `adm_operation_log` VALUES (913, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 07:05:48', '2019-12-27 07:05:48');
INSERT INTO `adm_operation_log` VALUES (914, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-27 07:08:06', '2019-12-27 07:08:06');
INSERT INTO `adm_operation_log` VALUES (915, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"d1a5d828-ef8a-46e3-8e86-c53e1f0c8fc4\"],\"actors\":[\"瀬名きらり\"],\"id\":[\"22\"],\"info_path\":[\"data\\\\info\\\\ABP-647\\\\.info\"],\"intro\":[\"絶対的鉄板シチュエーション 6 完全主観！！瀬名きらりが贈るとてもHな4シチュエーション\"],\"poster_path\":[\"data\\\\info\\\\ABP-647\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"単体作品,フェラ,イラマチオ,妄想,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-647\\\\thumb.jpg\"],\"video_id\":[\"b33fac44-2877-11ea-a299-00155d012d1c\"],\"video_no\":[\"ABP-647\"]}', '2019-12-27 07:08:36', '2019-12-27 07:08:36');
INSERT INTO `adm_operation_log` VALUES (916, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 07:08:37', '2019-12-27 07:08:37');
INSERT INTO `adm_operation_log` VALUES (917, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-27 07:08:40', '2019-12-27 07:08:40');
INSERT INTO `adm_operation_log` VALUES (918, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-27 07:08:42', '2019-12-27 07:08:42');
INSERT INTO `adm_operation_log` VALUES (919, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"bb99a345-86c8-452e-b6af-de6acab7b71b\"],\"actors\":[\"長谷川るい\"],\"id\":[\"23\"],\"info_path\":[\"data\\\\info\\\\ABP-648\\\\.info\"],\"intro\":[\"超高級裏スパ癒らしぃサロン 01 癒らし隠語×極上エスコートSEX 長谷川るい\"],\"poster_path\":[\"data\\\\info\\\\ABP-648\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"顔射,単体作品,パイズリ,主観,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-648\\\\thumb.jpg\"],\"video_id\":[\"cd64f0c5-2877-11ea-a299-00155d012d1c\"],\"video_no\":[\"ABP-648\"]}', '2019-12-27 07:09:20', '2019-12-27 07:09:20');
INSERT INTO `adm_operation_log` VALUES (920, 1, '/admin/new/videos', 'POST', '::1', '{\"_previous_\":[\"/admin/info/videos?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"471904bc-1622-4568-8bf9-94396e4b6635\"],\"actors\":[\"ひなた澪\"],\"id\":[\"24\"],\"info_path\":[\"data\\\\info\\\\ABP-649\\\\.info\"],\"intro\":[\"1VS1【※演技一切無し】本能剥き出しタイマン4本番 ACT.09 ひなた澪\"],\"poster_path\":[\"data\\\\info\\\\ABP-649\\\\image.jpg\"],\"source_path\":[\"\"],\"tags\":[\"顔射,単体作品,オナニー,パイズリ,潮吹き,ハイビジョン\"],\"thumb_path\":[\"data\\\\info\\\\ABP-649\\\\thumb.jpg\"],\"video_id\":[\"cfdc336c-2877-11ea-a299-00155d012d1c\"],\"video_no\":[\"ABP-649\"]}', '2019-12-27 07:09:24', '2019-12-27 07:09:24');
INSERT INTO `adm_operation_log` VALUES (921, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 07:13:39', '2019-12-27 07:13:39');
INSERT INTO `adm_operation_log` VALUES (922, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 07:14:19', '2019-12-27 07:14:19');
INSERT INTO `adm_operation_log` VALUES (923, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:15:15', '2019-12-27 07:15:15');
INSERT INTO `adm_operation_log` VALUES (924, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-27 07:15:19', '2019-12-27 07:15:19');
INSERT INTO `adm_operation_log` VALUES (925, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ed93ee42-062f-4e7e-af79-00e88afd4210\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"]}', '2019-12-27 07:15:24', '2019-12-27 07:15:24');
INSERT INTO `adm_operation_log` VALUES (926, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-27 07:15:26', '2019-12-27 07:15:26');
INSERT INTO `adm_operation_log` VALUES (927, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"80bab169-e843-4b6d-af74-8fab3d9bcf05\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"]}', '2019-12-27 07:15:30', '2019-12-27 07:15:30');
INSERT INTO `adm_operation_log` VALUES (928, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:18:04', '2019-12-27 07:18:04');
INSERT INTO `adm_operation_log` VALUES (929, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-27 07:18:06', '2019-12-27 07:18:06');
INSERT INTO `adm_operation_log` VALUES (930, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"eb925cfb-c3f1-4f76-964a-d5f9a8d98ded\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"]}', '2019-12-27 07:18:10', '2019-12-27 07:18:10');
INSERT INTO `adm_operation_log` VALUES (931, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-27 07:18:12', '2019-12-27 07:18:12');
INSERT INTO `adm_operation_log` VALUES (932, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9a009720-86ac-4035-b920-124fbf9e78ae\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"]}', '2019-12-27 07:18:17', '2019-12-27 07:18:17');
INSERT INTO `adm_operation_log` VALUES (933, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:24:33', '2019-12-27 07:24:33');
INSERT INTO `adm_operation_log` VALUES (934, 1, '/admin/info/user', 'GET', '::1', '', '2019-12-27 07:24:34', '2019-12-27 07:24:34');
INSERT INTO `adm_operation_log` VALUES (935, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:24:35', '2019-12-27 07:24:35');
INSERT INTO `adm_operation_log` VALUES (936, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:25:06', '2019-12-27 07:25:06');
INSERT INTO `adm_operation_log` VALUES (937, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 07:27:14', '2019-12-27 07:27:14');
INSERT INTO `adm_operation_log` VALUES (938, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 07:28:06', '2019-12-27 07:28:06');
INSERT INTO `adm_operation_log` VALUES (939, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:34:42', '2019-12-27 07:34:42');
INSERT INTO `adm_operation_log` VALUES (940, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 07:36:45', '2019-12-27 07:36:45');
INSERT INTO `adm_operation_log` VALUES (941, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:37:06', '2019-12-27 07:37:06');
INSERT INTO `adm_operation_log` VALUES (942, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:52:01', '2019-12-27 07:52:01');
INSERT INTO `adm_operation_log` VALUES (943, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:52:04', '2019-12-27 07:52:04');
INSERT INTO `adm_operation_log` VALUES (944, 1, '/admin/info/nodes/new', 'GET', '::1', '', '2019-12-27 07:52:05', '2019-12-27 07:52:05');
INSERT INTO `adm_operation_log` VALUES (945, 1, '/admin/new/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"dc18c3e5-d8ec-40b0-b567-17a304c6ec10\"],\"interval\":[\"\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-27 07:52:17', '2019-12-27 07:52:17');
INSERT INTO `adm_operation_log` VALUES (946, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:52:58', '2019-12-27 07:52:58');
INSERT INTO `adm_operation_log` VALUES (947, 1, '/admin/info/nodes/new', 'GET', '::1', '', '2019-12-27 07:52:59', '2019-12-27 07:52:59');
INSERT INTO `adm_operation_log` VALUES (948, 1, '/admin/new/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"13309a60-fee8-4e47-ab22-d1182501eaf3\"],\"id\":[\"8\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-27 07:53:04', '2019-12-27 07:53:04');
INSERT INTO `adm_operation_log` VALUES (949, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:58:03', '2019-12-27 07:58:03');
INSERT INTO `adm_operation_log` VALUES (950, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 07:59:19', '2019-12-27 07:59:19');
INSERT INTO `adm_operation_log` VALUES (951, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 07:59:25', '2019-12-27 07:59:25');
INSERT INTO `adm_operation_log` VALUES (952, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 08:00:49', '2019-12-27 08:00:49');
INSERT INTO `adm_operation_log` VALUES (953, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 08:00:52', '2019-12-27 08:00:52');
INSERT INTO `adm_operation_log` VALUES (954, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 08:00:57', '2019-12-27 08:00:57');
INSERT INTO `adm_operation_log` VALUES (955, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 08:01:01', '2019-12-27 08:01:01');
INSERT INTO `adm_operation_log` VALUES (956, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 08:01:04', '2019-12-27 08:01:04');
INSERT INTO `adm_operation_log` VALUES (957, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 08:01:27', '2019-12-27 08:01:27');
INSERT INTO `adm_operation_log` VALUES (958, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 08:13:54', '2019-12-27 08:13:54');
INSERT INTO `adm_operation_log` VALUES (959, 1, '/admin/menu', 'GET', '::1', '', '2019-12-27 08:14:16', '2019-12-27 08:14:16');
INSERT INTO `adm_operation_log` VALUES (960, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-27 08:14:28', '2019-12-27 08:14:28');
INSERT INTO `adm_operation_log` VALUES (961, 1, '/admin/menu', 'GET', '::1', '', '2019-12-27 08:14:36', '2019-12-27 08:14:36');
INSERT INTO `adm_operation_log` VALUES (962, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"1547b150-1367-43ba-8e2d-1d0f38265559\"],\"header\":[\"\"],\"icon\":[\"fa-video-camera\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\"],\"title\":[\"视频管理\"],\"uri\":[\"\"]}', '2019-12-27 08:16:01', '2019-12-27 08:16:01');
INSERT INTO `adm_operation_log` VALUES (963, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-27 08:16:19', '2019-12-27 08:16:19');
INSERT INTO `adm_operation_log` VALUES (964, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"e1044aab-7d48-4da2-959c-7278a993a4e4\"],\"header\":[\"管理\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"15\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频\"],\"uri\":[\"/info/videos\"]}', '2019-12-27 08:16:24', '2019-12-27 08:16:24');
INSERT INTO `adm_operation_log` VALUES (965, 1, '/admin/menu/order', 'POST', '::1', '', '2019-12-27 08:16:31', '2019-12-27 08:16:31');
INSERT INTO `adm_operation_log` VALUES (966, 1, '/admin/menu', 'GET', '::1', '', '2019-12-27 08:16:31', '2019-12-27 08:16:31');
INSERT INTO `adm_operation_log` VALUES (967, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"98d450a3-f1d5-4be1-845b-98ea7a954736\"],\"header\":[\"\"],\"icon\":[\"fa-chain\"],\"parent_id\":[\"0\"],\"title\":[\"节点管理\"],\"uri\":[\"\"]}', '2019-12-27 08:17:12', '2019-12-27 08:17:12');
INSERT INTO `adm_operation_log` VALUES (968, 1, '/admin/menu/order', 'POST', '::1', '', '2019-12-27 08:17:19', '2019-12-27 08:17:19');
INSERT INTO `adm_operation_log` VALUES (969, 1, '/admin/menu', 'GET', '::1', '', '2019-12-27 08:17:19', '2019-12-27 08:17:19');
INSERT INTO `adm_operation_log` VALUES (970, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-27 08:17:27', '2019-12-27 08:17:27');
INSERT INTO `adm_operation_log` VALUES (971, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"1b3cd0c1-c1f9-4239-8576-57f96cb1171c\"],\"header\":[\"\"],\"icon\":[\"fa-automobile\"],\"id\":[\"14\"],\"parent_id\":[\"16\"],\"roles[]\":[\"1\"],\"title\":[\"节点\"],\"uri\":[\"/info/nodes\"]}', '2019-12-27 08:17:32', '2019-12-27 08:17:32');
INSERT INTO `adm_operation_log` VALUES (972, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 08:18:32', '2019-12-27 08:18:32');
INSERT INTO `adm_operation_log` VALUES (973, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 08:18:37', '2019-12-27 08:18:37');
INSERT INTO `adm_operation_log` VALUES (974, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 08:18:41', '2019-12-27 08:18:41');
INSERT INTO `adm_operation_log` VALUES (975, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 08:19:05', '2019-12-27 08:19:05');
INSERT INTO `adm_operation_log` VALUES (976, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 08:19:11', '2019-12-27 08:19:11');
INSERT INTO `adm_operation_log` VALUES (977, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 08:19:32', '2019-12-27 08:19:32');
INSERT INTO `adm_operation_log` VALUES (978, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-27 08:28:46', '2019-12-27 08:28:46');
INSERT INTO `adm_operation_log` VALUES (979, 1, '/admin/info/posts', 'GET', '::1', '', '2019-12-27 08:29:00', '2019-12-27 08:29:00');
INSERT INTO `adm_operation_log` VALUES (980, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:12:25', '2019-12-27 09:12:25');
INSERT INTO `adm_operation_log` VALUES (981, 1, '/admin/delete/nodes', 'POST', '::1', '', '2019-12-27 09:12:29', '2019-12-27 09:12:29');
INSERT INTO `adm_operation_log` VALUES (982, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:12:29', '2019-12-27 09:12:29');
INSERT INTO `adm_operation_log` VALUES (983, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-27 09:12:33', '2019-12-27 09:12:33');
INSERT INTO `adm_operation_log` VALUES (984, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:12:36', '2019-12-27 09:12:36');
INSERT INTO `adm_operation_log` VALUES (985, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-27 09:12:39', '2019-12-27 09:12:39');
INSERT INTO `adm_operation_log` VALUES (986, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:12:41', '2019-12-27 09:12:41');
INSERT INTO `adm_operation_log` VALUES (987, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 09:12:49', '2019-12-27 09:12:49');
INSERT INTO `adm_operation_log` VALUES (988, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:13:38', '2019-12-27 09:13:38');
INSERT INTO `adm_operation_log` VALUES (989, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:15:24', '2019-12-27 09:15:24');
INSERT INTO `adm_operation_log` VALUES (990, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 09:15:34', '2019-12-27 09:15:34');
INSERT INTO `adm_operation_log` VALUES (991, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:15:56', '2019-12-27 09:15:56');
INSERT INTO `adm_operation_log` VALUES (992, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:17:37', '2019-12-27 09:17:37');
INSERT INTO `adm_operation_log` VALUES (993, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:18:16', '2019-12-27 09:18:16');
INSERT INTO `adm_operation_log` VALUES (994, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:18:19', '2019-12-27 09:18:19');
INSERT INTO `adm_operation_log` VALUES (995, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:19:28', '2019-12-27 09:19:28');
INSERT INTO `adm_operation_log` VALUES (996, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:27:35', '2019-12-27 09:27:35');
INSERT INTO `adm_operation_log` VALUES (997, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-27 09:27:39', '2019-12-27 09:27:39');
INSERT INTO `adm_operation_log` VALUES (998, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\\u0026sync=0\"],\"_t\":[\"407e350b-b54a-4504-ab8b-c169eaefe966\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-27 09:27:58', '2019-12-27 09:27:58');
INSERT INTO `adm_operation_log` VALUES (999, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:30:58', '2019-12-27 09:30:58');
INSERT INTO `adm_operation_log` VALUES (1000, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:31:03', '2019-12-27 09:31:03');
INSERT INTO `adm_operation_log` VALUES (1001, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-27 09:31:09', '2019-12-27 09:31:09');
INSERT INTO `adm_operation_log` VALUES (1002, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-27 09:31:09', '2019-12-27 09:31:09');
INSERT INTO `adm_operation_log` VALUES (1003, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-30 05:19:51', '2019-12-30 05:19:51');
INSERT INTO `adm_operation_log` VALUES (1004, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:19:59', '2019-12-30 05:19:59');
INSERT INTO `adm_operation_log` VALUES (1005, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:20:05', '2019-12-30 05:20:05');
INSERT INTO `adm_operation_log` VALUES (1006, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"2fd0006a-873e-4d9d-98ec-08f95c281c57\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:20:09', '2019-12-30 05:20:09');
INSERT INTO `adm_operation_log` VALUES (1007, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:20:12', '2019-12-30 05:20:12');
INSERT INTO `adm_operation_log` VALUES (1008, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"66218a98-afa6-4ff7-ab71-1aed648677d3\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:20:16', '2019-12-30 05:20:16');
INSERT INTO `adm_operation_log` VALUES (1009, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"74bfaec4-43a5-47e7-a8cf-fbeafd38f481\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:20:28', '2019-12-30 05:20:28');
INSERT INTO `adm_operation_log` VALUES (1010, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:20:31', '2019-12-30 05:20:31');
INSERT INTO `adm_operation_log` VALUES (1011, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"dd40d287-36f5-447d-8b39-2d599dd8acac\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:20:34', '2019-12-30 05:20:34');
INSERT INTO `adm_operation_log` VALUES (1012, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"23e624b2-7eba-4083-a376-8b2d7769f554\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:20:39', '2019-12-30 05:20:39');
INSERT INTO `adm_operation_log` VALUES (1013, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"dfd9ddda-1d79-4c84-a449-1addb20de112\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:20:45', '2019-12-30 05:20:45');
INSERT INTO `adm_operation_log` VALUES (1014, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"518adc5f-0b3c-4b9d-a1d9-bef476256f4e\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:20:51', '2019-12-30 05:20:51');
INSERT INTO `adm_operation_log` VALUES (1015, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:29:04', '2019-12-30 05:29:04');
INSERT INTO `adm_operation_log` VALUES (1016, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:29:08', '2019-12-30 05:29:08');
INSERT INTO `adm_operation_log` VALUES (1017, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:29:13', '2019-12-30 05:29:13');
INSERT INTO `adm_operation_log` VALUES (1018, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"62a552c4-13a8-429d-98fe-b0e61d266114\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:29:18', '2019-12-30 05:29:18');
INSERT INTO `adm_operation_log` VALUES (1019, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:29:20', '2019-12-30 05:29:20');
INSERT INTO `adm_operation_log` VALUES (1020, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e74ab0c3-c358-4b74-86f2-3d8a0fa4b910\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:29:25', '2019-12-30 05:29:25');
INSERT INTO `adm_operation_log` VALUES (1021, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:29:27', '2019-12-30 05:29:27');
INSERT INTO `adm_operation_log` VALUES (1022, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"0d8766e3-d999-4cd2-8e49-e24e73a56aeb\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:29:31', '2019-12-30 05:29:31');
INSERT INTO `adm_operation_log` VALUES (1023, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"d18dad1c-f1c6-477e-bb4c-f75b46de624d\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:29:38', '2019-12-30 05:29:38');
INSERT INTO `adm_operation_log` VALUES (1024, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:29:40', '2019-12-30 05:29:40');
INSERT INTO `adm_operation_log` VALUES (1025, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e9cb128a-5521-4796-8a0e-6b3e5e3fdb3d\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:29:44', '2019-12-30 05:29:44');
INSERT INTO `adm_operation_log` VALUES (1026, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7f287de9-f44f-432a-9fe2-572334846b52\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:30:06', '2019-12-30 05:30:06');
INSERT INTO `adm_operation_log` VALUES (1027, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:30:08', '2019-12-30 05:30:08');
INSERT INTO `adm_operation_log` VALUES (1028, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"42c559d8-594a-4c83-b2c9-19a1232ed353\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:30:12', '2019-12-30 05:30:12');
INSERT INTO `adm_operation_log` VALUES (1029, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:30:14', '2019-12-30 05:30:14');
INSERT INTO `adm_operation_log` VALUES (1030, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"06750042-804d-4d83-8635-1832c6ea7d0c\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:30:17', '2019-12-30 05:30:17');
INSERT INTO `adm_operation_log` VALUES (1031, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:30:57', '2019-12-30 05:30:57');
INSERT INTO `adm_operation_log` VALUES (1032, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"013acab9-e47b-48b1-b677-767898070a30\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/5001\\t\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:31:12', '2019-12-30 05:31:12');
INSERT INTO `adm_operation_log` VALUES (1033, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:31:17', '2019-12-30 05:31:17');
INSERT INTO `adm_operation_log` VALUES (1034, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"af4a3e7b-c02f-4614-a180-5f71a350e71b\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:31:25', '2019-12-30 05:31:25');
INSERT INTO `adm_operation_log` VALUES (1035, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:33:14', '2019-12-30 05:33:14');
INSERT INTO `adm_operation_log` VALUES (1036, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b891a230-823f-46e6-9559-c34b4f34a571\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:33:18', '2019-12-30 05:33:18');
INSERT INTO `adm_operation_log` VALUES (1037, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"320c1157-4a36-46c0-aeda-19e050de5c02\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"sync\":[\"2\"]}', '2019-12-30 05:34:40', '2019-12-30 05:34:40');
INSERT INTO `adm_operation_log` VALUES (1038, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:34:42', '2019-12-30 05:34:42');
INSERT INTO `adm_operation_log` VALUES (1039, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:34:43', '2019-12-30 05:34:43');
INSERT INTO `adm_operation_log` VALUES (1040, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"240a77e8-1f28-484c-9cff-8538900d44db\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:34:48', '2019-12-30 05:34:48');
INSERT INTO `adm_operation_log` VALUES (1041, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:34:50', '2019-12-30 05:34:50');
INSERT INTO `adm_operation_log` VALUES (1042, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"8a28f721-328e-49ab-b4a3-67b5277798e1\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:34:54', '2019-12-30 05:34:54');
INSERT INTO `adm_operation_log` VALUES (1043, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:34:56', '2019-12-30 05:34:56');
INSERT INTO `adm_operation_log` VALUES (1044, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"47934fa9-12c0-45a5-b5ca-26dc3f569258\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:34:59', '2019-12-30 05:34:59');
INSERT INTO `adm_operation_log` VALUES (1045, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:35:19', '2019-12-30 05:35:19');
INSERT INTO `adm_operation_log` VALUES (1046, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"82fc7139-7697-4dec-9764-a220486589b4\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:35:22', '2019-12-30 05:35:22');
INSERT INTO `adm_operation_log` VALUES (1047, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"bc65bb72-e58f-4bab-90ef-665c6989f4ba\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:36:51', '2019-12-30 05:36:51');
INSERT INTO `adm_operation_log` VALUES (1048, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5670a5a3-c855-4258-922a-f50be4c7435b\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"sync\":[\"2\"]}', '2019-12-30 05:38:00', '2019-12-30 05:38:00');
INSERT INTO `adm_operation_log` VALUES (1049, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:38:02', '2019-12-30 05:38:02');
INSERT INTO `adm_operation_log` VALUES (1050, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:38:05', '2019-12-30 05:38:05');
INSERT INTO `adm_operation_log` VALUES (1051, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"09360a6a-730d-4d8a-b07b-cb4cf4c33252\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:38:11', '2019-12-30 05:38:11');
INSERT INTO `adm_operation_log` VALUES (1052, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:38:55', '2019-12-30 05:38:55');
INSERT INTO `adm_operation_log` VALUES (1053, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:38:57', '2019-12-30 05:38:57');
INSERT INTO `adm_operation_log` VALUES (1054, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"bbb47f4b-da3d-4080-9713-76c1bad0c127\"],\"async\":[\"2\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:39:02', '2019-12-30 05:39:02');
INSERT INTO `adm_operation_log` VALUES (1055, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"169532b4-c2e8-470f-b503-3198491e5b7e\"],\"async\":[\"2\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"]}', '2019-12-30 05:39:50', '2019-12-30 05:39:50');
INSERT INTO `adm_operation_log` VALUES (1056, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:39:52', '2019-12-30 05:39:52');
INSERT INTO `adm_operation_log` VALUES (1057, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:39:54', '2019-12-30 05:39:54');
INSERT INTO `adm_operation_log` VALUES (1058, 1, '/admin/info/user', 'GET', '::1', '', '2019-12-30 05:39:57', '2019-12-30 05:39:57');
INSERT INTO `adm_operation_log` VALUES (1059, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:39:59', '2019-12-30 05:39:59');
INSERT INTO `adm_operation_log` VALUES (1060, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:40:01', '2019-12-30 05:40:01');
INSERT INTO `adm_operation_log` VALUES (1061, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1627166e-1af5-4c2d-afce-53f0cb81347d\"],\"async\":[\"2\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:40:04', '2019-12-30 05:40:04');
INSERT INTO `adm_operation_log` VALUES (1062, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b9ea0c93-4f02-4464-8e2f-262bc7d7bbde\"],\"async\":[\"2\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:40:11', '2019-12-30 05:40:11');
INSERT INTO `adm_operation_log` VALUES (1063, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"2a086062-ba79-411e-b6fa-35564cd5dede\"],\"async\":[\"2\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:40:24', '2019-12-30 05:40:24');
INSERT INTO `adm_operation_log` VALUES (1064, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:40:50', '2019-12-30 05:40:50');
INSERT INTO `adm_operation_log` VALUES (1065, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:40:53', '2019-12-30 05:40:53');
INSERT INTO `adm_operation_log` VALUES (1066, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:40:54', '2019-12-30 05:40:54');
INSERT INTO `adm_operation_log` VALUES (1067, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1397bd13-589a-495f-ad02-8ea6d2002997\"],\"async\":[\"2\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:40:58', '2019-12-30 05:40:58');
INSERT INTO `adm_operation_log` VALUES (1068, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"4c3f651f-f94c-47a9-8524-a65524c0e77b\"],\"async\":[\"2\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync[]\":[\"\"]}', '2019-12-30 05:41:03', '2019-12-30 05:41:03');
INSERT INTO `adm_operation_log` VALUES (1069, 1, '/admin/info/user', 'GET', '::1', '', '2019-12-30 05:41:48', '2019-12-30 05:41:48');
INSERT INTO `adm_operation_log` VALUES (1070, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:41:50', '2019-12-30 05:41:50');
INSERT INTO `adm_operation_log` VALUES (1071, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:41:51', '2019-12-30 05:41:51');
INSERT INTO `adm_operation_log` VALUES (1072, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3e07fb3b-20c2-41b7-9351-715506ce0619\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:41:57', '2019-12-30 05:41:57');
INSERT INTO `adm_operation_log` VALUES (1073, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:41:59', '2019-12-30 05:41:59');
INSERT INTO `adm_operation_log` VALUES (1074, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"fbbe31c1-4b0a-4715-9efe-3177921e4459\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:42:04', '2019-12-30 05:42:04');
INSERT INTO `adm_operation_log` VALUES (1075, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"bcab4fd7-78a4-4586-9036-c5af0da35852\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:42:15', '2019-12-30 05:42:15');
INSERT INTO `adm_operation_log` VALUES (1076, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:42:17', '2019-12-30 05:42:17');
INSERT INTO `adm_operation_log` VALUES (1077, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5210f15f-f74d-49df-b263-a02ffd505ad8\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:42:22', '2019-12-30 05:42:22');
INSERT INTO `adm_operation_log` VALUES (1078, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:42:23', '2019-12-30 05:42:23');
INSERT INTO `adm_operation_log` VALUES (1079, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f65f957b-0be8-4420-a895-0db1e6c819a4\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:42:27', '2019-12-30 05:42:27');
INSERT INTO `adm_operation_log` VALUES (1080, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:42:29', '2019-12-30 05:42:29');
INSERT INTO `adm_operation_log` VALUES (1081, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1ff267de-99f2-4ea1-9295-4a78a381ab12\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:42:33', '2019-12-30 05:42:33');
INSERT INTO `adm_operation_log` VALUES (1082, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9c5f5b0d-7105-4424-bced-b75328787eef\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:43:35', '2019-12-30 05:43:35');
INSERT INTO `adm_operation_log` VALUES (1083, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:51:08', '2019-12-30 05:51:08');
INSERT INTO `adm_operation_log` VALUES (1084, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:51:10', '2019-12-30 05:51:10');
INSERT INTO `adm_operation_log` VALUES (1085, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"78180bcf-8f8c-4b9d-8fec-da1950a4352a\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:51:14', '2019-12-30 05:51:14');
INSERT INTO `adm_operation_log` VALUES (1086, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:51:16', '2019-12-30 05:51:16');
INSERT INTO `adm_operation_log` VALUES (1087, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"805a9a09-9fa0-4abe-9030-d27f654fc2ee\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:51:21', '2019-12-30 05:51:21');
INSERT INTO `adm_operation_log` VALUES (1088, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e63a6d38-acce-42ac-9544-af1846fa27b8\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:51:40', '2019-12-30 05:51:40');
INSERT INTO `adm_operation_log` VALUES (1089, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:52:01', '2019-12-30 05:52:01');
INSERT INTO `adm_operation_log` VALUES (1090, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"934fd25a-bcf7-4f6a-bedb-7c3f778abcd5\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:52:11', '2019-12-30 05:52:11');
INSERT INTO `adm_operation_log` VALUES (1091, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:52:14', '2019-12-30 05:52:14');
INSERT INTO `adm_operation_log` VALUES (1092, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6fb4aeb4-b1d8-4daf-ac71-b05764ea22f9\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:52:19', '2019-12-30 05:52:19');
INSERT INTO `adm_operation_log` VALUES (1093, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:52:22', '2019-12-30 05:52:22');
INSERT INTO `adm_operation_log` VALUES (1094, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"549caaea-02eb-43fa-901e-4869136a223f\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:52:26', '2019-12-30 05:52:26');
INSERT INTO `adm_operation_log` VALUES (1095, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"be41c883-d090-46a4-adff-387b181e9560\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:52:51', '2019-12-30 05:52:51');
INSERT INTO `adm_operation_log` VALUES (1096, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:54:12', '2019-12-30 05:54:12');
INSERT INTO `adm_operation_log` VALUES (1097, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3febee6c-176c-48f2-a9be-19f6de6fd10b\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:54:17', '2019-12-30 05:54:17');
INSERT INTO `adm_operation_log` VALUES (1098, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c83952da-bba0-40f9-86fa-1d63a5dab773\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:54:22', '2019-12-30 05:54:22');
INSERT INTO `adm_operation_log` VALUES (1099, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3a998bff-39d3-4f27-bead-f17aa5bdbddd\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:54:29', '2019-12-30 05:54:29');
INSERT INTO `adm_operation_log` VALUES (1100, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"8bda6bd1-3e7e-4878-bec5-b877f3f4a47e\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:54:33', '2019-12-30 05:54:33');
INSERT INTO `adm_operation_log` VALUES (1101, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"bcb2b526-0d83-4599-b888-d99b7c65ffb5\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:54:37', '2019-12-30 05:54:37');
INSERT INTO `adm_operation_log` VALUES (1102, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:56:03', '2019-12-30 05:56:03');
INSERT INTO `adm_operation_log` VALUES (1103, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:56:04', '2019-12-30 05:56:04');
INSERT INTO `adm_operation_log` VALUES (1104, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"5c8d64f6-d193-4917-9ec5-bb283fd94240\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:56:08', '2019-12-30 05:56:08');
INSERT INTO `adm_operation_log` VALUES (1105, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b634145e-6d6e-4859-a41c-e882cd6cb96f\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:56:14', '2019-12-30 05:56:14');
INSERT INTO `adm_operation_log` VALUES (1106, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"e24ed633-a139-498e-813c-ac5d12841cce\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:56:23', '2019-12-30 05:56:23');
INSERT INTO `adm_operation_log` VALUES (1107, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:56:24', '2019-12-30 05:56:24');
INSERT INTO `adm_operation_log` VALUES (1108, 1, '/admin/info/user', 'GET', '::1', '', '2019-12-30 05:56:26', '2019-12-30 05:56:26');
INSERT INTO `adm_operation_log` VALUES (1109, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 05:56:27', '2019-12-30 05:56:27');
INSERT INTO `adm_operation_log` VALUES (1110, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:56:29', '2019-12-30 05:56:29');
INSERT INTO `adm_operation_log` VALUES (1111, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6939f206-10b1-4923-937b-c6470558da90\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:56:37', '2019-12-30 05:56:37');
INSERT INTO `adm_operation_log` VALUES (1112, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:56:39', '2019-12-30 05:56:39');
INSERT INTO `adm_operation_log` VALUES (1113, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"d807bfb3-c359-48ad-b81e-e01b58865177\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:56:43', '2019-12-30 05:56:43');
INSERT INTO `adm_operation_log` VALUES (1114, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"019c8d6e-7f57-4741-a31e-baf73c0b9595\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:57:33', '2019-12-30 05:57:33');
INSERT INTO `adm_operation_log` VALUES (1115, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:57:44', '2019-12-30 05:57:44');
INSERT INTO `adm_operation_log` VALUES (1116, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ef3d0965-2d42-4b57-91f6-da994b2c607d\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 05:57:48', '2019-12-30 05:57:48');
INSERT INTO `adm_operation_log` VALUES (1117, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 05:57:50', '2019-12-30 05:57:50');
INSERT INTO `adm_operation_log` VALUES (1118, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"8ecd6c46-4c69-40c9-8f2d-2b9d3f321e25\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 05:57:53', '2019-12-30 05:57:53');
INSERT INTO `adm_operation_log` VALUES (1119, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f493af6e-2328-4217-8c17-de10c519b9ac\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:00:02', '2019-12-30 06:00:02');
INSERT INTO `adm_operation_log` VALUES (1120, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:00:24', '2019-12-30 06:00:24');
INSERT INTO `adm_operation_log` VALUES (1121, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"358d6460-dd9e-418d-9143-5df595f6bee6\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:00:29', '2019-12-30 06:00:29');
INSERT INTO `adm_operation_log` VALUES (1122, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"c304b2c3-40a4-46f1-b998-c8740c8afa73\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:00:47', '2019-12-30 06:00:47');
INSERT INTO `adm_operation_log` VALUES (1123, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"89cb26f3-c84a-45fd-8beb-9ebdc4f541ce\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:00:56', '2019-12-30 06:00:56');
INSERT INTO `adm_operation_log` VALUES (1124, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"301e60a0-aeb8-4657-85e0-1b30aad031e1\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:01:06', '2019-12-30 06:01:06');
INSERT INTO `adm_operation_log` VALUES (1125, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:04:55', '2019-12-30 06:04:55');
INSERT INTO `adm_operation_log` VALUES (1126, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"775344e4-7968-4f6a-a5ae-8dadd7306376\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:04:59', '2019-12-30 06:04:59');
INSERT INTO `adm_operation_log` VALUES (1127, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:06:00', '2019-12-30 06:06:00');
INSERT INTO `adm_operation_log` VALUES (1128, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:06:02', '2019-12-30 06:06:02');
INSERT INTO `adm_operation_log` VALUES (1129, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"16f70eaf-fd1d-4044-8b7d-df58351497c2\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 06:06:07', '2019-12-30 06:06:07');
INSERT INTO `adm_operation_log` VALUES (1130, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:06:41', '2019-12-30 06:06:41');
INSERT INTO `adm_operation_log` VALUES (1131, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:06:42', '2019-12-30 06:06:42');
INSERT INTO `adm_operation_log` VALUES (1132, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:06:43', '2019-12-30 06:06:43');
INSERT INTO `adm_operation_log` VALUES (1133, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:06:45', '2019-12-30 06:06:45');
INSERT INTO `adm_operation_log` VALUES (1134, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"58a31528-2f79-476d-b077-4dd343f52dc4\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:06:50', '2019-12-30 06:06:50');
INSERT INTO `adm_operation_log` VALUES (1135, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:08:40', '2019-12-30 06:08:40');
INSERT INTO `adm_operation_log` VALUES (1136, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:08:43', '2019-12-30 06:08:43');
INSERT INTO `adm_operation_log` VALUES (1137, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"44a0b1be-4f4b-41df-91e2-c7b8a0a1b93c\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:08:47', '2019-12-30 06:08:47');
INSERT INTO `adm_operation_log` VALUES (1138, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:10:23', '2019-12-30 06:10:23');
INSERT INTO `adm_operation_log` VALUES (1139, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:10:25', '2019-12-30 06:10:25');
INSERT INTO `adm_operation_log` VALUES (1140, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"16b51243-3ccc-4abf-b168-7d15db6dd984\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:10:32', '2019-12-30 06:10:32');
INSERT INTO `adm_operation_log` VALUES (1141, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"61f1cf96-fc71-43ff-bbf1-a93b5c7ec1b7\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:10:41', '2019-12-30 06:10:41');
INSERT INTO `adm_operation_log` VALUES (1142, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:11:52', '2019-12-30 06:11:52');
INSERT INTO `adm_operation_log` VALUES (1143, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 06:11:55', '2019-12-30 06:11:55');
INSERT INTO `adm_operation_log` VALUES (1144, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:11:57', '2019-12-30 06:11:57');
INSERT INTO `adm_operation_log` VALUES (1145, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"45756324-cca2-403a-b024-5d7faae90737\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 06:12:01', '2019-12-30 06:12:01');
INSERT INTO `adm_operation_log` VALUES (1146, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"d7c611a2-d544-41c0-a298-8dd34d4d5af6\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 06:12:29', '2019-12-30 06:12:29');
INSERT INTO `adm_operation_log` VALUES (1147, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 06:15:37', '2019-12-30 06:15:37');
INSERT INTO `adm_operation_log` VALUES (1148, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6830fd79-a607-4ef0-ad93-dad038fd67f3\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:15:41', '2019-12-30 06:15:41');
INSERT INTO `adm_operation_log` VALUES (1149, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1009d5be-ca75-440f-8d9d-a1af67aa7851\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 06:16:25', '2019-12-30 06:16:25');
INSERT INTO `adm_operation_log` VALUES (1150, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 07:58:01', '2019-12-30 07:58:01');
INSERT INTO `adm_operation_log` VALUES (1151, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 07:58:04', '2019-12-30 07:58:04');
INSERT INTO `adm_operation_log` VALUES (1152, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"65d6b549-03a0-4db0-b9eb-238aa071d175\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 07:58:12', '2019-12-30 07:58:12');
INSERT INTO `adm_operation_log` VALUES (1153, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 07:59:07', '2019-12-30 07:59:07');
INSERT INTO `adm_operation_log` VALUES (1154, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"845584c3-761e-48db-b9f9-7d73e8cebf33\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 07:59:14', '2019-12-30 07:59:14');
INSERT INTO `adm_operation_log` VALUES (1155, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:03:17', '2019-12-30 08:03:17');
INSERT INTO `adm_operation_log` VALUES (1156, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:03:20', '2019-12-30 08:03:20');
INSERT INTO `adm_operation_log` VALUES (1157, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6046cc3e-c384-4213-9604-7e16603acd10\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 08:03:24', '2019-12-30 08:03:24');
INSERT INTO `adm_operation_log` VALUES (1158, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:05:29', '2019-12-30 08:05:29');
INSERT INTO `adm_operation_log` VALUES (1159, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:05:31', '2019-12-30 08:05:31');
INSERT INTO `adm_operation_log` VALUES (1160, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ae19fb41-55c8-4b5d-b059-1b4bcef4daff\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 08:05:39', '2019-12-30 08:05:39');
INSERT INTO `adm_operation_log` VALUES (1161, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:11:17', '2019-12-30 08:11:17');
INSERT INTO `adm_operation_log` VALUES (1162, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:11:19', '2019-12-30 08:11:19');
INSERT INTO `adm_operation_log` VALUES (1163, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:13:57', '2019-12-30 08:13:57');
INSERT INTO `adm_operation_log` VALUES (1164, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:13:59', '2019-12-30 08:13:59');
INSERT INTO `adm_operation_log` VALUES (1165, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6189c7ae-bcfd-4ef8-90b1-a37c846864b3\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 08:14:04', '2019-12-30 08:14:04');
INSERT INTO `adm_operation_log` VALUES (1166, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:14:06', '2019-12-30 08:14:06');
INSERT INTO `adm_operation_log` VALUES (1167, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"22818ff3-fa3e-4de2-85b5-12932de9670a\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 08:14:10', '2019-12-30 08:14:10');
INSERT INTO `adm_operation_log` VALUES (1168, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"80e29f9a-5dfc-4744-9139-3c701408cf44\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 08:16:10', '2019-12-30 08:16:10');
INSERT INTO `adm_operation_log` VALUES (1169, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:24:58', '2019-12-30 08:24:58');
INSERT INTO `adm_operation_log` VALUES (1170, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:24:59', '2019-12-30 08:24:59');
INSERT INTO `adm_operation_log` VALUES (1171, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:25:02', '2019-12-30 08:25:02');
INSERT INTO `adm_operation_log` VALUES (1172, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f7f7a5d6-2883-4358-aa78-963e3b6a1b4c\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 08:25:07', '2019-12-30 08:25:07');
INSERT INTO `adm_operation_log` VALUES (1173, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"81d52422-9e2a-4583-a3fb-1312bc8c474f\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 08:25:11', '2019-12-30 08:25:11');
INSERT INTO `adm_operation_log` VALUES (1174, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:26:21', '2019-12-30 08:26:21');
INSERT INTO `adm_operation_log` VALUES (1175, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:26:23', '2019-12-30 08:26:23');
INSERT INTO `adm_operation_log` VALUES (1176, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a6e11560-da79-4db2-af51-10149a3ceaee\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-30 08:26:24', '2019-12-30 08:26:24');
INSERT INTO `adm_operation_log` VALUES (1177, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:26:29', '2019-12-30 08:26:29');
INSERT INTO `adm_operation_log` VALUES (1178, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3f8357da-8031-4ad4-b516-5e3aea37109f\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 08:26:32', '2019-12-30 08:26:32');
INSERT INTO `adm_operation_log` VALUES (1179, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:26:34', '2019-12-30 08:26:34');
INSERT INTO `adm_operation_log` VALUES (1180, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"894937be-78b3-45a7-9571-bf8f53ab39f9\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 08:26:37', '2019-12-30 08:26:37');
INSERT INTO `adm_operation_log` VALUES (1181, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:33:03', '2019-12-30 08:33:03');
INSERT INTO `adm_operation_log` VALUES (1182, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 08:33:05', '2019-12-30 08:33:05');
INSERT INTO `adm_operation_log` VALUES (1183, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:33:06', '2019-12-30 08:33:06');
INSERT INTO `adm_operation_log` VALUES (1184, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-30 08:33:48', '2019-12-30 08:33:48');
INSERT INTO `adm_operation_log` VALUES (1185, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"http://localhost:9033/admin/edit/nodes\"],\"_t\":[\"c41d4af2-6198-416a-855c-332270cba14d\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-30 08:40:14', '2019-12-30 08:40:14');
INSERT INTO `adm_operation_log` VALUES (1186, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-30 09:13:05', '2019-12-30 09:13:05');
INSERT INTO `adm_operation_log` VALUES (1187, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:30:12', '2019-12-30 09:30:12');
INSERT INTO `adm_operation_log` VALUES (1188, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"fdde0ffa-4222-4312-aad4-0af966017f79\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"title\":[\"文件管理\"],\"uri\":[\"\"]}', '2019-12-30 09:30:30', '2019-12-30 09:30:30');
INSERT INTO `adm_operation_log` VALUES (1189, 1, '/admin/menu/order', 'POST', '::1', '', '2019-12-30 09:30:41', '2019-12-30 09:30:41');
INSERT INTO `adm_operation_log` VALUES (1190, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:30:41', '2019-12-30 09:30:41');
INSERT INTO `adm_operation_log` VALUES (1191, 1, '/admin/menu/order', 'POST', '::1', '', '2019-12-30 09:36:28', '2019-12-30 09:36:28');
INSERT INTO `adm_operation_log` VALUES (1192, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:36:28', '2019-12-30 09:36:28');
INSERT INTO `adm_operation_log` VALUES (1193, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"3e966afd-4144-4f42-8119-a11c13e7b972\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"17\"],\"title\":[\"文件上传\"],\"uri\":[\"\"]}', '2019-12-30 09:36:44', '2019-12-30 09:36:44');
INSERT INTO `adm_operation_log` VALUES (1194, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-30 09:36:48', '2019-12-30 09:36:48');
INSERT INTO `adm_operation_log` VALUES (1195, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"a6c11c2c-6507-4984-8bbe-5f455e67a3d1\"],\"header\":[\"\"],\"icon\":[\"fa-file-video-o\"],\"id\":[\"18\"],\"parent_id\":[\"17\"],\"title\":[\"文件上传\"],\"uri\":[\"\"]}', '2019-12-30 09:37:02', '2019-12-30 09:37:02');
INSERT INTO `adm_operation_log` VALUES (1196, 1, '/admin/menu/order', 'POST', '::1', '', '2019-12-30 09:37:07', '2019-12-30 09:37:07');
INSERT INTO `adm_operation_log` VALUES (1197, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:37:07', '2019-12-30 09:37:07');
INSERT INTO `adm_operation_log` VALUES (1198, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:37:11', '2019-12-30 09:37:11');
INSERT INTO `adm_operation_log` VALUES (1199, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:37:20', '2019-12-30 09:37:20');
INSERT INTO `adm_operation_log` VALUES (1200, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-30 09:37:22', '2019-12-30 09:37:22');
INSERT INTO `adm_operation_log` VALUES (1201, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"7de004ff-7a07-44db-88eb-17a4fba1b3bb\"],\"header\":[\"\"],\"icon\":[\"fa-file-video-o\"],\"id\":[\"18\"],\"parent_id\":[\"17\"],\"title\":[\"文件上传\"],\"uri\":[\"/info/files\"]}', '2019-12-30 09:37:30', '2019-12-30 09:37:30');
INSERT INTO `adm_operation_log` VALUES (1202, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-30 09:37:32', '2019-12-30 09:37:32');
INSERT INTO `adm_operation_log` VALUES (1203, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:37:33', '2019-12-30 09:37:33');
INSERT INTO `adm_operation_log` VALUES (1204, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-30 09:37:37', '2019-12-30 09:37:37');
INSERT INTO `adm_operation_log` VALUES (1205, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:45:24', '2019-12-30 09:45:24');
INSERT INTO `adm_operation_log` VALUES (1206, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-30 09:45:25', '2019-12-30 09:45:25');
INSERT INTO `adm_operation_log` VALUES (1207, 1, '/admin/menu', 'GET', '::1', '', '2019-12-30 09:48:11', '2019-12-30 09:48:11');
INSERT INTO `adm_operation_log` VALUES (1208, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-30 09:48:13', '2019-12-30 09:48:13');
INSERT INTO `adm_operation_log` VALUES (1209, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-30 09:48:50', '2019-12-30 09:48:50');
INSERT INTO `adm_operation_log` VALUES (1210, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 09:48:52', '2019-12-30 09:48:52');
INSERT INTO `adm_operation_log` VALUES (1211, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"0083d988-28c5-40a3-a7ee-52bec9f46c74\"],\"address\":[\"5f76fef3-2648-40c8-9a95-0dd184749d5a.mp4\"],\"id\":[\"1\"],\"name\":[\"fuck\"]}', '2019-12-30 09:49:07', '2019-12-30 09:49:07');
INSERT INTO `adm_operation_log` VALUES (1212, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-30 09:51:41', '2019-12-30 09:51:41');
INSERT INTO `adm_operation_log` VALUES (1213, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 09:51:45', '2019-12-30 09:51:45');
INSERT INTO `adm_operation_log` VALUES (1214, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7f740567-a756-4979-9cf4-3bae8d487670\"],\"address\":[\"16aeff28-90db-4106-a702-bacd3e36f845.mp4\"],\"id\":[\"2\"],\"name\":[\"\"]}', '2019-12-30 09:51:56', '2019-12-30 09:51:56');
INSERT INTO `adm_operation_log` VALUES (1215, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 09:52:18', '2019-12-30 09:52:18');
INSERT INTO `adm_operation_log` VALUES (1216, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-30 10:02:00', '2019-12-30 10:02:00');
INSERT INTO `adm_operation_log` VALUES (1217, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 10:02:02', '2019-12-30 10:02:02');
INSERT INTO `adm_operation_log` VALUES (1218, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f1a481ef-93b6-47b8-ac73-f5254d0fbcdc\"],\"address\":[\"5f129448-725c-490e-9a60-3388ae334906.mp4\"],\"id\":[\"3\"],\"name\":[\"JJJ\"]}', '2019-12-30 10:02:14', '2019-12-30 10:02:14');
INSERT INTO `adm_operation_log` VALUES (1219, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-30 10:03:52', '2019-12-30 10:03:52');
INSERT INTO `adm_operation_log` VALUES (1220, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 10:03:54', '2019-12-30 10:03:54');
INSERT INTO `adm_operation_log` VALUES (1221, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"464ab65c-ca03-48ba-b0c0-aceacb47d7fc\"],\"address\":[\"84286ab1-873b-42f2-b90e-6dc3701bbf3d.mp4\"],\"id\":[\"4\"],\"name\":[\"ddd\"]}', '2019-12-30 10:04:05', '2019-12-30 10:04:05');
INSERT INTO `adm_operation_log` VALUES (1222, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 10:04:47', '2019-12-30 10:04:47');
INSERT INTO `adm_operation_log` VALUES (1223, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"624e57f0-ba64-49a6-bab6-5f35d71ee1a3\"],\"address\":[\"fdf4678a-a7b3-4967-97be-4186cdaf478b.mp4\"],\"id\":[\"5\"],\"name\":[\"ddddd\"]}', '2019-12-30 10:04:55', '2019-12-30 10:04:55');
INSERT INTO `adm_operation_log` VALUES (1224, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 10:09:55', '2019-12-30 10:09:55');
INSERT INTO `adm_operation_log` VALUES (1225, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"229f5410-9136-4426-b0b0-15dadfe1b52d\"],\"address\":[\"8a42db39-4c5a-495d-aa21-d97cba67b549.mp4\"],\"id\":[\"6\"],\"name\":[\"dxxxx\"]}', '2019-12-30 10:10:06', '2019-12-30 10:10:06');
INSERT INTO `adm_operation_log` VALUES (1226, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-30 10:13:49', '2019-12-30 10:13:49');
INSERT INTO `adm_operation_log` VALUES (1227, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"88cc74ea-ed4b-40b4-9d1a-b9de87f89a54\"],\"address\":[\"66830321-62cf-42ac-ba3c-ab80493d60c4.mp4\"],\"id\":[\"7\"],\"name\":[\"animation.gif.mp4\\t\"]}', '2019-12-30 10:15:49', '2019-12-30 10:15:49');
INSERT INTO `adm_operation_log` VALUES (1228, 1, '/admin/export/files', 'POST', '::1', '', '2019-12-30 10:15:59', '2019-12-30 10:15:59');
INSERT INTO `adm_operation_log` VALUES (1229, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 05:47:14', '2019-12-31 05:47:14');
INSERT INTO `adm_operation_log` VALUES (1230, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 05:47:15', '2019-12-31 05:47:15');
INSERT INTO `adm_operation_log` VALUES (1231, 1, '/admin/new/files', 'POST', '::1', '{\"_filenameaddress\":[\"doc_2018-08-10_16-23-19.mp4\"],\"_filesizeaddress\":[\"1vkm\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"8ad8b7ad-bf79-40f2-b6a4-d7659944ebd8\"],\"address\":[\"f371f3b3-3c08-4d43-99c7-4c982e31e819.mp4\"],\"id\":[\"8\"],\"name\":[\"\"]}', '2019-12-31 05:47:23', '2019-12-31 05:47:23');
INSERT INTO `adm_operation_log` VALUES (1232, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 05:53:49', '2019-12-31 05:53:49');
INSERT INTO `adm_operation_log` VALUES (1233, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 05:53:51', '2019-12-31 05:53:51');
INSERT INTO `adm_operation_log` VALUES (1234, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"animation.gif.mp4\"],\"_filesize_address\":[\"69231\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"94d3e356-1fc6-4b59-9700-2909f41a34b3\"],\"address\":[\"3e41b465-b215-46f0-be3a-1ab45d4ff612.mp4\"],\"id\":[\"9\"],\"name\":[\"animation.gif.mp4\"],\"size\":[\"69231\"]}', '2019-12-31 05:53:57', '2019-12-31 05:53:57');
INSERT INTO `adm_operation_log` VALUES (1235, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 05:54:00', '2019-12-31 05:54:00');
INSERT INTO `adm_operation_log` VALUES (1236, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"813ed01a-0e36-426f-9bb0-b8fe908f01cf\"],\"name\":[\"\"]}', '2019-12-31 05:54:19', '2019-12-31 05:54:19');
INSERT INTO `adm_operation_log` VALUES (1237, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6970a465-0974-47a2-ad25-ccce10f53934\"],\"name\":[\"\"]}', '2019-12-31 06:00:12', '2019-12-31 06:00:12');
INSERT INTO `adm_operation_log` VALUES (1238, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"gpuoutput2.mp4\"],\"_filesize_address\":[\"29584051\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"49340d0f-7552-4e84-8d57-7b29d7c92fe8\"],\"address\":[\"71aea605-b33e-42da-9fe1-7b4c4ef1e30f.mp4\"],\"id\":[\"10\"],\"name\":[\"gpuoutput2.mp4\"],\"size\":[\"29584051\"]}', '2019-12-31 06:05:40', '2019-12-31 06:05:40');
INSERT INTO `adm_operation_log` VALUES (1239, 1, '/admin/delete/files', 'POST', '::1', '', '2019-12-31 06:30:45', '2019-12-31 06:30:45');
INSERT INTO `adm_operation_log` VALUES (1240, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:30:45', '2019-12-31 06:30:45');
INSERT INTO `adm_operation_log` VALUES (1241, 1, '/admin/delete/files', 'POST', '::1', '', '2019-12-31 06:30:48', '2019-12-31 06:30:48');
INSERT INTO `adm_operation_log` VALUES (1242, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:30:48', '2019-12-31 06:30:48');
INSERT INTO `adm_operation_log` VALUES (1243, 1, '/admin/delete/files', 'POST', '::1', '', '2019-12-31 06:30:51', '2019-12-31 06:30:51');
INSERT INTO `adm_operation_log` VALUES (1244, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:30:51', '2019-12-31 06:30:51');
INSERT INTO `adm_operation_log` VALUES (1245, 1, '/admin/delete/files', 'POST', '::1', '', '2019-12-31 06:30:54', '2019-12-31 06:30:54');
INSERT INTO `adm_operation_log` VALUES (1246, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:30:54', '2019-12-31 06:30:54');
INSERT INTO `adm_operation_log` VALUES (1247, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 06:52:33', '2019-12-31 06:52:33');
INSERT INTO `adm_operation_log` VALUES (1248, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"gpuoutput.mp4\"],\"_filesize_address\":[\"30 MB\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"511fe239-b5ad-4b07-8c00-da73b078f9f7\"],\"address\":[\"65cdfb7e-cd4c-4724-9afd-9aaa0c4ca27e.mp4\"],\"id\":[\"11\"],\"name\":[\"gpuoutput.mp4\"],\"size\":[\"30 MB\"]}', '2019-12-31 06:52:40', '2019-12-31 06:52:40');
INSERT INTO `adm_operation_log` VALUES (1249, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:52:48', '2019-12-31 06:52:48');
INSERT INTO `adm_operation_log` VALUES (1250, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:52:50', '2019-12-31 06:52:50');
INSERT INTO `adm_operation_log` VALUES (1251, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:52:52', '2019-12-31 06:52:52');
INSERT INTO `adm_operation_log` VALUES (1252, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:52:53', '2019-12-31 06:52:53');
INSERT INTO `adm_operation_log` VALUES (1253, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:52:54', '2019-12-31 06:52:54');
INSERT INTO `adm_operation_log` VALUES (1254, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:52:54', '2019-12-31 06:52:54');
INSERT INTO `adm_operation_log` VALUES (1255, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:52:55', '2019-12-31 06:52:55');
INSERT INTO `adm_operation_log` VALUES (1256, 1, '/admin/delete/files', 'POST', '::1', '', '2019-12-31 06:53:11', '2019-12-31 06:53:11');
INSERT INTO `adm_operation_log` VALUES (1257, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:53:11', '2019-12-31 06:53:11');
INSERT INTO `adm_operation_log` VALUES (1258, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 06:53:14', '2019-12-31 06:53:14');
INSERT INTO `adm_operation_log` VALUES (1259, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=size\\u0026__sort_type=desc\"],\"_t\":[\"4be29aeb-6e02-4e8e-aa96-ca571aa0d8b6\"],\"name\":[\"\"]}', '2019-12-31 06:53:34', '2019-12-31 06:53:34');
INSERT INTO `adm_operation_log` VALUES (1260, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"周杰伦 唱歌贼难听.2019.1080P.h264.aac.Japanese.None.mp4\"],\"_filesize_address\":[\"30 MB\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=size\\u0026__sort_type=desc\"],\"_t\":[\"de60197a-aa79-43fe-ac34-f7ea01a56823\"],\"address\":[\"0110c1fd-91f2-4ab7-a19e-ad9cc95ab5c1.mp4\"],\"id\":[\"12\"],\"name\":[\"周杰伦 唱歌贼难听.2019.1080P.h264.aac.Japanese.None.mp4\"],\"size\":[\"30 MB\"]}', '2019-12-31 06:57:10', '2019-12-31 06:57:10');
INSERT INTO `adm_operation_log` VALUES (1261, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 06:58:09', '2019-12-31 06:58:09');
INSERT INTO `adm_operation_log` VALUES (1262, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 07:16:20', '2019-12-31 07:16:20');
INSERT INTO `adm_operation_log` VALUES (1263, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=size\\u0026__sort_type=desc\"],\"_t\":[\"a1eb64b2-e21b-497f-8f3c-202e8007c6c7\"],\"name\":[\"\"]}', '2019-12-31 07:16:40', '2019-12-31 07:16:40');
INSERT INTO `adm_operation_log` VALUES (1264, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=size\\u0026__sort_type=desc\"],\"_t\":[\"b705f7af-b47c-4316-b081-0eb85dde9e02\"],\"name\":[\"\"]}', '2019-12-31 07:17:31', '2019-12-31 07:17:31');
INSERT INTO `adm_operation_log` VALUES (1265, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=size\\u0026__sort_type=desc\"],\"_t\":[\"a86a920f-4125-4184-b532-41b969d123fc\"],\"name\":[\"\"]}', '2019-12-31 07:20:07', '2019-12-31 07:20:07');
INSERT INTO `adm_operation_log` VALUES (1266, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 07:20:09', '2019-12-31 07:20:09');
INSERT INTO `adm_operation_log` VALUES (1267, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 07:20:11', '2019-12-31 07:20:11');
INSERT INTO `adm_operation_log` VALUES (1268, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6fe39d0e-5688-4fbf-bc83-5753e2876831\"],\"name\":[\"\"]}', '2019-12-31 07:20:20', '2019-12-31 07:20:20');
INSERT INTO `adm_operation_log` VALUES (1269, 1, '/admin/new/files', 'POST', '::1', '{\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6dad7940-b06d-48d9-8042-340f91eb660a\"],\"name\":[\"\"]}', '2019-12-31 07:32:02', '2019-12-31 07:32:02');
INSERT INTO `adm_operation_log` VALUES (1270, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 07:32:04', '2019-12-31 07:32:04');
INSERT INTO `adm_operation_log` VALUES (1271, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 07:32:06', '2019-12-31 07:32:06');
INSERT INTO `adm_operation_log` VALUES (1272, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"fulian4.mp4\"],\"_filesize_address\":[\"699 MB\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"473e502d-7224-41ee-8873-d4fcc6491321\"],\"address\":[\"48001a7b-bbf2-429e-9694-278560507d79.mp4\"],\"id\":[\"13\"],\"name\":[\"fulian4.mp4\"],\"size\":[\"699 MB\"]}', '2019-12-31 07:32:15', '2019-12-31 07:32:15');
INSERT INTO `adm_operation_log` VALUES (1273, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 07:32:19', '2019-12-31 07:32:19');
INSERT INTO `adm_operation_log` VALUES (1274, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"ubuntu-18.04-desktop-amd64.iso\"],\"_filesize_address\":[\"1.9 GB\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a76e5b95-513c-4c00-920d-5952fe35ce0a\"],\"address\":[\"c9b6fbcd-a6bf-402e-940c-5c041e40ccbf.iso\"],\"id\":[\"14\"],\"name\":[\"ubuntu-18.04-desktop-amd64.iso\"],\"size\":[\"1.9 GB\"]}', '2019-12-31 07:33:09', '2019-12-31 07:33:09');
INSERT INTO `adm_operation_log` VALUES (1275, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 07:56:18', '2019-12-31 07:56:18');
INSERT INTO `adm_operation_log` VALUES (1276, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 07:56:20', '2019-12-31 07:56:20');
INSERT INTO `adm_operation_log` VALUES (1277, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 07:56:23', '2019-12-31 07:56:23');
INSERT INTO `adm_operation_log` VALUES (1278, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"4b96c044-50fc-4f0a-8cda-ea21179e64d7\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 07:56:25', '2019-12-31 07:56:25');
INSERT INTO `adm_operation_log` VALUES (1279, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"51342037-abae-4c0a-b7d5-1d1ee9ee8d5a\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-31 08:17:42', '2019-12-31 08:17:42');
INSERT INTO `adm_operation_log` VALUES (1280, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 08:23:44', '2019-12-31 08:23:44');
INSERT INTO `adm_operation_log` VALUES (1281, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 08:23:47', '2019-12-31 08:23:47');
INSERT INTO `adm_operation_log` VALUES (1282, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 08:23:49', '2019-12-31 08:23:49');
INSERT INTO `adm_operation_log` VALUES (1283, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 08:24:53', '2019-12-31 08:24:53');
INSERT INTO `adm_operation_log` VALUES (1284, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 08:24:55', '2019-12-31 08:24:55');
INSERT INTO `adm_operation_log` VALUES (1285, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 08:24:57', '2019-12-31 08:24:57');
INSERT INTO `adm_operation_log` VALUES (1286, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"98729738-b881-42c8-87f3-3a7513b67342\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:00', '2019-12-31 08:25:00');
INSERT INTO `adm_operation_log` VALUES (1287, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9897a605-d552-47e0-96a3-dad6b57cd805\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:03', '2019-12-31 08:25:03');
INSERT INTO `adm_operation_log` VALUES (1288, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"25c6389e-52d0-43ec-a1a1-dc4267e93dab\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:07', '2019-12-31 08:25:07');
INSERT INTO `adm_operation_log` VALUES (1289, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9155b90a-cbfb-434b-9ecd-d106c7b36768\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:08', '2019-12-31 08:25:08');
INSERT INTO `adm_operation_log` VALUES (1290, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 08:25:11', '2019-12-31 08:25:11');
INSERT INTO `adm_operation_log` VALUES (1291, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a2808ef6-a759-4d35-adff-75cd4ff8d44e\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:13', '2019-12-31 08:25:13');
INSERT INTO `adm_operation_log` VALUES (1292, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"54003024-a828-4c81-813c-f6ec75c28a76\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:14', '2019-12-31 08:25:14');
INSERT INTO `adm_operation_log` VALUES (1293, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"515953a9-3f4a-4746-bff4-6ee5e6564093\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:15', '2019-12-31 08:25:15');
INSERT INTO `adm_operation_log` VALUES (1294, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"04634fb2-2aab-4fa7-b260-4f05f4c5ecd2\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:15', '2019-12-31 08:25:15');
INSERT INTO `adm_operation_log` VALUES (1295, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"7aa47775-8faa-4a8c-91ca-e21ecd799346\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:16', '2019-12-31 08:25:16');
INSERT INTO `adm_operation_log` VALUES (1296, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"19d5ae4a-1d2c-45e8-a21c-361dc1407194\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:17', '2019-12-31 08:25:17');
INSERT INTO `adm_operation_log` VALUES (1297, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 08:25:21', '2019-12-31 08:25:21');
INSERT INTO `adm_operation_log` VALUES (1298, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"cbbe2936-58ab-4df7-9a2a-6c15c832d93e\"],\"id\":[\"5\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 08:25:25', '2019-12-31 08:25:25');
INSERT INTO `adm_operation_log` VALUES (1299, 1, '/admin/update/nodes', 'POST', '::1', '', '2019-12-31 08:25:41', '2019-12-31 08:25:41');
INSERT INTO `adm_operation_log` VALUES (1300, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:35:41', '2019-12-31 08:35:41');
INSERT INTO `adm_operation_log` VALUES (1301, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:37:02', '2019-12-31 08:37:02');
INSERT INTO `adm_operation_log` VALUES (1302, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:37:06', '2019-12-31 08:37:06');
INSERT INTO `adm_operation_log` VALUES (1303, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 08:37:07', '2019-12-31 08:37:07');
INSERT INTO `adm_operation_log` VALUES (1304, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:37:09', '2019-12-31 08:37:09');
INSERT INTO `adm_operation_log` VALUES (1305, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:37:13', '2019-12-31 08:37:13');
INSERT INTO `adm_operation_log` VALUES (1306, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:37:21', '2019-12-31 08:37:21');
INSERT INTO `adm_operation_log` VALUES (1307, 1, '/admin/export/videos', 'POST', '::1', '', '2019-12-31 08:37:27', '2019-12-31 08:37:27');
INSERT INTO `adm_operation_log` VALUES (1308, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:37:59', '2019-12-31 08:37:59');
INSERT INTO `adm_operation_log` VALUES (1309, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 08:38:03', '2019-12-31 08:38:03');
INSERT INTO `adm_operation_log` VALUES (1310, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 08:38:30', '2019-12-31 08:38:30');
INSERT INTO `adm_operation_log` VALUES (1311, 1, '/admin/info/slices', 'GET', '::1', '', '2019-12-31 08:45:58', '2019-12-31 08:45:58');
INSERT INTO `adm_operation_log` VALUES (1312, 1, '/admin/info/slices/new', 'GET', '::1', '', '2019-12-31 08:46:03', '2019-12-31 08:46:03');
INSERT INTO `adm_operation_log` VALUES (1313, 1, '/admin/info/slices/new', 'GET', '::1', '', '2019-12-31 08:47:37', '2019-12-31 08:47:37');
INSERT INTO `adm_operation_log` VALUES (1314, 1, '/admin/info/user', 'GET', '::1', '', '2019-12-31 09:09:56', '2019-12-31 09:09:56');
INSERT INTO `adm_operation_log` VALUES (1315, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:09:57', '2019-12-31 09:09:57');
INSERT INTO `adm_operation_log` VALUES (1316, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:40:19', '2019-12-31 09:40:19');
INSERT INTO `adm_operation_log` VALUES (1317, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:40:21', '2019-12-31 09:40:21');
INSERT INTO `adm_operation_log` VALUES (1318, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:40:22', '2019-12-31 09:40:22');
INSERT INTO `adm_operation_log` VALUES (1319, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:44:10', '2019-12-31 09:44:10');
INSERT INTO `adm_operation_log` VALUES (1320, 1, '/admin/delete/files', 'POST', '::1', '', '2019-12-31 09:44:30', '2019-12-31 09:44:30');
INSERT INTO `adm_operation_log` VALUES (1321, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:44:30', '2019-12-31 09:44:30');
INSERT INTO `adm_operation_log` VALUES (1322, 1, '/admin/info/files/new', 'GET', '::1', '', '2019-12-31 09:44:34', '2019-12-31 09:44:34');
INSERT INTO `adm_operation_log` VALUES (1323, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"architectui-vue-free-theme.zip\"],\"_filesize_address\":[\"9.0 MB\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"42835006-de46-4aef-802c-5060ccec3ab5\"],\"address\":[\"a99d631c-207a-4833-ba10-f4f91352b2bb.zip\"],\"id\":[\"15\"],\"name\":[\"architectui-vue-free-theme.zip\"],\"size\":[\"9.0 MB\"]}', '2019-12-31 09:44:40', '2019-12-31 09:44:40');
INSERT INTO `adm_operation_log` VALUES (1324, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:46:46', '2019-12-31 09:46:46');
INSERT INTO `adm_operation_log` VALUES (1325, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:47:32', '2019-12-31 09:47:32');
INSERT INTO `adm_operation_log` VALUES (1326, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 09:47:39', '2019-12-31 09:47:39');
INSERT INTO `adm_operation_log` VALUES (1327, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:47:41', '2019-12-31 09:47:41');
INSERT INTO `adm_operation_log` VALUES (1328, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 09:47:46', '2019-12-31 09:47:46');
INSERT INTO `adm_operation_log` VALUES (1329, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ffc62756-68d0-485a-b99e-4cf419b61e0f\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 09:47:55', '2019-12-31 09:47:55');
INSERT INTO `adm_operation_log` VALUES (1330, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a2964fc2-44ab-4e1a-87e5-ff4d2acb79cf\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"1\"],\"sync[]\":[\"\"]}', '2019-12-31 09:47:59', '2019-12-31 09:47:59');
INSERT INTO `adm_operation_log` VALUES (1331, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"45f4c6ae-ba36-429f-94b8-2633c2031c88\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/127.0.0.1/tcp/5001\"],\"node_id\":[\"abnormal\"],\"node_status\":[\"0\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-31 09:48:04', '2019-12-31 09:48:04');
INSERT INTO `adm_operation_log` VALUES (1332, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2019-12-31 09:48:11', '2019-12-31 09:48:11');
INSERT INTO `adm_operation_log` VALUES (1333, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3c84951a-1c65-473c-8e7e-dd60c06edacf\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-31 09:48:24', '2019-12-31 09:48:24');
INSERT INTO `adm_operation_log` VALUES (1334, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:48:33', '2019-12-31 09:48:33');
INSERT INTO `adm_operation_log` VALUES (1335, 1, '/admin/edit/nodes', 'POST', '::1', '{\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"f90e718a-5459-495c-a6b1-46a799208fde\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-31 09:48:43', '2019-12-31 09:48:43');
INSERT INTO `adm_operation_log` VALUES (1336, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9d4bf331-c409-4ebb-b0e0-e8157decd5ff\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"2\"],\"sync[]\":[\"\"]}', '2019-12-31 09:48:46', '2019-12-31 09:48:46');
INSERT INTO `adm_operation_log` VALUES (1337, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 09:49:04', '2019-12-31 09:49:04');
INSERT INTO `adm_operation_log` VALUES (1338, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 09:49:15', '2019-12-31 09:49:15');
INSERT INTO `adm_operation_log` VALUES (1339, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:49:17', '2019-12-31 09:49:17');
INSERT INTO `adm_operation_log` VALUES (1340, 1, '/admin/info/files', 'GET', '::1', '', '2019-12-31 09:49:19', '2019-12-31 09:49:19');
INSERT INTO `adm_operation_log` VALUES (1341, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:49:21', '2019-12-31 09:49:21');
INSERT INTO `adm_operation_log` VALUES (1342, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 09:49:28', '2019-12-31 09:49:28');
INSERT INTO `adm_operation_log` VALUES (1343, 1, '/admin/info/videos/new', 'GET', '::1', '', '2019-12-31 09:54:34', '2019-12-31 09:54:34');
INSERT INTO `adm_operation_log` VALUES (1344, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:54:37', '2019-12-31 09:54:37');
INSERT INTO `adm_operation_log` VALUES (1345, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 09:54:48', '2019-12-31 09:54:48');
INSERT INTO `adm_operation_log` VALUES (1346, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:55:05', '2019-12-31 09:55:05');
INSERT INTO `adm_operation_log` VALUES (1347, 1, '/admin/menu', 'GET', '::1', '', '2019-12-31 09:55:10', '2019-12-31 09:55:10');
INSERT INTO `adm_operation_log` VALUES (1348, 1, '/admin/info/videos', 'GET', '::1', '', '2019-12-31 09:55:18', '2019-12-31 09:55:18');
INSERT INTO `adm_operation_log` VALUES (1349, 1, '/admin/menu', 'GET', '::1', '', '2019-12-31 09:55:24', '2019-12-31 09:55:24');
INSERT INTO `adm_operation_log` VALUES (1350, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"3dd9bae1-1532-4021-88cb-d8ecca002458\"],\"header\":[\"\"],\"icon\":[\"fa-file-video-o\"],\"parent_id\":[\"15\"],\"roles[]\":[\"1\"],\"title\":[\"视频切片\"],\"uri\":[\"/info/slices\"]}', '2019-12-31 09:56:09', '2019-12-31 09:56:09');
INSERT INTO `adm_operation_log` VALUES (1351, 1, '/admin/menu', 'GET', '::1', '', '2019-12-31 09:56:24', '2019-12-31 09:56:24');
INSERT INTO `adm_operation_log` VALUES (1352, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-31 09:56:27', '2019-12-31 09:56:27');
INSERT INTO `adm_operation_log` VALUES (1353, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"26be6db7-960a-4f84-9883-08bf64038e45\"],\"header\":[\"管理\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"15\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频信息\"],\"uri\":[\"/info/videos\"]}', '2019-12-31 09:56:39', '2019-12-31 09:56:39');
INSERT INTO `adm_operation_log` VALUES (1354, 1, '/admin/menu', 'GET', '::1', '', '2019-12-31 09:56:43', '2019-12-31 09:56:43');
INSERT INTO `adm_operation_log` VALUES (1355, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 09:56:50', '2019-12-31 09:56:50');
INSERT INTO `adm_operation_log` VALUES (1356, 1, '/admin/menu', 'GET', '::1', '', '2019-12-31 09:56:55', '2019-12-31 09:56:55');
INSERT INTO `adm_operation_log` VALUES (1357, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-31 09:56:59', '2019-12-31 09:56:59');
INSERT INTO `adm_operation_log` VALUES (1358, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"781b8ebd-6c97-43a3-b643-e2711890927d\"],\"header\":[\"\"],\"icon\":[\"fa-wpforms\"],\"id\":[\"8\"],\"parent_id\":[\"15\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"视频信息\"],\"uri\":[\"/info/videos\"]}', '2019-12-31 09:57:02', '2019-12-31 09:57:02');
INSERT INTO `adm_operation_log` VALUES (1359, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-31 09:57:06', '2019-12-31 09:57:06');
INSERT INTO `adm_operation_log` VALUES (1360, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"ab86dffb-2b29-43ea-a561-2f5606082280\"],\"header\":[\"\"],\"icon\":[\"fa-automobile\"],\"id\":[\"14\"],\"parent_id\":[\"16\"],\"roles[]\":[\"1\"],\"title\":[\"节点状态\"],\"uri\":[\"/info/nodes\"]}', '2019-12-31 09:57:13', '2019-12-31 09:57:13');
INSERT INTO `adm_operation_log` VALUES (1361, 1, '/admin/info/manager', 'GET', '::1', '', '2019-12-31 09:57:59', '2019-12-31 09:57:59');
INSERT INTO `adm_operation_log` VALUES (1362, 1, '/admin/menu', 'GET', '::1', '', '2019-12-31 09:58:00', '2019-12-31 09:58:00');
INSERT INTO `adm_operation_log` VALUES (1363, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-31 09:58:08', '2019-12-31 09:58:08');
INSERT INTO `adm_operation_log` VALUES (1364, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"159424dc-62ac-4003-b755-ad04dfc25c2a\"],\"header\":[\"\"],\"icon\":[\"fa-bar-chart\"],\"id\":[\"7\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"Dashboard\"],\"uri\":[\"\"]}', '2019-12-31 09:58:16', '2019-12-31 09:58:16');
INSERT INTO `adm_operation_log` VALUES (1365, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"c53ed03b-215b-43ed-8e98-ae159a0e1de9\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"title\":[\"\"],\"uri\":[\"/\"]}', '2019-12-31 09:58:21', '2019-12-31 09:58:21');
INSERT INTO `adm_operation_log` VALUES (1366, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"5c91e02e-8170-4657-b0fb-b0236b9583dd\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"title\":[\"\"],\"uri\":[\"/\"]}', '2019-12-31 09:58:28', '2019-12-31 09:58:28');
INSERT INTO `adm_operation_log` VALUES (1367, 1, '/admin/menu', 'GET', '::1', '', '2019-12-31 09:58:35', '2019-12-31 09:58:35');
INSERT INTO `adm_operation_log` VALUES (1368, 1, '/admin/menu/new', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"992c83f9-2bb1-432e-a7c6-ab121c313e99\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"0\"],\"title\":[\"\"],\"uri\":[\"/admin\"]}', '2019-12-31 09:58:43', '2019-12-31 09:58:43');
INSERT INTO `adm_operation_log` VALUES (1369, 1, '/admin/menu/edit/show', 'GET', '::1', '', '2019-12-31 09:58:47', '2019-12-31 09:58:47');
INSERT INTO `adm_operation_log` VALUES (1370, 1, '/admin/menu/edit', 'POST', '::1', '{\"_previous_\":[\"/admin/menu\"],\"_t\":[\"53e1a3e5-254d-4cf6-bb26-343a068f84b7\"],\"header\":[\"\"],\"icon\":[\"fa-bar-chart\"],\"id\":[\"7\"],\"parent_id\":[\"0\"],\"roles[]\":[\"1\",\"2\"],\"title\":[\"Dashboard\"],\"uri\":[\"/\"]}', '2019-12-31 09:58:50', '2019-12-31 09:58:50');
INSERT INTO `adm_operation_log` VALUES (1371, 1, '/admin/info/nodes', 'GET', '::1', '', '2019-12-31 10:23:44', '2019-12-31 10:23:44');
INSERT INTO `adm_operation_log` VALUES (1372, 1, '/admin/info/slices', 'GET', '::1', '', '2019-12-31 10:23:50', '2019-12-31 10:23:50');
INSERT INTO `adm_operation_log` VALUES (1373, 1, '/admin/info/slices/new', 'GET', '::1', '', '2019-12-31 10:24:31', '2019-12-31 10:24:31');
INSERT INTO `adm_operation_log` VALUES (1374, 1, '/admin/info/slices/new', 'GET', '::1', '', '2019-12-31 10:32:55', '2019-12-31 10:32:55');
INSERT INTO `adm_operation_log` VALUES (1375, 1, '/admin/info/slices/new', 'GET', '::1', '', '2019-12-31 10:33:00', '2019-12-31 10:33:00');
INSERT INTO `adm_operation_log` VALUES (1376, 1, '/admin/info/nodes', 'GET', '::1', '', '2020-01-01 06:39:36', '2020-01-01 06:39:36');
INSERT INTO `adm_operation_log` VALUES (1377, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2020-01-01 06:39:38', '2020-01-01 06:39:38');
INSERT INTO `adm_operation_log` VALUES (1378, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"87dcc2c9-5535-46ef-a870-a0e43e8ccfa3\"],\"id\":[\"7\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.13/tcp/15001\"],\"node_id\":[\"QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri\"],\"node_status\":[\"1\"],\"sync\":[\"1\"]}', '2020-01-01 06:39:43', '2020-01-01 06:39:43');
INSERT INTO `adm_operation_log` VALUES (1379, 1, '/admin/info/nodes/edit', 'GET', '::1', '', '2020-01-01 06:39:45', '2020-01-01 06:39:45');
INSERT INTO `adm_operation_log` VALUES (1380, 1, '/admin/edit/nodes', 'POST', '::1', '{\"__go_admin_post_type\":[\"0\"],\"_previous_\":[\"/admin/info/nodes?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"4bc14845-59da-4332-a360-1120de98fdca\"],\"id\":[\"6\"],\"interval\":[\"3\"],\"node_addr\":[\"/ip4/192.168.1.146/tcp/15006\"],\"node_id\":[\"QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA\"],\"node_status\":[\"1\"],\"sync\":[\"2\"]}', '2020-01-01 06:39:48', '2020-01-01 06:39:48');
INSERT INTO `adm_operation_log` VALUES (1381, 1, '/admin/info/files', 'GET', '::1', '', '2020-01-01 06:39:51', '2020-01-01 06:39:51');
INSERT INTO `adm_operation_log` VALUES (1382, 1, '/admin/info/files', 'GET', '::1', '', '2020-01-01 06:39:54', '2020-01-01 06:39:54');
INSERT INTO `adm_operation_log` VALUES (1383, 1, '/admin/info/files', 'GET', '::1', '', '2020-01-01 06:39:55', '2020-01-01 06:39:55');
INSERT INTO `adm_operation_log` VALUES (1384, 1, '/admin/info/files/new', 'GET', '::1', '', '2020-01-01 06:39:56', '2020-01-01 06:39:56');
INSERT INTO `adm_operation_log` VALUES (1385, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"ubuntu-18.10-desktop-amd64.iso\"],\"_filesize_address\":[\"2.0 GB\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"6a915b14-51af-4107-95c5-132bdd02f0ef\"],\"address\":[\"0816a8dc-745d-455a-874f-fadf3c5772d7.iso\"],\"id\":[\"16\"],\"name\":[\"ubuntu-18.10-desktop-amd64.iso\"],\"size\":[\"2.0 GB\"]}', '2020-01-01 06:41:04', '2020-01-01 06:41:04');
INSERT INTO `adm_operation_log` VALUES (1386, 1, '/admin/info/files/new', 'GET', '::1', '', '2020-01-01 06:41:08', '2020-01-01 06:41:08');
INSERT INTO `adm_operation_log` VALUES (1387, 1, '/admin/new/files', 'POST', '::1', '{\"_filename_address\":[\"SW_DVD5_Office_Professional_Plus_2016_64Bit_ChnSimp_MLF_X20-42426.ISO\"],\"_filesize_address\":[\"1.1 GB\"],\"_previous_\":[\"/admin/info/files?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"09ad619a-4398-46e8-9bed-bdb807e54044\"],\"address\":[\"40da7d00-903a-415d-9cdc-632f9811d969.ISO\"],\"id\":[\"17\"],\"name\":[\"bbbc\"],\"size\":[\"1.1 GB\"]}', '2020-01-01 06:41:48', '2020-01-01 06:41:48');
INSERT INTO `adm_operation_log` VALUES (1388, 1, '/admin/info/videos', 'GET', '::1', '', '2020-01-01 07:28:52', '2020-01-01 07:28:52');
INSERT INTO `adm_operation_log` VALUES (1389, 1, '/admin/info/nodes', 'GET', '::1', '', '2020-01-01 07:29:27', '2020-01-01 07:29:27');
INSERT INTO `adm_operation_log` VALUES (1390, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-01 08:18:42', '2020-01-01 08:18:42');
INSERT INTO `adm_operation_log` VALUES (1391, 1, '/admin/info/slices', 'GET', '127.0.0.1', '', '2020-01-01 08:27:13', '2020-01-01 08:27:13');
INSERT INTO `adm_operation_log` VALUES (1392, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-01 08:27:17', '2020-01-01 08:27:17');
INSERT INTO `adm_operation_log` VALUES (1393, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-02 05:41:27', '2020-01-02 05:41:27');
INSERT INTO `adm_operation_log` VALUES (1394, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 06:51:40', '2020-01-03 06:51:40');
INSERT INTO `adm_operation_log` VALUES (1395, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-03 06:51:57', '2020-01-03 06:51:57');
INSERT INTO `adm_operation_log` VALUES (1396, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-03 07:00:56', '2020-01-03 07:00:56');
INSERT INTO `adm_operation_log` VALUES (1397, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"24d0b75b-1127-4db6-8ce4-63fe06a0f6cd\"],\"address\":[\"dddd\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:01:02', '2020-01-03 07:01:02');
INSERT INTO `adm_operation_log` VALUES (1398, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"32c52252-66ee-4cea-9ad2-0aafb5cf31a5\"],\"address\":[\"ssss\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:01:35', '2020-01-03 07:01:35');
INSERT INTO `adm_operation_log` VALUES (1399, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"50fb6b7a-73ab-4b2f-977b-c286eb852043\"],\"address\":[\"ssssssssssssss\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:02:43', '2020-01-03 07:02:43');
INSERT INTO `adm_operation_log` VALUES (1400, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9635b98d-4ebc-40c9-b029-b9304922d8b7\"],\"address\":[\"sdddddddddd\"],\"id\":[\"1\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:02:58', '2020-01-03 07:02:58');
INSERT INTO `adm_operation_log` VALUES (1401, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:09:55', '2020-01-03 07:09:55');
INSERT INTO `adm_operation_log` VALUES (1402, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-03 07:10:00', '2020-01-03 07:10:00');
INSERT INTO `adm_operation_log` VALUES (1403, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"1115bb34-ce66-4bc1-8c26-81af4e55eb29\"],\"address\":[\"\"],\"id\":[\"2\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:10:02', '2020-01-03 07:10:02');
INSERT INTO `adm_operation_log` VALUES (1404, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-03 07:10:08', '2020-01-03 07:10:08');
INSERT INTO `adm_operation_log` VALUES (1405, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"076b03c9-71b1-42c5-87d2-8b97369bc4f6\"],\"address\":[\"ddddddddddddddddd\"],\"id\":[\"3\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:10:11', '2020-01-03 07:10:11');
INSERT INTO `adm_operation_log` VALUES (1406, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-03 07:14:21', '2020-01-03 07:14:21');
INSERT INTO `adm_operation_log` VALUES (1407, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"3d42c883-3f39-47f2-a1d0-459bb8ed5d99\"],\"address\":[\"ddddddddddddd\"],\"id\":[\"4\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:14:24', '2020-01-03 07:14:24');
INSERT INTO `adm_operation_log` VALUES (1408, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-03 07:16:12', '2020-01-03 07:16:12');
INSERT INTO `adm_operation_log` VALUES (1409, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b730772e-ce34-4ced-a0cc-26ccda17ab8a\"],\"address\":[\"dddsssssssssss\"],\"id\":[\"5\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:16:15', '2020-01-03 07:16:15');
INSERT INTO `adm_operation_log` VALUES (1410, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:17:35', '2020-01-03 07:17:35');
INSERT INTO `adm_operation_log` VALUES (1411, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:17:45', '2020-01-03 07:17:45');
INSERT INTO `adm_operation_log` VALUES (1412, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:17:47', '2020-01-03 07:17:47');
INSERT INTO `adm_operation_log` VALUES (1413, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:17:48', '2020-01-03 07:17:48');
INSERT INTO `adm_operation_log` VALUES (1414, 1, '/admin/info/slices/new', 'GET', '::1', '', '2020-01-03 07:18:01', '2020-01-03 07:18:01');
INSERT INTO `adm_operation_log` VALUES (1415, 1, '/admin/new/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"ada77d37-f62b-410d-81d4-474f8a4513e2\"],\"address\":[\"ssssssssssssss\"],\"id\":[\"6\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:18:04', '2020-01-03 07:18:04');
INSERT INTO `adm_operation_log` VALUES (1416, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:18:35', '2020-01-03 07:18:35');
INSERT INTO `adm_operation_log` VALUES (1417, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:20:30', '2020-01-03 07:20:30');
INSERT INTO `adm_operation_log` VALUES (1418, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:20:34', '2020-01-03 07:20:34');
INSERT INTO `adm_operation_log` VALUES (1419, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:20:41', '2020-01-03 07:20:41');
INSERT INTO `adm_operation_log` VALUES (1420, 1, '/admin/info/videos', 'GET', '::1', '', '2020-01-03 07:20:41', '2020-01-03 07:20:41');
INSERT INTO `adm_operation_log` VALUES (1421, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:20:42', '2020-01-03 07:20:42');
INSERT INTO `adm_operation_log` VALUES (1422, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:20:53', '2020-01-03 07:20:53');
INSERT INTO `adm_operation_log` VALUES (1423, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:21:11', '2020-01-03 07:21:11');
INSERT INTO `adm_operation_log` VALUES (1424, 1, '/admin/info/videos', 'GET', '::1', '', '2020-01-03 07:21:14', '2020-01-03 07:21:14');
INSERT INTO `adm_operation_log` VALUES (1425, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:21:18', '2020-01-03 07:21:18');
INSERT INTO `adm_operation_log` VALUES (1426, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:21:21', '2020-01-03 07:21:21');
INSERT INTO `adm_operation_log` VALUES (1427, 1, '/admin/info/videos', 'GET', '::1', '', '2020-01-03 07:21:24', '2020-01-03 07:21:24');
INSERT INTO `adm_operation_log` VALUES (1428, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:21:24', '2020-01-03 07:21:24');
INSERT INTO `adm_operation_log` VALUES (1429, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:24:01', '2020-01-03 07:24:01');
INSERT INTO `adm_operation_log` VALUES (1430, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:24:08', '2020-01-03 07:24:08');
INSERT INTO `adm_operation_log` VALUES (1431, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:24:12', '2020-01-03 07:24:12');
INSERT INTO `adm_operation_log` VALUES (1432, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:24:16', '2020-01-03 07:24:16');
INSERT INTO `adm_operation_log` VALUES (1433, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:24:54', '2020-01-03 07:24:54');
INSERT INTO `adm_operation_log` VALUES (1434, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:25:01', '2020-01-03 07:25:01');
INSERT INTO `adm_operation_log` VALUES (1435, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:25:10', '2020-01-03 07:25:10');
INSERT INTO `adm_operation_log` VALUES (1436, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:25:28', '2020-01-03 07:25:28');
INSERT INTO `adm_operation_log` VALUES (1437, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:25:46', '2020-01-03 07:25:46');
INSERT INTO `adm_operation_log` VALUES (1438, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:26:02', '2020-01-03 07:26:02');
INSERT INTO `adm_operation_log` VALUES (1439, 1, '/admin/update/slices', 'POST', '::1', '', '2020-01-03 07:26:06', '2020-01-03 07:26:06');
INSERT INTO `adm_operation_log` VALUES (1440, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:26:07', '2020-01-03 07:26:07');
INSERT INTO `adm_operation_log` VALUES (1441, 1, '/admin/info/slices/edit', 'GET', '::1', '', '2020-01-03 07:26:16', '2020-01-03 07:26:16');
INSERT INTO `adm_operation_log` VALUES (1442, 1, '/admin/edit/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b211f3e1-ae96-4048-8e93-e5c5fdf7664d\"],\"address\":[\"dddddddddddddddddddd\"],\"video_id\":[\"1fce79b1-27bf-11ea-b031-00155d012d1c\"]}', '2020-01-03 07:26:21', '2020-01-03 07:26:21');
INSERT INTO `adm_operation_log` VALUES (1443, 1, '/admin/edit/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"b211f3e1-ae96-4048-8e93-e5c5fdf7664d\"],\"address\":[\"dddddddddddddddddddd\"],\"video_id\":[\"1fce79b1-27bf-11ea-b031-00155d012d1c\"]}', '2020-01-03 07:26:23', '2020-01-03 07:26:23');
INSERT INTO `adm_operation_log` VALUES (1444, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:26:25', '2020-01-03 07:26:25');
INSERT INTO `adm_operation_log` VALUES (1445, 1, '/admin/info/slices/edit', 'GET', '::1', '', '2020-01-03 07:26:28', '2020-01-03 07:26:28');
INSERT INTO `adm_operation_log` VALUES (1446, 1, '/admin/edit/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"988e348a-c8e4-4c79-8092-a66ce9c2d21d\"],\"address\":[\"sssssssssssssssss\"],\"video_id\":[\"1fce79b1-27bf-11ea-b031-00155d012d1c\"]}', '2020-01-03 07:26:30', '2020-01-03 07:26:30');
INSERT INTO `adm_operation_log` VALUES (1447, 1, '/admin/edit/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"988e348a-c8e4-4c79-8092-a66ce9c2d21d\"],\"address\":[\"sssssssssssssssss\"],\"video_id\":[\"1fce79b1-27bf-11ea-b031-00155d012d1c\"]}', '2020-01-03 07:26:33', '2020-01-03 07:26:33');
INSERT INTO `adm_operation_log` VALUES (1448, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:26:36', '2020-01-03 07:26:36');
INSERT INTO `adm_operation_log` VALUES (1449, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:28:31', '2020-01-03 07:28:31');
INSERT INTO `adm_operation_log` VALUES (1450, 1, '/admin/info/slices/edit', 'GET', '::1', '', '2020-01-03 07:28:32', '2020-01-03 07:28:32');
INSERT INTO `adm_operation_log` VALUES (1451, 1, '/admin/edit/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"14968d3e-0a6d-4cc4-923c-6bdbbcdb2193\"],\"address\":[\"dddddddddddddddddddd\"],\"id\":[\"\"],\"video_id\":[\"1fce79b1-27bf-11ea-b031-00155d012d1c\"]}', '2020-01-03 07:28:36', '2020-01-03 07:28:36');
INSERT INTO `adm_operation_log` VALUES (1452, 1, '/admin/info/slices/edit', 'GET', '::1', '', '2020-01-03 07:28:39', '2020-01-03 07:28:39');
INSERT INTO `adm_operation_log` VALUES (1453, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:29:35', '2020-01-03 07:29:35');
INSERT INTO `adm_operation_log` VALUES (1454, 1, '/admin/info/slices/edit', 'GET', '::1', '', '2020-01-03 07:29:41', '2020-01-03 07:29:41');
INSERT INTO `adm_operation_log` VALUES (1455, 1, '/admin/edit/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"a733d271-df44-4db0-b393-4c6d528488ac\"],\"address\":[\"ggggggggggggggggggggggg\"],\"id\":[\"4\"],\"video_id\":[\"00000000-0000-0000-0000-000000000000\"]}', '2020-01-03 07:29:49', '2020-01-03 07:29:49');
INSERT INTO `adm_operation_log` VALUES (1456, 1, '/admin/info/slices/edit', 'GET', '::1', '', '2020-01-03 07:29:54', '2020-01-03 07:29:54');
INSERT INTO `adm_operation_log` VALUES (1457, 1, '/admin/edit/slices', 'POST', '::1', '{\"_previous_\":[\"/admin/info/slices?__page=1\\u0026__pageSize=10\\u0026__sort=id\\u0026__sort_type=desc\"],\"_t\":[\"9d3f2d47-8c6e-45f5-9c01-37509c24684f\"],\"address\":[\"ggggggggggggggggggggggg\"],\"id\":[\"4\"],\"video_id\":[\"1fce79b1-27bf-11ea-b031-00155d012d1c\"]}', '2020-01-03 07:29:58', '2020-01-03 07:29:58');
INSERT INTO `adm_operation_log` VALUES (1458, 1, '/admin/info/slices', 'GET', '::1', '', '2020-01-03 07:32:51', '2020-01-03 07:32:51');
INSERT INTO `adm_operation_log` VALUES (1459, 1, '/admin/info/videos', 'GET', '::1', '', '2020-01-03 07:33:53', '2020-01-03 07:33:53');
INSERT INTO `adm_operation_log` VALUES (1460, 1, '/admin/info/files', 'GET', '::1', '', '2020-01-03 07:34:12', '2020-01-03 07:34:12');
INSERT INTO `adm_operation_log` VALUES (1461, 1, '/admin/info/posts', 'GET', '::1', '', '2020-01-03 07:35:45', '2020-01-03 07:35:45');
INSERT INTO `adm_operation_log` VALUES (1462, 1, '/admin/info/roles', 'GET', '::1', '', '2020-01-03 07:39:28', '2020-01-03 07:39:28');
INSERT INTO `adm_operation_log` VALUES (1463, 1, '/admin/info/permission', 'GET', '::1', '', '2020-01-03 07:39:32', '2020-01-03 07:39:32');
INSERT INTO `adm_operation_log` VALUES (1464, 1, '/admin/info/manager', 'GET', '::1', '', '2020-01-03 07:39:32', '2020-01-03 07:39:32');
INSERT INTO `adm_operation_log` VALUES (1465, 1, '/admin/info/roles', 'GET', '::1', '', '2020-01-03 07:39:35', '2020-01-03 07:39:35');
INSERT INTO `adm_operation_log` VALUES (1466, 1, '/admin/info/manager', 'GET', '::1', '', '2020-01-03 07:39:38', '2020-01-03 07:39:38');
INSERT INTO `adm_operation_log` VALUES (1467, 1, '/admin/info/manager/edit', 'GET', '::1', '', '2020-01-03 07:39:41', '2020-01-03 07:39:41');
INSERT INTO `adm_operation_log` VALUES (1468, 1, '/admin/info/manager', 'GET', '::1', '', '2020-01-03 07:47:54', '2020-01-03 07:47:54');
INSERT INTO `adm_operation_log` VALUES (1469, 1, '/admin/info/manager/edit', 'GET', '::1', '', '2020-01-03 07:47:57', '2020-01-03 07:47:57');
INSERT INTO `adm_operation_log` VALUES (1470, 1, '/admin/info/manager', 'GET', '::1', '', '2020-01-03 08:02:26', '2020-01-03 08:02:26');
INSERT INTO `adm_operation_log` VALUES (1471, 1, '/admin/info/manager/edit', 'GET', '::1', '', '2020-01-03 08:02:29', '2020-01-03 08:02:29');
INSERT INTO `adm_operation_log` VALUES (1472, 1, '/admin/info/roles/new', 'GET', '::1', '', '2020-01-03 08:02:39', '2020-01-03 08:02:39');
INSERT INTO `adm_operation_log` VALUES (1473, 1, '/admin/info/manager/edit', 'GET', '::1', '', '2020-01-03 08:02:44', '2020-01-03 08:02:44');

-- ----------------------------
-- Table structure for adm_permissions
-- ----------------------------
DROP TABLE IF EXISTS `adm_permissions`;
CREATE TABLE `adm_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_permissions
-- ----------------------------
INSERT INTO `adm_permissions` VALUES (1, '所有权限', '*', '', '*', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_permissions` VALUES (2, '仪表盘', 'dashboard', 'GET', '/', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_permissions` VALUES (3, '操作员编辑', 'operator_edit', 'GET,POST', '/info/manager/edit?id=2\r\n/edit/manager?id=2', '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for adm_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `adm_role_menu`;
CREATE TABLE `adm_role_menu`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_role_menu
-- ----------------------------
INSERT INTO `adm_role_menu` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_role_menu` VALUES (1, 9, '2019-09-12 07:15:07', '2019-09-12 07:15:07');
INSERT INTO `adm_role_menu` VALUES (1, 10, '2019-09-12 07:16:04', '2019-09-12 07:16:04');
INSERT INTO `adm_role_menu` VALUES (1, 11, '2019-09-12 07:16:32', '2019-09-12 07:16:32');
INSERT INTO `adm_role_menu` VALUES (1, 12, '2019-09-19 22:00:13', '2019-09-19 22:00:13');
INSERT INTO `adm_role_menu` VALUES (2, 12, '2019-09-19 22:00:13', '2019-09-19 22:00:13');
INSERT INTO `adm_role_menu` VALUES (1, 13, '2019-12-19 07:31:14', '2019-12-19 07:31:14');
INSERT INTO `adm_role_menu` VALUES (1, 15, '2019-12-27 08:16:01', '2019-12-27 08:16:01');
INSERT INTO `adm_role_menu` VALUES (1, 19, '2019-12-31 09:56:08', '2019-12-31 09:56:08');
INSERT INTO `adm_role_menu` VALUES (1, 8, '2019-12-31 09:57:02', '2019-12-31 09:57:02');
INSERT INTO `adm_role_menu` VALUES (2, 8, '2019-12-31 09:57:02', '2019-12-31 09:57:02');
INSERT INTO `adm_role_menu` VALUES (1, 14, '2019-12-31 09:57:13', '2019-12-31 09:57:13');
INSERT INTO `adm_role_menu` VALUES (1, 7, '2019-12-31 09:58:50', '2019-12-31 09:58:50');
INSERT INTO `adm_role_menu` VALUES (2, 7, '2019-12-31 09:58:50', '2019-12-31 09:58:50');

-- ----------------------------
-- Table structure for adm_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `adm_role_permissions`;
CREATE TABLE `adm_role_permissions`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `admin_role_permissions`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_role_permissions
-- ----------------------------
INSERT INTO `adm_role_permissions` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_role_permissions` VALUES (1, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_role_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_role_permissions` VALUES (2, 3, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for adm_role_users
-- ----------------------------
DROP TABLE IF EXISTS `adm_role_users`;
CREATE TABLE `adm_role_users`  (
  `role_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `admin_user_roles`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_role_users
-- ----------------------------
INSERT INTO `adm_role_users` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_role_users` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for adm_roles
-- ----------------------------
DROP TABLE IF EXISTS `adm_roles`;
CREATE TABLE `adm_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_roles
-- ----------------------------
INSERT INTO `adm_roles` VALUES (1, '超级管理员', 'administrator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_roles` VALUES (2, '操作员', 'operator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for adm_session
-- ----------------------------
DROP TABLE IF EXISTS `adm_session`;
CREATE TABLE `adm_session`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_session
-- ----------------------------
INSERT INTO `adm_session` VALUES (37, '1f212abb-eb57-4e0f-b2ee-08ef7c2bf940', '{\"user_id\":1}', '2020-01-03 06:51:36', '2020-01-03 06:51:36');

-- ----------------------------
-- Table structure for adm_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `adm_user_permissions`;
CREATE TABLE `adm_user_permissions`  (
  `user_id` int(11) UNSIGNED NOT NULL,
  `permission_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `admin_user_permissions`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_user_permissions
-- ----------------------------
INSERT INTO `adm_user_permissions` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_user_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for adm_users
-- ----------------------------
DROP TABLE IF EXISTS `adm_users`;
CREATE TABLE `adm_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_users
-- ----------------------------
INSERT INTO `adm_users` VALUES (1, 'admin', '$2a$10$DhWaqVmj4lo4cIefZxBXI.7xmFTA5ryqAn9YpphVwPt88ETDBoG.e', '超级管理员', '', 'tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `adm_users` VALUES (2, 'operator', '$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.', '操作员', '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');

-- ----------------------------
-- Table structure for authors
-- ----------------------------
DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `added` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authors
-- ----------------------------
INSERT INTO `authors` VALUES (1, 'Adam', 'Ondricka', 'abogisich@example.net', '1989-11-20', '1975-10-05 01:47:51');
INSERT INTO `authors` VALUES (2, 'Eileen', 'Abbott', 'etreutel@example.net', '1985-02-24', '2009-01-12 19:22:24');
INSERT INTO `authors` VALUES (3, 'Ebony', 'Mante', 'pagac.marc@example.net', '1982-04-06', '1998-03-18 09:28:58');
INSERT INTO `authors` VALUES (4, 'Breanne', 'Nienow', 'osinski.domenico@example.net', '2007-10-21', '2004-05-07 21:06:14');
INSERT INTO `authors` VALUES (5, 'Eliane', 'Rosenbaum', 'zhessel@example.net', '1996-01-23', '1979-05-24 01:52:18');
INSERT INTO `authors` VALUES (6, 'Bradford', 'Erdman', 'francesca.stark@example.net', '2000-02-22', '1985-04-04 03:23:30');
INSERT INTO `authors` VALUES (7, 'Isidro', 'Hudson', 'sandy.gusikowski@example.com', '2004-09-08', '1979-07-30 08:29:20');
INSERT INTO `authors` VALUES (8, 'Albina', 'Hand', 'zlind@example.net', '2014-03-02', '1996-10-01 11:25:22');
INSERT INTO `authors` VALUES (9, 'Andrew', 'Haley', 'schaden.deborah@example.net', '1984-08-25', '1979-06-25 20:54:46');
INSERT INTO `authors` VALUES (10, 'Lafayette', 'Koch', 'camron.gleason@example.net', '2005-05-26', '1989-06-17 11:15:02');
INSERT INTO `authors` VALUES (11, 'Lincoln', 'Carroll', 'elsa99@example.org', '2007-11-09', '2014-05-05 20:06:45');
INSERT INTO `authors` VALUES (12, 'Joesph', 'Erdman', 'danny.rath@example.net', '1987-05-20', '1992-08-13 00:10:15');
INSERT INTO `authors` VALUES (13, 'Gayle', 'Dach', 'lrice@example.org', '1978-10-17', '1987-08-11 09:51:54');
INSERT INTO `authors` VALUES (14, 'Amira', 'Langosh', 'zbogan@example.net', '2003-06-03', '2000-03-01 05:01:53');
INSERT INTO `authors` VALUES (15, 'Gaston', 'Kshlerin', 'fprosacco@example.com', '2015-01-23', '1988-05-28 23:26:18');
INSERT INTO `authors` VALUES (16, 'Verna', 'Kuhlman', 'lorena.hyatt@example.net', '1986-05-22', '1975-10-11 05:10:36');
INSERT INTO `authors` VALUES (17, 'Janessa', 'Marks', 'lwilderman@example.org', '2013-02-18', '2001-12-16 08:32:18');
INSERT INTO `authors` VALUES (18, 'Olaf', 'Pacocha', 'bogisich.marcel@example.org', '1975-12-10', '1993-05-26 12:54:05');
INSERT INTO `authors` VALUES (19, 'Hayden', 'Stracke', 'lbrown@example.net', '2001-04-05', '1972-06-04 16:55:42');
INSERT INTO `authors` VALUES (20, 'Marisol', 'Bruen', 'cartwright.devante@example.net', '1997-10-14', '1979-01-13 08:54:00');
INSERT INTO `authors` VALUES (21, 'Ottis', 'Christiansen', 'hbeatty@example.com', '1979-05-18', '1992-05-16 02:57:42');
INSERT INTO `authors` VALUES (22, 'Henderson', 'Jaskolski', 'kshlerin.josue@example.net', '1991-06-08', '2011-09-10 06:24:32');
INSERT INTO `authors` VALUES (23, 'Hanna', 'Ryan', 'jaskolski.arno@example.net', '1977-06-13', '2008-09-25 15:29:20');
INSERT INTO `authors` VALUES (24, 'Heather', 'Ryan', 'bode.crawford@example.com', '1993-03-03', '1978-03-31 06:14:34');
INSERT INTO `authors` VALUES (25, 'Jayson', 'Pouros', 'olemke@example.com', '1973-11-16', '1995-03-15 03:22:58');
INSERT INTO `authors` VALUES (26, 'Mack', 'Kihn', 'deion.grimes@example.org', '1990-01-22', '2014-08-13 06:28:25');
INSERT INTO `authors` VALUES (27, 'Elsa', 'Stiedemann', 'rosenbaum.clara@example.net', '1997-12-01', '1994-07-31 00:24:25');
INSERT INTO `authors` VALUES (28, 'Kaylin', 'Wolff', 'wkerluke@example.com', '1999-06-03', '1985-05-11 04:19:46');
INSERT INTO `authors` VALUES (29, 'Braulio', 'Morissette', 'savanah87@example.org', '2000-07-06', '1971-01-25 05:06:31');
INSERT INTO `authors` VALUES (30, 'Darren', 'Tromp', 'roob.micheal@example.org', '1986-12-25', '1976-02-15 07:07:46');
INSERT INTO `authors` VALUES (31, 'Kara', 'Zulauf', 'karelle.bergstrom@example.net', '2015-06-22', '1981-12-01 13:45:28');
INSERT INTO `authors` VALUES (32, 'Rebekah', 'Doyle', 'kunde.makayla@example.net', '1999-05-03', '2012-10-23 15:36:44');
INSERT INTO `authors` VALUES (33, 'Jazmyn', 'Schamberger', 'agustina03@example.net', '1999-11-15', '2001-09-21 07:58:31');
INSERT INTO `authors` VALUES (34, 'Maritza', 'Johnson', 'turner.beau@example.com', '1988-05-23', '1985-08-21 17:22:08');
INSERT INTO `authors` VALUES (35, 'Jaylon', 'Altenwerth', 'cleora56@example.org', '1970-10-04', '2013-02-18 20:23:08');
INSERT INTO `authors` VALUES (36, 'Clint', 'Rogahn', 'vbins@example.net', '1979-04-09', '1998-02-18 01:55:42');
INSERT INTO `authors` VALUES (37, 'Rosie', 'Rodriguez', 'sporer.bette@example.net', '2005-03-09', '1991-02-07 21:17:54');
INSERT INTO `authors` VALUES (38, 'Ethelyn', 'Connelly', 'vfahey@example.net', '2012-06-15', '1986-12-03 15:39:42');
INSERT INTO `authors` VALUES (39, 'Mitchell', 'Hand', 'trohan@example.net', '2018-04-15', '1976-11-01 08:54:42');
INSERT INTO `authors` VALUES (40, 'Helen', 'Jenkins', 'harvey43@example.net', '1991-03-08', '2006-11-03 15:05:32');
INSERT INTO `authors` VALUES (41, 'Stephany', 'Douglas', 'kariane55@example.net', '2004-06-19', '1990-03-15 02:47:10');
INSERT INTO `authors` VALUES (42, 'Deshawn', 'Gottlieb', 'clement.padberg@example.com', '2000-10-14', '2015-06-24 16:31:36');
INSERT INTO `authors` VALUES (43, 'Elian', 'Bernhard', 'iwuckert@example.com', '2000-09-11', '1985-04-07 19:12:57');
INSERT INTO `authors` VALUES (44, 'Bridgette', 'McKenzie', 'elisha.ruecker@example.com', '1998-05-19', '1978-11-23 04:01:34');
INSERT INTO `authors` VALUES (45, 'Olaf', 'Herzog', 'vlakin@example.net', '2014-01-19', '1998-10-22 15:14:05');
INSERT INTO `authors` VALUES (46, 'Newell', 'Purdy', 'danny.pacocha@example.org', '1981-05-02', '1970-04-20 19:05:26');
INSERT INTO `authors` VALUES (47, 'Mikayla', 'Ernser', 'harris.ruby@example.net', '2011-08-04', '1976-05-21 14:53:47');
INSERT INTO `authors` VALUES (48, 'Patrick', 'Collier', 'moore.delfina@example.org', '1978-06-28', '1994-05-11 08:00:54');
INSERT INTO `authors` VALUES (49, 'Jerry', 'Heller', 'shemar.oberbrunner@example.com', '1995-06-17', '1971-12-27 22:58:07');
INSERT INTO `authors` VALUES (50, 'Grace', 'Graham', 'eldora.schulist@example.org', '1998-05-01', '2010-01-02 02:00:02');
INSERT INTO `authors` VALUES (51, 'Nettie', 'Lemke', 'petra.witting@example.com', '1983-12-18', '2004-12-30 20:54:48');
INSERT INTO `authors` VALUES (52, 'Newell', 'Luettgen', 'ervin.brekke@example.net', '1978-06-22', '1980-04-20 13:12:53');
INSERT INTO `authors` VALUES (53, 'Joseph', 'Goldner', 'garrett33@example.com', '2012-11-23', '1995-05-29 10:05:51');
INSERT INTO `authors` VALUES (54, 'Catalina', 'Pollich', 'durgan.tommie@example.org', '2015-07-25', '1996-12-24 05:54:01');
INSERT INTO `authors` VALUES (55, 'Mohamed', 'Hammes', 'larson.burnice@example.net', '1978-12-02', '2016-01-10 20:15:42');
INSERT INTO `authors` VALUES (56, 'Chaim', 'Nolan', 'amorar@example.org', '1999-12-30', '1974-12-11 23:27:19');
INSERT INTO `authors` VALUES (57, 'Miles', 'Muller', 'jgutkowski@example.com', '1974-08-08', '1980-10-21 19:56:07');
INSERT INTO `authors` VALUES (58, 'Terence', 'Schaefer', 'kyra.abbott@example.org', '1988-09-21', '1988-08-01 01:03:45');
INSERT INTO `authors` VALUES (59, 'Sydni', 'Krajcik', 'isom.wolf@example.net', '2003-07-25', '2008-04-24 00:09:21');
INSERT INTO `authors` VALUES (60, 'Billie', 'Goyette', 'bosco.abbey@example.com', '1971-02-02', '2018-07-29 01:37:31');
INSERT INTO `authors` VALUES (61, 'Rupert', 'Lesch', 'nakia.schmitt@example.net', '2009-11-01', '2006-05-09 15:39:32');
INSERT INTO `authors` VALUES (62, 'Allison', 'Botsford', 'bernita79@example.com', '1993-11-28', '1983-08-20 16:38:11');
INSERT INTO `authors` VALUES (63, 'Darrell', 'Kemmer', 'iveum@example.org', '1977-10-04', '2001-07-03 06:14:54');
INSERT INTO `authors` VALUES (64, 'Daisha', 'Lubowitz', 'josephine94@example.org', '1972-10-16', '1992-12-02 10:42:35');
INSERT INTO `authors` VALUES (65, 'Shyann', 'Schaefer', 'gkutch@example.net', '2013-07-21', '1993-09-03 21:02:55');
INSERT INTO `authors` VALUES (66, 'Mario', 'Renner', 'nicola51@example.org', '1974-04-19', '1984-09-01 05:43:31');
INSERT INTO `authors` VALUES (67, 'Lauretta', 'Harber', 'elinore80@example.com', '1994-03-14', '1988-04-21 01:03:32');
INSERT INTO `authors` VALUES (68, 'Edison', 'Brakus', 'cummerata.lucious@example.org', '1982-12-27', '2001-08-09 18:05:29');
INSERT INTO `authors` VALUES (69, 'Eliseo', 'Mosciski', 'william36@example.com', '2011-03-05', '1999-03-30 11:42:39');
INSERT INTO `authors` VALUES (70, 'Terence', 'Waelchi', 'vpowlowski@example.com', '1981-06-11', '1971-05-17 02:27:01');
INSERT INTO `authors` VALUES (71, 'Cameron', 'Roob', 'sally53@example.org', '2018-01-26', '1996-03-04 03:47:57');
INSERT INTO `authors` VALUES (72, 'Gaetano', 'Crona', 'ritchie.lysanne@example.net', '1998-01-21', '1991-12-30 10:22:49');
INSERT INTO `authors` VALUES (73, 'Luna', 'Turner', 'wuckert.madaline@example.com', '2005-12-07', '1976-04-15 16:10:31');
INSERT INTO `authors` VALUES (74, 'Max', 'Streich', 'payton.white@example.net', '1984-05-02', '1971-11-27 05:50:36');
INSERT INTO `authors` VALUES (75, 'Jermaine', 'Fahey', 'guiseppe99@example.com', '1987-10-13', '1972-10-05 06:59:47');
INSERT INTO `authors` VALUES (76, 'Diego', 'Tromp', 'kacey.green@example.org', '1992-08-14', '1973-10-03 22:24:16');
INSERT INTO `authors` VALUES (77, 'Ansel', 'Reichel', 'friesen.lon@example.org', '2009-06-20', '1988-09-12 13:59:55');
INSERT INTO `authors` VALUES (78, 'Lukas', 'Sipes', 'jimmy.tremblay@example.net', '1980-02-06', '1983-01-03 08:42:07');
INSERT INTO `authors` VALUES (79, 'Rashawn', 'Reynolds', 'durgan.francisca@example.net', '1993-07-17', '1994-11-05 14:37:38');
INSERT INTO `authors` VALUES (80, 'Stuart', 'Kohler', 'hfranecki@example.com', '2001-12-18', '1996-04-12 22:58:20');
INSERT INTO `authors` VALUES (81, 'Bettye', 'Brekke', 'westley.keebler@example.com', '2015-03-05', '2007-10-08 12:52:06');
INSERT INTO `authors` VALUES (82, 'Bartholome', 'Mueller', 'lucas10@example.com', '1976-08-31', '2012-05-31 04:17:57');
INSERT INTO `authors` VALUES (83, 'Magali', 'Reilly', 'kmuller@example.org', '1977-10-06', '1975-05-01 03:44:28');
INSERT INTO `authors` VALUES (84, 'Fredrick', 'Schultz', 'telly.considine@example.net', '2003-08-29', '2003-09-03 06:47:15');
INSERT INTO `authors` VALUES (85, 'Pierce', 'Johns', 'aurelia.muller@example.org', '2002-04-11', '1995-10-09 06:12:24');
INSERT INTO `authors` VALUES (86, 'Liliane', 'Rolfson', 'patricia54@example.com', '1983-07-11', '2000-11-06 03:21:36');
INSERT INTO `authors` VALUES (87, 'Ella', 'Ruecker', 'kulas.reid@example.net', '2007-05-30', '1995-10-25 15:54:49');
INSERT INTO `authors` VALUES (88, 'Pascale', 'Bosco', 'lauretta21@example.net', '1973-04-16', '2012-05-08 19:01:51');
INSERT INTO `authors` VALUES (89, 'Easter', 'Kerluke', 'zboncak.alycia@example.net', '1986-04-23', '2010-11-14 22:11:14');
INSERT INTO `authors` VALUES (90, 'Maxime', 'Runolfsson', 'roberts.fern@example.org', '1971-03-24', '2014-09-14 22:24:17');
INSERT INTO `authors` VALUES (91, 'Dylan', 'Muller', 'kelley02@example.com', '2015-07-04', '1975-05-29 15:00:46');
INSERT INTO `authors` VALUES (92, 'Shaina', 'Crona', 'vincenza.baumbach@example.net', '1988-04-02', '1991-02-11 06:30:27');
INSERT INTO `authors` VALUES (93, 'Saige', 'Eichmann', 'lbalistreri@example.org', '1997-02-02', '1991-08-08 19:16:28');
INSERT INTO `authors` VALUES (94, 'Shea', 'Tromp', 'fabiola91@example.net', '2004-07-17', '2015-01-26 02:14:57');
INSERT INTO `authors` VALUES (95, 'Fausto', 'Hills', 'iheller@example.net', '2003-10-13', '1986-03-12 05:38:06');
INSERT INTO `authors` VALUES (96, 'Bernard', 'Erdman', 'orrin50@example.net', '2001-08-10', '2005-11-19 22:58:15');
INSERT INTO `authors` VALUES (97, 'Curt', 'Von', 'myles.gottlieb@example.org', '2016-03-10', '2008-04-06 15:02:33');
INSERT INTO `authors` VALUES (98, 'Emelie', 'Bayer', 'grimes.elmira@example.org', '2004-09-08', '2000-12-18 11:51:56');
INSERT INTO `authors` VALUES (99, 'Nova', 'Barton', 'xleannon@example.org', '1981-11-21', '1971-09-03 23:24:33');
INSERT INTO `authors` VALUES (100, 'Nina', 'Walker', 'hilario.padberg@example.org', '1987-04-12', '1981-08-05 00:34:46');

-- ----------------------------
-- Table structure for dhash_aliases
-- ----------------------------
DROP TABLE IF EXISTS `dhash_aliases`;
CREATE TABLE `dhash_aliases`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dhash_aliases_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_aliases
-- ----------------------------
INSERT INTO `dhash_aliases` VALUES ('0a19bf7c-256c-11ea-9aba-00155d012d1c', '2019-12-23 18:07:34', '2019-12-23 18:07:34', NULL, 'alias1');
INSERT INTO `dhash_aliases` VALUES ('236f33ab-2610-11ea-a694-00155d012d1c', '2019-12-24 13:42:14', '2019-12-24 13:42:14', NULL, 'alias1');
INSERT INTO `dhash_aliases` VALUES ('a0d7b579-2615-11ea-b7e0-00155d012d1c', '2019-12-24 14:21:32', '2019-12-24 14:21:32', NULL, 'alias1');
INSERT INTO `dhash_aliases` VALUES ('e409685b-256b-11ea-a076-00155d012d1c', '2019-12-23 18:06:31', '2019-12-23 18:06:31', NULL, 'alias1');

-- ----------------------------
-- Table structure for dhash_nodes
-- ----------------------------
DROP TABLE IF EXISTS `dhash_nodes`;
CREATE TABLE `dhash_nodes`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `node_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `node_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `config_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dhash_nodes_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dhash_roles
-- ----------------------------
DROP TABLE IF EXISTS `dhash_roles`;
CREATE TABLE `dhash_roles`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dhash_roles_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_roles
-- ----------------------------
INSERT INTO `dhash_roles` VALUES ('0f752398-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '夢乃あいか');
INSERT INTO `dhash_roles` VALUES ('119325a6-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:32', '2019-12-26 18:18:32', NULL, '三上悠亜');
INSERT INTO `dhash_roles` VALUES ('11943701-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '天使もえ');
INSERT INTO `dhash_roles` VALUES ('1194d342-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '葵つかさ');
INSERT INTO `dhash_roles` VALUES ('11956f70-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '筧ジュン');
INSERT INTO `dhash_roles` VALUES ('119659db-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '橋本ありな');
INSERT INTO `dhash_roles` VALUES ('1197443e-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '坂道みる');
INSERT INTO `dhash_roles` VALUES ('1197e08d-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '架乃ゆら');
INSERT INTO `dhash_roles` VALUES ('1198cb8d-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '伊賀まこ');
INSERT INTO `dhash_roles` VALUES ('1199b53d-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, 'ひなたまりん');
INSERT INTO `dhash_roles` VALUES ('1efeacfc-27b7-11ea-8511-00155d012d1c', '2019-12-26 16:10:04', '2019-12-26 16:10:04', NULL, 'ABSOLUTELY PERFECT');
INSERT INTO `dhash_roles` VALUES ('1fceed74-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, '涼森れむ');
INSERT INTO `dhash_roles` VALUES ('25f0c5d8-27bd-11ea-bf54-00155d012d1c', '2019-12-26 16:53:13', '2019-12-26 16:53:13', NULL, 'ABSOLUTELY PERFECT');
INSERT INTO `dhash_roles` VALUES ('43bc0464-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, '園田みおん');
INSERT INTO `dhash_roles` VALUES ('44c7ca10-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, '乙都さきの');
INSERT INTO `dhash_roles` VALUES ('55244f74-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, '吉岡ひより');
INSERT INTO `dhash_roles` VALUES ('581a79da-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, '河合あすな');
INSERT INTO `dhash_roles` VALUES ('6f8b017c-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, '葵つかさ');
INSERT INTO `dhash_roles` VALUES ('79736a26-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, '乙都さきの');
INSERT INTO `dhash_roles` VALUES ('81401377-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, '里美ゆりあ');
INSERT INTO `dhash_roles` VALUES ('867201fe-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, '野々浦暖');
INSERT INTO `dhash_roles` VALUES ('88008b2f-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:57', '2019-12-26 16:55:57', NULL, 'ABSOLUTELY PERFECT');
INSERT INTO `dhash_roles` VALUES ('9d4bfce9-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:48', '2019-12-26 15:37:48', NULL, '園田みおん');
INSERT INTO `dhash_roles` VALUES ('b33ffa71-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '瀬名きらり');
INSERT INTO `dhash_roles` VALUES ('ba684775-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, '園田みおん');
INSERT INTO `dhash_roles` VALUES ('cbcc7a32-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, '河合あすな');
INSERT INTO `dhash_roles` VALUES ('cd653ef5-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '長谷川るい');
INSERT INTO `dhash_roles` VALUES ('cf2f6797-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, '河合あすな');
INSERT INTO `dhash_roles` VALUES ('cfdca78c-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, 'ひなた澪');
INSERT INTO `dhash_roles` VALUES ('def50194-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, '三上悠亜');
INSERT INTO `dhash_roles` VALUES ('fa65ade1-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, '北川ゆず');

-- ----------------------------
-- Table structure for dhash_samples
-- ----------------------------
DROP TABLE IF EXISTS `dhash_samples`;
CREATE TABLE `dhash_samples`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `video_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dhash_samples_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_samples
-- ----------------------------
INSERT INTO `dhash_samples` VALUES ('0f78cce5-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '0', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-1.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f78f3f6-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '1', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-2.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f796932-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '2', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-3.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f79903f-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '3', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-4.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f79dece-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '4', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-5.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f7a0579-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '5', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-6.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f7a2caf-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '6', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-7.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f7a7aa9-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '7', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-8.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f7aa19f-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '8', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-9.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('0f7ac8ba-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '9', 'https://pics.dmm.co.jp/digital/video/ssni00646/ssni00646jp-10.jpg', '0f74afdb-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b3448e33-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '0', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-1.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b344b541-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '1', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-2.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b3450366-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '2', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-3.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b3455295-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '3', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-4.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b3459fa8-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '4', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-5.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b345edd7-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '5', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-6.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b346631a-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '6', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-7.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b346b126-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '7', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-8.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b346ff32-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '8', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-9.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('b3472643-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '9', 'https://pics.dmm.co.jp/digital/video/118abp00647/118abp00647jp-10.jpg', 'b33fac44-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd689ac8-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '0', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-1.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd68c153-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '1', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-2.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd6936cc-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '2', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-3.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd695d9a-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '3', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-4.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd69abac-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '4', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-5.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd69f9c5-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '5', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-6.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd6a20d2-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '6', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-7.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd6a47f4-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '7', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-8.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd6a6f00-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '8', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-9.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd6a9609-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '9', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-10.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cd6abd29-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '10', 'https://pics.dmm.co.jp/digital/video/118abp00648/118abp00648jp-11.jpg', 'cd64f0c5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe13b5c-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '0', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-1.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe189ea-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '1', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-2.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe1d798-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '2', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-3.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe225da-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '3', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-4.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe27414-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '4', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-5.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe2e908-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '5', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-6.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe33726-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '6', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-7.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe35f03-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '7', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-8.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe3854a-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '8', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-9.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe3d371-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '9', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-10.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_samples` VALUES ('cfe3fa99-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '10', 'https://pics.dmm.co.jp/digital/video/118abp00649/118abp00649jp-11.jpg', 'cfdc336c-2877-11ea-a299-00155d012d1c');

-- ----------------------------
-- Table structure for dhash_tags
-- ----------------------------
DROP TABLE IF EXISTS `dhash_tags`;
CREATE TABLE `dhash_tags`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dhash_tags_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_tags
-- ----------------------------
INSERT INTO `dhash_tags` VALUES ('0f75989b-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('0f760ee1-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '独占配信');
INSERT INTO `dhash_tags` VALUES ('0f7682fe-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '足コキ');
INSERT INTO `dhash_tags` VALUES ('0f772072-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('0f77bb96-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '女子校生');
INSERT INTO `dhash_tags` VALUES ('0f7809a6-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, 'ギリモザ');
INSERT INTO `dhash_tags` VALUES ('0f787ec6-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('119a518d-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('119b3bdb-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '美少女');
INSERT INTO `dhash_tags` VALUES ('119c271a-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '乱交');
INSERT INTO `dhash_tags` VALUES ('119cc290-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, 'ファン感謝・訪問');
INSERT INTO `dhash_tags` VALUES ('119d85cb-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, 'ヘルス・ソープ');
INSERT INTO `dhash_tags` VALUES ('119e4f27-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, 'ギリモザ');
INSERT INTO `dhash_tags` VALUES ('119eeb46-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '独占配信');
INSERT INTO `dhash_tags` VALUES ('119f606b-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('11a023c2-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:33', '2019-12-26 18:18:33', NULL, '4時間以上作品');
INSERT INTO `dhash_tags` VALUES ('1eff6a39-27b7-11ea-8511-00155d012d1c', '2019-12-26 16:10:04', '2019-12-26 16:10:04', NULL, 'プレステージ');
INSERT INTO `dhash_tags` VALUES ('1fcfb0ad-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('1fd04cfe-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, '汗だく');
INSERT INTO `dhash_tags` VALUES ('1fd0c3ae-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, 'スポーツ');
INSERT INTO `dhash_tags` VALUES ('1fd18702-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('1fd221bc-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, 'コスプレ');
INSERT INTO `dhash_tags` VALUES ('1fd296f7-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, 'フェラ');
INSERT INTO `dhash_tags` VALUES ('1fd30c1e-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, '顔射');
INSERT INTO `dhash_tags` VALUES ('1fd382c4-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('1fd3f67d-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, '競泳・スクール水着');
INSERT INTO `dhash_tags` VALUES ('25f1b31e-27bd-11ea-bf54-00155d012d1c', '2019-12-26 16:53:13', '2019-12-26 16:53:13', NULL, 'プレステージ');
INSERT INTO `dhash_tags` VALUES ('43bcc633-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, 'コスプレ');
INSERT INTO `dhash_tags` VALUES ('43bdb0b1-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, '3P・4P');
INSERT INTO `dhash_tags` VALUES ('43be73ea-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('43bee91b-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('43bf8575-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('43c06fda-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('44c86700-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, '顔射');
INSERT INTO `dhash_tags` VALUES ('44c90191-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('44c9ec40-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, 'フェラ');
INSERT INTO `dhash_tags` VALUES ('44ca8862-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, '近親相姦');
INSERT INTO `dhash_tags` VALUES ('44cb2489-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, '姉・妹');
INSERT INTO `dhash_tags` VALUES ('44cbc0de-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, '主観');
INSERT INTO `dhash_tags` VALUES ('44cc8460-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('44cd2069-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, '童貞');
INSERT INTO `dhash_tags` VALUES ('5524c4c3-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, '潮吹き');
INSERT INTO `dhash_tags` VALUES ('552563d0-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, '美少女');
INSERT INTO `dhash_tags` VALUES ('5525fdd9-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, '美乳');
INSERT INTO `dhash_tags` VALUES ('5526731a-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, '3P・4P');
INSERT INTO `dhash_tags` VALUES ('5526e6b7-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('5527aa49-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, 'ギリモザ');
INSERT INTO `dhash_tags` VALUES ('5528206e-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, '独占配信');
INSERT INTO `dhash_tags` VALUES ('5528945f-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('552909c9-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, 'スレンダー');
INSERT INTO `dhash_tags` VALUES ('581b3d74-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('581bd951-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('581c4e61-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, 'フェラ');
INSERT INTO `dhash_tags` VALUES ('581cc4ce-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('581d5ff8-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, '妄想');
INSERT INTO `dhash_tags` VALUES ('581e2320-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, '主観');
INSERT INTO `dhash_tags` VALUES ('581ebf7f-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('6f8b9db8-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('6f8c39f5-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, '独占配信');
INSERT INTO `dhash_tags` VALUES ('6f8caf3c-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, 'ナンパ');
INSERT INTO `dhash_tags` VALUES ('6f8d4b94-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, 'スレンダー');
INSERT INTO `dhash_tags` VALUES ('6f8e0edb-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, '盗撮・のぞき');
INSERT INTO `dhash_tags` VALUES ('6f8eaaf3-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, '美少女');
INSERT INTO `dhash_tags` VALUES ('6f8f472c-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, 'ギリモザ');
INSERT INTO `dhash_tags` VALUES ('6f8fe391-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('797454c3-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('7974f223-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, '顔射');
INSERT INTO `dhash_tags` VALUES ('7975661c-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, 'おもちゃ');
INSERT INTO `dhash_tags` VALUES ('797650ae-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, '男の潮吹き');
INSERT INTO `dhash_tags` VALUES ('79773ac7-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('7977d721-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, 'M男');
INSERT INTO `dhash_tags` VALUES ('8140af9e-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('81414cf8-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('8141e927-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, 'アナル');
INSERT INTO `dhash_tags` VALUES ('81428454-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, 'フェラ');
INSERT INTO `dhash_tags` VALUES ('8143489b-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, '潮吹き');
INSERT INTO `dhash_tags` VALUES ('8143bccf-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('86729e5e-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('867361b0-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, 'パイパン');
INSERT INTO `dhash_tags` VALUES ('8673d6b6-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, 'コスプレ');
INSERT INTO `dhash_tags` VALUES ('86747319-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, 'フェラ');
INSERT INTO `dhash_tags` VALUES ('8674e852-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, '顔射');
INSERT INTO `dhash_tags` VALUES ('8675848f-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('88014e6f-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:57', '2019-12-26 16:55:57', NULL, 'プレステージ');
INSERT INTO `dhash_tags` VALUES ('9d4cc1be-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:48', '2019-12-26 15:37:48', NULL, 'コスプレ');
INSERT INTO `dhash_tags` VALUES ('9d4d837a-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:48', '2019-12-26 15:37:48', NULL, '3P・4P');
INSERT INTO `dhash_tags` VALUES ('9d4e4ade-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:49', '2019-12-26 15:37:49', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('9d4f0a1d-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:49', '2019-12-26 15:37:49', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('9d4fa621-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:49', '2019-12-26 15:37:49', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('9d504279-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:49', '2019-12-26 15:37:49', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('b340bdd9-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('b341a842-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, 'フェラ');
INSERT INTO `dhash_tags` VALUES ('b3426b73-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, 'イラマチオ');
INSERT INTO `dhash_tags` VALUES ('b343079a-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, '妄想');
INSERT INTO `dhash_tags` VALUES ('b343ccc9-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('ba693017-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, 'コスプレ');
INSERT INTO `dhash_tags` VALUES ('ba69f3a3-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, '3P・4P');
INSERT INTO `dhash_tags` VALUES ('ba6a6898-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('ba6adef3-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('ba6b5311-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('ba6bef63-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('cbcd3c10-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, '顔射');
INSERT INTO `dhash_tags` VALUES ('cbcdff44-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('cbcec2ab-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('cbcf37c0-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, 'ハメ撮り');
INSERT INTO `dhash_tags` VALUES ('cbd02272-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('cbd10ca0-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('cd65b421-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '顔射');
INSERT INTO `dhash_tags` VALUES ('cd66505b-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('cd671397-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('cd678aa9-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, '主観');
INSERT INTO `dhash_tags` VALUES ('cd68250d-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('cf30526a-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('cf30ee44-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('cf318a9d-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, 'フェラ');
INSERT INTO `dhash_tags` VALUES ('cf324e03-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('cf33112f-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, '妄想');
INSERT INTO `dhash_tags` VALUES ('cf338651-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, '主観');
INSERT INTO `dhash_tags` VALUES ('cf33fb7d-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('cfdd91f9-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '顔射');
INSERT INTO `dhash_tags` VALUES ('cfde2e1e-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('cfdeca8c-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, 'オナニー');
INSERT INTO `dhash_tags` VALUES ('cfdf66b1-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, 'パイズリ');
INSERT INTO `dhash_tags` VALUES ('cfe029f9-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, '潮吹き');
INSERT INTO `dhash_tags` VALUES ('cfe0c6b5-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('def5c4c5-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, 'ハイビジョン');
INSERT INTO `dhash_tags` VALUES ('def66117-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, '独占配信');
INSERT INTO `dhash_tags` VALUES ('def725b7-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, '巨乳');
INSERT INTO `dhash_tags` VALUES ('def7998a-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, 'ドキュメンタリー');
INSERT INTO `dhash_tags` VALUES ('def835b2-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, 'アイドル・芸能人');
INSERT INTO `dhash_tags` VALUES ('def8aace-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, '潮吹き');
INSERT INTO `dhash_tags` VALUES ('def9472b-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('def9e433-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, 'ギリモザ');
INSERT INTO `dhash_tags` VALUES ('fa669770-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, '単体作品');
INSERT INTO `dhash_tags` VALUES ('fa6734c9-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, '独占配信');
INSERT INTO `dhash_tags` VALUES ('fa67f6e3-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, 'スレンダー');
INSERT INTO `dhash_tags` VALUES ('fa68ba4a-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, '潮吹き');
INSERT INTO `dhash_tags` VALUES ('fa695690-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, 'パイパン');
INSERT INTO `dhash_tags` VALUES ('fa69f2c8-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, '淫乱・ハード系');
INSERT INTO `dhash_tags` VALUES ('fa6ab799-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, '美少女');
INSERT INTO `dhash_tags` VALUES ('fa6b7980-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, 'ギリモザ');
INSERT INTO `dhash_tags` VALUES ('fa6c1baa-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, 'ハイビジョン');

-- ----------------------------
-- Table structure for dhash_video_aliases
-- ----------------------------
DROP TABLE IF EXISTS `dhash_video_aliases`;
CREATE TABLE `dhash_video_aliases`  (
  `video_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `alias_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`video_id`, `alias_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_video_aliases
-- ----------------------------
INSERT INTO `dhash_video_aliases` VALUES ('0a197160-256c-11ea-9aba-00155d012d1c', '0a19bf7c-256c-11ea-9aba-00155d012d1c');
INSERT INTO `dhash_video_aliases` VALUES ('236dfd00-2610-11ea-a694-00155d012d1c', '236f33ab-2610-11ea-a694-00155d012d1c');
INSERT INTO `dhash_video_aliases` VALUES ('a0d7621d-2615-11ea-b7e0-00155d012d1c', 'a0d7b579-2615-11ea-b7e0-00155d012d1c');
INSERT INTO `dhash_video_aliases` VALUES ('e40915df-256b-11ea-a076-00155d012d1c', 'e409685b-256b-11ea-a076-00155d012d1c');

-- ----------------------------
-- Table structure for dhash_video_roles
-- ----------------------------
DROP TABLE IF EXISTS `dhash_video_roles`;
CREATE TABLE `dhash_video_roles`  (
  `video_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`video_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_video_roles
-- ----------------------------
INSERT INTO `dhash_video_roles` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f752398-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119325a6-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '11943701-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '1194d342-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '11956f70-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119659db-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '1197443e-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '1197e08d-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '1198cb8d-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '1199b53d-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1efe32d9-27b7-11ea-8511-00155d012d1c', '1efeacfc-27b7-11ea-8511-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fceed74-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('25f029b5-27bd-11ea-bf54-00155d012d1c', '25f0c5d8-27bd-11ea-bf54-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '43bc0464-27b6-11ea-be04-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44c7ca10-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '55244f74-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581a79da-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8b017c-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '79736a26-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '81401377-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '867201fe-27c2-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('88003cf8-27bd-11ea-92bd-00155d012d1c', '88008b2f-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '9d4bfce9-27b2-11ea-94c2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('b33fac44-2877-11ea-a299-00155d012d1c', 'b33ffa71-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', 'ba684775-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', 'cbcc7a32-27ae-11ea-a75d-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('cd64f0c5-2877-11ea-a299-00155d012d1c', 'cd653ef5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf2f6797-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', 'cfdca78c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def50194-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_roles` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa65ade1-27ad-11ea-b37a-00155d012d1c');

-- ----------------------------
-- Table structure for dhash_video_tags
-- ----------------------------
DROP TABLE IF EXISTS `dhash_video_tags`;
CREATE TABLE `dhash_video_tags`  (
  `video_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `tag_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`video_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_video_tags
-- ----------------------------
INSERT INTO `dhash_video_tags` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f75989b-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f760ee1-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f7682fe-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f772072-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f77bb96-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f7809a6-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '0f787ec6-286b-11ea-8520-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119a518d-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119b3bdb-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119c271a-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119cc290-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119d85cb-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119e4f27-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119eeb46-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '119f606b-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '11a023c2-27c9-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1efe32d9-27b7-11ea-8511-00155d012d1c', '1eff6a39-27b7-11ea-8511-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fcfb0ad-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd04cfe-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd0c3ae-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd18702-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd221bc-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd296f7-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd30c1e-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd382c4-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '1fd3f67d-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('25f029b5-27bd-11ea-bf54-00155d012d1c', '25f1b31e-27bd-11ea-bf54-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '43bcc633-27b6-11ea-be04-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '43bdb0b1-27b6-11ea-be04-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '43be73ea-27b6-11ea-be04-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '43bee91b-27b6-11ea-be04-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '43bf8575-27b6-11ea-be04-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '43c06fda-27b6-11ea-be04-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44c86700-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44c90191-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44c9ec40-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44ca8862-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44cb2489-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44cbc0de-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44cc8460-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '44cd2069-27c1-11ea-95ff-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '5524c4c3-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '552563d0-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '5525fdd9-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '5526731a-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '5526e6b7-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '5527aa49-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '5528206e-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '5528945f-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '552909c9-286a-11ea-9db3-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581b3d74-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581bd951-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581c4e61-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581cc4ce-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581d5ff8-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581e2320-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '581ebf7f-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8b9db8-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8c39f5-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8caf3c-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8d4b94-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8e0edb-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8eaaf3-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8f472c-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '6f8fe391-27bf-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '797454c3-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '7974f223-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '7975661c-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '797650ae-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '79773ac7-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '7977d721-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '8140af9e-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '81414cf8-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '8141e927-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '81428454-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '8143489b-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '8143bccf-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '86729e5e-27c2-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '867361b0-27c2-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '8673d6b6-27c2-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '86747319-27c2-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '8674e852-27c2-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '8675848f-27c2-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('88003cf8-27bd-11ea-92bd-00155d012d1c', '88014e6f-27bd-11ea-92bd-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '9d4cc1be-27b2-11ea-94c2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '9d4d837a-27b2-11ea-94c2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '9d4e4ade-27b2-11ea-94c2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '9d4f0a1d-27b2-11ea-94c2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '9d4fa621-27b2-11ea-94c2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '9d504279-27b2-11ea-94c2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('b33fac44-2877-11ea-a299-00155d012d1c', 'b340bdd9-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('b33fac44-2877-11ea-a299-00155d012d1c', 'b341a842-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('b33fac44-2877-11ea-a299-00155d012d1c', 'b3426b73-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('b33fac44-2877-11ea-a299-00155d012d1c', 'b343079a-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('b33fac44-2877-11ea-a299-00155d012d1c', 'b343ccc9-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', 'ba693017-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', 'ba69f3a3-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', 'ba6a6898-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', 'ba6adef3-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', 'ba6b5311-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', 'ba6bef63-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', 'cbcd3c10-27ae-11ea-a75d-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', 'cbcdff44-27ae-11ea-a75d-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', 'cbcec2ab-27ae-11ea-a75d-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', 'cbcf37c0-27ae-11ea-a75d-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', 'cbd02272-27ae-11ea-a75d-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', 'cbd10ca0-27ae-11ea-a75d-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cd64f0c5-2877-11ea-a299-00155d012d1c', 'cd65b421-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cd64f0c5-2877-11ea-a299-00155d012d1c', 'cd66505b-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cd64f0c5-2877-11ea-a299-00155d012d1c', 'cd671397-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cd64f0c5-2877-11ea-a299-00155d012d1c', 'cd678aa9-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cd64f0c5-2877-11ea-a299-00155d012d1c', 'cd68250d-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf30526a-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf30ee44-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf318a9d-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf324e03-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf33112f-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf338651-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', 'cf33fb7d-27c0-11ea-b031-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', 'cfdd91f9-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', 'cfde2e1e-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', 'cfdeca8c-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', 'cfdf66b1-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', 'cfe029f9-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', 'cfe0c6b5-2877-11ea-a299-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def5c4c5-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def66117-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def725b7-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def7998a-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def835b2-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def8aace-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def9472b-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', 'def9e433-27c8-11ea-9df2-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa669770-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa6734c9-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa67f6e3-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa68ba4a-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa695690-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa69f2c8-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa6ab799-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa6b7980-27ad-11ea-b37a-00155d012d1c');
INSERT INTO `dhash_video_tags` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', 'fa6c1baa-27ad-11ea-b37a-00155d012d1c');

-- ----------------------------
-- Table structure for dhash_videos
-- ----------------------------
DROP TABLE IF EXISTS `dhash_videos`;
CREATE TABLE `dhash_videos`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `thumb_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `poster_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `source_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `m3u8_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `m3u8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `director` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `systematics` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `season` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `total_episode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `episode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `producer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `sharpness` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `series` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `length` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `uncensored` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dhash_videos_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_dhash_videos_index`(`index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dhash_videos
-- ----------------------------
INSERT INTO `dhash_videos` VALUES ('0f74afdb-286b-11ea-8520-00155d012d1c', '2019-12-27 13:38:07', '2019-12-27 13:38:07', NULL, 'SSNI-646', '絶・対・領・域 ハリのあるムチムチ太ももで無意識に誘惑 着衣巨乳ニーハイ美少女 夢乃あいか', '', '', '', '', '', '', '', '', '1', '1', '1', 'エスワン ナンバーワンスタイル', '', '', '2D', '', '', '', '', '2019-12-14', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('1192899a-27c9-11ea-9df2-00155d012d1c', '2019-12-26 18:18:32', '2019-12-26 18:18:32', NULL, 'SSNI-658', 'S1豪華絢爛ドリーム大共演2019 ファン感謝祭！大大大乱交！夢のハーレムソープ！超豪華3本立て伝説の270分', '', '', '', '', '', '', '', '', '1', '1', '1', 'エスワン ナンバーワンスタイル', '', '', '2D', '', '', '', '', '2019-12-14 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('1efe32d9-27b7-11ea-8511-00155d012d1c', '2019-12-26 16:10:04', '2019-12-26 16:10:04', NULL, 'ABP-888', '伝説の超高級サロン 究極のM性感 秘密倶楽部 乙都さきのが責めて責めて責めまくる！！', '', '', '', '', '', '', '', '', '1', '1', '1', 'プノンペン凌', '', '', '2D', '', '', '', '', '2019-08-16 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('1fce79b1-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:07:21', '2019-12-26 17:07:21', NULL, 'ABP-889', 'スポコス汗だくSEX4本番！ 体育会系・涼森れむ act.23 弾ける汗×スポーツウェアフェチズム', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-08-16 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('25f029b5-27bd-11ea-bf54-00155d012d1c', '2019-12-26 16:53:13', '2019-12-26 16:53:13', NULL, 'ABP-888', '伝説の超高級サロン 究極のM性感 秘密倶楽部 乙都さきのが責めて責めて責めまくる！！', '', '', '', '', '', '', '', '', '1', '1', '1', 'プノンペン凌', '', '', '2D', '', '', '', '', '2019-08-16 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('43bbb4d0-27b6-11ea-be04-00155d012d1c', '2019-12-26 16:03:56', '2019-12-26 16:03:56', NULL, 'ABP-874', '僕とみおんの異世界性活 最強セクシー装備でエロさ限界突破！！！ 園田みおん', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-07-05 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('44c7543a-27c1-11ea-95ff-00155d012d1c', '2019-12-26 17:22:42', '2019-12-26 17:22:42', NULL, 'ABP-847', 'ボクの妹・乙都さきのとエッチなふたりぐらし 近親相姦シリーズNo.005 いたずら大好きっ娘。完全主観SEX', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-04-19 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('55240085-286a-11ea-9db3-00155d012d1c', '2019-12-27 13:32:55', '2019-12-27 13:32:55', NULL, 'SSNI-656', '激イキ181回！痙攣6012回！イキ潮8706cc！超敏感スリムボディ エロス覚醒 はじめての大・痙・攣スペシャル 吉岡ひより', '', '', '', '', '', '', '', '', '1', '1', '1', 'エスワン ナンバーワンスタイル', '', '', '2D', '', '', '', '', '2019-12-14', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('581a2bb5-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:16:05', '2019-12-26 17:16:05', NULL, 'ABP-777', '絶対的鉄板シチュエーション 13 完全主観！！！河合あすなが贈るとてもHな3シチュエーション', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2018-09-28 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('6f8a8c75-27bf-11ea-b031-00155d012d1c', '2019-12-26 17:09:35', '2019-12-26 17:09:35', NULL, 'SNIS-658', '盗撮リアルドキュメント！密着44日、葵つかさのプライベートを激撮し、カメラマンを装ったベテランナンパ師に引っ掛かって、SEXまでしちゃった一部始終', '', '', '', '', '', '', '', '', '1', '1', '1', 'エスワンナンバーワンスタイル', '', '', '2D', '', '', '', '', '2016-05-15 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('7259de74-27be-11ea-9e4d-00155d012d1c', '2019-12-26 17:02:30', '2019-12-26 17:02:30', NULL, 'ABP-889', 'スポコス汗だくSEX4本番！ 体育会系・涼森れむ act.23 弾ける汗×スポーツウェアフェチズム', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-08-16 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('7972ce0b-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:33', '2019-12-26 16:55:33', NULL, 'ABP-888', '伝説の超高級サロン 究極のM性感 秘密倶楽部 乙都さきのが責めて責めて責めまくる！！', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-08-16 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('813f9e41-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:17:14', '2019-12-26 17:17:14', NULL, 'ABP-666', '焦らし寸止め小悪魔ソープ 3 人生史上最高の射精をあなたに。 里美ゆりあ', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2017-11-17 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('8671b589-27c2-11ea-9df2-00155d012d1c', '2019-12-26 17:31:42', '2019-12-26 17:31:42', NULL, 'ABP-886', '本番オーケー！？噂の裏ピンサロ 11 AV界随一のアイドル級ルックスを味わい尽くせ！ 野々浦暖', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-08-09 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('88003cf8-27bd-11ea-92bd-00155d012d1c', '2019-12-26 16:55:57', '2019-12-26 16:55:57', NULL, 'ABP-889', 'スポコス汗だくSEX4本番！ 体育会系・涼森れむ act.23 弾ける汗×スポーツウェアフェチズム', '', '', '', '', '', '', '', '', '1', '1', '1', 'シコティッシュふわふわ', '', '', '2D', '', '', '', '', '2019-08-16 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('9d4b60b2-27b2-11ea-94c2-00155d012d1c', '2019-12-26 15:37:48', '2019-12-26 15:37:48', NULL, 'ABP-874', '僕とみおんの異世界性活 最強セクシー装備でエロさ限界突破！！！ 園田みおん', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('b33fac44-2877-11ea-a299-00155d012d1c', '2019-12-27 15:08:36', '2019-12-27 15:08:36', NULL, 'ABP-647', '絶対的鉄板シチュエーション 6 完全主観！！瀬名きらりが贈るとてもHな4シチュエーション', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2017-10-06', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('ba67f90d-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:02:50', '2019-12-26 15:02:50', NULL, 'ABP-874', '僕とみおんの異世界性活 最強セクシー装備でエロさ限界突破！！！ 園田みおん', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-07-05 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('cbcc2a9b-27ae-11ea-a75d-00155d012d1c', '2019-12-26 15:10:29', '2019-12-26 15:10:29', NULL, 'ABP-871', '1VS1【※演技一切無し】本能剥き出しタイマン4本番 ACT.16 台本演出一切無し、只々貪り合う1対1のSEX…女優の本音と女優の本気見せます。 河合あすな', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2019-06-28 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('cd64f0c5-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:20', '2019-12-27 15:09:20', NULL, 'ABP-648', '超高級裏スパ癒らしぃサロン 01 癒らし隠語×極上エスコートSEX 長谷川るい', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2017-10-13', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('cf2ece38-27c0-11ea-b031-00155d012d1c', '2019-12-26 17:19:25', '2019-12-26 17:19:25', NULL, 'ABP-777', '絶対的鉄板シチュエーション 13 完全主観！！！河合あすなが贈るとてもHな3シチュエーション', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2018-09-28 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('cfdc336c-2877-11ea-a299-00155d012d1c', '2019-12-27 15:09:24', '2019-12-27 15:09:24', NULL, 'ABP-649', '1VS1【※演技一切無し】本能剥き出しタイマン4本番 ACT.09 ひなた澪', '', '', '', '', '', '', '', '', '1', '1', '1', 'プレステージ', '', '', '2D', '', '', '', '', '2017-10-13', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('def46531-27c8-11ea-9df2-00155d012d1c', '2019-12-26 18:17:08', '2019-12-26 18:17:08', NULL, 'SSNI-644', '【※異常なる大絶頂】エロス最大覚醒！性欲が尽き果てるまで怒涛のノンストップ本気性交 三上悠亜', '', '', '', '', '', '', '', '', '1', '1', '1', 'エスワン ナンバーワンスタイル', '', '', '2D', '', '', '', '', '2019-12-14 00:00:00 +0000 UTC', '', '', '', 0);
INSERT INTO `dhash_videos` VALUES ('fa6539dc-27ad-11ea-b37a-00155d012d1c', '2019-12-26 15:04:37', '2019-12-26 15:04:37', NULL, 'SNIS-647', '24時間、朝から晩まで快感が止まらないお漏らしみたいな潮漏らし性交 北川ゆず', '', '', '', '', '', '', '', '', '1', '1', '1', 'エスワンナンバーワンスタイル', '', '', '2D', '', '', '', '', '2016-04-16 00:00:00 +0000 UTC', '', '', '', 0);

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of files
-- ----------------------------
INSERT INTO `files` VALUES (15, 'a99d631c-207a-4833-ba10-f4f91352b2bb.zip', '9.0 MB', 'architectui-vue-free-theme.zip', '2019-12-31 09:44:40', '2019-12-31 09:44:40');
INSERT INTO `files` VALUES (16, '0816a8dc-745d-455a-874f-fadf3c5772d7.iso', '2.0 GB', 'ubuntu-18.10-desktop-amd64.iso', '2020-01-01 06:41:04', '2020-01-01 06:41:04');
INSERT INTO `files` VALUES (17, '40da7d00-903a-415d-9cdc-632f9811d969.ISO', '1.1 GB', 'bbbc', '2020-01-01 06:41:48', '2020-01-01 06:41:48');

-- ----------------------------
-- Table structure for nodes
-- ----------------------------
DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sync` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `node_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `node_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `node_status` int(8) UNSIGNED NOT NULL,
  `node_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `interval` int(8) UNSIGNED NOT NULL DEFAULT 3,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nodes
-- ----------------------------
INSERT INTO `nodes` VALUES (5, 1, '', 'abnormal', 0, '/ip4/127.0.0.1/tcp/5001', 3, '2019-12-24 07:52:08', '2019-12-31 08:25:25');
INSERT INTO `nodes` VALUES (6, 2, '', 'QmaCidjpHqP2p71fTT6B1gGzeHxR5KFQxVRbpaGv9hGRoA', 1, '/ip4/192.168.1.146/tcp/15006', 3, '2019-12-24 08:05:41', '2020-01-01 06:39:48');
INSERT INTO `nodes` VALUES (7, 1, '', 'QmXNZRTd54Zvarf4sswVvUUnpb4gPQNAhFViozVgG8uwri', 1, '/ip4/192.168.1.13/tcp/15001', 3, '2019-12-24 08:05:52', '2020-01-01 06:39:43');

-- ----------------------------
-- Table structure for uploads
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` tinyint(4) NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3633 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3133, 'voluptatum', 0, 'West Dorrischester', '130.24.131.165', '(291)462-9', '2008-10-12 07:44:28', '2003-10-16 23:40:41');
INSERT INTO `users` VALUES (3134, 'quaerat', 0, 'Mantefurt', '18.206.108.141', '1-170-439-', '2017-01-05 23:01:17', '2006-10-09 16:31:23');
INSERT INTO `users` VALUES (3135, 'quibusdam', 0, 'Altafurt', '89.162.78.57', '017-065-51', '1988-11-08 14:53:14', '2007-03-26 20:18:35');
INSERT INTO `users` VALUES (3136, 'molestias', 0, 'East Jadontown', '131.25.27.144', '+92(7)3113', '2014-01-23 15:56:15', '1986-06-19 20:37:54');
INSERT INTO `users` VALUES (3137, 'incidunt', 0, 'Angelville', '90.255.113.150', '1-881-209-', '1989-02-17 23:59:30', '1970-12-05 20:00:04');
INSERT INTO `users` VALUES (3138, 'exercitationem', 0, 'Mrazport', '112.152.108.62', '(101)591-1', '1995-04-18 15:32:08', '1989-07-06 17:23:48');
INSERT INTO `users` VALUES (3139, 'cumque', 0, 'South Carsonborough', '56.70.126.83', '687-792-49', '2004-09-09 12:22:21', '1994-05-17 16:53:50');
INSERT INTO `users` VALUES (3140, 'ab', 0, 'New Abigaylemouth', '180.66.161.219', '121.009.26', '1993-07-16 16:40:39', '1985-04-27 19:02:24');
INSERT INTO `users` VALUES (3141, 'numquam', 0, 'Port Polly', '118.115.157.126', '764.875.85', '1998-11-04 17:36:16', '2003-06-16 00:32:30');
INSERT INTO `users` VALUES (3142, 'ratione', 0, 'East Madelynn', '124.144.175.243', '446.459.77', '1980-10-31 12:09:14', '2000-08-28 21:10:47');
INSERT INTO `users` VALUES (3143, 'repellat', 0, 'Lake Aliza', '69.66.247.238', '1-514-720-', '1981-07-11 13:57:15', '1982-11-16 19:31:11');
INSERT INTO `users` VALUES (3144, 'unde', 0, 'Claudechester', '80.187.230.130', '371-412-97', '1973-01-22 17:32:51', '1985-10-16 07:15:04');
INSERT INTO `users` VALUES (3145, 'dolores', 0, 'East Candida', '89.169.15.90', '591.507.13', '1991-05-05 21:02:27', '1985-10-09 18:49:14');
INSERT INTO `users` VALUES (3146, 'laudantium', 0, 'Harrisstad', '51.29.100.162', '668-521-48', '1981-09-12 04:20:41', '1994-05-09 03:32:30');
INSERT INTO `users` VALUES (3147, 'iure', 0, 'Kingbury', '99.13.130.67', '(670)383-5', '1996-10-03 14:10:37', '1993-04-25 20:38:23');
INSERT INTO `users` VALUES (3148, 'numquam', 0, 'Sanfordville', '89.174.176.217', '015-350-08', '2010-07-15 20:25:56', '1990-04-21 13:27:30');
INSERT INTO `users` VALUES (3149, 'alias', 0, 'New Jacquelynmouth', '176.202.145.52', '670.430.97', '2000-06-07 07:57:30', '2015-06-06 08:57:47');
INSERT INTO `users` VALUES (3150, 'expedita', 0, 'Lake Hilbert', '96.21.195.51', '(534)858-3', '2012-11-07 10:02:02', '2002-04-08 21:41:02');
INSERT INTO `users` VALUES (3151, 'quis', 0, 'Lake Neal', '89.152.227.200', '+07(9)3192', '1990-10-22 15:41:12', '2013-06-22 09:51:23');
INSERT INTO `users` VALUES (3152, 'id', 0, 'Port Laurence', '45.24.206.89', '270-153-13', '2013-03-28 06:34:44', '2012-12-25 08:49:40');
INSERT INTO `users` VALUES (3153, 'ea', 0, 'Cummingsmouth', '119.31.3.235', '628-176-55', '2008-12-25 21:07:18', '1987-03-04 14:45:37');
INSERT INTO `users` VALUES (3154, 'sapiente', 0, 'West Joaquin', '203.137.34.242', '034.848.48', '2010-03-10 04:23:48', '1974-02-27 01:52:51');
INSERT INTO `users` VALUES (3155, 'blanditiis', 0, 'Port Logan', '247.71.235.180', '1-354-533-', '2010-03-12 00:22:42', '2007-08-22 08:52:34');
INSERT INTO `users` VALUES (3156, 'laborum', 0, 'North Odie', '184.185.248.33', '(349)149-5', '1993-12-23 09:54:44', '1990-11-07 05:09:54');
INSERT INTO `users` VALUES (3157, 'sit', 0, 'Port Brook', '254.154.238.177', '1-028-949-', '1997-11-18 14:26:34', '1992-07-22 16:48:00');
INSERT INTO `users` VALUES (3158, 'assumenda', 0, 'East Mackenzie', '204.158.130.66', '(160)960-2', '1981-10-11 07:31:53', '1984-01-23 14:16:56');
INSERT INTO `users` VALUES (3159, 'quisquam', 0, 'Bashirianburgh', '153.180.29.168', '371-305-81', '2009-02-15 00:27:53', '2005-06-29 12:23:04');
INSERT INTO `users` VALUES (3160, 'sed', 0, 'New Donny', '118.254.120.78', '1-685-501-', '1980-05-23 09:06:18', '1974-09-02 22:40:54');
INSERT INTO `users` VALUES (3161, 'ut', 0, 'South Krisville', '5.98.220.210', '639.996.18', '1977-08-06 01:42:41', '1994-10-30 13:59:51');
INSERT INTO `users` VALUES (3162, 'cumque', 0, 'North Emmanuel', '39.91.220.233', '(168)144-2', '1974-03-22 07:17:19', '1994-08-04 06:33:55');
INSERT INTO `users` VALUES (3163, 'dolorem', 0, 'New Noel', '180.17.202.66', '+06(8)8657', '1978-02-06 09:30:14', '2005-03-31 17:13:48');
INSERT INTO `users` VALUES (3164, 'sunt', 0, 'Strosinchester', '41.78.165.138', '(749)823-5', '1985-12-25 15:40:37', '2003-01-25 09:21:52');
INSERT INTO `users` VALUES (3165, 'rerum', 0, 'West Leatha', '51.234.111.252', '(455)407-9', '2017-02-06 23:59:34', '2004-02-10 12:17:41');
INSERT INTO `users` VALUES (3166, 'aut', 0, 'West Nels', '114.157.77.105', '570-533-99', '1983-09-23 12:47:53', '2004-03-08 06:57:28');
INSERT INTO `users` VALUES (3167, 'eos', 0, 'Janland', '190.148.202.0', '267-198-73', '1974-08-12 15:23:43', '1984-06-17 08:04:48');
INSERT INTO `users` VALUES (3168, 'omnis', 0, 'Nitzscheburgh', '94.253.229.243', '056.325.16', '2007-02-19 03:02:05', '1977-11-24 10:53:20');
INSERT INTO `users` VALUES (3169, 'quae', 0, 'Gustfurt', '11.246.22.247', '972-910-38', '1985-02-01 23:31:23', '1989-08-17 05:57:51');
INSERT INTO `users` VALUES (3170, 'facere', 0, 'Heathcoteburgh', '104.70.84.237', '234.144.01', '1978-05-28 17:06:56', '2009-06-23 00:34:41');
INSERT INTO `users` VALUES (3171, 'eligendi', 0, 'New Candice', '185.172.87.32', '1-990-977-', '1994-01-24 17:04:22', '1990-03-14 20:10:48');
INSERT INTO `users` VALUES (3172, 'autem', 0, 'New Martymouth', '218.85.247.31', '0213109440', '1992-08-23 07:34:29', '1991-05-23 02:26:46');
INSERT INTO `users` VALUES (3173, 'velit', 0, 'North Chadd', '152.4.77.210', '1-977-024-', '2018-05-12 19:40:30', '1996-06-24 00:43:49');
INSERT INTO `users` VALUES (3174, 'voluptatem', 0, 'Emardland', '12.36.43.98', '1-504-175-', '2018-08-26 09:42:55', '1984-11-20 08:11:22');
INSERT INTO `users` VALUES (3175, 'sunt', 0, 'West Myrna', '212.40.77.247', '0142702071', '1987-01-26 19:14:35', '1998-09-02 19:16:30');
INSERT INTO `users` VALUES (3176, 'minus', 0, 'Gennaroton', '220.16.78.177', '661.478.49', '1999-11-02 21:00:18', '2018-07-26 06:23:23');
INSERT INTO `users` VALUES (3177, 'eum', 0, 'Mervinmouth', '39.68.16.110', '514-868-17', '2016-07-18 15:08:34', '1988-04-11 18:14:53');
INSERT INTO `users` VALUES (3178, 'et', 0, 'Port Natalieton', '29.13.164.161', '+20(9)5254', '2000-04-22 21:43:23', '1986-06-13 03:01:07');
INSERT INTO `users` VALUES (3179, 'ipsam', 0, 'North Rettaview', '65.174.146.78', '+19(5)5639', '1993-02-07 05:41:54', '1991-04-26 01:48:31');
INSERT INTO `users` VALUES (3180, 'adipisci', 0, 'Conroyfurt', '49.211.166.251', '376.870.27', '2000-04-04 06:18:45', '1999-08-12 18:49:47');
INSERT INTO `users` VALUES (3181, 'qui', 0, 'East Terryburgh', '201.237.10.151', '(682)499-4', '1974-12-27 16:39:14', '1978-03-27 05:36:35');
INSERT INTO `users` VALUES (3182, 'aliquam', 0, 'North Darion', '123.110.173.222', '(386)536-3', '1989-07-26 23:33:27', '2007-03-10 19:38:38');
INSERT INTO `users` VALUES (3183, 'blanditiis', 0, 'Shanelshire', '161.173.251.134', '693.628.85', '2011-04-19 13:27:17', '2000-06-27 07:32:56');
INSERT INTO `users` VALUES (3184, 'provident', 0, 'South Amie', '157.222.23.146', '(941)805-3', '1983-05-21 22:14:39', '1974-08-13 07:59:23');
INSERT INTO `users` VALUES (3185, 'et', 0, 'New Ryleeville', '60.133.158.102', '238.375.46', '1981-05-23 07:26:35', '2018-05-16 09:31:50');
INSERT INTO `users` VALUES (3186, 'rem', 0, 'Krajcikview', '254.68.144.153', '113.589.44', '2012-02-21 21:23:56', '2017-11-11 18:05:11');
INSERT INTO `users` VALUES (3187, 'officia', 0, 'Port Cruz', '5.23.112.130', '481.895.97', '2002-06-26 19:07:28', '1970-12-27 13:47:14');
INSERT INTO `users` VALUES (3188, 'sit', 0, 'New Brooklyntown', '75.170.89.171', '+21(7)5136', '1995-07-01 21:01:08', '2005-02-24 14:01:38');
INSERT INTO `users` VALUES (3189, 'error', 0, 'Lutherfort', '78.141.190.96', '+25(3)1840', '1984-01-20 15:11:23', '2016-09-18 14:55:22');
INSERT INTO `users` VALUES (3190, 'est', 0, 'Linneamouth', '117.182.29.64', '+32(6)9290', '1998-10-13 05:51:01', '1993-04-20 07:28:18');
INSERT INTO `users` VALUES (3191, 'molestias', 0, 'Miashire', '160.3.34.22', '408.583.99', '1978-11-12 14:23:51', '1989-05-01 09:34:51');
INSERT INTO `users` VALUES (3192, 'dolorem', 0, 'Nathaven', '30.142.214.7', '1-015-611-', '1993-02-25 17:21:00', '2006-08-03 07:06:04');
INSERT INTO `users` VALUES (3193, 'voluptatem', 0, 'Clintonberg', '155.218.87.29', '+36(1)8939', '1998-09-14 21:54:13', '1977-11-23 07:50:55');
INSERT INTO `users` VALUES (3194, 'cum', 0, 'Billiemouth', '184.218.96.17', '602-921-61', '1988-08-13 12:19:16', '2001-08-02 09:43:17');
INSERT INTO `users` VALUES (3195, 'et', 0, 'West Trevor', '134.173.224.149', '1-654-522-', '2017-02-08 08:50:11', '1994-02-25 02:45:06');
INSERT INTO `users` VALUES (3196, 'voluptate', 0, 'Port Muhammad', '101.162.1.247', '1-469-725-', '2007-05-31 21:55:19', '1983-02-02 07:16:01');
INSERT INTO `users` VALUES (3197, 'ut', 0, 'North Tomasa', '34.50.218.169', '1-254-394-', '1998-12-01 09:58:54', '1975-02-07 01:59:00');
INSERT INTO `users` VALUES (3198, 'sed', 0, 'Hillaryport', '120.212.199.52', '1-926-573-', '2016-07-29 19:03:12', '2008-09-10 13:04:44');
INSERT INTO `users` VALUES (3199, 'magni', 0, 'Sebastianshire', '177.94.144.118', '627-932-50', '1973-11-10 20:24:51', '2017-10-08 23:29:45');
INSERT INTO `users` VALUES (3200, 'aliquid', 0, 'South Ellis', '224.211.29.87', '(493)204-8', '1975-03-25 03:58:01', '1990-07-28 11:14:30');
INSERT INTO `users` VALUES (3201, 'omnis', 0, 'Anabelstad', '92.249.88.62', '(978)197-9', '2009-01-01 18:00:34', '2014-10-16 11:54:54');
INSERT INTO `users` VALUES (3202, 'numquam', 0, 'South Ronmouth', '169.106.168.28', '392-241-92', '1978-12-18 04:09:47', '1992-08-30 11:20:23');
INSERT INTO `users` VALUES (3203, 'dolores', 0, 'Lake Benjamin', '15.117.69.132', '251.485.93', '2018-08-28 16:39:31', '2011-07-06 04:53:46');
INSERT INTO `users` VALUES (3204, 'deserunt', 0, 'Emersonmouth', '66.51.232.79', '1-447-734-', '2002-11-30 12:44:53', '1975-05-16 18:37:48');
INSERT INTO `users` VALUES (3205, 'ut', 0, 'Spinkamouth', '244.43.102.248', '1-000-780-', '2014-04-07 13:41:12', '1989-05-30 18:40:16');
INSERT INTO `users` VALUES (3206, 'qui', 0, 'South Kristopherhaven', '246.92.42.67', '1-484-350-', '2006-06-23 16:52:48', '2003-12-02 16:52:52');
INSERT INTO `users` VALUES (3207, 'culpa', 0, 'Port Kaitlin', '137.7.62.226', '(970)422-8', '1979-11-03 20:39:44', '2008-09-19 21:25:57');
INSERT INTO `users` VALUES (3208, 'assumenda', 0, 'Brittanystad', '112.235.56.1', '1-140-282-', '1992-03-29 10:34:11', '1987-10-13 16:36:42');
INSERT INTO `users` VALUES (3209, 'tempora', 0, 'West Madisenbury', '252.216.155.148', '0364798286', '1977-07-19 04:38:56', '1990-02-12 06:56:49');
INSERT INTO `users` VALUES (3210, 'voluptas', 0, 'Lake Eugenestad', '159.105.105.253', '(687)489-4', '1983-02-04 14:30:46', '2015-11-11 17:30:31');
INSERT INTO `users` VALUES (3211, 'animi', 0, 'Gradymouth', '234.240.244.211', '0732322239', '2010-05-25 02:06:51', '1994-01-31 02:15:34');
INSERT INTO `users` VALUES (3212, 'sunt', 0, 'Port Catharine', '170.237.211.55', '262.806.58', '1975-10-13 05:49:59', '1973-09-14 21:04:22');
INSERT INTO `users` VALUES (3213, 'aspernatur', 0, 'North Paolo', '67.211.135.138', '(620)698-7', '1990-12-12 18:58:51', '2018-06-06 04:54:08');
INSERT INTO `users` VALUES (3214, 'blanditiis', 0, 'Adamouth', '157.101.158.128', '110-851-48', '1997-03-01 04:50:56', '1990-05-13 20:20:15');
INSERT INTO `users` VALUES (3215, 'aut', 0, 'Maribelburgh', '214.169.56.47', '219-930-75', '1993-06-16 00:21:23', '1982-01-22 04:54:59');
INSERT INTO `users` VALUES (3216, 'voluptatibus', 0, 'Lake Tiannaberg', '123.67.227.100', '397.747.22', '2014-01-27 12:53:19', '2006-06-26 14:45:55');
INSERT INTO `users` VALUES (3217, 'architecto', 0, 'Beverlystad', '104.35.135.41', '1-856-949-', '2004-11-10 07:30:30', '2000-04-30 05:34:03');
INSERT INTO `users` VALUES (3218, 'perspiciatis', 0, 'New Dejahfurt', '248.150.222.9', '754.322.73', '1993-09-14 09:32:03', '2002-01-09 16:50:17');
INSERT INTO `users` VALUES (3219, 'repellat', 0, 'New Humberto', '103.130.113.37', '866.129.48', '1985-05-01 06:16:30', '1996-11-03 06:40:02');
INSERT INTO `users` VALUES (3220, 'consequuntur', 0, 'Friesenmouth', '119.247.58.87', '955-141-06', '1976-03-20 14:24:07', '1998-11-24 08:35:53');
INSERT INTO `users` VALUES (3221, 'voluptas', 0, 'Ornfort', '120.132.216.182', '(589)854-2', '1988-04-18 11:20:40', '1992-02-26 18:57:32');
INSERT INTO `users` VALUES (3222, 'laudantium', 0, 'South Darrell', '94.253.191.196', '343-005-11', '1980-05-23 23:38:00', '2000-02-20 03:24:03');
INSERT INTO `users` VALUES (3223, 'ut', 0, 'Kaiafort', '212.3.22.162', '1-552-220-', '1970-05-19 08:31:38', '1998-11-01 09:55:05');
INSERT INTO `users` VALUES (3224, 'rerum', 0, 'Quitzonview', '19.97.140.221', '348.900.22', '2003-12-24 17:54:42', '1970-02-03 17:36:52');
INSERT INTO `users` VALUES (3225, 'qui', 0, 'New Marcelle', '48.29.124.108', '1-524-833-', '1976-09-27 18:40:44', '1993-03-05 23:57:54');
INSERT INTO `users` VALUES (3226, 'autem', 0, 'Lake Carolineborough', '243.186.200.110', '485-310-14', '1998-06-23 22:09:28', '1987-05-01 07:29:39');
INSERT INTO `users` VALUES (3227, 'quas', 0, 'Marshallmouth', '188.233.129.117', '1-200-909-', '2011-07-18 19:31:07', '1993-12-17 23:25:30');
INSERT INTO `users` VALUES (3228, 'ab', 0, 'Lake Staceyhaven', '23.48.214.152', '0788802278', '2003-04-03 18:06:42', '2007-12-19 05:02:45');
INSERT INTO `users` VALUES (3229, 'ipsa', 0, 'Kreigerborough', '40.12.123.51', '+77(3)1104', '1997-12-07 21:03:32', '2017-05-22 09:25:19');
INSERT INTO `users` VALUES (3230, 'sit', 0, 'New Idellatown', '124.93.199.84', '682.372.57', '1985-09-21 20:35:22', '1981-12-01 18:28:11');
INSERT INTO `users` VALUES (3231, 'quis', 0, 'Doyleburgh', '115.32.241.190', '530-811-53', '1985-08-03 02:36:05', '2007-08-05 11:37:00');
INSERT INTO `users` VALUES (3232, 'explicabo', 0, 'Carrollland', '239.130.251.156', '606-189-58', '1975-05-11 20:23:26', '2004-08-23 10:18:05');
INSERT INTO `users` VALUES (3233, 'quas', 0, 'Dorotheamouth', '65.227.95.202', '1-120-101-', '1980-08-28 22:15:44', '1977-05-04 14:41:36');
INSERT INTO `users` VALUES (3234, 'tenetur', 0, 'New Alia', '199.166.74.233', '1-572-838-', '1998-05-01 13:15:57', '1970-11-11 23:53:42');
INSERT INTO `users` VALUES (3235, 'quia', 0, 'Lloydchester', '218.151.232.131', '373-827-78', '1990-06-26 20:36:08', '1974-01-23 10:11:30');
INSERT INTO `users` VALUES (3236, 'at', 0, 'Port Lavina', '142.20.99.100', '1-143-840-', '2013-08-16 10:26:08', '1992-08-12 10:21:22');
INSERT INTO `users` VALUES (3237, 'molestias', 0, 'Lake Abigail', '94.251.47.14', '1-447-916-', '1989-01-06 00:47:25', '2017-03-27 18:34:24');
INSERT INTO `users` VALUES (3238, 'sed', 0, 'East Osvaldo', '216.134.64.85', '042-252-27', '2005-05-18 01:08:48', '1993-03-08 21:51:34');
INSERT INTO `users` VALUES (3239, 'culpa', 0, 'West Isai', '72.31.156.203', '163.371.96', '2012-03-03 13:45:16', '1973-06-12 11:43:50');
INSERT INTO `users` VALUES (3240, 'facere', 0, 'Hyattborough', '51.104.88.26', '231.377.24', '1970-08-07 22:22:07', '1983-01-26 07:57:25');
INSERT INTO `users` VALUES (3241, 'fugit', 0, 'New Liza', '27.112.133.177', '904-573-87', '2013-10-04 05:06:22', '2007-07-16 18:29:25');
INSERT INTO `users` VALUES (3242, 'neque', 0, 'East Danielle', '157.168.24.24', '+94(7)1774', '1988-05-10 04:14:27', '1993-02-08 06:47:36');
INSERT INTO `users` VALUES (3243, 'quia', 0, 'O\'Keefeview', '70.50.30.180', '0164718145', '1974-04-24 16:33:59', '2005-01-18 07:29:15');
INSERT INTO `users` VALUES (3244, 'numquam', 0, 'Michaelabury', '53.71.3.102', '0299837132', '1978-01-15 11:37:22', '1977-08-09 14:57:12');
INSERT INTO `users` VALUES (3245, 'totam', 0, 'Robelchester', '114.111.34.155', '(280)920-4', '1988-06-18 07:07:36', '1976-05-04 06:53:23');
INSERT INTO `users` VALUES (3246, 'cum', 0, 'West Christelle', '204.179.105.65', '1-723-954-', '1970-10-07 18:47:12', '2001-06-10 00:11:35');
INSERT INTO `users` VALUES (3247, 'et', 0, 'Lake Gordonview', '134.37.138.46', '571.023.03', '1986-04-18 15:35:11', '1999-06-26 14:06:40');
INSERT INTO `users` VALUES (3248, 'repudiandae', 0, 'Osinskiview', '203.98.66.29', '918.083.62', '1988-07-11 12:47:08', '2007-02-05 08:33:42');
INSERT INTO `users` VALUES (3249, 'sit', 0, 'Danielborough', '142.3.154.246', '639-854-16', '1996-09-27 10:01:56', '1978-10-20 16:19:40');
INSERT INTO `users` VALUES (3250, 'quas', 0, 'Caylaport', '39.59.16.140', '1-525-084-', '2010-09-08 21:26:03', '2012-12-31 06:40:44');
INSERT INTO `users` VALUES (3251, 'vel', 0, 'New Rachel', '12.204.98.52', '452-152-05', '1997-12-25 22:59:17', '1973-02-10 23:01:57');
INSERT INTO `users` VALUES (3252, 'dolorem', 0, 'Percytown', '210.106.182.152', '535.053.16', '1993-08-24 20:35:26', '1991-06-07 15:41:42');
INSERT INTO `users` VALUES (3253, 'beatae', 0, 'Port Giuseppe', '129.103.117.240', '0746314959', '2006-01-08 13:12:12', '1987-10-19 15:52:16');
INSERT INTO `users` VALUES (3254, 'laborum', 0, 'Emilemouth', '143.250.182.10', '208-474-67', '1996-04-27 11:59:12', '1972-03-09 01:05:51');
INSERT INTO `users` VALUES (3255, 'qui', 0, 'Bretfurt', '14.228.86.173', '1-731-969-', '1993-03-02 16:38:18', '1971-11-29 06:11:51');
INSERT INTO `users` VALUES (3256, 'molestiae', 0, 'Mrazstad', '154.250.62.124', '1-042-000-', '1988-02-27 03:26:38', '1984-10-22 16:47:53');
INSERT INTO `users` VALUES (3257, 'dolor', 0, 'Arthurport', '78.31.73.49', '(497)571-6', '2013-10-15 15:07:52', '2009-08-05 19:22:08');
INSERT INTO `users` VALUES (3258, 'natus', 0, 'New Llewellynmouth', '107.103.145.191', '0075365037', '1976-11-15 13:53:37', '2017-06-19 09:05:35');
INSERT INTO `users` VALUES (3259, 'deleniti', 0, 'Port Brianaville', '40.238.246.238', '738.597.92', '1979-05-09 05:38:34', '1974-05-01 17:33:26');
INSERT INTO `users` VALUES (3260, 'perferendis', 0, 'Fernland', '251.122.97.250', '016.802.84', '1990-10-29 06:42:36', '1970-06-05 08:36:08');
INSERT INTO `users` VALUES (3261, 'enim', 0, 'West Corene', '11.230.216.91', '046.245.06', '2000-12-16 10:42:36', '1989-03-12 13:04:43');
INSERT INTO `users` VALUES (3262, 'temporibus', 0, 'Lake Jeffrey', '17.215.181.158', '1-718-572-', '1980-03-20 21:19:02', '1985-09-21 11:37:23');
INSERT INTO `users` VALUES (3263, 'dolores', 0, 'Padbergfort', '234.57.125.133', '1-038-626-', '1975-02-04 17:12:59', '2009-05-25 09:34:47');
INSERT INTO `users` VALUES (3264, 'voluptate', 0, 'Summerburgh', '55.53.167.232', '+27(1)0912', '2012-02-08 11:03:26', '2006-10-04 17:03:42');
INSERT INTO `users` VALUES (3265, 'eos', 0, 'Skyemouth', '24.109.190.206', '1-273-659-', '2012-05-11 13:48:41', '1993-12-10 11:35:07');
INSERT INTO `users` VALUES (3266, 'est', 0, 'Lake Cielo', '76.61.195.147', '839.836.78', '1995-02-28 10:50:55', '2012-03-29 02:52:38');
INSERT INTO `users` VALUES (3267, 'est', 0, 'East Olechester', '140.144.31.250', '(072)173-9', '1980-08-02 02:39:16', '2005-01-29 08:04:23');
INSERT INTO `users` VALUES (3268, 'quis', 0, 'West Rene', '66.121.42.158', '1-891-088-', '1995-07-21 03:09:30', '1978-01-19 17:11:51');
INSERT INTO `users` VALUES (3269, 'aut', 0, 'Watersbury', '180.149.56.224', '0132323569', '1985-01-05 08:22:29', '1975-01-02 09:25:47');
INSERT INTO `users` VALUES (3270, 'minus', 0, 'Croninville', '78.153.241.182', '113-876-42', '1987-04-28 22:14:14', '1987-06-13 05:37:25');
INSERT INTO `users` VALUES (3271, 'amet', 0, 'Hayesview', '14.255.29.7', '(480)071-6', '1973-02-14 13:59:43', '1980-11-28 03:07:03');
INSERT INTO `users` VALUES (3272, 'non', 0, 'North Norbertmouth', '44.237.148.54', '+28(7)8548', '1983-08-27 15:51:14', '2013-08-01 03:44:26');
INSERT INTO `users` VALUES (3273, 'voluptatem', 0, 'Elinorebury', '42.239.180.52', '(279)289-4', '1984-01-03 20:46:25', '1984-07-14 12:20:20');
INSERT INTO `users` VALUES (3274, 'odit', 0, 'North Brendentown', '115.178.183.225', '(145)183-4', '1988-01-06 19:47:57', '1977-01-23 12:25:03');
INSERT INTO `users` VALUES (3275, 'molestiae', 0, 'Hansenstad', '85.207.66.119', '+23(8)9011', '2014-11-10 01:15:34', '1992-01-24 19:05:03');
INSERT INTO `users` VALUES (3276, 'adipisci', 0, 'New Ron', '52.90.66.94', '(501)958-2', '1976-06-14 10:34:29', '1984-12-01 18:02:17');
INSERT INTO `users` VALUES (3277, 'voluptatem', 0, 'North Austyn', '41.118.67.2', '565-395-66', '2009-06-11 17:22:55', '2006-02-28 04:49:27');
INSERT INTO `users` VALUES (3278, 'porro', 0, 'North Eugenia', '172.19.220.43', '+43(9)2323', '1990-09-18 08:30:43', '2003-05-20 06:45:14');
INSERT INTO `users` VALUES (3279, 'eveniet', 0, 'Tremblaychester', '16.139.58.116', '354-802-19', '2000-12-16 04:29:23', '1970-08-23 10:56:50');
INSERT INTO `users` VALUES (3280, 'nemo', 0, 'North Claud', '68.109.169.232', '993-618-69', '2005-09-13 21:58:46', '1982-05-22 16:22:05');
INSERT INTO `users` VALUES (3281, 'optio', 0, 'East Daynafurt', '199.126.239.157', '(161)507-0', '1987-10-05 06:01:41', '1971-04-01 15:46:45');
INSERT INTO `users` VALUES (3282, 'non', 0, 'Mohrview', '176.72.193.165', '1-452-832-', '2001-07-31 20:47:45', '2001-06-18 13:22:54');
INSERT INTO `users` VALUES (3283, 'ipsa', 0, 'Grantmouth', '154.46.131.92', '785.891.89', '1996-08-30 22:52:09', '1978-02-10 17:19:32');
INSERT INTO `users` VALUES (3284, 'explicabo', 0, 'Runolfsdottirport', '92.24.234.110', '302-548-56', '1991-05-01 18:18:48', '2001-11-21 04:01:59');
INSERT INTO `users` VALUES (3285, 'quae', 0, 'Roweside', '73.125.108.199', '(343)336-7', '2011-10-20 04:34:26', '2003-12-03 15:08:59');
INSERT INTO `users` VALUES (3286, 'magnam', 0, 'Gradybury', '11.113.172.42', '546-620-43', '1990-10-04 05:56:00', '2009-04-11 09:28:48');
INSERT INTO `users` VALUES (3287, 'qui', 0, 'West Kirstenburgh', '39.255.13.136', '1-145-939-', '1997-11-21 21:44:09', '1979-07-03 22:04:22');
INSERT INTO `users` VALUES (3288, 'ullam', 0, 'East Karolann', '166.98.203.245', '095.456.62', '1987-02-03 19:50:24', '1974-05-25 19:03:17');
INSERT INTO `users` VALUES (3289, 'quibusdam', 0, 'North Deion', '172.163.182.72', '599.675.65', '2013-03-21 01:44:08', '1997-06-12 02:34:03');
INSERT INTO `users` VALUES (3290, 'magni', 0, 'Port Abigayleville', '79.3.120.110', '088-721-76', '1997-05-22 03:44:56', '2014-09-05 13:54:58');
INSERT INTO `users` VALUES (3291, 'et', 0, 'East Marshallborough', '5.14.226.39', '(304)041-1', '1991-10-05 02:11:16', '1990-01-02 23:47:07');
INSERT INTO `users` VALUES (3292, 'porro', 0, 'Nettiemouth', '65.89.200.237', '165-275-88', '1974-07-29 15:10:07', '1984-05-07 22:06:01');
INSERT INTO `users` VALUES (3293, 'repellat', 0, 'West Scarlett', '140.3.204.8', '+03(0)7694', '1994-03-26 14:25:08', '1979-04-22 05:33:07');
INSERT INTO `users` VALUES (3294, 'fugiat', 0, 'Brantview', '70.42.16.240', '1-627-965-', '1981-06-15 10:31:13', '2016-11-28 09:05:45');
INSERT INTO `users` VALUES (3295, 'quos', 0, 'North Viola', '245.23.181.139', '(623)093-8', '2010-03-04 14:33:49', '2015-12-22 06:38:12');
INSERT INTO `users` VALUES (3296, 'similique', 0, 'West Freeda', '165.100.134.76', '841-951-12', '2000-09-05 04:27:16', '1980-07-12 02:20:34');
INSERT INTO `users` VALUES (3297, 'eum', 0, 'Port Jeanette', '136.228.82.230', '(013)986-0', '2003-01-30 13:02:32', '1999-01-08 06:05:00');
INSERT INTO `users` VALUES (3298, 'veniam', 0, 'Ashleighfort', '16.31.170.207', '964.454.63', '1983-11-15 18:58:05', '1983-10-23 20:22:25');
INSERT INTO `users` VALUES (3299, 'cupiditate', 0, 'Port Juston', '146.119.149.248', '0734846430', '1974-06-29 14:17:06', '1971-08-08 21:44:59');
INSERT INTO `users` VALUES (3300, 'quod', 0, 'Terrenceport', '54.210.9.45', '+59(9)9140', '2018-02-18 20:10:33', '2008-04-13 08:39:19');
INSERT INTO `users` VALUES (3301, 'ex', 0, 'Ashleechester', '234.218.28.254', '623-244-45', '2003-05-07 07:37:49', '1996-02-03 17:07:08');
INSERT INTO `users` VALUES (3302, 'vel', 0, 'Evangelineland', '222.163.8.132', '+86(8)0600', '1972-12-12 00:31:03', '2008-05-03 20:35:37');
INSERT INTO `users` VALUES (3303, 'accusamus', 0, 'New Cullenville', '151.245.215.38', '(192)022-7', '2000-07-18 04:16:58', '1977-07-12 17:08:53');
INSERT INTO `users` VALUES (3304, 'ab', 0, 'Handport', '173.42.123.176', '398-716-29', '2006-02-10 18:01:20', '1999-02-25 07:10:06');
INSERT INTO `users` VALUES (3305, 'et', 0, 'Port Johnnyhaven', '233.58.72.238', '1-074-069-', '2016-04-11 08:58:22', '1987-08-06 05:31:53');
INSERT INTO `users` VALUES (3306, 'aut', 0, 'Port Kelsishire', '147.70.218.123', '260-029-99', '2004-07-05 08:01:29', '1982-06-06 06:01:15');
INSERT INTO `users` VALUES (3307, 'veritatis', 0, 'Spinkastad', '182.226.141.49', '270.363.40', '1985-07-20 11:56:37', '2009-12-22 22:58:55');
INSERT INTO `users` VALUES (3308, 'veniam', 0, 'East Hassan', '14.13.221.154', '+02(5)2162', '2004-05-12 06:31:48', '1973-12-26 05:34:16');
INSERT INTO `users` VALUES (3309, 'quo', 0, 'North Obieville', '245.90.180.74', '586-215-19', '1997-08-08 03:46:36', '1980-09-04 01:28:01');
INSERT INTO `users` VALUES (3310, 'ut', 0, 'North Suzanne', '197.56.164.93', '610.891.48', '1990-08-05 07:21:55', '2007-09-25 00:10:24');
INSERT INTO `users` VALUES (3311, 'ut', 0, 'Westland', '142.134.38.159', '641-994-82', '1973-11-07 04:25:51', '1990-09-29 13:27:24');
INSERT INTO `users` VALUES (3312, 'ut', 0, 'West Leilani', '251.36.57.226', '(052)219-5', '2012-12-20 21:31:49', '2002-04-05 03:22:38');
INSERT INTO `users` VALUES (3313, 'ut', 0, 'Bryceland', '192.12.86.86', '(013)745-4', '2001-04-27 10:05:55', '1970-11-02 17:17:26');
INSERT INTO `users` VALUES (3314, 'nostrum', 0, 'South Jovanyside', '90.197.44.89', '1-045-832-', '2004-12-14 22:58:28', '2004-02-15 08:01:42');
INSERT INTO `users` VALUES (3315, 'exercitationem', 0, 'West Leathaside', '141.252.64.95', '1-522-974-', '1999-12-10 09:33:12', '1976-09-20 20:34:30');
INSERT INTO `users` VALUES (3316, 'exercitationem', 0, 'South Jonland', '62.250.195.67', '265-569-20', '2017-05-24 22:56:36', '1986-08-09 19:53:11');
INSERT INTO `users` VALUES (3317, 'nobis', 0, 'New Toyton', '243.101.86.254', '+70(9)9340', '1992-11-06 11:45:57', '1981-05-29 01:27:54');
INSERT INTO `users` VALUES (3318, 'facilis', 0, 'Lake Bartonside', '1.253.87.76', '1-143-393-', '2018-04-03 11:04:44', '2014-01-31 03:29:23');
INSERT INTO `users` VALUES (3319, 'tempore', 0, 'Stammborough', '36.1.224.234', '+10(7)3357', '1985-10-20 20:29:47', '2003-11-17 02:36:18');
INSERT INTO `users` VALUES (3320, 'reiciendis', 0, 'Mohrside', '167.173.146.87', '733-004-75', '2013-04-10 02:42:43', '1997-03-02 15:11:22');
INSERT INTO `users` VALUES (3321, 'voluptas', 0, 'Port Liliane', '74.158.177.169', '0688789370', '2007-05-30 21:17:16', '1971-09-25 18:26:07');
INSERT INTO `users` VALUES (3322, 'officia', 0, 'Ezraland', '25.244.7.6', '674.964.09', '1986-04-19 01:52:53', '1977-01-28 17:05:00');
INSERT INTO `users` VALUES (3323, 'sequi', 0, 'South Gerard', '133.239.163.94', '905-932-23', '2011-03-12 12:21:44', '2012-04-24 11:39:32');
INSERT INTO `users` VALUES (3324, 'omnis', 0, 'Ferryshire', '83.39.109.239', '(550)498-0', '1972-03-25 02:48:25', '1996-12-25 23:17:49');
INSERT INTO `users` VALUES (3325, 'incidunt', 0, 'Yvonneville', '6.51.97.92', '(852)117-3', '2005-04-07 01:38:06', '1989-08-28 17:43:09');
INSERT INTO `users` VALUES (3326, 'quae', 0, 'Port Jany', '16.61.225.139', '752.678.57', '2017-06-19 23:01:21', '1999-03-14 15:40:18');
INSERT INTO `users` VALUES (3327, 'et', 0, 'Lebsackbury', '26.234.18.201', '0175854263', '1979-07-02 16:16:53', '1998-11-09 18:48:22');
INSERT INTO `users` VALUES (3328, 'dolores', 0, 'Port Danmouth', '254.113.216.146', '1-084-837-', '1972-03-06 08:53:45', '2002-10-25 23:37:51');
INSERT INTO `users` VALUES (3329, 'beatae', 0, 'Nicolasbury', '235.116.36.67', '+64(6)8785', '1980-12-13 17:06:33', '1970-12-07 19:24:53');
INSERT INTO `users` VALUES (3330, 'occaecati', 0, 'Lake Alexabury', '34.197.115.212', '247.059.68', '1984-07-04 05:17:30', '2002-12-31 18:32:34');
INSERT INTO `users` VALUES (3331, 'quos', 0, 'New Jeradtown', '147.1.236.40', '801-831-21', '2014-01-25 10:56:11', '1985-12-18 08:32:13');
INSERT INTO `users` VALUES (3332, 'enim', 0, 'Port Laceyside', '190.178.98.127', '636-619-27', '2003-06-05 07:01:09', '1990-01-26 03:38:11');
INSERT INTO `users` VALUES (3333, 'sit', 0, 'Candelariostad', '193.93.52.117', '0567107317', '1996-02-03 23:34:20', '2014-05-31 08:22:54');
INSERT INTO `users` VALUES (3334, 'accusamus', 0, 'Saraistad', '146.160.14.143', '0341358792', '1995-11-12 21:05:56', '1970-10-31 16:49:23');
INSERT INTO `users` VALUES (3335, 'dolor', 0, 'Erdmanstad', '56.61.203.178', '1-786-102-', '2014-03-13 13:42:05', '1992-10-01 20:15:38');
INSERT INTO `users` VALUES (3336, 'unde', 0, 'Swiftfort', '25.237.104.211', '827-079-05', '1977-06-07 03:50:31', '1996-01-13 04:12:42');
INSERT INTO `users` VALUES (3337, 'temporibus', 0, 'East Alfonzoview', '97.59.85.100', '658-046-87', '1976-11-17 11:38:12', '2004-11-30 15:04:41');
INSERT INTO `users` VALUES (3338, 'quas', 0, 'East Mayaburgh', '158.31.115.89', '706.877.99', '2008-07-23 22:25:46', '1993-01-07 03:13:42');
INSERT INTO `users` VALUES (3339, 'soluta', 0, 'Port Johnathanbury', '161.124.68.210', '702-970-66', '1998-12-10 05:55:02', '1990-10-16 07:24:27');
INSERT INTO `users` VALUES (3340, 'aut', 0, 'Lednerview', '101.251.62.49', '1-091-626-', '1970-05-06 07:09:16', '1995-06-27 20:56:36');
INSERT INTO `users` VALUES (3341, 'itaque', 0, 'Tyresetown', '60.229.236.252', '015-633-24', '1973-10-17 03:48:22', '2013-11-10 19:20:45');
INSERT INTO `users` VALUES (3342, 'ut', 0, 'Bogisichborough', '60.115.32.101', '176.055.33', '1992-08-22 05:52:57', '2014-07-15 09:08:25');
INSERT INTO `users` VALUES (3343, 'velit', 0, 'South Gloriaview', '94.23.22.110', '073.821.48', '1999-10-28 13:23:56', '1996-03-19 20:46:26');
INSERT INTO `users` VALUES (3344, 'sequi', 0, 'McKenzieport', '231.10.226.193', '(707)799-3', '1997-12-29 10:39:24', '2018-09-02 23:51:27');
INSERT INTO `users` VALUES (3345, 'ea', 0, 'East Zoeyberg', '165.108.236.75', '1-433-822-', '1972-03-09 03:34:11', '1979-02-20 19:36:46');
INSERT INTO `users` VALUES (3346, 'vitae', 0, 'Tracyshire', '151.243.43.61', '(973)554-6', '1995-06-17 19:20:23', '1975-09-17 05:24:51');
INSERT INTO `users` VALUES (3347, 'tempora', 0, 'Bridiestad', '206.253.211.111', '182-681-94', '1980-03-02 01:37:19', '1992-05-22 14:04:20');
INSERT INTO `users` VALUES (3348, 'voluptatem', 0, 'South Lila', '165.44.254.129', '602-030-04', '1999-03-10 04:21:35', '1993-07-21 22:52:05');
INSERT INTO `users` VALUES (3349, 'tempore', 0, 'Pollichland', '104.117.144.199', '0683071524', '2016-09-18 14:32:40', '1992-06-18 10:44:01');
INSERT INTO `users` VALUES (3350, 'unde', 0, 'New Shad', '91.62.12.172', '863-317-58', '1985-07-11 10:03:30', '1988-10-10 22:33:46');
INSERT INTO `users` VALUES (3351, 'nemo', 0, 'Balistreristad', '215.26.198.4', '(050)067-2', '2003-01-06 01:16:09', '2006-05-08 20:31:38');
INSERT INTO `users` VALUES (3352, 'et', 0, 'South Anjali', '182.24.46.226', '(885)063-9', '1988-07-09 15:48:03', '1976-05-24 18:13:54');
INSERT INTO `users` VALUES (3353, 'quisquam', 0, 'Irvington', '162.113.85.216', '1-499-879-', '1970-07-03 21:33:58', '2006-11-18 07:56:59');
INSERT INTO `users` VALUES (3354, 'qui', 0, 'New Paula', '126.22.203.144', '175-842-51', '1985-10-29 20:51:30', '2000-10-01 23:58:21');
INSERT INTO `users` VALUES (3355, 'totam', 0, 'Lake Roselyn', '234.125.210.187', '091.261.75', '1998-03-17 11:43:03', '2009-12-31 14:08:31');
INSERT INTO `users` VALUES (3356, 'omnis', 0, 'New Amos', '1.178.75.45', '641.760.59', '1989-09-24 12:06:53', '1999-12-03 09:18:22');
INSERT INTO `users` VALUES (3357, 'dicta', 0, 'South Norbertoton', '52.82.117.114', '+13(6)5987', '1979-06-18 09:16:59', '1970-11-23 06:08:32');
INSERT INTO `users` VALUES (3358, 'omnis', 0, 'Blockland', '84.16.115.59', '556.144.31', '2009-06-08 22:22:52', '1985-05-28 11:15:06');
INSERT INTO `users` VALUES (3359, 'ullam', 0, 'South Noe', '241.128.201.251', '692.402.74', '1974-06-25 10:22:45', '2016-04-04 18:45:03');
INSERT INTO `users` VALUES (3360, 'sint', 0, 'Jensenmouth', '224.110.47.8', '852.476.89', '2001-10-18 08:01:33', '2001-08-03 21:33:25');
INSERT INTO `users` VALUES (3361, 'aut', 0, 'Maggiomouth', '78.217.129.57', '028-994-43', '2003-11-25 17:51:09', '2004-11-24 13:20:42');
INSERT INTO `users` VALUES (3362, 'eius', 0, 'Orvalland', '89.223.162.142', '(098)411-5', '1973-05-24 03:59:13', '2014-07-04 07:19:24');
INSERT INTO `users` VALUES (3363, 'blanditiis', 0, 'East Jaylen', '43.73.27.206', '053.267.03', '1994-02-11 20:55:55', '1972-02-14 13:07:36');
INSERT INTO `users` VALUES (3364, 'eos', 0, 'North Adelaland', '36.59.127.135', '1-618-077-', '2011-04-15 23:26:57', '1992-03-06 21:26:31');
INSERT INTO `users` VALUES (3365, 'non', 0, 'Port Elton', '63.33.226.128', '(129)439-5', '2012-04-23 10:11:35', '1985-12-21 04:50:07');
INSERT INTO `users` VALUES (3366, 'quo', 0, 'Vivianfurt', '12.138.214.51', '+13(3)4473', '1980-03-20 22:44:56', '2010-04-10 04:17:17');
INSERT INTO `users` VALUES (3367, 'eveniet', 0, 'Port Breannebury', '209.134.207.15', '1-102-207-', '2007-08-24 04:01:42', '1994-01-02 19:49:01');
INSERT INTO `users` VALUES (3368, 'consequatur', 0, 'Port Kayleemouth', '194.140.100.127', '388.119.91', '1991-11-04 06:34:20', '1991-01-10 05:33:06');
INSERT INTO `users` VALUES (3369, 'autem', 0, 'Audiemouth', '207.83.17.228', '1-683-186-', '2004-11-20 22:49:35', '1972-02-02 13:16:36');
INSERT INTO `users` VALUES (3370, 'quibusdam', 0, 'Otisborough', '252.82.66.186', '015.822.43', '1999-03-03 10:17:17', '1972-07-21 15:24:15');
INSERT INTO `users` VALUES (3371, 'est', 0, 'Craigport', '171.137.145.164', '701-459-34', '2003-08-10 07:14:22', '2008-12-23 06:50:11');
INSERT INTO `users` VALUES (3372, 'a', 0, 'Champlinport', '243.57.237.129', '1-924-703-', '2000-07-10 23:57:02', '2006-08-27 05:04:33');
INSERT INTO `users` VALUES (3373, 'magnam', 0, 'Dejaport', '35.124.39.212', '526.515.23', '1984-06-08 20:45:10', '1979-03-07 05:01:52');
INSERT INTO `users` VALUES (3374, 'quam', 0, 'East Jarretborough', '80.121.170.252', '590-237-54', '1986-06-04 23:47:50', '2009-07-19 02:08:43');
INSERT INTO `users` VALUES (3375, 'accusantium', 0, 'Lake Nolan', '97.233.236.99', '1-185-372-', '2000-08-04 14:01:37', '2010-06-14 00:46:41');
INSERT INTO `users` VALUES (3376, 'vel', 0, 'Shaniehaven', '116.120.203.180', '390.497.32', '1999-06-21 18:01:55', '2018-06-09 23:07:48');
INSERT INTO `users` VALUES (3377, 'illum', 0, 'Lake Salmamouth', '20.197.46.150', '1-141-087-', '1986-05-29 00:31:57', '2011-09-28 05:09:47');
INSERT INTO `users` VALUES (3378, 'quaerat', 0, 'Gregorystad', '30.92.108.54', '602-770-30', '2011-08-07 05:07:07', '1983-10-17 07:29:35');
INSERT INTO `users` VALUES (3379, 'optio', 0, 'Port Myrtie', '45.26.98.103', '274-062-80', '1978-03-30 00:50:51', '1974-03-02 07:04:00');
INSERT INTO `users` VALUES (3380, 'dolorem', 0, 'South Catharinetown', '253.247.117.6', '1-519-728-', '2004-12-05 17:14:46', '1993-01-05 08:42:36');
INSERT INTO `users` VALUES (3381, 'nulla', 0, 'South Adolphland', '210.101.222.1', '0489811467', '1975-09-15 07:33:26', '2007-11-03 11:27:49');
INSERT INTO `users` VALUES (3382, 'accusantium', 0, 'North Rubye', '24.88.204.117', '0469408753', '1973-08-06 21:14:01', '1973-09-07 13:57:41');
INSERT INTO `users` VALUES (3383, 'dignissimos', 0, 'South Jordane', '152.235.138.208', '(080)913-7', '2003-12-03 05:32:36', '2010-08-13 04:21:16');
INSERT INTO `users` VALUES (3384, 'repellat', 0, 'Port Hank', '6.49.142.143', '060.547.33', '2018-07-21 13:44:43', '2018-01-26 23:51:58');
INSERT INTO `users` VALUES (3385, 'consequatur', 0, 'Lindside', '136.96.93.97', '186.133.79', '1991-01-22 08:30:39', '1994-05-05 21:33:23');
INSERT INTO `users` VALUES (3386, 'exercitationem', 0, 'Kohlerstad', '39.92.16.50', '255.555.02', '2017-10-24 10:36:40', '2004-03-21 15:46:27');
INSERT INTO `users` VALUES (3387, 'ex', 0, 'East Myrtie', '37.248.89.57', '433.214.08', '1981-02-07 00:38:49', '1994-06-27 14:58:47');
INSERT INTO `users` VALUES (3388, 'pariatur', 0, 'Lake Mariettamouth', '96.253.67.229', '(054)701-5', '1981-11-18 19:19:26', '2010-11-07 05:47:42');
INSERT INTO `users` VALUES (3389, 'ut', 0, 'West Natalie', '76.87.187.203', '852-572-46', '2002-11-11 01:36:28', '1986-09-28 20:38:22');
INSERT INTO `users` VALUES (3390, 'quaerat', 0, 'Kunzeside', '105.52.178.0', '595-492-07', '2000-01-12 18:46:06', '2004-10-27 12:58:55');
INSERT INTO `users` VALUES (3391, 'modi', 0, 'South Valentina', '48.105.136.86', '1-357-132-', '1970-09-06 22:22:05', '2018-04-20 02:27:24');
INSERT INTO `users` VALUES (3392, 'est', 0, 'East Consuelo', '23.255.1.17', '669.590.79', '1978-01-03 08:21:15', '2006-01-31 04:09:08');
INSERT INTO `users` VALUES (3393, 'quibusdam', 0, 'Dareberg', '153.213.74.15', '(711)613-2', '2004-02-16 07:12:28', '2017-01-31 21:27:10');
INSERT INTO `users` VALUES (3394, 'repellat', 0, 'Lake Everettview', '102.117.160.49', '656-189-44', '1986-05-17 19:10:30', '1970-07-21 04:46:03');
INSERT INTO `users` VALUES (3395, 'harum', 0, 'Savanahtown', '253.107.166.124', '860.458.37', '1999-10-21 05:29:44', '2003-11-05 08:35:48');
INSERT INTO `users` VALUES (3396, 'sunt', 0, 'Alainamouth', '241.190.233.169', '1-067-038-', '2005-12-02 11:38:52', '1971-09-17 21:28:53');
INSERT INTO `users` VALUES (3397, 'soluta', 0, 'South Garrymouth', '234.226.175.181', '(765)446-8', '1982-06-15 15:17:15', '2018-01-01 01:46:59');
INSERT INTO `users` VALUES (3398, 'rem', 0, 'Meggiefort', '50.237.203.74', '(296)813-7', '1984-09-24 03:59:30', '2014-12-26 14:31:39');
INSERT INTO `users` VALUES (3399, 'deleniti', 0, 'East Helenatown', '71.231.197.70', '(855)237-1', '1998-03-19 05:18:14', '2002-12-10 05:48:54');
INSERT INTO `users` VALUES (3400, 'similique', 0, 'Goldnerhaven', '56.208.243.249', '393-653-83', '1984-08-14 04:49:35', '1988-04-21 20:28:38');
INSERT INTO `users` VALUES (3401, 'dolore', 0, 'East Terrenceville', '13.129.190.14', '696.090.54', '1995-03-19 04:16:29', '1978-09-19 10:37:42');
INSERT INTO `users` VALUES (3402, 'in', 0, 'East Raoul', '118.3.163.246', '(028)185-0', '1973-11-18 21:52:08', '1981-10-25 12:48:06');
INSERT INTO `users` VALUES (3403, 'accusamus', 0, 'New Blakeshire', '46.79.121.213', '645.256.89', '2003-08-09 16:38:47', '2008-11-20 23:47:42');
INSERT INTO `users` VALUES (3404, 'labore', 0, 'Mitchellborough', '156.253.65.25', '0634176277', '1996-10-10 00:40:12', '1997-06-14 02:04:42');
INSERT INTO `users` VALUES (3405, 'fuga', 0, 'East Abigayle', '19.19.137.184', '0258068368', '1971-09-27 05:23:31', '1986-07-15 12:43:22');
INSERT INTO `users` VALUES (3406, 'vero', 0, 'East Nicola', '167.44.32.124', '+88(7)2499', '2000-06-21 03:07:16', '1991-09-26 04:54:52');
INSERT INTO `users` VALUES (3407, 'soluta', 0, 'Lake Nicholeberg', '116.249.20.85', '094.859.18', '1974-02-18 15:57:22', '2011-07-02 12:05:19');
INSERT INTO `users` VALUES (3408, 'sunt', 0, 'Timmyside', '211.19.13.99', '811.165.01', '1981-05-28 06:53:24', '2007-08-05 12:20:01');
INSERT INTO `users` VALUES (3409, 'voluptas', 0, 'Gislasonshire', '219.108.233.62', '242-399-13', '1995-07-01 22:23:49', '1980-10-19 16:01:28');
INSERT INTO `users` VALUES (3410, 'voluptas', 0, 'Ankundingburgh', '47.182.3.47', '0627288658', '1977-06-25 13:17:14', '1983-07-19 13:04:56');
INSERT INTO `users` VALUES (3411, 'minus', 0, 'Everettehaven', '62.70.160.108', '1-062-569-', '2014-02-27 18:08:42', '1987-07-01 01:45:34');
INSERT INTO `users` VALUES (3412, 'non', 0, 'Lake Donny', '255.127.184.117', '1-363-312-', '1973-10-05 11:43:16', '2004-11-08 13:44:30');
INSERT INTO `users` VALUES (3413, 'omnis', 0, 'Lake Rebekachester', '1.80.205.252', '1-913-414-', '1972-01-20 19:10:02', '2016-08-11 21:35:01');
INSERT INTO `users` VALUES (3414, 'ad', 0, 'West Dannie', '135.100.117.47', '0903738080', '2014-11-02 00:30:50', '2001-05-15 07:01:33');
INSERT INTO `users` VALUES (3415, 'ut', 0, 'Lindgrenmouth', '102.166.22.255', '(204)119-2', '1979-02-20 19:50:18', '1988-04-26 21:15:00');
INSERT INTO `users` VALUES (3416, 'sed', 0, 'Tremblayfurt', '204.7.60.164', '1-330-416-', '2011-02-13 20:27:44', '1993-07-09 02:15:37');
INSERT INTO `users` VALUES (3417, 'earum', 0, 'North Chaunceyville', '35.178.220.137', '214-926-87', '2006-07-17 03:57:34', '2000-09-29 03:52:37');
INSERT INTO `users` VALUES (3418, 'repudiandae', 0, 'Hettiemouth', '142.219.179.249', '1-589-065-', '1997-01-25 23:37:48', '1998-06-13 21:56:21');
INSERT INTO `users` VALUES (3419, 'voluptas', 0, 'Lake Lucindafurt', '105.161.154.164', '0467019682', '2001-03-19 12:50:32', '2010-11-11 10:03:20');
INSERT INTO `users` VALUES (3420, 'quidem', 0, 'Aubreehaven', '255.148.182.99', '+67(7)5341', '1986-01-12 00:59:50', '1986-06-10 23:07:55');
INSERT INTO `users` VALUES (3421, 'nulla', 0, 'Port Cordellmouth', '30.95.252.41', '244.614.49', '1990-02-15 12:42:48', '2002-03-15 23:30:03');
INSERT INTO `users` VALUES (3422, 'maiores', 0, 'East Lolaburgh', '205.93.230.215', '1-007-620-', '1973-07-07 10:38:45', '1974-05-22 04:08:39');
INSERT INTO `users` VALUES (3423, 'tenetur', 0, 'Abshirechester', '45.176.193.66', '553.776.62', '1973-03-11 13:37:17', '1979-06-07 09:38:27');
INSERT INTO `users` VALUES (3424, 'atque', 0, 'Casimirmouth', '130.82.213.107', '1-766-902-', '1970-04-06 01:14:49', '2001-06-26 11:08:28');
INSERT INTO `users` VALUES (3425, 'et', 0, 'New Angelside', '110.15.82.164', '1-896-521-', '2012-07-01 21:22:34', '1978-04-03 04:39:41');
INSERT INTO `users` VALUES (3426, 'porro', 0, 'Rubieland', '208.44.190.104', '837.606.17', '1993-04-13 05:39:25', '2001-01-14 18:50:09');
INSERT INTO `users` VALUES (3427, 'dolores', 0, 'New Brando', '49.213.42.242', '1-186-547-', '1978-06-06 06:46:11', '2010-12-14 06:39:53');
INSERT INTO `users` VALUES (3428, 'ut', 0, 'Wilmerborough', '117.97.4.28', '1-545-493-', '1978-07-18 14:44:09', '2011-03-23 23:55:47');
INSERT INTO `users` VALUES (3429, 'saepe', 0, 'Port Macie', '78.106.131.111', '483-356-24', '1974-01-09 18:56:06', '1987-04-11 23:31:37');
INSERT INTO `users` VALUES (3430, 'et', 0, 'West Alliechester', '179.43.10.13', '536.776.49', '2013-06-16 23:26:55', '1999-11-23 15:58:54');
INSERT INTO `users` VALUES (3431, 'iusto', 0, 'Emmerichview', '199.248.102.197', '647.123.75', '2002-12-29 17:36:23', '1981-05-06 14:05:15');
INSERT INTO `users` VALUES (3432, 'consequuntur', 0, 'New Enolaside', '53.221.31.200', '176-329-91', '1999-05-06 02:59:17', '1976-01-15 02:31:46');
INSERT INTO `users` VALUES (3433, 'quo', 0, 'Flossiemouth', '95.193.82.37', '+70(2)0322', '2013-12-07 19:59:45', '1983-07-24 22:11:04');
INSERT INTO `users` VALUES (3434, 'et', 0, 'North Jacynthe', '111.216.122.142', '691.406.49', '2016-06-14 07:14:11', '1999-02-21 06:12:13');
INSERT INTO `users` VALUES (3435, 'et', 0, 'Port Desireestad', '42.193.176.211', '350.809.40', '1998-08-08 08:14:04', '1994-11-03 15:55:43');
INSERT INTO `users` VALUES (3436, 'minus', 0, 'North Mellie', '195.161.216.21', '1-917-589-', '2003-06-02 07:12:02', '1988-03-18 02:34:16');
INSERT INTO `users` VALUES (3437, 'sit', 0, 'Lake Hettie', '41.12.154.183', '(752)741-4', '2010-06-25 00:17:58', '1979-01-11 21:17:39');
INSERT INTO `users` VALUES (3438, 'esse', 0, 'Port Bennettshire', '93.84.64.174', '(420)566-3', '2016-07-13 16:35:17', '2015-03-09 22:48:47');
INSERT INTO `users` VALUES (3439, 'molestias', 0, 'Schummmouth', '134.191.78.173', '099.731.04', '2014-07-11 04:27:19', '1984-09-05 16:04:19');
INSERT INTO `users` VALUES (3440, 'voluptates', 0, 'Thelmaport', '185.51.130.165', '+78(7)3207', '1987-09-24 09:52:29', '1991-01-10 20:54:08');
INSERT INTO `users` VALUES (3441, 'praesentium', 0, 'Lake Kayleigh', '179.73.254.100', '1-265-500-', '1979-01-21 17:05:06', '1986-10-16 18:14:42');
INSERT INTO `users` VALUES (3442, 'doloribus', 0, 'North Tyrell', '109.110.154.254', '(567)761-1', '2011-11-23 21:46:13', '1999-11-21 08:45:42');
INSERT INTO `users` VALUES (3443, 'quod', 0, 'North Kileyview', '31.75.225.205', '645-593-19', '1979-06-18 16:54:54', '1975-04-04 03:18:06');
INSERT INTO `users` VALUES (3444, 'omnis', 0, 'Estaville', '190.216.21.227', '206-515-37', '2002-06-16 10:27:47', '2007-12-29 18:02:48');
INSERT INTO `users` VALUES (3445, 'eum', 0, 'South Cornelius', '182.51.73.151', '1-029-121-', '1991-12-24 09:11:28', '2016-08-03 16:17:44');
INSERT INTO `users` VALUES (3446, 'voluptate', 0, 'Rashawnhaven', '161.80.31.102', '1-504-258-', '1996-07-04 03:36:24', '1972-06-21 21:54:40');
INSERT INTO `users` VALUES (3447, 'adipisci', 0, 'Jonesstad', '195.254.143.4', '111-419-96', '1993-10-01 12:05:21', '1985-03-09 04:57:53');
INSERT INTO `users` VALUES (3448, 'sed', 0, 'Jerroldtown', '73.115.17.9', '251.602.95', '1998-03-31 16:53:44', '1976-09-22 06:22:57');
INSERT INTO `users` VALUES (3449, 'quia', 0, 'Lake Branson', '185.166.125.194', '+64(5)9841', '1971-05-04 04:15:25', '2006-04-13 12:47:56');
INSERT INTO `users` VALUES (3450, 'aliquam', 0, 'New Tobin', '240.74.79.35', '1-150-196-', '1988-06-20 10:17:43', '1999-07-02 09:51:48');
INSERT INTO `users` VALUES (3451, 'iusto', 0, 'Hillschester', '58.139.205.242', '(957)623-9', '1983-11-01 21:11:46', '1995-02-08 19:35:58');
INSERT INTO `users` VALUES (3452, 'fugit', 0, 'South Maybelle', '189.67.84.156', '0625347730', '1975-08-06 14:17:31', '2010-04-06 13:29:44');
INSERT INTO `users` VALUES (3453, 'quae', 0, 'Quigleyfort', '30.124.4.130', '594-065-99', '2005-02-03 19:54:20', '2005-12-10 11:56:22');
INSERT INTO `users` VALUES (3454, 'dicta', 0, 'South Rutheshire', '248.141.1.30', '0255107270', '2009-03-06 05:54:55', '2010-04-14 10:24:09');
INSERT INTO `users` VALUES (3455, 'et', 0, 'Schoenborough', '210.48.136.23', '1-024-180-', '1976-07-27 03:42:14', '2002-10-24 01:39:24');
INSERT INTO `users` VALUES (3456, 'quia', 0, 'Kreigerchester', '138.57.41.18', '0166571290', '2006-10-18 19:03:59', '1972-06-02 08:22:57');
INSERT INTO `users` VALUES (3457, 'earum', 0, 'Lonzoview', '59.207.128.155', '1-060-122-', '1992-02-07 13:08:37', '1992-11-12 21:29:22');
INSERT INTO `users` VALUES (3458, 'porro', 0, 'Garrickview', '155.146.93.19', '(782)550-5', '1973-09-24 12:57:30', '2007-04-15 10:15:15');
INSERT INTO `users` VALUES (3459, 'tempora', 0, 'Port Jayson', '152.205.14.60', '1-307-191-', '1992-04-26 17:08:29', '2009-07-30 02:13:21');
INSERT INTO `users` VALUES (3460, 'adipisci', 0, 'Nashburgh', '104.42.8.194', '137-825-55', '1975-05-09 05:45:33', '1980-12-26 14:02:14');
INSERT INTO `users` VALUES (3461, 'nisi', 0, 'New Skylaland', '36.11.213.234', '+76(9)7530', '1990-07-20 18:43:42', '1991-07-10 12:10:06');
INSERT INTO `users` VALUES (3462, 'quia', 0, 'Beckerhaven', '181.201.251.246', '706-974-98', '2017-07-13 02:35:01', '1987-12-11 17:50:18');
INSERT INTO `users` VALUES (3463, 'dolorem', 0, 'North Claramouth', '85.228.215.248', '0733505625', '1982-08-04 10:06:54', '1997-10-22 16:48:06');
INSERT INTO `users` VALUES (3464, 'autem', 0, 'Lake Aubreeborough', '254.148.165.25', '(815)671-5', '1993-10-05 12:54:29', '2009-05-25 05:40:38');
INSERT INTO `users` VALUES (3465, 'similique', 0, 'East Pamela', '215.211.184.68', '1-420-189-', '1986-09-19 22:17:21', '1987-06-14 04:11:55');
INSERT INTO `users` VALUES (3466, 'consequatur', 0, 'Goldnermouth', '231.205.168.42', '+67(7)5307', '2005-08-07 03:16:58', '2005-04-22 18:09:20');
INSERT INTO `users` VALUES (3467, 'nemo', 0, 'West Bereniceberg', '72.244.164.204', '0875319992', '2014-09-22 22:30:07', '1971-11-08 06:29:26');
INSERT INTO `users` VALUES (3468, 'et', 0, 'Stevehaven', '249.198.181.233', '(838)098-0', '2003-10-02 06:21:16', '2017-07-12 17:41:52');
INSERT INTO `users` VALUES (3469, 'blanditiis', 0, 'Port Opheliaborough', '80.6.214.241', '1-701-970-', '1981-06-23 10:24:46', '2010-07-01 05:47:53');
INSERT INTO `users` VALUES (3470, 'ipsa', 0, 'New Jeromyshire', '88.12.30.166', '1-396-023-', '2001-01-27 06:15:24', '2003-10-12 21:20:18');
INSERT INTO `users` VALUES (3471, 'magni', 0, 'Port Mylene', '27.216.57.238', '623-392-66', '2002-08-03 19:02:11', '1990-07-11 01:08:38');
INSERT INTO `users` VALUES (3472, 'nesciunt', 0, 'Claudieton', '145.119.101.220', '276.586.85', '1977-11-24 02:56:38', '1988-06-20 23:30:56');
INSERT INTO `users` VALUES (3473, 'quibusdam', 0, 'North Teresaborough', '63.250.125.168', '938.855.92', '2006-08-07 14:41:35', '1988-09-07 22:37:22');
INSERT INTO `users` VALUES (3474, 'quam', 0, 'Odieton', '165.17.200.218', '900.232.81', '1971-02-18 14:36:53', '1999-11-10 06:52:00');
INSERT INTO `users` VALUES (3475, 'laborum', 0, 'Port Cameronshire', '229.85.43.115', '508-231-66', '2001-05-03 12:30:57', '2013-08-28 23:25:51');
INSERT INTO `users` VALUES (3476, 'eos', 0, 'East Dorothy', '191.11.85.60', '644.082.24', '1979-04-24 16:05:15', '2005-11-16 23:39:12');
INSERT INTO `users` VALUES (3477, 'sit', 0, 'New Violet', '8.104.4.73', '847.919.66', '2007-08-15 11:28:13', '2016-12-26 12:10:28');
INSERT INTO `users` VALUES (3478, 'non', 0, 'Fishermouth', '212.25.180.65', '1-171-913-', '1986-12-20 19:50:57', '1999-11-26 22:36:24');
INSERT INTO `users` VALUES (3479, 'pariatur', 0, 'Port Prudence', '33.213.10.49', '392.424.67', '1995-11-25 17:19:40', '2016-08-16 19:44:17');
INSERT INTO `users` VALUES (3480, 'aut', 0, 'Darechester', '250.10.168.250', '0854356375', '2002-07-30 15:04:00', '1978-07-28 13:03:09');
INSERT INTO `users` VALUES (3481, 'cupiditate', 0, 'East Lavern', '195.112.174.29', '1-812-866-', '2004-11-05 02:14:09', '1971-03-21 07:02:31');
INSERT INTO `users` VALUES (3482, 'sunt', 0, 'Murielstad', '24.170.243.120', '1-008-317-', '2017-09-11 16:56:59', '2002-11-26 11:10:27');
INSERT INTO `users` VALUES (3483, 'deleniti', 0, 'Schinnerchester', '103.228.52.91', '(292)799-5', '2001-10-23 02:13:35', '1979-09-09 08:16:41');
INSERT INTO `users` VALUES (3484, 'reiciendis', 0, 'Rolfsonshire', '76.195.138.229', '365-008-81', '2007-01-30 05:39:32', '1977-10-07 13:37:12');
INSERT INTO `users` VALUES (3485, 'voluptas', 0, 'Muellerport', '188.8.50.17', '(117)949-2', '1984-07-16 05:43:56', '1985-11-29 00:14:42');
INSERT INTO `users` VALUES (3486, 'in', 0, 'North Adriannatown', '132.201.226.74', '(329)798-5', '1975-12-20 10:20:50', '1999-10-02 01:51:20');
INSERT INTO `users` VALUES (3487, 'necessitatibus', 0, 'Sventown', '204.115.122.166', '0551545525', '1974-01-24 11:36:22', '1980-05-01 17:41:02');
INSERT INTO `users` VALUES (3488, 'at', 0, 'Annamariefort', '78.166.91.2', '058-000-20', '2008-11-08 21:47:19', '1987-03-16 15:50:41');
INSERT INTO `users` VALUES (3489, 'sed', 0, 'West Carloshaven', '225.10.133.23', '(819)905-3', '2016-04-26 03:40:17', '2003-02-28 14:52:34');
INSERT INTO `users` VALUES (3490, 'labore', 0, 'Margarettaville', '172.240.60.11', '1-452-934-', '2017-09-29 03:34:56', '2002-07-26 20:40:02');
INSERT INTO `users` VALUES (3491, 'esse', 0, 'Lake Stephon', '168.123.18.189', '0849736569', '2014-08-23 13:20:59', '1987-01-04 13:04:09');
INSERT INTO `users` VALUES (3492, 'ea', 0, 'South Mervin', '26.34.2.92', '1-885-510-', '1990-08-24 15:55:15', '1998-10-30 06:33:23');
INSERT INTO `users` VALUES (3493, 'magnam', 0, 'New Chetmouth', '92.74.33.0', '1-516-901-', '2003-01-28 03:16:13', '1979-09-06 12:06:09');
INSERT INTO `users` VALUES (3494, 'consequatur', 0, 'Lake Altaside', '225.118.45.93', '663-281-48', '1973-09-22 09:23:25', '2007-10-14 11:24:15');
INSERT INTO `users` VALUES (3495, 'voluptatum', 0, 'Queenieton', '146.82.102.151', '1-328-152-', '2002-05-20 11:31:59', '2002-08-28 07:20:00');
INSERT INTO `users` VALUES (3496, 'ut', 0, 'West Carymouth', '10.60.63.251', '(989)820-4', '1989-04-21 07:07:13', '1990-12-24 02:47:28');
INSERT INTO `users` VALUES (3497, 'nobis', 0, 'Jalonview', '238.77.193.47', '(330)315-9', '1978-07-27 14:02:30', '1996-03-03 11:20:54');
INSERT INTO `users` VALUES (3498, 'aut', 0, 'West Idella', '251.56.100.124', '546-635-94', '2005-11-12 06:04:39', '1978-08-23 12:39:37');
INSERT INTO `users` VALUES (3499, 'aut', 0, 'Elodyshire', '196.107.206.223', '346-151-34', '2003-02-25 04:53:41', '2017-02-02 03:11:26');
INSERT INTO `users` VALUES (3500, 'quis', 0, 'Quigleyberg', '237.159.226.79', '1-776-036-', '2002-11-17 05:07:35', '1981-09-10 06:58:54');
INSERT INTO `users` VALUES (3501, 'quia', 0, 'New Arturo', '170.45.86.69', '(691)445-1', '1976-05-15 01:18:24', '1988-07-24 22:56:56');
INSERT INTO `users` VALUES (3502, 'hic', 0, 'Port Hallebury', '142.6.127.99', '1-169-333-', '2014-11-11 13:37:49', '2005-11-08 07:30:05');
INSERT INTO `users` VALUES (3503, 'dolor', 0, 'Alyssonhaven', '24.176.25.173', '+04(2)7381', '1985-12-02 09:53:18', '1995-03-29 00:15:23');
INSERT INTO `users` VALUES (3504, 'illum', 0, 'Brakusstad', '168.49.119.41', '609-640-42', '1974-01-21 02:04:03', '1987-07-26 15:47:49');
INSERT INTO `users` VALUES (3505, 'libero', 0, 'Rennerberg', '146.26.82.104', '683.853.55', '1970-09-01 22:05:23', '1973-08-14 12:16:47');
INSERT INTO `users` VALUES (3506, 'in', 0, 'West Janiya', '10.1.31.19', '713-503-00', '1993-10-19 07:39:10', '2017-04-22 16:36:57');
INSERT INTO `users` VALUES (3507, 'numquam', 0, 'New Baronport', '107.147.46.211', '1-569-388-', '1997-05-17 06:31:30', '1972-11-08 01:53:45');
INSERT INTO `users` VALUES (3508, 'perferendis', 0, 'North Gretaton', '143.251.203.192', '431.534.17', '2012-02-02 16:40:16', '1976-08-20 19:15:09');
INSERT INTO `users` VALUES (3509, 'ducimus', 0, 'South Tysonview', '108.111.67.31', '608-650-05', '2014-12-10 19:35:25', '2006-06-26 11:34:15');
INSERT INTO `users` VALUES (3510, 'quos', 0, 'Chasestad', '167.13.212.135', '813-000-50', '1986-03-14 04:29:26', '1975-11-03 02:35:59');
INSERT INTO `users` VALUES (3511, 'eum', 0, 'Brycenmouth', '111.227.229.165', '603-298-68', '1982-10-11 05:10:34', '1973-03-02 00:06:01');
INSERT INTO `users` VALUES (3512, 'fugit', 0, 'Port Efrainfort', '4.156.59.105', '0541974665', '2003-11-13 13:30:47', '2007-06-17 10:54:26');
INSERT INTO `users` VALUES (3513, 'nam', 0, 'Bransonmouth', '80.34.42.38', '(922)182-4', '1985-02-03 03:19:55', '1997-08-22 02:14:12');
INSERT INTO `users` VALUES (3514, 'facere', 0, 'Port Jasperborough', '241.62.100.211', '143-863-54', '1987-01-14 09:26:47', '2011-09-22 12:47:22');
INSERT INTO `users` VALUES (3515, 'omnis', 0, 'New Elaina', '18.61.107.227', '268.544.14', '2010-06-27 13:07:33', '2000-09-27 03:37:20');
INSERT INTO `users` VALUES (3516, 'ratione', 0, 'Powlowskiville', '237.77.219.138', '096-213-99', '1976-06-20 14:35:25', '1991-06-05 17:08:36');
INSERT INTO `users` VALUES (3517, 'non', 0, 'Lockmanmouth', '49.235.171.170', '243.297.00', '1983-07-06 17:53:07', '1980-11-03 05:19:32');
INSERT INTO `users` VALUES (3518, 'libero', 0, 'New Alysonberg', '52.159.242.218', '0452604694', '2008-06-11 17:09:09', '2004-05-28 09:11:05');
INSERT INTO `users` VALUES (3519, 'labore', 0, 'North Karlie', '42.161.170.45', '(455)677-1', '2017-07-23 14:49:51', '1985-12-08 16:47:58');
INSERT INTO `users` VALUES (3520, 'vel', 0, 'New Halleland', '237.182.194.16', '039-063-11', '1993-10-16 08:17:47', '2013-07-06 16:04:04');
INSERT INTO `users` VALUES (3521, 'quae', 0, 'Reynaside', '55.54.220.201', '+55(8)8984', '2014-02-23 19:05:13', '2013-01-07 03:01:29');
INSERT INTO `users` VALUES (3522, 'excepturi', 0, 'Veumview', '76.119.238.159', '436.903.04', '2010-01-26 16:01:37', '2011-12-06 00:34:59');
INSERT INTO `users` VALUES (3533, 'veritatis', 0, 'Rennerburgh', '68.61.125.31', '0534037314', '2012-01-21 23:38:29', '1983-04-10 21:59:57');
INSERT INTO `users` VALUES (3534, 'dolore', 0, 'Port Ameliamouth', '121.233.127.35', '1-066-022-', '1991-10-31 07:54:20', '1981-11-08 01:27:33');
INSERT INTO `users` VALUES (3535, 'voluptate', 0, 'Brakusville', '34.174.33.24', '408-798-88', '2005-01-18 12:23:47', '2012-09-15 19:29:26');
INSERT INTO `users` VALUES (3536, 'ut', 0, 'New Stephanyborough', '221.148.133.140', '+26(2)8254', '1973-04-30 09:22:38', '2012-09-24 01:17:23');
INSERT INTO `users` VALUES (3537, 'harum', 0, 'Dayanaside', '212.243.245.102', '385.664.59', '2012-02-18 20:45:30', '2002-06-19 01:45:07');
INSERT INTO `users` VALUES (3538, 'dolorem', 0, 'Port Stefan', '32.209.164.53', '940-256-17', '1987-05-04 10:19:41', '2001-05-16 19:06:54');
INSERT INTO `users` VALUES (3539, 'explicabo', 0, 'Lake Reece', '179.3.230.214', '214.933.87', '2004-05-24 03:06:46', '1999-10-24 01:51:10');
INSERT INTO `users` VALUES (3540, 'natus', 0, 'East Cayla', '5.235.230.141', '177-086-62', '1995-06-05 11:23:04', '1991-02-22 15:15:59');
INSERT INTO `users` VALUES (3541, 'vel', 0, 'South Hildegard', '96.57.86.127', '1-030-589-', '2000-04-07 13:28:08', '1973-08-29 01:21:55');
INSERT INTO `users` VALUES (3542, 'fuga', 0, 'West Jaylinstad', '101.10.119.202', '868.175.37', '1996-07-09 05:27:22', '1999-06-04 00:55:27');
INSERT INTO `users` VALUES (3543, 'eum', 0, 'West Kurtisview', '3.126.146.78', '1-978-526-', '2009-02-04 17:42:30', '1995-04-04 11:36:08');
INSERT INTO `users` VALUES (3544, 'quis', 0, 'Kihnmouth', '40.104.57.244', '707-091-14', '1970-01-08 02:50:19', '2009-03-13 16:24:14');
INSERT INTO `users` VALUES (3545, 'non', 0, 'South Macie', '194.214.47.4', '1-139-408-', '1998-07-07 22:36:05', '2011-03-11 18:08:50');
INSERT INTO `users` VALUES (3546, 'omnis', 0, 'Brucefurt', '181.89.229.60', '516-189-83', '2016-09-06 01:19:10', '1986-05-29 17:14:56');
INSERT INTO `users` VALUES (3547, 'excepturi', 0, 'New Marilouview', '145.149.175.208', '(880)213-3', '2014-08-15 22:25:32', '1980-08-28 19:42:32');
INSERT INTO `users` VALUES (3548, 'quis', 0, 'Gleasonshire', '167.27.6.99', '1-858-234-', '1986-11-29 04:22:21', '1970-11-10 09:05:01');
INSERT INTO `users` VALUES (3549, 'nam', 0, 'Bednarport', '191.136.151.149', '+93(0)0160', '1980-07-28 04:16:44', '1987-09-25 22:52:44');
INSERT INTO `users` VALUES (3550, 'magni', 0, 'New Freddy', '57.236.48.42', '728.443.11', '1987-12-16 13:15:22', '2004-11-05 09:05:05');
INSERT INTO `users` VALUES (3551, 'molestiae', 0, 'West Faechester', '118.211.102.71', '+56(6)8041', '2006-08-05 04:28:18', '1977-10-26 01:25:21');
INSERT INTO `users` VALUES (3552, 'vero', 0, 'Wendychester', '72.22.166.214', '1-244-158-', '1982-06-27 12:06:26', '2009-07-29 03:25:49');
INSERT INTO `users` VALUES (3553, 'sint', 0, 'East Mekhimouth', '47.242.147.33', '1-767-793-', '1982-09-09 09:42:56', '1994-11-20 05:07:22');
INSERT INTO `users` VALUES (3554, 'neque', 0, 'Ziemannport', '17.62.48.137', '1-368-014-', '1991-02-21 01:33:25', '1970-11-22 16:39:27');
INSERT INTO `users` VALUES (3555, 'est', 0, 'North Magdalenamouth', '235.14.209.171', '(312)895-9', '1984-09-03 16:52:47', '2016-12-19 15:23:31');
INSERT INTO `users` VALUES (3556, 'et', 0, 'West Hailie', '3.133.37.143', '888-105-29', '1981-10-12 13:05:05', '2002-11-01 00:26:30');
INSERT INTO `users` VALUES (3557, 'at', 0, 'North Samantafurt', '173.115.27.148', '461-551-39', '1994-01-28 13:27:31', '1973-02-04 11:16:52');
INSERT INTO `users` VALUES (3558, 'molestiae', 0, 'Ornberg', '191.169.127.210', '+02(1)8156', '2008-11-23 00:48:41', '1992-08-20 10:46:33');
INSERT INTO `users` VALUES (3559, 'quidem', 0, 'Port Tamaraview', '192.153.27.106', '(666)424-6', '1989-11-15 18:43:29', '1974-08-09 10:32:50');
INSERT INTO `users` VALUES (3560, 'nisi', 0, 'Kimberlyburgh', '133.22.174.35', '473-623-56', '1983-12-05 15:44:44', '1998-09-20 14:48:35');
INSERT INTO `users` VALUES (3561, 'cum', 0, 'Terrybury', '209.64.148.117', '(830)837-1', '2016-12-24 23:23:20', '2014-03-13 01:55:48');
INSERT INTO `users` VALUES (3562, 'vel', 0, 'Thielview', '198.217.150.31', '(456)730-2', '2003-09-26 21:54:54', '2000-04-02 05:23:27');
INSERT INTO `users` VALUES (3563, 'officia', 0, 'West Zoeyland', '236.1.74.232', '1-937-136-', '1974-12-22 01:34:18', '1975-06-09 22:54:44');
INSERT INTO `users` VALUES (3564, 'debitis', 0, 'South Kenton', '240.246.104.110', '461.078.61', '2014-01-20 18:58:50', '1980-07-08 17:59:15');
INSERT INTO `users` VALUES (3565, 'quis', 0, 'Considineview', '207.34.54.115', '232.558.64', '1985-05-22 13:47:16', '1978-03-14 19:28:42');
INSERT INTO `users` VALUES (3566, 'dolorum', 0, 'Archibaldside', '221.22.85.170', '463-422-83', '2011-03-28 20:10:42', '2006-09-26 07:27:04');
INSERT INTO `users` VALUES (3567, 'quasi', 0, 'Port Hank', '171.203.177.154', '842.983.63', '1996-08-06 11:37:11', '2011-07-29 18:23:38');
INSERT INTO `users` VALUES (3568, 'magni', 0, 'New Blanche', '3.35.149.172', '1-641-022-', '1997-04-19 20:07:12', '1991-04-12 05:42:36');
INSERT INTO `users` VALUES (3569, 'quos', 0, 'Mariemouth', '61.69.8.252', '(791)134-9', '1977-03-02 06:41:25', '2002-03-17 09:39:27');
INSERT INTO `users` VALUES (3570, 'porro', 0, 'East Toreystad', '60.96.29.98', '1-140-367-', '1991-12-29 23:22:48', '1985-10-11 20:39:01');
INSERT INTO `users` VALUES (3571, 'illum', 0, 'Lake Alexandro', '249.42.40.198', '+30(1)2617', '1988-06-24 22:46:56', '2005-09-08 20:21:34');
INSERT INTO `users` VALUES (3572, 'nemo', 0, 'Port Brayanborough', '54.103.80.249', '(299)623-7', '1999-12-25 13:28:46', '1988-06-10 15:39:54');
INSERT INTO `users` VALUES (3573, 'sed', 0, 'Lake Karineland', '12.20.132.3', '1-191-489-', '1974-05-09 10:10:10', '1997-07-17 23:13:33');
INSERT INTO `users` VALUES (3574, 'facilis', 0, 'Carmenport', '154.138.33.195', '132.967.29', '1984-06-17 02:21:00', '1980-06-24 21:46:48');
INSERT INTO `users` VALUES (3575, 'non', 0, 'Lindgrenville', '85.14.13.68', '1-288-017-', '1997-11-21 19:09:15', '2013-10-17 05:55:08');
INSERT INTO `users` VALUES (3576, 'corporis', 0, 'Yundtmouth', '164.130.100.225', '206-977-83', '2007-04-04 06:03:45', '2011-10-24 09:17:48');
INSERT INTO `users` VALUES (3577, 'ut', 0, 'Jerdefort', '39.45.5.201', '1-860-456-', '1970-01-25 08:59:41', '1989-09-15 02:52:38');
INSERT INTO `users` VALUES (3578, 'quaerat', 0, 'South Juddtown', '19.35.137.172', '272-124-66', '2003-08-07 03:14:13', '1993-01-09 17:23:36');
INSERT INTO `users` VALUES (3579, 'sed', 0, 'Libbiemouth', '130.65.173.78', '(191)105-8', '1994-03-20 04:01:23', '1970-05-31 12:45:50');
INSERT INTO `users` VALUES (3580, 'ab', 0, 'Roslyntown', '0.102.169.114', '141-201-95', '1972-01-22 11:45:18', '1998-11-03 14:21:26');
INSERT INTO `users` VALUES (3581, 'quo', 0, 'Port Thurmanland', '122.198.232.126', '(492)417-8', '1990-05-22 05:14:13', '1988-01-29 21:01:26');
INSERT INTO `users` VALUES (3582, 'praesentium', 0, 'North Eladio', '250.83.255.63', '1-196-471-', '2005-02-22 18:58:38', '1977-08-09 05:26:58');
INSERT INTO `users` VALUES (3583, 'sit', 0, 'Janland', '156.57.188.91', '(571)629-3', '2016-11-12 10:33:41', '1993-10-29 05:11:09');
INSERT INTO `users` VALUES (3584, 'distinctio', 0, 'North Jonathonshire', '193.194.145.144', '1-268-990-', '1994-07-01 06:46:43', '2011-04-13 16:18:34');
INSERT INTO `users` VALUES (3585, 'optio', 0, 'Lake Ashton', '91.229.83.202', '865.936.37', '1980-10-01 04:49:31', '1972-03-01 23:46:04');
INSERT INTO `users` VALUES (3586, 'ut', 0, 'Dannyville', '16.35.42.122', '1-689-931-', '1982-07-13 22:10:44', '1997-03-07 10:59:15');
INSERT INTO `users` VALUES (3587, 'illum', 0, 'South Therese', '172.210.38.173', '711.643.19', '1979-08-03 06:58:46', '1995-06-04 19:32:31');
INSERT INTO `users` VALUES (3588, 'omnis', 0, 'Gulgowskihaven', '87.248.97.124', '+87(9)2872', '1987-12-26 17:31:09', '2012-07-27 20:53:19');
INSERT INTO `users` VALUES (3589, 'a', 0, 'Braxtonberg', '16.243.90.94', '729.472.40', '1979-08-26 23:47:41', '1976-06-08 01:38:54');
INSERT INTO `users` VALUES (3590, 'ipsum', 0, 'Volkmanmouth', '4.172.79.139', '(435)882-7', '1989-09-17 02:46:48', '1982-03-24 16:39:20');
INSERT INTO `users` VALUES (3591, 'rerum', 0, 'Port Daphne', '82.17.193.69', '210-411-07', '2012-04-16 04:23:06', '1975-08-26 22:15:32');
INSERT INTO `users` VALUES (3592, 'ut', 0, 'Alisahaven', '27.48.6.129', '0163879923', '1991-06-01 14:32:49', '1993-10-11 09:21:17');
INSERT INTO `users` VALUES (3593, 'delectus', 0, 'Pfefferstad', '65.85.208.31', '337.847.86', '1990-10-31 04:16:17', '2006-03-03 00:58:19');
INSERT INTO `users` VALUES (3594, 'vel', 0, 'Orrinmouth', '98.8.148.51', '055-025-92', '2005-02-02 15:51:42', '1976-03-20 17:22:25');
INSERT INTO `users` VALUES (3595, 'dolores', 0, 'Stanfordberg', '213.64.206.141', '(349)322-7', '1971-05-16 14:34:28', '1997-04-15 04:27:27');
INSERT INTO `users` VALUES (3596, 'dolores', 0, 'Jastfurt', '136.52.88.145', '1-501-724-', '1978-02-16 08:20:04', '1985-03-07 02:49:48');
INSERT INTO `users` VALUES (3597, 'molestiae', 0, 'North Onie', '77.54.23.29', '+70(0)0434', '1996-12-19 19:20:36', '1986-12-16 20:52:30');
INSERT INTO `users` VALUES (3598, 'aliquid', 0, 'Martyside', '53.35.127.52', '1-278-721-', '2010-02-14 10:19:18', '2008-08-09 18:19:39');
INSERT INTO `users` VALUES (3599, 'voluptas', 0, 'South Alizeside', '102.150.75.84', '(170)558-3', '1998-03-09 19:51:00', '1996-04-07 16:19:05');
INSERT INTO `users` VALUES (3600, 'placeat', 0, 'Jedediahhaven', '51.120.40.29', '983.874.32', '1999-11-18 12:41:45', '1984-02-11 20:12:20');
INSERT INTO `users` VALUES (3601, 'aut', 0, 'Eliezerborough', '45.223.224.137', '567-734-86', '1997-10-09 23:40:04', '2000-05-31 12:34:53');
INSERT INTO `users` VALUES (3602, 'ratione', 0, 'Stantonberg', '52.110.164.42', '672-250-78', '1979-10-18 17:14:19', '1976-07-21 11:25:39');
INSERT INTO `users` VALUES (3603, 'delectus', 0, 'Altenwerthhaven', '108.208.102.228', '(946)109-8', '1973-12-22 01:55:10', '2017-08-22 21:01:25');
INSERT INTO `users` VALUES (3604, 'rem', 0, 'Nikoview', '85.22.124.217', '(392)062-1', '2001-10-06 06:22:43', '2009-11-10 08:33:37');
INSERT INTO `users` VALUES (3605, 'ipsa', 0, 'Veldaland', '162.1.194.205', '1-878-693-', '2000-02-27 16:13:36', '1974-10-30 15:27:59');
INSERT INTO `users` VALUES (3606, 'velit', 0, 'East Victorhaven', '167.152.191.22', '360-578-87', '1999-07-27 08:09:45', '1977-04-08 02:49:47');
INSERT INTO `users` VALUES (3607, 'officia', 0, 'New Alvena', '164.112.65.189', '368.118.45', '1999-10-01 11:58:31', '1978-06-29 08:56:09');
INSERT INTO `users` VALUES (3608, 'sint', 0, 'South Benedictfort', '233.207.36.141', '236-098-83', '1993-07-18 07:26:36', '2011-06-24 12:51:13');
INSERT INTO `users` VALUES (3609, 'in', 0, 'New Nellie', '249.138.122.234', '966.297.36', '2001-09-02 13:56:59', '1991-01-06 07:26:57');
INSERT INTO `users` VALUES (3610, 'et', 0, 'Port Thurmanland', '42.130.224.227', '568.227.15', '2007-09-27 20:40:39', '2000-11-25 05:14:26');
INSERT INTO `users` VALUES (3611, 'modi', 0, 'East Lexie', '85.229.167.107', '0772770674', '1999-07-03 06:30:07', '1988-06-20 06:40:51');
INSERT INTO `users` VALUES (3612, 'maxime', 0, 'New Alexie', '215.116.99.9', '683-691-69', '1993-03-26 07:17:38', '2002-06-25 05:31:46');
INSERT INTO `users` VALUES (3613, 'fuga', 0, 'West Calebtown', '68.7.17.136', '0663388244', '2018-03-13 19:05:07', '2001-03-31 11:00:46');
INSERT INTO `users` VALUES (3614, 'cum', 0, 'Legrosville', '153.104.135.176', '887-580-25', '2012-09-23 19:30:39', '1971-12-23 20:31:29');
INSERT INTO `users` VALUES (3615, 'debitis', 0, 'Talonshire', '252.183.125.133', '590-080-43', '1992-04-06 17:05:15', '1974-05-15 00:41:49');
INSERT INTO `users` VALUES (3616, 'debitis', 0, 'Krajcikmouth', '91.67.150.100', '(620)706-5', '1979-05-22 18:20:40', '1976-05-31 03:30:21');
INSERT INTO `users` VALUES (3617, 'vel', 0, 'New Natashaside', '99.172.223.12', '1-487-477-', '1990-07-23 05:50:58', '1987-09-21 06:25:17');
INSERT INTO `users` VALUES (3618, 'velit', 0, 'East Brenden', '126.156.29.227', '886.081.94', '2012-07-06 10:00:17', '2001-11-01 10:29:52');
INSERT INTO `users` VALUES (3619, 'maxime', 0, 'Hamillmouth', '141.71.116.174', '0113283211', '2003-09-18 04:59:43', '1985-04-13 00:34:51');
INSERT INTO `users` VALUES (3620, 'dignissimos', 0, 'Nashtown', '167.10.97.38', '0523900539', '2008-09-16 19:42:24', '2008-06-07 22:02:23');
INSERT INTO `users` VALUES (3621, 'molestiae', 0, 'North Ayanabury', '145.150.47.208', '349.329.55', '2005-01-21 00:19:47', '1971-12-28 20:06:17');
INSERT INTO `users` VALUES (3622, 'fugit', 0, 'Lake Brody', '1.136.86.6', '0440324999', '1972-12-03 09:13:16', '2011-09-18 11:38:01');
INSERT INTO `users` VALUES (3623, 'nulla', 0, 'Weimannland', '118.114.119.11', '(340)258-7', '1974-03-21 05:05:30', '2009-06-27 02:12:17');
INSERT INTO `users` VALUES (3624, 'nulla', 0, 'New Hazel', '44.250.63.247', '1-161-076-', '2011-03-10 11:11:19', '1986-05-29 01:00:28');
INSERT INTO `users` VALUES (3625, 'voluptas', 0, 'Elouisefort', '236.68.46.155', '(269)757-4', '2000-11-07 10:25:31', '1987-08-30 06:03:10');
INSERT INTO `users` VALUES (3626, 'culpa', 0, 'North Vernertown', '225.213.15.73', '(202)535-0', '1973-07-15 20:18:22', '2009-05-29 06:46:32');
INSERT INTO `users` VALUES (3627, 'deserunt', 0, 'Framibury', '200.246.179.100', '+16(5)8517', '1996-01-05 01:54:25', '1997-08-29 07:30:10');
INSERT INTO `users` VALUES (3628, 'totam', 0, 'North Fred', '70.226.199.72', '708-253-36', '1990-11-23 09:24:53', '1989-07-11 05:06:55');
INSERT INTO `users` VALUES (3629, 'cupiditate', 8, 'East Careyborough', '251.55.8.91', '(763)447-2', '1999-06-20 10:02:37', '2017-05-13 16:10:57');
INSERT INTO `users` VALUES (3630, 'libero', 1, 'South Lydiaberg', '180.64.77.168', '0835552395', '2005-04-21 15:18:59', '2009-05-10 12:18:32');
INSERT INTO `users` VALUES (3631, 'iure2', 2, 'Suzanneville', '242.42.173.68', '446.892.99', '1980-11-05 19:50:02', '1971-10-10 17:36:31');
INSERT INTO `users` VALUES (3632, 'john', 1, 'North Gideonshire', '199.1.120.7', '1-739-973-', '1991-04-07 00:37:29', '2009-07-16 22:01:58');

-- ----------------------------
-- Table structure for video_slices
-- ----------------------------
DROP TABLE IF EXISTS `video_slices`;
CREATE TABLE `video_slices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `workspace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_slices
-- ----------------------------
INSERT INTO `video_slices` VALUES (1, '00000000-0000-0000-0000-000000000000', '', 'sdddddddddd', '', 0, '2020-01-03 07:02:58', '2020-01-03 07:02:58');
INSERT INTO `video_slices` VALUES (2, '00000000-0000-0000-0000-000000000000', '', '', '', 0, '2020-01-03 07:10:02', '2020-01-03 07:10:02');
INSERT INTO `video_slices` VALUES (3, '00000000-0000-0000-0000-000000000000', '', 'ddddddddddddddddd', '', 0, '2020-01-03 07:10:11', '2020-01-03 07:10:11');
INSERT INTO `video_slices` VALUES (4, '1fce79b1-27bf-11ea-b031-00155d012d1c', '', 'ggggggggggggggggggggggg', '', 0, '2020-01-03 07:14:24', '2020-01-03 07:29:58');
INSERT INTO `video_slices` VALUES (5, '1fce79b1-27bf-11ea-b031-00155d012d1c', '', 'dddsssssssssss', '', 0, '2020-01-03 07:16:15', '2020-01-03 07:26:06');
INSERT INTO `video_slices` VALUES (6, '1fce79b1-27bf-11ea-b031-00155d012d1c', '', 'ssssssssssssss', '', 0, '2020-01-03 07:18:04', '2020-01-03 07:25:46');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `video_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `actors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `info_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `poster_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `thumb_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `source_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES (5, '43bbb4d0-27b6-11ea-be04-00155d012d1c', 'ABP-874', '僕とみおんの異世界性活 最強セクシー装備でエロさ限界突破！！！ 園田みおん', '園田みおん', 'コスプレ,3P・4P,巨乳,単体作品,パイズリ,ハイビジョン', 'data\\info\\ABP-874\\.info', 'data\\info\\ABP-874\\image.jpg', 'data\\info\\ABP-874\\thumb.jpg', '', '2019-12-26 08:03:56', '2019-12-26 09:18:02');
INSERT INTO `videos` VALUES (8, '7972ce0b-27bd-11ea-92bd-00155d012d1c', 'ABP-888', '伝説の超高級サロン 究極のM性感 秘密倶楽部 乙都さきのが責めて責めて責めまくる！！', '乙都さきの', 'ハイビジョン,顔射,おもちゃ,男の潮吹き,単体作品,M男', 'data\\info\\ABP-888\\.info', 'data\\info\\ABP-888\\image.jpg', 'data\\info\\ABP-888\\thumb.jpg', '', '2019-12-26 08:55:32', '2019-12-26 08:55:32');
INSERT INTO `videos` VALUES (11, '1fce79b1-27bf-11ea-b031-00155d012d1c', 'ABP-889', 'スポコス汗だくSEX4本番！ 体育会系・涼森れむ act.23 弾ける汗×スポーツウェアフェチズム', '涼森れむ', 'ハイビジョン,汗だく,スポーツ,巨乳,コスプレ,フェラ,顔射,単体作品,競泳・スクール水着', 'data\\info\\ABP-889\\.info', 'data\\info\\ABP-889\\image.jpg', 'data\\info\\ABP-889\\thumb.jpg', '', '2019-12-26 09:07:21', '2019-12-26 09:07:21');
INSERT INTO `videos` VALUES (12, '6f8a8c75-27bf-11ea-b031-00155d012d1c', 'SNIS-658', '盗撮リアルドキュメント！密着44日、葵つかさのプライベートを激撮し、カメラマンを装ったベテランナンパ師に引っ掛かって、SEXまでしちゃった一部始終', '葵つかさ', '単体作品,独占配信,ナンパ,スレンダー,盗撮・のぞき,美少女,ギリモザ,ハイビジョン', 'data\\info\\SNIS-658\\.info', 'data\\info\\SNIS-658\\image.jpg', 'data\\info\\SNIS-658\\thumb.jpg', '', '2019-12-26 09:09:35', '2019-12-26 09:09:35');
INSERT INTO `videos` VALUES (14, '813f9e41-27c0-11ea-b031-00155d012d1c', 'ABP-666', '焦らし寸止め小悪魔ソープ 3 人生史上最高の射精をあなたに。 里美ゆりあ', '里美ゆりあ', '巨乳,単体作品,アナル,フェラ,潮吹き,ハイビジョン', 'data\\info\\ABP-666\\.info', 'data\\info\\ABP-666\\image.jpg', 'data\\info\\ABP-666\\thumb.jpg', '', '2019-12-26 09:17:14', '2019-12-26 09:17:14');
INSERT INTO `videos` VALUES (15, 'cf2ece38-27c0-11ea-b031-00155d012d1c', 'ABP-777', '絶対的鉄板シチュエーション 13 完全主観！！！河合あすなが贈るとてもHな3シチュエーション', '河合あすな', '巨乳,単体作品,フェラ,パイズリ,妄想,主観,ハイビジョン', 'data\\info\\ABP-777\\.info', 'data\\info\\ABP-777\\image.jpg', 'data\\info\\ABP-777\\thumb.jpg', '', '2019-12-26 09:19:25', '2019-12-26 09:19:25');
INSERT INTO `videos` VALUES (16, '44c7543a-27c1-11ea-95ff-00155d012d1c', 'ABP-847', 'ボクの妹・乙都さきのとエッチなふたりぐらし 近親相姦シリーズNo.005 いたずら大好きっ娘。完全主観SEX', '乙都さきの', '顔射,単体作品,フェラ,近親相姦,姉・妹,主観,ハイビジョン,童貞', 'data\\info\\ABP-847\\.info', 'data\\info\\ABP-847\\image.jpg', 'data\\info\\ABP-847\\thumb.jpg', '', '2019-12-26 09:22:42', '2019-12-26 09:22:42');
INSERT INTO `videos` VALUES (17, '8671b589-27c2-11ea-9df2-00155d012d1c', 'ABP-886', '本番オーケー！？噂の裏ピンサロ 11 AV界随一のアイドル級ルックスを味わい尽くせ！ 野々浦暖', '野々浦暖', 'ハイビジョン,パイパン,コスプレ,フェラ,顔射,単体作品', 'data\\info\\ABP-886\\.info', 'data\\info\\ABP-886\\image.jpg', 'data\\info\\ABP-886\\thumb.jpg', '', '2019-12-26 09:31:42', '2019-12-26 09:31:42');
INSERT INTO `videos` VALUES (18, 'def46531-27c8-11ea-9df2-00155d012d1c', 'SSNI-644', '【※異常なる大絶頂】エロス最大覚醒！性欲が尽き果てるまで怒涛のノンストップ本気性交 三上悠亜', '三上悠亜', 'ハイビジョン,独占配信,巨乳,ドキュメンタリー,アイドル・芸能人,潮吹き,単体作品,ギリモザ', 'data\\info\\SSNI-644\\.info', 'data\\info\\SSNI-644\\image.jpg', 'data\\info\\SSNI-644\\thumb.jpg', '', '2019-12-26 10:17:07', '2019-12-26 10:17:07');
INSERT INTO `videos` VALUES (19, '1192899a-27c9-11ea-9df2-00155d012d1c', 'SSNI-658', 'S1豪華絢爛ドリーム大共演2019 ファン感謝祭！大大大乱交！夢のハーレムソープ！超豪華3本立て伝説の270分', '三上悠亜,天使もえ,葵つかさ,筧ジュン,橋本ありな,坂道みる,架乃ゆら,伊賀まこ,ひなたまりん', '巨乳,美少女,乱交,ファン感謝・訪問,ヘルス・ソープ,ギリモザ,独占配信,ハイビジョン,4時間以上作品', 'data\\info\\SSNI-658\\.info', 'data\\info\\SSNI-658\\image.jpg', 'data\\info\\SSNI-658\\thumb.jpg', '', '2019-12-26 10:18:32', '2019-12-26 10:18:32');
INSERT INTO `videos` VALUES (20, '55240085-286a-11ea-9db3-00155d012d1c', 'SSNI-656', '激イキ181回！痙攣6012回！イキ潮8706cc！超敏感スリムボディ エロス覚醒 はじめての大・痙・攣スペシャル 吉岡ひより', '吉岡ひより', '潮吹き,美少女,美乳,3P・4P,単体作品,ギリモザ,独占配信,ハイビジョン,スレンダー', 'data\\info\\SSNI-656\\.info', 'data\\info\\SSNI-656\\image.jpg', 'data\\info\\SSNI-656\\thumb.jpg', '', '2019-12-27 05:32:54', '2019-12-27 05:32:54');
INSERT INTO `videos` VALUES (21, '0f74afdb-286b-11ea-8520-00155d012d1c', 'SSNI-646', '絶・対・領・域 ハリのあるムチムチ太ももで無意識に誘惑 着衣巨乳ニーハイ美少女 夢乃あいか', '夢乃あいか', 'ハイビジョン,独占配信,足コキ,巨乳,女子校生,ギリモザ,単体作品', 'data\\info\\SSNI-646\\.info', 'data\\info\\SSNI-646\\image.jpg', 'data\\info\\SSNI-646\\thumb.jpg', '', '2019-12-27 05:38:07', '2019-12-27 05:38:07');
INSERT INTO `videos` VALUES (22, 'b33fac44-2877-11ea-a299-00155d012d1c', 'ABP-647', '絶対的鉄板シチュエーション 6 完全主観！！瀬名きらりが贈るとてもHな4シチュエーション', '瀬名きらり', '単体作品,フェラ,イラマチオ,妄想,ハイビジョン', 'data\\info\\ABP-647\\.info', 'data\\info\\ABP-647\\image.jpg', 'data\\info\\ABP-647\\thumb.jpg', '', '2019-12-27 07:08:36', '2019-12-27 07:08:36');
INSERT INTO `videos` VALUES (23, 'cd64f0c5-2877-11ea-a299-00155d012d1c', 'ABP-648', '超高級裏スパ癒らしぃサロン 01 癒らし隠語×極上エスコートSEX 長谷川るい', '長谷川るい', '顔射,単体作品,パイズリ,主観,ハイビジョン', 'data\\info\\ABP-648\\.info', 'data\\info\\ABP-648\\image.jpg', 'data\\info\\ABP-648\\thumb.jpg', '', '2019-12-27 07:09:20', '2019-12-27 07:09:20');
INSERT INTO `videos` VALUES (24, 'cfdc336c-2877-11ea-a299-00155d012d1c', 'ABP-649', '1VS1【※演技一切無し】本能剥き出しタイマン4本番 ACT.09 ひなた澪', 'ひなた澪', '顔射,単体作品,オナニー,パイズリ,潮吹き,ハイビジョン', 'data\\info\\ABP-649\\.info', 'data\\info\\ABP-649\\image.jpg', 'data\\info\\ABP-649\\thumb.jpg', '', '2019-12-27 07:09:24', '2019-12-27 07:09:24');

SET FOREIGN_KEY_CHECKS = 1;
