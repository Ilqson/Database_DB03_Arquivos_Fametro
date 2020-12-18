/*
 Navicat Premium Data Transfer

 Source Server         : Projeto_mineracao
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : projeto_pizzaria

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 14/12/2020 16:04:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bairro
-- ----------------------------
DROP TABLE IF EXISTS `bairro`;
CREATE TABLE `bairro`  (
  `COD_BAIRRO` int(11) NOT NULL,
  `NOME_BAIRRO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`COD_BAIRRO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bairro
-- ----------------------------

-- ----------------------------
-- Table structure for cardapio
-- ----------------------------
DROP TABLE IF EXISTS `cardapio`;
CREATE TABLE `cardapio`  (
  `NOME_CARDAPIO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COD_CARDAPIO` int(11) NOT NULL,
  PRIMARY KEY (`COD_CARDAPIO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cardapio
-- ----------------------------
INSERT INTO `cardapio` VALUES ('Carne', 1);
INSERT INTO `cardapio` VALUES ('Peixe', 2);

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `NOME_CLIENTE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDERECO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COD_CLIENTE` int(11) NOT NULL,
  `TELEFONE` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`COD_CLIENTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente
-- ----------------------------

-- ----------------------------
-- Table structure for entregador
-- ----------------------------
DROP TABLE IF EXISTS `entregador`;
CREATE TABLE `entregador`  (
  `CELULAR` decimal(10, 0) NULL DEFAULT NULL,
  `FK_FUNCIONARIO_COD_FUNCIONARIO` int(11) NOT NULL,
  PRIMARY KEY (`FK_FUNCIONARIO_COD_FUNCIONARIO`) USING BTREE,
  CONSTRAINT `FK_ENTREGADOR_2` FOREIGN KEY (`FK_FUNCIONARIO_COD_FUNCIONARIO`) REFERENCES `funcionario` (`COD_FUNCIONARIO`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entregador
-- ----------------------------

-- ----------------------------
-- Table structure for funcionario
-- ----------------------------
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario`  (
  `NOME_FUNCIONARIO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENDERECO` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COD_FUNCIONARIO` int(11) NOT NULL,
  `TELEFONE` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`COD_FUNCIONARIO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of funcionario
-- ----------------------------

-- ----------------------------
-- Table structure for ingredientes
-- ----------------------------
DROP TABLE IF EXISTS `ingredientes`;
CREATE TABLE `ingredientes`  (
  `Observacao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ingredientes
-- ----------------------------

-- ----------------------------
-- Table structure for pedido
-- ----------------------------
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido`  (
  `DATA_EMISSAO` date NULL DEFAULT NULL,
  `NUMERO` int(11) NOT NULL,
  `FK_CLIENTE_COD_CLIENTE` int(11) NULL DEFAULT NULL,
  `FK_FUNCIONARIO_COD_FUNCIONARIO` int(11) NULL DEFAULT NULL,
  `FK_ENTREGADOR_FK_FUNCIONARIO_COD_FUNCIONARIO` int(11) NULL DEFAULT NULL,
  `FK_BAIRRO_COD_BAIRRO` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`) USING BTREE,
  INDEX `FK_PEDIDO_2`(`FK_CLIENTE_COD_CLIENTE`) USING BTREE,
  INDEX `FK_PEDIDO_3`(`FK_FUNCIONARIO_COD_FUNCIONARIO`) USING BTREE,
  INDEX `FK_PEDIDO_4`(`FK_ENTREGADOR_FK_FUNCIONARIO_COD_FUNCIONARIO`) USING BTREE,
  INDEX `FK_PEDIDO_5`(`FK_BAIRRO_COD_BAIRRO`) USING BTREE,
  CONSTRAINT `FK_PEDIDO_2` FOREIGN KEY (`FK_CLIENTE_COD_CLIENTE`) REFERENCES `cliente` (`COD_CLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PEDIDO_3` FOREIGN KEY (`FK_FUNCIONARIO_COD_FUNCIONARIO`) REFERENCES `funcionario` (`COD_FUNCIONARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PEDIDO_4` FOREIGN KEY (`FK_ENTREGADOR_FK_FUNCIONARIO_COD_FUNCIONARIO`) REFERENCES `entregador` (`FK_FUNCIONARIO_COD_FUNCIONARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PEDIDO_5` FOREIGN KEY (`FK_BAIRRO_COD_BAIRRO`) REFERENCES `bairro` (`COD_BAIRRO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pedido
-- ----------------------------
INSERT INTO `pedido` VALUES ('2020-12-15', 1, NULL, NULL, NULL, NULL);
INSERT INTO `pedido` VALUES ('2020-08-10', 2, NULL, NULL, NULL, NULL);
INSERT INTO `pedido` VALUES ('2019-04-03', 3, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pizza
-- ----------------------------
DROP TABLE IF EXISTS `pizza`;
CREATE TABLE `pizza`  (
  `FK_cardapio_COD_CARDAPIO` int(11) NULL DEFAULT NULL,
  `FK_PEDIDO_NUMERO` int(11) NULL DEFAULT NULL,
  INDEX `FK_PIZZA_1`(`FK_cardapio_COD_CARDAPIO`) USING BTREE,
  INDEX `FK_PIZZA_2`(`FK_PEDIDO_NUMERO`) USING BTREE,
  CONSTRAINT `FK_PIZZA_1` FOREIGN KEY (`FK_cardapio_COD_CARDAPIO`) REFERENCES `cardapio` (`COD_CARDAPIO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PIZZA_2` FOREIGN KEY (`FK_PEDIDO_NUMERO`) REFERENCES `pedido` (`NUMERO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pizza
-- ----------------------------

-- ----------------------------
-- Table structure for pizza_ingredientes
-- ----------------------------
DROP TABLE IF EXISTS `pizza_ingredientes`;
CREATE TABLE `pizza_ingredientes`  (
  `Observacao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pizza_ingredientes
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
