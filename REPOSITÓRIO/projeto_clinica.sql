/*
 Navicat Premium Data Transfer

 Source Server         : Projeto_mineracao
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : projeto_clinica

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 14/12/2020 14:55:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for andar
-- ----------------------------
DROP TABLE IF EXISTS `andar`;
CREATE TABLE `andar`  (
  `cod_andar` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cod_andar`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of andar
-- ----------------------------

-- ----------------------------
-- Table structure for especialidade
-- ----------------------------
DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE `especialidade`  (
  `cod_especialidade` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cod_especialidade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of especialidade
-- ----------------------------

-- ----------------------------
-- Table structure for medico
-- ----------------------------
DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico`  (
  `CRM` decimal(10, 0) NOT NULL,
  `salario` float NULL DEFAULT NULL,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fk_especialidade_cod_especialidade` int(11) NULL DEFAULT NULL,
  `horario` time(0) NULL DEFAULT NULL,
  PRIMARY KEY (`CRM`) USING BTREE,
  INDEX `FK_medico_2`(`fk_especialidade_cod_especialidade`) USING BTREE,
  CONSTRAINT `FK_medico_2` FOREIGN KEY (`fk_especialidade_cod_especialidade`) REFERENCES `especialidade` (`cod_especialidade`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medico
-- ----------------------------

-- ----------------------------
-- Table structure for medico_paciente
-- ----------------------------
DROP TABLE IF EXISTS `medico_paciente`;
CREATE TABLE `medico_paciente`  (
  `fk_paciente_CPF` decimal(10, 0) NULL DEFAULT NULL,
  `fk_medico_CRM` decimal(10, 0) NULL DEFAULT NULL,
  INDEX `FK_medico_paciente_1`(`fk_paciente_CPF`) USING BTREE,
  INDEX `FK_medico_paciente_2`(`fk_medico_CRM`) USING BTREE,
  CONSTRAINT `FK_medico_paciente_1` FOREIGN KEY (`fk_paciente_CPF`) REFERENCES `medico` (`CRM`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_medico_paciente_2` FOREIGN KEY (`fk_medico_CRM`) REFERENCES `medico` (`CRM`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of medico_paciente
-- ----------------------------

-- ----------------------------
-- Table structure for quarto_paciente
-- ----------------------------
DROP TABLE IF EXISTS `quarto_paciente`;
CREATE TABLE `quarto_paciente`  (
  `numero` int(11) NOT NULL,
  `CPF` decimal(10, 0) NOT NULL,
  `NOME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fk_telefone_telefone_PK` int(11) NULL DEFAULT NULL,
  `endereco` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_nascimento` date NULL DEFAULT NULL,
  `RG` decimal(10, 0) NULL DEFAULT NULL,
  `fk_medico_CRM` decimal(10, 0) NULL DEFAULT NULL,
  `fk_andar_cod_andar` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`numero`, `CPF`) USING BTREE,
  INDEX `FK_quarto_paciente_2`(`fk_telefone_telefone_PK`) USING BTREE,
  INDEX `FK_quarto_paciente_3`(`fk_medico_CRM`) USING BTREE,
  INDEX `FK_quarto_paciente_4`(`fk_andar_cod_andar`) USING BTREE,
  CONSTRAINT `FK_quarto_paciente_2` FOREIGN KEY (`fk_telefone_telefone_PK`) REFERENCES `telefone` (`telefone_PK`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_quarto_paciente_3` FOREIGN KEY (`fk_medico_CRM`) REFERENCES `medico` (`CRM`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_quarto_paciente_4` FOREIGN KEY (`fk_andar_cod_andar`) REFERENCES `andar` (`cod_andar`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quarto_paciente
-- ----------------------------

-- ----------------------------
-- Table structure for telefone
-- ----------------------------
DROP TABLE IF EXISTS `telefone`;
CREATE TABLE `telefone`  (
  `telefone_PK` int(11) NOT NULL,
  `telefone` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`telefone_PK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of telefone
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
