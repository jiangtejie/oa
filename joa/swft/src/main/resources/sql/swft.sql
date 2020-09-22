-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: swft
-- ------------------------------------------------------
-- Server version	5.5.27-log

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
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('2',1,'processes/MyProcess.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"ç”³è¯·è¯·å‡\" activiti:assignee=\"${user}\" activiti:candidateUsers=\"${user}\" activiti:candidateGroups=\"user\">\n      <extensionElements>\n        <activiti:formProperty id=\"dayNum\" name=\"è¯·å‡å¤©æ•°\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"type\" name=\"è¯·å‡ç±»å‹\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"username\" name=\"è¯·å‡äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"userId\" name=\"è¯·å‡äººID\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"éƒ¨é—¨å®¡æ ¸\" activiti:assignee=\"dept\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"æ˜¯å¦åŒæ„\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"å®¡æ‰¹äººID\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"å®¡æ‰¹äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"æ€»ç»ç†å®¡æ ¸\" activiti:assignee=\"manager\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"æ˜¯å¦åŒæ„\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"å®¡æ‰¹äººid\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"å®¡æ‰¹äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum < 1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum >= 1}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"exclusivegateway3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \"Y\" || isAgree == \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \'Y\' || isAgree == \'y\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"exclusivegateway3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" sourceRef=\"exclusivegateway2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"80.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"170.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"320.0\" y=\"348.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"286.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"389.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"397.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"294.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"115.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"170.0\" y=\"367.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"275.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"368.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"340.0\" y=\"388.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"416.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"340.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"313.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"545.0\" y=\"416.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"417.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"545.0\" y=\"313.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"314.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"630.0\" y=\"314.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"610.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"375.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"610.0\" y=\"294.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"610.0\" y=\"437.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"218.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"395.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2502',1,'processes/MyProcess.bpmn20.xml','2501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"ç”³è¯·è¯·å‡\" activiti:assignee=\"${user}\" activiti:candidateUsers=\"${user}\" activiti:candidateGroups=\"user\">\n      <extensionElements>\n        <activiti:formProperty id=\"dayNum\" name=\"è¯·å‡å¤©æ•°\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"type\" name=\"è¯·å‡ç±»å‹\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"username\" name=\"è¯·å‡äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"userId\" name=\"è¯·å‡äººID\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"éƒ¨é—¨å®¡æ ¸\" activiti:assignee=\"dept\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"æ˜¯å¦åŒæ„\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"å®¡æ‰¹äººID\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"å®¡æ‰¹äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"æ€»ç»ç†å®¡æ ¸\" activiti:assignee=\"manager\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"æ˜¯å¦åŒæ„\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"å®¡æ‰¹äººid\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"å®¡æ‰¹äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum < 1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum >= 1}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"exclusivegateway3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \"Y\" || isAgree == \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \'Y\' || isAgree == \'y\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"exclusivegateway3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" sourceRef=\"exclusivegateway2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"80.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"170.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"320.0\" y=\"348.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"286.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"389.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"397.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"294.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"115.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"170.0\" y=\"367.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"275.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"368.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"340.0\" y=\"388.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"416.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"340.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"313.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"545.0\" y=\"416.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"417.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"545.0\" y=\"313.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"314.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"630.0\" y=\"314.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"610.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"375.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"610.0\" y=\"294.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"610.0\" y=\"437.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"218.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"395.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('2503',1,'processes/MyProcess.myProcess.png','2501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0W\0\0õ\0\0\0\Z‰<\0\06IDATx^íİ\r˜\\u}/ğ`mM{õb­­Z½¾T[õ¶V¯µÕëK­VS$ø6™™İ$Ô*åÅ*‚DP‘J}A*pQá\n¾£¢‚@D”HIQ#(‚@HxİûûggúÿÍÎìÌìóù<Ï÷™ìÿœ™äìÎÿ|sfÎ™7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`˜Ôjµ1‘”|\0\0º`2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S¼±±±_{íµŸ_³fÍ]«V­\Z;çœs¤\09÷Üsï»ğÂ¯9ï¼óåÛ¬ŒÌ\0Ğ#“)ŞÕW_ı¡.¸`lÓ¦McwŞyçØ]wİ%HÚi›D¹º#ÊÖ.ùv+ó\0ôÈd\nƒ·zõê;ÒN|¾s/ÅÈÆo‰rµ:ßnec>\0€™LağÒ[±*nÒ¶‰rµ5ßnec>\0€™LağÒç{òz)VÒ6Ê·[Ù˜\0 G&S¼NËÕ·n»öÒ“Ç®<÷ğíINcùzÒÿ(Wæ\0è™É¯“ruû-7Œ­;ûĞ±µß8ğIciY¾¾ô7Ê•ù\0\0zf2…Áë¤\\]wå×&«f®¿òëÖ—şF¹2\0@ÏL¦0x”««Î?jB©j&-Ë×—şF¹š÷ÂÆ|ğÂ|\0Ğ!å\n¯“rµîœ•JU3iY¾¾ô7%/W©PmìÛ¸U°\0`:”+<åªø)q¹j«f¡Ê¿\0:¥\\ÁàuR®ÒÙóRÕLZ–¯/ıMIËÕdEj²q\0`G”+¼NÊÕ†‹PªšIËòõ¥¿)a¹šª@Mµ\0È)W0x”«›oøñØºo6¡X¥±´,__ú›’•«N‹S§ë\0‰rƒ×I¹JÙôƒÏL(Wi,_OúŸ•«nS·ë@y)W0x•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷€rQ®`ğ¦*W·ßrÃØú‹?6¡X5“–¥uòûIÿR‚rÕkAêõş\00ü”+¼IËÕ¶mc›7œ7vÅYO(TyÒ:i]G±“!/Wı*Fız\0NÊ^»r5ÕÑªÉâ(Ö`2Äåªß…¨ß\0ÃC¹‚ÁkW®:9Z5YÒ}óÇ“Ş2¤å*/B;EvoÜv#¿_ş¸\0@¢\\Áàµ+Wyaê6ùãIoÂr• TŒNŠ¤¿gºí´`Mv¿üñ\0å\n¯]¹’beÈÊU»â“<¥¿c3¬ÖbÕÌ²–åí¾\0”—rƒ§\\?CT®&+<íŠÒ\nV»õOlŒ·šìû@ù(W0}ñûsr¥RyJ>S®ŠŸ\"•«ø¹:?² ïÀTE§]ajW°Ú­×®X5Mõ} ”+˜¾ôû¹§^¯Ÿ622ò¬|y“rUü¬\\¥Ÿ«”nJV§§]qj-Xí–ï¨X5uúı`x)W0}-;ÁÛS­V¿Ò®d)WÅOAËU§%«ÛbÓ®@¥¯Ôf¼“bÕÔíó\0€á¢\\ÁôµÙ	ş¯’y^s=åªø)x¹ÚQÉšn¡iW°®Î¾î¦X5M÷ù\0ÀÜ§\\ÁôµÙùÍ³}gX¹*~æH¹zÀÏÕ¼Ş‹L»‚ÕK±jêõyÀÜ”&ê|Œá°råÊ­X±â÷.\\ø]wİõ-Zô°J¥²säõzı‘‘G-Y²ä1£££‹±ÇG”NÎP­Vÿ*òôXş×‘¿Mos‹ü]äÒÑ˜Å‹¿ ~n^”vîbù?E^Ë^ù×øó®±În‘×Äò×EªõqKblYdøób|Eüyï¸}Käßbl¿ÈÛ\"Åø;\"ïŠñC#+#‡GŞËŒü{ä?bù‡#ÇÄø±‘ã\"\'DNŒeŸŒ|:rj|ıÙÈç\"_ˆ|9rFäë‘oÆ}ÏŠuÎ‰?¯Š\\¹0rqduäû‘ËbE~^¹*ruäšÈµ‘ŸG®¯MÜéÍsŠrUü´Ùv…Nü®ÍŸ??½~ï›ÿîw)½0?b•¾Nã½HÏ+¬ùù\0Zi’ÎÇ˜û\Z;`÷Eîl‹l‰2q[ÜŞ\Z¹9òëÈ¯\"¿Œ\\W/©4l¨—ˆŸÔÆKÅÚT2âö‘Kjãåã»µñ2r~m¼œ|;••È7\"_«—˜/ÕÆKÍéµñ’sJ£ô|2ÖùDm¼}¼6^>Ú(KGGj”¨÷ÖÆKÕaµñ’up£t9 QÆö©—³½\"+\"¯e{TÇKÜh}ÜâÚxÉ{uu¼ô½2²0•Á(‰/­—Ã×ÆËâócÙó\"yv*•Q<ŸQ/™O«—Î\'7Jh*£­µÙém$ı»½rÁ‚N%·ÈåjŞÄ#Û3SË‹’9rä*ıÎ-hYµ×#D;:rÕî,‚êõyÀÜ”&ì|Œ¹ÏvùÎouüh×nùzE/W;\Zôò¢¤àå*/U­¦[dÚ«üV×kşüùæMïù\0ÀÜg\'|8Ù®3£eç÷Šv¥ªI¹š|yQRĞrµ£RÕªÛ‚Õ®X¥ÏXµ;[`Ç+«×¾öµ÷GÖÇïÃ\'êõú›Ò[Š+•ÊäëÀP²>œl×™ÿÎbr÷ôö¿|Y+åjòåEIÁÊU§¥ªU§k²bµ£ë\\uR°¶ÿ(X/i|>3}¦ò¤ÈÚÈ–Èbìøø}yCzËmú<hş\0\00çÙ	N¶ëÌ˜ªT5)W“//JŠT®z0UÁjWœZ‹US»õvT°vø}+•Ê6>ÏøÖxmúTmüóœwD.‰±ÿ¬Ÿèæoc½ßËï\0sŠğád»‹r5ùò¢dHÊU2YÑiW˜Ú«¦vë·+X“}¿ZºtéKgbµo¼^R?#g*\\ß‹±cÒát2™tB˜ü¾\0PXvÂ‡“íZ,ÊÕäË‹’!*WI»Â³û¼Î‹US»‚µ¬ey»ï3m•Jå¡Q¸ş1ÊÕµñ³Œ¦3—Ş¹(ŠÖG\"KÒ™;.\0\nËNøp²]‹¥èåª]fjyQ2då*É‹OkQê¤X5Mv¿üñ\"]›/\n×K¢pX¿´CºÖÜï¢d}\'ò‘úÈÈÈ_Îëüï\0ƒc\'|8Ù®ÅRär%ãÂr•ä(tä©Û\"’ß/ÜeêÓuêâuîíµñëémŠÜ\Z=ë¼úø…ÆÇ:‘ß\0ÎNøp²]‹E¹*~†´\\%ı.Bı~¼¾X¶lÙŸT«Õ‰×¾ƒ#_ü\"òÛ(ZçÔÇ/LşÚøú‰ùı\0 ¯ì„\'ÛµX”«âgˆËUÒ¯BÔ¯Ç™K—.ı³(\\ãõğĞÈW#7D~cgEÙzoüùÕ‘ÿ‘ß\0¦ÍNøp²]‹E¹*~†¼\\%½£^ï_•JåÑQ®^¯‘+#gF6GnŒ±oÄíá‘E‘?Ïï\0±>œl×bQ®ŠŸ”«dºiº÷›¢p=6ÊÕnñºyDä›‘›\"¿Œ|=rXd—z½ş¨ü~\00ğád»‹rUü”¤\\%İ¥n×\nQ¸…ë5ñZú¾ÈÙ‘ßD®œ9$ÊÖ+b?Íï@ÉÙ	N¶k±(WÅO‰ÊUÒiaêt½Rˆ2õ¤xm}]ä‘s#¿ü<ò¥([ïŒ¼,ÖyD~?\0†TL\0ç§î)r~~?æ´-ó1frUü”¬\\%S§©–ªÕê“ãõ¶\Zù`c½5rm­ÏGŠ?ÿóòåËß€!/òÚ”©<òû1÷¤m™1{”«â§„å*™¬@M6ÎÔvŠÂõWñ\Z<ùPäÂ(Y·Åí†¸=-nÿOšgGGGÿ{~G\0æ Ú^9j5$”«bQ®ŠŸ’–«$/Rù×ôhåÊ•ŠÂõôx]^\Zùhä»‘Û£lı4nÿ_dÿÈ‹*•ÊCóûPpµ½Z¯ÏÜ”¶g>ÆìQ®ŠŸ—«¤Y¨ömÜ*VEê÷¢pıM¼V/|,²:rGä\'‘ÏDş-òü]wİõòûP0µöG¯µ\Z\"ÊU±(WÅOÉËUâˆÕ,[°`Áƒ£p=3^¿÷Œ|<òıÈ–È‘“#o‰<wùòåóóû0‹jí^-È×cîR®ŠE¹*~”«íì´ÌŠ+~?^ÏÿWä‘\"—5\n×å‘#{E!ûû…>$¿/\03¨öÀ£WZ\råªX”«âG¹b®¨T*¯ñÏIÅªQ°RÑJ…+¯TÀVDázv*fù}Ú^-È—3·)WÅ¢\\?ÊsYz«`¼î?·6şÖÁ“£\\ı¸Q¸Ò[‹¼>½å0½õ0¿/\0}Rk½ÊÇ™ûl×bYµjÕıwŞyç„z)F¶lÙrY”«­ùvƒ¹,#æ‚çGş­^¯:remü¤k\"ÇF–§“j¤“kä÷`\Zj£Wù8sŸíZ,]tÑ\r›6mš°S/ÅÈå—_ş™(W«óíÃ&î=æ‡EÑÚ/rjãtğ·G.®Ÿ&~i:m|:}|~_:×8’øÏñoùá¸ıVÜş(n¯‹ÜÓøs:º¸oüû¿ĞE¦)½±±±_{íµŸ_³fÍ]«V­ÚşV’¹œ´ÍÅœ{î¹÷]xá…×œwŞy‹òmVFÊU±¤ŸËx½¸uÃ†\r?w«8‰mqıºuëÎ×Í‘]òíe°hÑ¢‡ÅNş‹#ok\\è8]ğ8]øøÂÚø…G¢”=5Vİ)¿/ÿnO‹¯/4\nk~â°eC”­¯¤²•?&½«¯¾úC\\pÁXú_h;IÅIÚi›ÄNìv’”«\"J?—‘Õ‘­ùÈ¬%m‹´MJÿš­ÒÑ”ØÑÿ§ÈA‘ÏÇœrmäwµñ|0Š@-\n×Sæ)\\Û¥Ï²¥r\Zÿ6[Û§nsr<Ö#óïCkõêÕwx{Oq³qãÆ[ÒÎR¾İÊ&½@çc\00]Q¦;ı/‹¼3æ˜/E~%ë–¸=7nŠÄ*•\'å÷v£Ué\"Ğ(IQPÇ;ì°±“O>9ıÇïØÏ~ö³±{ï½wìæ›oŞşçµk×}îsŸ;øàƒór•òëxÜİóïC)½Ğ«â&m›ô¿Ñùv+å\n€AKGX\"¯ˆ9çô¶¶ÚøçŠn|;òş{M®Çç÷“­:üğÃ·—§nÜrË-c\'xb^°RÎOå-ÿŞ0TÒ[Iòz)VÒ6Ê·[Ù(W\0Ì†(Š9h—(Vï|-şüËÈM‘oEˆ±İ¢p=6¿ß\\Ò(Vç´¡t¤êì³ÏÎ{SWÖ¯_?vàækk|¯×æÏ†F§åê[7]{éÉcW{øö¤?§±|=é”+å\n€âˆ9éÏ£ ì\ZyO”«oÄ×7F~93²2Æ^¹dÉ’Çä÷+ªÆ«­ºé¦›ò®4-é­ƒ_ıêWÇ–.]ÚZ°î©¹&)Ãª“ruû-7Œ­;ûĞ±µß8ğIciY¾¾ô7Ê•r@±>.JÊ«\"ïruVÌ[¿ÜùjäĞ‘‘‘‚ñgùıf[ã3VÿõVÀ3Ï<3ïG}‘ÊÚĞZ°n§¿ÉŸÌy”«ë®üÚ„bÕÌõW~}ÂúÒß(WÊ\0sOª\'¤·ÀEl¼í.}~ë‘/G±xW,ù²eËş$¿_¯âñ?˜®–çÒÛk-\'¯HG¬)}v+;‚uUzùó‚9­“ruÕùGM(UÍ¤eùúÒß(Wó^Ø(W®—Àœ…ê/¢h-ü{Ìm«\Zg(Ü·_Œ¼cñâÅ/uş8¿_§âq™æÌx¬5N/?©Ö·¦ÏXõë­€;’>ÇÕR®RŞ?/˜Ó:)WëÎY9¡T5“–åëKSòr•\nÕæÈ¾[€a²S”©¿Œ¢SBtt”jã×àÚù\\Œ…ë%Q”vÎïØNÜg—fqi·¶×½ËßØëÉ+ºqôÑGÿW¹JÏ1şnÎŸ³,R<şøã÷ˆuÑ!‡rÓşûï¿e¯½öºwttt,ıùˆ#øÉG>ò‘Ó=öØ7¬\\¹Ò…ÌZ(WÅO‰ËU³X5Uş5\0£Rù‰â1\Zùp”‹\"·GÖG>cDáúÇE‹=,¿cz»a³¸´äˆüíw1vJsù ß˜»í¶ÛÆŞüæ7?àùµ>7fQ*JïyÏ{.yıë_ïT7»âŠ+Æ¾üå/½ûİï¾oŸ}öÙúÎw¾óò+V<9Ì²é¤\\¥³æ¥ª™´,__ú›’–«ÉŠÔdã\00´bŸ÷A•JåFyZ9&\nÉ÷\"wD®JE)ÆöBöÂêøéâór•ò­ô–ÁæãÅ×W4—u{«~¸ä’KZŸÛ†Ö¿+³äè£Şgï½÷¾+•©_üâù6Û¡-[¶l?J”²{:è æm¾L:)W.>vB©j&-Ë×—ş¦„åjª5Õr\0zQ¶~ottôQ¨öˆüg””Kâöş6Åª™M‘ç¤“]4ÇÒÁ‰Ù^µ>·‘‘‘gå?fH:ZuÈ!‡|ÿı÷¿?]œ¬é¨V”´ûßô¦7mŞ}÷İ_¯2è¤\\İ|ÃÇÖ}û°	Å*¥eùúÒß”¬\\uZœ:]\0J!¾M¡Êswääæ×é]_³e¿ıök}^Ş\Z8Şÿş÷¿iï½÷Şvê©§İ}÷İù6š¶K/½tlÅŠwíµ×^§Eƒxş}‡Y\'å*eÓ>3¡\\¥±|=éJT®º-Lİ®\0C«Z­îÖ¦LmO,»-n/«×ëéó[››ãé`³å˜ci}_Èÿ>X*Vo}ë[ïëõhÕd¶nİ:vÒI\'İ½dÉ’e*X•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷€¡’ş´”•{\"ç§\\D×ú˜øúÍõÒy\nfË7¿ùÍÖrµºõïÂ€¥·¦#Vƒ*V­:ê¨ßÄşn¬ùùóFS•«Ûo¹alıÅ›P¬šIËÒ:ùı¤)A¹êµ õz\0˜ó\ZgüXd—]D8ÖûQ³ÔÌÆÉ,š6nÜØZ®®ËŸ\'”>c•Ş\n8ÒÉ.öÜsÏ›ëõúiùóF“–«mÛÆ6o8oìŠ³P¨ò¤uÒºb\r&C^®úUŒúõ8\00Ô\ZGµ¶—š~~Ì¦[é{·”«aŞ×)–tVÀtòŠ™Üøë×¯¿7ÊÕ½©ùçÏgØ´+WS­š,b\r&C\\®ú]ˆúıx\00tÒQ¢\"¹J\'–säj†5Şx×L¼0wúé§ßëša{`»rÕÉÑªÉ’î›?ô–!-WyÚ)²{ã¶ùıòÇ€Òèä¼­oüÎw¾“ïÏ˜´ßR®|æj&qÄÏÖYLÒˆ8à€kÒEÙòç5LÚ•«¼0u›üñ¤·a¹ÊP*F\'EÒß3İvZ°&»_şø\0P\n©¤D6ÄşëWÒÉ,Ò»°Z/œÄ×ç4KÍ§?ıé|xÆ´^H8=ßÖçÈ€ì·ß~w¦C†³%6ú¯R»ÏŸ×0iW®¤X²rÕ®ø¤#OéïØL\'«µX5³¬ey»ï\0C­öÀ3>àmw-…ëëÍñÃ?<ßı1\'œpBëóû`şw¡ÏV®\\ùğw¾ó÷åb&5¯]©T’?¿a¡\\?CT®&+<íŠÒ\nV»õOlŒ·šìûÀPª×ë/lS¬&Í{î™ïşÎ˜½÷ŞûşæóHÏ;ÿ»ĞgÇü_üâóí0ãŞøÆ7ŞœZ~şüŠ.~PÏ,ÈÇsÊUñS¤rÕéÏUSv…©]Áj·^»bÕ4Õ÷€¡‘®góôíy‰jI*4ßÜÕ»é¦›òİßûéOÚúœœÌb&sÌ1§®]»6ß3îıïÿ\rµ9xÕè–Øî+WÅOÁÊUG?W™NN»âÔZ°Ú-ßQ±jêôûÀœ¶páÂ‡T«Õï¶Ì×­¹#òÏi½ÖÏ]xâ‰ùîï@¥ó\Z|ğÁ­ÏëcùßƒxßûŞwål²éK_úÒ/jsğ&m~¡Úî+WÅOAËÕ®Zt[lÚ¨ôõƒÚŒwR¬šº}\00\'D™zz:[ÌÇßŒü.ŠÓÆ6óõæÈsZî³[ëò™<3wzgZË÷¾g˜?~S(ûï¿ÿ–Ù<™ESü°İX›ƒ‡+ÛüRµİV®ŠŸ‚—«¶?W\rÓ-4í\nÖÕÙ×İ«¦é>\0(Œ‘‘‘?rT‰|\"æŞtàg‘¢T½6Š=şüÄl¾*–=-œÖS²xàÛ(\rZ:p2::ÚúÜµš)é~&6òTî¾ûî­iãçÏ¯è²_ªvÙ¾3¬\\?s¤\\=àçj^ïE¦]Áê¥X5õú¼\0`F¥ÏQ-^¼øQŞsìšÈï\"gÆ×ûT*•§æë\'±|Cc^¾4Öyt¾<É^}õ«_Íwƒû*ö©ÓeşëûÅ÷¿e²çÆ\0ìµ×^÷ám7ŞxãÚlçq¨¢\\?ù6+zâ…rlşüù©õz¸ôVÀüˆUú:÷\"=¯T°†úá\0Ì]1Ÿ>1ÊÓ›âöK©„Äíãë#£d½$æÙ?È×ÏÅúÇ¥ÏUÅºÍ—µjıìÕÒ¥Kzr‹SO=õûéï—?(½-p6¯\Zİ´fÍš/Ô†ã3WÍœ_›#oœ7ñˆÅöÌÔò¢d¹zÀÏÕ¼ŞíèÈU»³vª×ç\0}—JP”]c.ıXd}mü3RŸ‰b5\Z¥çÏòõ§’>Ç”xåã¹øŒïs]s>OG–ú}p#±JÅ*{;àqùsaÀŞõ®wız6¯\ZİtÊ)§||.^5ºƒßíŠ^®v46èåEIÁËUÛŸ«†é™vÅ*?‚5‚5İç\0ı¶Sì_>;ÊÍ;Ó\\\Z··Åí¹1v`ä™iy~‡A©_ëæÜ`}öÙù.ñ´¤¢ÖúVÀ”t´¬“âGŸuÔQÏæU£›öİwßOÇÂaùó+ºw~•«,/J\nZ®vøsÕ¢ÛBÓ®X¥ÏXµ;[`7«Ûç\0}µdÉ’ÇD±Ø=æÏÿ¹)ò“øú#Q¦îºë®”¯?“ây¼¶ÖR°R>úè±Ûn»-ß5îH:oB:+`v´j{±šê­ŠÈG?úÑ³yÕè†­ñCpÍÈÈÈ³òçWtîü*W“//J\nV®:ú¹ÊtZl&+VÍÕny\'«Óï\0}“®9µxñâ—Æ¼ùÁHúÿÍ±_ùù¸}}ääëÏ¶4¿×²¿ùÍoûáØñIæ¶lÙ2vÅWä×±jæ8G¬fÑòåËçï¾ûî÷mŞ¼9ßn3fıúõWÆÂ†ü¹\råjòåEI‘ÊU¦*8íŠSk±jj·Ş\nÖTß\0ú¦R©üÏØwÜ?ò­Æ[ı¾[­Vß·Ï]¹re¯\'d\Z¸t@!ëUy1zÃŞpÿ	\'œ0vÉ%—l¿&Vº\\Rú,ÕÆ·¿…ğØcğö¿fÒ	9œ¼¢ Şñw¬;óÌ3óÎ3c=ôĞÔæà[»¡\\M¾¼(’r•LVtÚ¦vÅª©İúí\nÖdß\0ú\"ÊÔ#¢8,ıÅ“jã\'†Øeâø¸}u,Û9_.HG—âù¿½q–Â	e©‹¤·~ÌéÖ$Zòß¥£W³q1áï}ï{ÓUº[ş¼†‰r5ùò¢dˆÊUÒ®ğì>¯óbÕÔ®`-kYŞîû\0@ORñhœ\0âˆÈ%‘[cñk‘·ŒŒüe¾ş\\–JQãïÙ¼fV§I%3•ª§äI¼ño<ïè£¾?/?ƒtÛm·İ3::ša¾->Ã¦èåª]fjyQ2då*É‹OkQê¤X5Mv¿üñ`Ú¢4ıE”…½ÒÙ£Gs.‹¼?ö_¼bÅŠßÏ×F·¦¢µıEÕ,R«Ó¿MÜ~0Ïü¾LÚ˜‘û.½ôÒ¼\rÌA”>t¸!}î+>Ã¦ÈåJÆ3„å*ÉP*FéÈS§Åª)¿_ş¸\0Ğ•E‹=,öEaøÏ´?ùeäS‘‘J¥ò§ùú0çŒ¾gÅŠwmİº5ïA}wöÙg§_¢Ûãêoòç1Œ”«âgHËUÒï\"ÔïÇ Ò‰&bßï9‘ƒëõúwÒ‰(Ò)Ããëÿû ÏÈ×‡¡°Ç{\\xÒI\'İ—¡~ºñÆ·ŒŒŒü6~™vÉ¿ÿ°R®ŠŸ!.WI¿\nQ¿€ˆ}½?,uZÜş:nÓ¢?·¯¨T*˜¯C\'~Ø¹dÉ’GuÔoÒ9ôû-±JÅªZ­î›ïa¦\\?C^®’^‹Q¯÷`È¥zÄ>Ş¿DuEä7‘ÏEö}\\¾>”B:s_ü|wÏ=÷¼yıúõ]Íl\néäÏX¥‹¦•æˆU“rUü” \\%Ó-HÓ½\0C®^¯ÿu”©\"g5®9uQä‘‘‘˜×œ‚‘şç!ÂÜ{úé§ßĞé£ÛI§[OgŒ_´\reùŒUN¹*~JR®’n‹R·ë0Ä–-[ö\'±?W‹}ÄOÆ¾İõ‘‘ãâëWÅşŞÏ×Z¤£LñËrÍşûï¿aíÚµWEWêèlé-…?üá7¿ûİï¾,N3ãme8+àd”«â§Då*é´0uº\0Cªq±ÛÅ¾Ü{ãöû‘[#_¯ßì\ZK0\r÷ÏîùQü2]·Ï>ûœzÊ)§||Íš5_¸ñÆ×Ş}÷İ[×¯_ãgœñó#<òú½öÚëÆÚø9ùÓöwB¹*~JV®’©ŠÓTËR±Ï÷äTb?îŒF™º4ò¾Å‹ÿcY®93\"ıEüÂ½«¶ã‹›–®›•ß·Ì”«â§„å*™¬@M6ÀJoç‹}¸İbîã‘k\"7DNn¼ıï‘ùú\0³J¹*~JZ®’¼Hå_0dÒ‰&¢8ı}¨C\"6NDqvúGY?Ì!ÊUñSâr•4UºD‚b0„*•Êc£8í%êôÚø)Ò×E™úû—2.˜ƒ”«â§äå*yaz‹oºÍ\00÷¤‹ôŒŒ¼<^Û?”ŠTmü\"¾§¥‚•ŠV¾>Àœ¡\\?ÊÕö³ƒ–şß HÆÆÆ|íµ×~~Íš5w­ZµjûÏ¨Ì~Î=÷Üû.¼ğÂkÎ;ï¼Eù6ƒÙ6::úŒôÖ¾x=ÿvã­~6>+ÿ×œ†Fšóy)VÒ6Ê·[Ù(WÅrõÕWè‚.Û´iÓØwŞ9ágVf\'i[¤måêxİØ%ßn0“ÒÉ&\"õxışTmü$×D™úÏtrŠE‹=,_`((WÅr¥\\ÍêÕ«ïH;ñùÏª#7n¼%^7VçÛ\r)=ºÔ‹ãõú}‘¤k‰Æíq»÷ÈÈÈ_äë¥U«Vİï‹›-[¶\\;I[óíV6ÊU±¤·zİ(nÒ¶ñºÁLH—Á‰×ç·DúZmüšSéB¾GD^”.ğ›¯0ô.ºè¢ütqsùå—Æÿ@+WEãˆwñãˆ7ƒ®9¯Ç¯¹6r}½^ÿdÜV—-[ö\'ùú\0¥“>ø¼jÕª[7lØğó¹ş?ÑÛ¶m›06WÛâúuëÖ;H›}vB¹*šNËÕ·n»öÒ“Ç®<÷ğíINcùzÒÿ(WôC:ÑÄÈÈÈ?Äkğ¡‘ï¦QT«Õ³âÏûÇŸÿ:_€yÛw”vIGGÒÛHÒ„<ó©O}j,í€çãs8i[¤mRúb•(WÅ’~Fóù<·ßrÃØº³[û4––åëK“¶Q¾İ £££‹×Ü×G>ùM”©G2õ2×œ(‰˜\0ÖFîÍÇÊU±tR®®»òkŠU3×_ùõ	ëK£\\m§t`×]wı£(N¯ˆõáx­ıIä¦Ègcl÷%K–<&_€!ÂhÚùN‰Éàiùræ>åªX:)WWÔ„RÕLZ–¯/ırµı¢ã›·db®üÛ˜;ŒÛs\Z×œº rğÈÈÈßÅâòõ(‰t6¢˜64ËUää|æ>åªX:)WëÎY9¡T5“–åëKSòrÕ,Vû6nK_°*•ÊŸÆëèH©OÇíæÈúÈ±ñõ®±ì¡ùú\0”TµZİ·¥X¥l‰âÑùzÌmÊU±(WÅO‰ËU~Ä*ÿºbüƒxİ\\åéÈ¸½¬qÍ©/GöŠeOÊ×€yË—/xãàZËUÊóu™Û”«bé¤\\¥³æ¥ª™´,__ú›’–«ÉŠÔdãC%\nÔ_EŞ\Z¯—_ü.²&røâÅ‹_àšS\0L)&ÃÚ«±ô?t©xåë3w)WÅÒI¹Úpñ±JU3iY¾¾ô7%,WS¨©–Ï9•Jeç˜ï^¯\'D6E~9±^¯/eÈ×€I¥·şÅ$r{^¬š‰Éåmù}˜»”«bé¤\\İ|ÃÇÖ}û°	Å*¥eùúÒß”¬\\uZœ:]¯bŞû½(SÏ‹¼;^/nœˆâ›q»_Œ==_\0:V¿:ü„RÕ’Í®Ç1<”«bé¤\\¥lúÁg&”«4–¯\'ıO‰ÊU·…©ÛõgUªÇGyzC¼~!rsdm|ıï‹/~éÂ…’¯\0]kµJgLoƒ¸®M±j½Ú=¿/s“rU,•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷¸tÍ©‘‘‘ùë#ñºwUäÆøó©Õju™“50cbòyUL>_iœšı‰)1öÈ|=æ&åªX¦*W·ßrÃØú‹?6¡X5“–¥uòûIÿR‚rÕkAêõşı²SÌ]ÏŒùê x[Õx«ßù1öÈ³Óòü\00p1	ÕbR:-g8(WÅ2i¹Ú¶mló†óÆ®8ëà	…*OZ\'­ë(Ö`2äåª_Å¨_Ó•˜«Y¯kŸ‰ü*ruÌaÇD^¹téÒÿ–¯\03.&§å5ZÊU±´+WS­š,b\r&C\\®ú]ˆúıx¤kN-^¼ø%ñ:ö(P?ŠÛßF¾Y‘Şe‘¯\0³.&¨½\"ÇåãåªXÚ•«NVM–tßüñ¤·i¹Ê‹PzË\\úlm·oËï—?nÏ¢P=5^·ş-rfmüšS«#+#ÏOgıË×€BiœŠöÃù8ÃA¹*–vå*/Lİ&<é-CX®ò”ŠÑI‘ô÷L·¬Éî—?~WÒµczm¼VıßÈÏ\"?9éqûº‘‘‘?Î×€BKş‰íÈ|œá \\ÍŒtB˜|¬våJŠ•!+WíŠO:ò”şÍtR°Z‹U3ËZ–·û>m¥£O1çüïÆÑ¨ï¥£S1}#­Šñ§åëÀœÒ˜àËÇÊÕÌˆç\réS•,åªø¢r5YáiW”vT°Ú­bc¼ÕdßoŞÈÈÈâwäQ¢¾·¿MŸŸŠ¿3ÿ”>W•¯\0sVLtˆ¼=g8(W3#ı;7rEì4î–/oR®ŠŸ\"•«øy:?² ïÀ¤E§¡]ajW°Ú­×®X5mÿ¾;ï¼óKãyï’Îäê§µñ3ûYšÎø—ß	\0†FLt‰	pß|œá \\ÍŒ–rµ=ÿ™ŸP²”«â§`åªù3ÕMÉšªX5µ+N­«İò«íæÏŸÿ’×¼æ5÷½úÕ¯¾,óÛGFF5oŠû\0ÀĞˆÀã£`½)g8(W3#/W­%+v._Ş\\O¹*~\nZ®:-Y«¦v*}ı 6ãS«¦T°æu÷<\0`8ÄDı©ôY‘|œáĞØ!»/rOd[äÎÈí‘[kã×ŒùuäÆÈ/#×G~¹6rMäêÈU‘uQ~Ü¸ÎLúßèï×ÆO|qäÂÈ‘UñstN¬sVüù›‘¯GÎˆ|9ò…Èç\"ŸuN|:òÉøúÄÈ	‘ã\"Ç¦·E>Ëş#òïéD+1ş¾ÈáµñÏ\ZËßU?	ËA‘·Eö«Ÿ¶ù-1¾wÜ®ˆ±7ÄŸ÷ˆ,‹?/‰Ôc¼\Zy]Œ½&QŠ¡]£ôük*>ñç—Eş)–/ˆ¼hñâÅ/ˆuËş!òwéŞcùßFş:ÆŸù«J¥ò”È“\"}\\mâNpâq^¢\\?/W;*Yİ«¦vëêìë‹U‹é>\0˜»b‚>=RÍÇ+W®|P:ÑÂÂ…eà#ìœNs…á‘K—.ı³%K–<&Æ›ÊB*\rQ œJD,Z*Q ‘JFŒ=;ò÷©|ÄÏÍó#/Šå/Nå$JÉKSY‰e#¯L%&–¿:òºX¾8•œM¥\'²GŒ¿¾6~1Ğt­µ·Äâ}êã—8 r`ä1~päĞÈa‘Ãcù{#GÆ²£\"GG>ãùxä„ûD¬óÉÈ§kãŸóølmüç<•¼tÒ3b¯E¾Q/ƒß¬ªï°¦²øİÚxy¼$òƒêx©\\YùIm¼tn¨—ĞTF¯«MÜùÍsŠrUüÌ‘rÕÌùµñ’Õk‘iW°z)VM½>/\0˜[jã;š>t®ÍNïöÄïÖW\"Ïk®§\\?ù6,z*•ÊØüùóS	êõ³³é­€ù«ôu\ZïEz^©`ÍÏ\0ÀĞIÿsßú™ {ùo*Uò?@‘ÊÕ¼‰G(¶§(Ëg+säÈÕùµ¾-°×#D;:rÕî,‚êõyÀÜôém]ù8Ğ¹Æï=ñ»tZ»RÕT´rµ£±Ù^>[)x¹ÊKU«é™vÅ*?‚5‚5İç\0sWLÔk\"ÏÍÇÎÅïĞÉé$ùxN¹ê|ùl¥ åjG¥ªU·…¦]±JŸ±jw¶Àn\nV·Ï\0†CLØ—W«Õgæã@ÿ)W/Ÿ­¬\\uZªZuZl&+VÍÕny\'«Óï\0Ã§^¯ÿ´R©<5úO¹ê|ùl¥HåªSœvÅ©µX5µ[oGkªï\0Ã­V«ılddä	ù8ĞÊUçËg+CR®’ÉŠN»ÂÔ®X5µ[¿]Ášìû@yD¹úU½^T>ôŸrÕùòÙÊ•«¤]áÙ}^çÅª©]ÁZÖ²¼İ÷€ò‰rukº l>ô_ÑÊU»eùleÈÊU’ŸÖ¢ÔI±jšì~ùã@yE¹Ú¶páÂ‡äã@ÿ©\\Iûa¹Jò”ŠQ:òÔi±jÊï—?.\0”ÚNQ®îÏÁP®ŠŸ!-WI¿‹P¿\0æ¶åË—Ïrµ5C¹*~†¸\\%ı*Dız\0Q®^­VoÉÇÁP®ŠŸ!/WI¯Å¨×ûÀpªT*®Õji’f€rUü” \\%Ó-HÓ½\0¿(VOŒlÊÇÁP®ŠŸ’”«¤Û¢Ôíú\0P.õzıiQ®®ÊÇÁP®ŠŸ•«¤ÓÂÔéz\0P^###ÏªV«?ÊÇÁP®ŠŸ’•«dªâ4Õr\0 ‰bõ¼Z­¶:C¹*~JX®’É\nÔdã\0@.ŠÕ‚Èùù80ÊUñSÒr•äE*ÿ\Z\0Ø‘z½şŠ(WßÊÇÁP®ŠŸ—«¤Y¨ömÜ*V\0Ğ©(W¯ªV«_ÉÇÁP®ŠŸ’—«ä…µZ-ı(V\0Ğ(Vµ(X§åãÀ`(WÅrµı-ã¥ÿ7\0€®Åº<rr>†rUü(WÊ\0LKL {EËÇÁP®ŠåJ¹€i©×ëûU«ÕçãÀ`¬Zµêş;ï¼sÂ½#[¶l¹,ÊÕÖ|»•r\0ÓÅêQ°ÌÇÁ¸è¢‹nØ´iÓ„z)F.¿üòÏD¹*ıµÿ”+\0˜†˜@WFËÇÁ8ï¼ó­ZµêÖ\r6üÜ¬â$¶ÅõëÖ­;;ŠÕæÈ.ùv+å\n\0¦!&ĞDŞƒ“vŞÓÑ‘ôö³ôù)DÒ¶HÛ¤ôÅ*Q®\0`\ZêõúGªÕjºX$\0l§\\À4D±:>\nÖ›òq\0ÊK¹€iˆ	ôSQ®vÏÇ(/å\n\0¦!&ĞÓ#Õ|€òR®\0`\Zb=£Z­î–P^Ê\0LC«³FFF^P^Ê\0LCL Ôëõçã\0”—r\0ÓèšÈsóq\0ÊK¹€iˆ	ôòjµúÌ|€òR®\0`\ZêõúO+•ÊSóq\0ÊK¹€iˆ	ôg###OÈÇ(/å\n\0¦!&Ğ_ÕëõGåã\0”—r\0Óè­•Jeç|€òR®\0`\Zbİ¶páÂ‡äã\0”—r\0İÛ)&ĞûóA\0ÊM¹€.-_¾|~L [óq\0ÊM¹€.E¹zxµZ½% Ü”+\0èR¥RytL ›óq\0ÊM¹€.ÅäùÄÈ¦|€rS®\0 Kõzıi1^•PnÊ\0tiddäYÕjõGù8\0å¦\\@—¢X=/&ĞÕù8\0å¦\\@—bò\\9? Ü”+\0èR½^EL ßÊÇ(7å\n\0ºåêUÕjõ+ù8\0å¦\\@—¢XÕ¢`–PnÊ\0t)&Ïå‘“óq\0ÊM¹€.Åä¹Wä¸|€rS®\0 Kõz}¿jµúá|€rS®\0 KQ¬ŞëÈ|€rS®\0 K1y®Œ–PnÊ\0t)&ÏDŞPnÊ\0t©^¯¤Z­î›PnÊ\0t)ŠÕñQ°Ş”PnÊ\0t)&ÏOE¹Ú= Ü”+\0èRL§Gªù8\0å¦\\@—bò<£Z­î–PnÊ\0t)ŠÕY###/ÏÇ(7å\n\0º“çõzıÅù8\0å¦\\@—bò\\yn>@¹)W\0Ğ¥˜</¯V«ÏÌÇ(7å\n\0ºT¯×Z©TšPnÊ\0t)&ÏŸŒŒ<! Ü”+\0èRL¿ª×ëÊÇ(7å\n\0º“ç­•Jeç|€rS®\0 K1yn[¸páCòq\0ÊM¹€îì”&O‘vÉ\'\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 óÿy©ı>Mºu\0\0\0\0IEND®B`‚',1),('3',1,'processes/MyProcess.myProcess.png','1','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0W\0\0õ\0\0\0\Z‰<\0\06IDATx^íİ\r˜\\u}/ğ`mM{õb­­Z½¾T[õ¶V¯µÕëK­VS$ø6™™İ$Ô*åÅ*‚DP‘J}A*pQá\n¾£¢‚@D”HIQ#(‚@HxİûûggúÿÍÎìÌìóù<Ï÷™ìÿœ™äìÎÿ|sfÎ™7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`˜Ôjµ1‘”|\0\0º`2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S¼±±±_{íµŸ_³fÍ]«V­\Z;çœs¤\09÷Üsï»ğÂ¯9ï¼óåÛ¬ŒÌ\0Ğ#“)ŞÕW_ı¡.¸`lÓ¦McwŞyçØ]wİ%HÚi›D¹º#ÊÖ.ùv+ó\0ôÈd\nƒ·zõê;ÒN|¾s/ÅÈÆo‰rµ:ßnec>\0€™LağÒ[±*nÒ¶‰rµ5ßnec>\0€™LağÒç{òz)VÒ6Ê·[Ù˜\0 G&S¼NËÕ·n»öÒ“Ç®<÷ğíINcùzÒÿ(Wæ\0è™É¯“ruû-7Œ­;ûĞ±µß8ğIciY¾¾ô7Ê•ù\0\0zf2…Áë¤\\]wå×&«f®¿òëÖ—şF¹2\0@ÏL¦0x”««Î?jB©j&-Ë×—şF¹š÷ÂÆ|ğÂ|\0Ğ!å\n¯“rµîœ•JU3iY¾¾ô7%/W©PmìÛ¸U°\0`:”+<åªø)q¹j«f¡Ê¿\0:¥\\ÁàuR®ÒÙóRÕLZ–¯/ıMIËÕdEj²q\0`G”+¼NÊÕ†‹PªšIËòõ¥¿)a¹šª@Mµ\0È)W0x”«›oøñØºo6¡X¥±´,__ú›’•«N‹S§ë\0‰rƒ×I¹JÙôƒÏL(Wi,_OúŸ•«nS·ë@y)W0x•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷€rQ®`ğ¦*W·ßrÃØú‹?6¡X5“–¥uòûIÿR‚rÕkAêõş\00ü”+¼IËÕ¶mc›7œ7vÅYO(TyÒ:i]G±“!/Wı*Fız\0NÊ^»r5ÕÑªÉâ(Ö`2Äåªß…¨ß\0ÃC¹‚ÁkW®:9Z5YÒ}óÇ“Ş2¤å*/B;EvoÜv#¿_ş¸\0@¢\\Áàµ+Wyaê6ùãIoÂr• TŒNŠ¤¿gºí´`Mv¿üñ\0å\n¯]¹’beÈÊU»â“<¥¿c3¬ÖbÕÌ²–åí¾\0”—rƒ§\\?CT®&+<íŠÒ\nV»õOlŒ·šìû@ù(W0}ñûsr¥RyJ>S®ŠŸ\"•«ø¹:?² ïÀTE§]ajW°Ú­×®X5Mõ} ”+˜¾ôû¹§^¯Ÿ622ò¬|y“rUü¬\\¥Ÿ«”nJV§§]qj-Xí–ï¨X5uúı`x)W0}-;ÁÛS­V¿Ò®d)WÅOAËU§%«ÛbÓ®@¥¯Ôf¼“bÕÔíó\0€á¢\\ÁôµÙ	ş¯’y^s=åªø)x¹ÚQÉšn¡iW°®Î¾î¦X5M÷ù\0ÀÜ§\\ÁôµÙùÍ³}gX¹*~æH¹zÀÏÕ¼Ş‹L»‚ÕK±jêõyÀÜ”&ê|Œá°råÊ­X±â÷.\\ø]wİõ-Zô°J¥²säõzı‘‘G-Y²ä1£££‹±ÇG”NÎP­Vÿ*òôXş×‘¿Mos‹ü]äÒÑ˜Å‹¿ ~n^”vîbù?E^Ë^ù×øó®±În‘×Äò×EªõqKblYdøób|Eüyï¸}Käßbl¿ÈÛ\"Åø;\"ïŠñC#+#‡GŞËŒü{ä?bù‡#ÇÄø±‘ã\"\'DNŒeŸŒ|:rj|ıÙÈç\"_ˆ|9rFäë‘oÆ}ÏŠuÎ‰?¯Š\\¹0rqduäû‘ËbE~^¹*ruäšÈµ‘ŸG®¯MÜéÍsŠrUü´Ùv…Nü®ÍŸ??½~ï›ÿîw)½0?b•¾Nã½HÏ+¬ùù\0Zi’ÎÇ˜û\Z;`÷Eîl‹l‰2q[ÜŞ\Z¹9òëÈ¯\"¿Œ\\W/©4l¨—ˆŸÔÆKÅÚT2âö‘Kjãåã»µñ2r~m¼œ|;••È7\"_«—˜/ÕÆKÍéµñ’sJ£ô|2ÖùDm¼}¼6^>Ú(KGGj”¨÷ÖÆKÕaµñ’up£t9 QÆö©—³½\"+\"¯e{TÇKÜh}ÜâÚxÉ{uu¼ô½2²0•Á(‰/­—Ã×ÆËâócÙó\"yv*•Q<ŸQ/™O«—Î\'7Jh*£­µÙém$ı»½rÁ‚N%·ÈåjŞÄ#Û3SË‹’9rä*ıÎ-hYµ×#D;:rÕî,‚êõyÀÜ”&ì|Œ¹ÏvùÎouüh×nùzE/W;\Zôò¢¤àå*/U­¦[dÚ«üV×kşüùæMïù\0ÀÜg\'|8Ù®3£eç÷Šv¥ªI¹š|yQRĞrµ£RÕªÛ‚Õ®X¥ÏXµ;[`Ç+«×¾öµ÷GÖÇïÃ\'êõú›Ò[Š+•ÊäëÀP²>œl×™ÿÎbr÷ôö¿|Y+åjòåEIÁÊU§¥ªU§k²bµ£ë\\uR°¶ÿ(X/i|>3}¦ò¤ÈÚÈ–Èbìøø}yCzËmú<hş\0\00çÙ	N¶ëÌ˜ªT5)W“//JŠT®z0UÁjWœZ‹US»õvT°vø}+•Ê6>ÏøÖxmúTmüóœwD.‰±ÿ¬Ÿèæoc½ßËï\0sŠğád»‹r5ùò¢dHÊU2YÑiW˜Ú«¦vë·+X“}¿ZºtéKgbµo¼^R?#g*\\ß‹±cÒát2™tB˜ü¾\0PXvÂ‡“íZ,ÊÕäË‹’!*WI»Â³û¼Î‹US»‚µ¬ey»ï3m•Jå¡Q¸ş1ÊÕµñ³Œ¦3—Ş¹(ŠÖG\"KÒ™;.\0\nËNøp²]‹¥èåª]fjyQ2då*É‹OkQê¤X5Mv¿üñ\"]›/\n×K¢pX¿´CºÖÜï¢d}\'ò‘úÈÈÈ_Îëüï\0ƒc\'|8Ù®ÅRär%ãÂr•ä(tä©Û\"’ß/ÜeêÓuêâuîíµñëémŠÜ\Z=ë¼úø…ÆÇ:‘ß\0ÎNøp²]‹E¹*~†´\\%ı.Bı~¼¾X¶lÙŸT«Õ‰×¾ƒ#_ü\"òÛ(ZçÔÇ/LşÚøú‰ùı\0 ¯ì„\'ÛµX”«âgˆËUÒ¯BÔ¯Ç™K—.ı³(\\ãõğĞÈW#7D~cgEÙzoüùÕ‘ÿ‘ß\0¦ÍNøp²]‹E¹*~†¼\\%½£^ï_•JåÑQ®^¯‘+#gF6GnŒ±oÄíá‘E‘?Ïï\0±>œl×bQ®ŠŸ”«dºiº÷›¢p=6ÊÕnñºyDä›‘›\"¿Œ|=rXd—z½ş¨ü~\00ğád»‹rUü”¤\\%İ¥n×\nQ¸…ë5ñZú¾ÈÙ‘ßD®œ9$ÊÖ+b?Íï@ÉÙ	N¶k±(WÅO‰ÊUÒiaêt½Rˆ2õ¤xm}]ä‘s#¿ü<ò¥([ïŒ¼,ÖyD~?\0†TL\0ç§î)r~~?æ´-ó1frUü”¬\\%S§©–ªÕê“ãõ¶\Zù`c½5rm­ÏGŠ?ÿóòåËß€!/òÚ”©<òû1÷¤m™1{”«â§„å*™¬@M6ÎÔvŠÂõWñ\Z<ùPäÂ(Y·Åí†¸=-nÿOšgGGGÿ{~G\0æ Ú^9j5$”«bQ®ŠŸ’–«$/Rù×ôhåÊ•ŠÂõôx]^\Zùhä»‘Û£lı4nÿ_dÿÈ‹*•ÊCóûPpµ½Z¯ÏÜ”¶g>ÆìQ®ŠŸ—«¤Y¨ömÜ*VEê÷¢pıM¼V/|,²:rGä\'‘ÏDş-òü]wİõòûP0µöG¯µ\Z\"ÊU±(WÅOÉËUâˆÕ,[°`Áƒ£p=3^¿÷Œ|<òıÈ–È‘“#o‰<wùòåóóû0‹jí^-È×cîR®ŠE¹*~”«íì´ÌŠ+~?^ÏÿWä‘\"—5\n×å‘#{E!ûû…>$¿/\03¨öÀ£WZ\råªX”«âG¹b®¨T*¯ñÏIÅªQ°RÑJ…+¯TÀVDázv*fù}Ú^-È—3·)WÅ¢\\?ÊsYz«`¼î?·6şÖÁ“£\\ı¸Q¸Ò[‹¼>½å0½õ0¿/\0}Rk½ÊÇ™ûl×bYµjÕıwŞyç„z)F¶lÙrY”«­ùvƒ¹,#æ‚çGş­^¯:remü¤k\"ÇF–§“j¤“kä÷`\Zj£Wù8sŸíZ,]tÑ\r›6mš°S/ÅÈå—_ş™(W«óíÃ&î=æ‡EÑÚ/rjãtğ·G.®Ÿ&~i:m|:}|~_:×8’øÏñoùá¸ıVÜş(n¯‹ÜÓøs:º¸oüû¿ĞE¦)½±±±_{íµŸ_³fÍ]«V­ÚşV’¹œ´ÍÅœ{î¹÷]xá…×œwŞy‹òmVFÊU±¤ŸËx½¸uÃ†\r?w«8‰mqıºuëÎ×Í‘]òíe°hÑ¢‡ÅNş‹#ok\\è8]ğ8]øøÂÚø…G¢”=5Vİ)¿/ÿnO‹¯/4\nk~â°eC”­¯¤²•?&½«¯¾úC\\pÁXú_h;IÅIÚi›ÄNìv’”«\"J?—‘Õ‘­ùÈ¬%m‹´MJÿš­ÒÑ”ØÑÿ§ÈA‘ÏÇœrmäwµñ|0Š@-\n×Sæ)\\Û¥Ï²¥r\Zÿ6[Û§nsr<Ö#óïCkõêÕwx{Oq³qãÆ[ÒÎR¾İÊ&½@çc\00]Q¦;ı/‹¼3æ˜/E~%ë–¸=7nŠÄ*•\'å÷v£Ué\"Ğ(IQPÇ;ì°±“O>9ıÇïØÏ~ö³±{ï½wìæ›oŞşçµk×}îsŸ;øàƒór•òëxÜİóïC)½Ğ«â&m›ô¿Ñùv+å\n€AKGX\"¯ˆ9çô¶¶ÚøçŠn|;òş{M®Çç÷“­:üğÃ·—§nÜrË-c\'xb^°RÎOå-ÿŞ0TÒ[Iòz)VÒ6Ê·[Ù(W\0Ì†(Š9h—(Vï|-şüËÈM‘oEˆ±İ¢p=6¿ß\\Ò(Vç´¡t¤êì³ÏÎ{SWÖ¯_?vàækk|¯×æÏ†F§åê[7]{éÉcW{øö¤?§±|=é”+å\n€âˆ9éÏ£ ì\ZyO”«oÄ×7F~93²2Æ^¹dÉ’Çä÷+ªÆ«­ºé¦›ò®4-é­ƒ_ıêWÇ–.]ÚZ°î©¹&)Ãª“ruû-7Œ­;ûĞ±µß8ğIciY¾¾ô7Ê•r@±>.JÊ«\"ïruVÌ[¿ÜùjäĞ‘‘‘‚ñgùıf[ã3VÿõVÀ3Ï<3ïG}‘ÊÚĞZ°n§¿ÉŸÌy”«ë®üÚ„bÕÌõW~}ÂúÒß(WÊ\0sOª\'¤·ÀEl¼í.}~ë‘/G±xW,ù²eËş$¿_¯âñ?˜®–çÒÛk-\'¯HG¬)}v+;‚uUzùó‚9­“ruÕùGM(UÍ¤eùúÒß(Wó^Ø(W®—Àœ…ê/¢h-ü{Ìm«\Zg(Ü·_Œ¼cñâÅ/uş8¿_§âq™æÌx¬5N/?©Ö·¦ÏXõë­€;’>ÇÕR®RŞ?/˜Ó:)WëÎY9¡T5“–åëKSòr•\nÕæÈ¾[€a²S”©¿Œ¢SBtt”jã×àÚù\\Œ…ë%Q”vÎïØNÜg—fqi·¶×½ËßØëÉ+ºqôÑGÿW¹JÏ1şnÎŸ³,R<şøã÷ˆuÑ!‡rÓşûï¿e¯½öºwttt,ıùˆ#øÉG>ò‘Ó=öØ7¬\\¹Ò…ÌZ(WÅO‰ËU³X5Uş5\0£Rù‰â1\Zùp”‹\"·GÖG>cDáúÇE‹=,¿cz»a³¸´äˆüíw1vJsù ß˜»í¶ÛÆŞüæ7?àùµ>7fQ*JïyÏ{.yıë_ïT7»âŠ+Æ¾üå/½ûİï¾oŸ}öÙúÎw¾óò+V<9Ì²é¤\\¥³æ¥ª™´,__ú›’–«ÉŠÔdã\00´bŸ÷A•JåFyZ9&\nÉ÷\"wD®JE)ÆöBöÂêøéâór•ò­ô–ÁæãÅ×W4—u{«~¸ä’KZŸÛ†Ö¿+³äè£Şgï½÷¾+•©_üâù6Û¡-[¶l?J”²{:è æm¾L:)W.>vB©j&-Ë×—ş¦„åjª5Õr\0zQ¶~ottôQ¨öˆüg””Kâöş6Åª™M‘ç¤“]4ÇÒÁ‰Ù^µ>·‘‘‘gå?fH:ZuÈ!‡|ÿı÷¿?]œ¬é¨V”´ûßô¦7mŞ}÷İ_¯2è¤\\İ|ÃÇÖ}û°	Å*¥eùúÒß”¬\\uZœ:]\0J!¾M¡Êswääæ×é]_³e¿ıök}^Ş\Z8Şÿş÷¿iï½÷Şvê©§İ}÷İù6š¶K/½tlÅŠwíµ×^§Eƒxş}‡Y\'å*eÓ>3¡\\¥±|=éJT®º-Lİ®\0C«Z­îÖ¦LmO,»-n/«×ëéó[››ãé`³å˜ci}_Èÿ>X*Vo}ë[ïëõhÕd¶nİ:vÒI\'İ½dÉ’e*X•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷€¡’ş´”•{\"ç§\\D×ú˜øúÍõÒy\nfË7¿ùÍÖrµºõïÂ€¥·¦#Vƒ*V­:ê¨ßÄşn¬ùùóFS•«Ûo¹alıÅ›P¬šIËÒ:ùı¤)A¹êµ õz\0˜ó\ZgüXd—]D8ÖûQ³ÔÌÆÉ,š6nÜØZ®®ËŸ\'”>c•Ş\n8ÒÉ.öÜsÏ›ëõúiùóF“–«mÛÆ6o8oìŠ³P¨ò¤uÒºb\r&C^®úUŒúõ8\00Ô\ZGµ¶—š~~Ì¦[é{·”«aŞ×)–tVÀtòŠ™Üøë×¯¿7ÊÕ½©ùçÏgØ´+WS­š,b\r&C\\®ú]ˆúıx\00tÒQ¢\"¹J\'–säj†5Şx×L¼0wúé§ßëša{`»rÕÉÑªÉ’î›?ô–!-WyÚ)²{ã¶ùıòÇ€Òèä¼­oüÎw¾“ïÏ˜´ßR®|æj&qÄÏÖYLÒˆ8à€kÒEÙòç5LÚ•«¼0u›üñ¤·a¹ÊP*F\'EÒß3İvZ°&»_şø\0P\n©¤D6ÄşëWÒÉ,Ò»°Z/œÄ×ç4KÍ§?ıé|xÆ´^H8=ßÖçÈ€ì·ß~w¦C†³%6ú¯R»ÏŸ×0iW®¤X²rÕ®ø¤#OéïØL\'«µX5³¬ey»ï\0C­öÀ3>àmw-…ëëÍñÃ?<ßı1\'œpBëóû`şw¡ÏV®\\ùğw¾ó÷åb&5¯]©T’?¿a¡\\?CT®&+<íŠÒ\nV»õOlŒ·šìûÀPª×ë/lS¬&Í{î™ïşÎ˜½÷ŞûşæóHÏ;ÿ»ĞgÇü_üâóí0ãŞøÆ7ŞœZ~şüŠ.~PÏ,ÈÇsÊUñS¤rÕéÏUSv…©]Áj·^»bÕ4Õ÷€¡‘®góôíy‰jI*4ßÜÕ»é¦›òİßûéOÚúœœÌb&sÌ1§®]»6ß3îıïÿ\rµ9xÕè–Øî+WÅOÁÊUG?W™NN»âÔZ°Ú-ßQ±jêôûÀœ¶páÂ‡T«Õï¶Ì×­¹#òÏi½ÖÏ]xâ‰ùîï@¥ó\Z|ğÁ­ÏëcùßƒxßûŞwål²éK_úÒ/jsğ&m~¡Úî+WÅOAËÕ®Zt[lÚ¨ôõƒÚŒwR¬šº}\00\'D™zz:[ÌÇßŒü.ŠÓÆ6óõæÈsZî³[ëò™<3wzgZË÷¾g˜?~S(ûï¿ÿ–Ù<™ESü°İX›ƒ‡+ÛüRµİV®ŠŸ‚—«¶?W\rÓ-4í\nÖÕÙ×İ«¦é>\0(Œ‘‘‘?rT‰|\"æŞtàg‘¢T½6Š=şüÄl¾*–=-œÖS²xàÛ(\rZ:p2::ÚúÜµš)é~&6òTî¾ûî­iãçÏ¯è²_ªvÙ¾3¬\\?s¤\\=àçj^ïE¦]Áê¥X5õú¼\0`F¥ÏQ-^¼øQŞsìšÈï\"gÆ×ûT*•§æë\'±|Cc^¾4Öyt¾<É^}õ«_Íwƒû*ö©ÓeşëûÅ÷¿e²çÆ\0ìµ×^÷ám7ŞxãÚlçq¨¢\\?ù6+zâ…rlşüù©õz¸ôVÀüˆUú:÷\"=¯T°†úá\0Ì]1Ÿ>1ÊÓ›âöK©„Äíãë#£d½$æÙ?È×ÏÅúÇ¥ÏUÅºÍ—µjıìÕÒ¥Kzr‹SO=õûéï—?(½-p6¯\Zİ´fÍš/Ô†ã3WÍœ_›#oœ7ñˆÅöÌÔò¢d¹zÀÏÕ¼ŞíèÈU»³vª×ç\0}—JP”]c.ıXd}mü3RŸ‰b5\Z¥çÏòõ§’>Ç”xåã¹øŒïs]s>OG–ú}p#±JÅ*{;àqùsaÀŞõ®wız6¯\ZİtÊ)§||.^5ºƒßíŠ^®v46èåEIÁËUÛŸ«†é™vÅ*?‚5‚5İç\0ı¶Sì_>;ÊÍ;Ó\\\Z··Åí¹1v`ä™iy~‡A©_ëæÜ`}öÙù.ñ´¤¢ÖúVÀ”t´¬“âGŸuÔQÏæU£›öİwßOÇÂaùó+ºw~•«,/J\nZ®vøsÕ¢ÛBÓ®X¥ÏXµ;[`7«Ûç\0}µdÉ’ÇD±Ø=æÏÿ¹)ò“øú#Q¦îºë®”¯?“ây¼¶ÖR°R>úè±Ûn»-ß5îH:oB:+`v´j{±šê­ŠÈG?úÑ³yÕè†­ñCpÍÈÈÈ³òçWtîü*W“//J\nV®:ú¹ÊtZl&+VÍÕny\'«Óï\0}“®9µxñâ—Æ¼ùÁHúÿÍ±_ùù¸}}ääëÏ¶4¿×²¿ùÍoûáØñIæ¶lÙ2vÅWä×±jæ8G¬fÑòåËçï¾ûî÷mŞ¼9ßn3fıúõWÆÂ†ü¹\råjòåEI‘ÊU¦*8íŠSk±jj·Ş\nÖTß\0ú¦R©üÏØwÜ?ò­Æ[ı¾[­Vß·Ï]¹re¯\'d\Z¸t@!ëUy1zÃŞpÿ	\'œ0vÉ%—l¿&Vº\\Rú,ÕÆ·¿…ğØcğö¿fÒ	9œ¼¢ Şñw¬;óÌ3óÎ3c=ôĞÔæà[»¡\\M¾¼(’r•LVtÚ¦vÅª©İúí\nÖdß\0ú\"ÊÔ#¢8,ıÅ“jã\'†Øeâø¸}u,Û9_.HG—âù¿½q–Â	e©‹¤·~ÌéÖ$Zòß¥£W³q1áï}ï{ÓUº[ş¼†‰r5ùò¢dˆÊUÒ®ğì>¯óbÕÔ®`-kYŞîû\0@ORñhœ\0âˆÈ%‘[cñk‘·ŒŒüe¾ş\\–JQãïÙ¼fV§I%3•ª§äI¼ño<ïè£¾?/?ƒtÛm·İ3::ša¾->Ã¦èåª]fjyQ2då*É‹OkQê¤X5Mv¿üñ`Ú¢4ıE”…½ÒÙ£Gs.‹¼?ö_¼bÅŠßÏ×F·¦¢µıEÕ,R«Ó¿MÜ~0Ïü¾LÚ˜‘û.½ôÒ¼\rÌA”>t¸!}î+>Ã¦ÈåJÆ3„å*ÉP*FéÈS§Åª)¿_ş¸\0Ğ•E‹=,öEaøÏ´?ùeäS‘‘J¥ò§ùú0çŒ¾gÅŠwmİº5ïA}wöÙg§_¢Ûãêoòç1Œ”«âgHËUÒï\"ÔïÇ Ò‰&bßï9‘ƒëõúwÒ‰(Ò)Ããëÿû ÏÈ×‡¡°Ç{\\xÒI\'İ—¡~ºñÆ·ŒŒŒü6~™vÉ¿ÿ°R®ŠŸ!.WI¿\nQ¿€ˆ}½?,uZÜş:nÓ¢?·¯¨T*˜¯C\'~Ø¹dÉ’GuÔoÒ9ôû-±JÅªZ­î›ïa¦\\?C^®’^‹Q¯÷`È¥zÄ>Ş¿DuEä7‘ÏEö}\\¾>”B:s_ü|wÏ=÷¼yıúõ]Íl\néäÏX¥‹¦•æˆU“rUü” \\%Ó-HÓ½\0C®^¯ÿu”©\"g5®9uQä‘‘‘˜×œ‚‘şç!ÂÜ{úé§ßĞé£ÛI§[OgŒ_´\reùŒUN¹*~JR®’n‹R·ë0Ä–-[ö\'±?W‹}ÄOÆ¾İõ‘‘ãâëWÅşŞÏ×Z¤£LñËrÍşûï¿aíÚµWEWêèlé-…?üá7¿ûİï¾,N3ãme8+àd”«â§Då*é´0uº\0Cªq±ÛÅ¾Ü{ãöû‘[#_¯ßì\ZK0\r÷ÏîùQü2]·Ï>ûœzÊ)§||Íš5_¸ñÆ×Ş}÷İ[×¯_ãgœñó#<òú½öÚëÆÚø9ùÓöwB¹*~JV®’©ŠÓTËR±Ï÷äTb?îŒF™º4ò¾Å‹ÿcY®93\"ıEüÂ½«¶ã‹›–®›•ß·Ì”«â§„å*™¬@M6ÀJoç‹}¸İbîã‘k\"7DNn¼ıï‘ùú\0³J¹*~JZ®’¼Hå_0dÒ‰&¢8ı}¨C\"6NDqvúGY?Ì!ÊUñSâr•4UºD‚b0„*•Êc£8í%êôÚø)Ò×E™úû—2.˜ƒ”«â§äå*yaz‹oºÍ\00÷¤‹ôŒŒ¼<^Û?”ŠTmü\"¾§¥‚•ŠV¾>Àœ¡\\?ÊÕö³ƒ–şß HÆÆÆ|íµ×~~Íš5w­ZµjûÏ¨Ì~Î=÷Üû.¼ğÂkÎ;ï¼Eù6ƒÙ6::úŒôÖ¾x=ÿvã­~6>+ÿ×œ†Fšóy)VÒ6Ê·[Ù(WÅrõÕWè‚.Û´iÓØwŞ9ágVf\'i[¤måêxİØ%ßn0“ÒÉ&\"õxışTmü$×D™úÏtrŠE‹=,_`((WÅr¥\\ÍêÕ«ïH;ñùÏª#7n¼%^7VçÛ\r)=ºÔ‹ãõú}‘¤k‰Æíq»÷ÈÈÈ_äë¥U«Vİï‹›-[¶\\;I[óíV6ÊU±¤·zİ(nÒ¶ñºÁLH—Á‰×ç·DúZmüšSéB¾GD^”.ğ›¯0ô.ºè¢ütqsùå—Æÿ@+WEãˆwñãˆ7ƒ®9¯Ç¯¹6r}½^ÿdÜV—-[ö\'ùú\0¥“>ø¼jÕª[7lØğó¹ş?ÑÛ¶m›06WÛâúuëÖ;H›}vB¹*šNËÕ·n»öÒ“Ç®<÷ğíINcùzÒÿ(WôC:ÑÄÈÈÈ?Äkğ¡‘ï¦QT«Õ³âÏûÇŸÿ:_€yÛw”vIGGÒÛHÒ„<ó©O}j,í€çãs8i[¤mRúb•(WÅ’~Fóù<·ßrÃØº³[û4––åëK“¶Q¾İ £££‹×Ü×G>ùM”©G2õ2×œ(‰˜\0ÖFîÍÇÊU±tR®®»òkŠU3×_ùõ	ëK£\\m§t`×]wı£(N¯ˆõáx­ıIä¦Ègcl÷%K–<&_€!ÂhÚùN‰Éàiùræ>åªX:)WWÔ„RÕLZ–¯/ırµı¢ã›·db®üÛ˜;ŒÛs\Z×œº rğÈÈÈßÅâòõ(‰t6¢˜64ËUää|æ>åªX:)WëÎY9¡T5“–åëKSòrÕ,Vû6nK_°*•ÊŸÆëèH©OÇíæÈúÈ±ñõ®±ì¡ùú\0”TµZİ·¥X¥l‰âÑùzÌmÊU±(WÅO‰ËU~Ä*ÿºbüƒxİ\\åéÈ¸½¬qÍ©/GöŠeOÊ×€yË—/xãàZËUÊóu™Û”«bé¤\\¥³æ¥ª™´,__ú›’–«ÉŠÔdãC%\nÔ_EŞ\Z¯—_ü.²&røâÅ‹_àšS\0L)&ÃÚ«±ô?t©xåë3w)WÅÒI¹Úpñ±JU3iY¾¾ô7%,WS¨©–Ï9•Jeç˜ï^¯\'D6E~9±^¯/eÈ×€I¥·şÅ$r{^¬š‰Éåmù}˜»”«bé¤\\İ|ÃÇÖ}û°	Å*¥eùúÒß”¬\\uZœ:]¯bŞû½(SÏ‹¼;^/nœˆâ›q»_Œ==_\0:V¿:ü„RÕ’Í®Ç1<”«bé¤\\¥lúÁg&”«4–¯\'ıO‰ÊU·…©ÛõgUªÇGyzC¼~!rsdm|ıï‹/~éÂ…’¯\0]kµJgLoƒ¸®M±j½Ú=¿/s“rU,•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷¸tÍ©‘‘‘ùë#ñºwUäÆøó©Õju™“50cbòyUL>_iœšı‰)1öÈ|=æ&åªX¦*W·ßrÃØú‹?6¡X5“–¥uòûIÿR‚rÕkAêõşı²SÌ]ÏŒùê x[Õx«ßù1öÈ³Óòü\00p1	ÕbR:-g8(WÅ2i¹Ú¶mló†óÆ®8ëà	…*OZ\'­ë(Ö`2äåª_Å¨_Ó•˜«Y¯kŸ‰ü*ruÌaÇD^¹téÒÿ–¯\03.&§å5ZÊU±´+WS­š,b\r&C\\®ú]ˆúıx¤kN-^¼ø%ñ:ö(P?ŠÛßF¾Y‘Şe‘¯\0³.&¨½\"ÇåãåªXÚ•«NVM–tßüñ¤·i¹Ê‹PzË\\úlm·oËï—?nÏ¢P=5^·ş-rfmüšS«#+#ÏOgıË×€BiœŠöÃù8ÃA¹*–vå*/Lİ&<é-CX®ò”ŠÑI‘ô÷L·¬Éî—?~WÒµczm¼VıßÈÏ\"?9éqûº‘‘‘?Î×€BKş‰íÈ|œá \\ÍŒtB˜|¬våJŠ•!+WíŠO:ò”şÍtR°Z‹U3ËZ–·û>m¥£O1çüïÆÑ¨ï¥£S1}#­Šñ§åëÀœÒ˜àËÇÊÕÌˆç\réS•,åªø¢r5YáiW”vT°Ú­bc¼ÕdßoŞÈÈÈâwäQ¢¾·¿MŸŸŠ¿3ÿ”>W•¯\0sVLtˆ¼=g8(W3#ı;7rEì4î–/oR®ŠŸ\"•«øy:?² ïÀ¤E§¡]ajW°Ú­×®X5mÿ¾;ï¼óKãyï’Îäê§µñ3ûYšÎø—ß	\0†FLt‰	pß|œá \\ÍŒ–rµ=ÿ™ŸP²”«â§`åªù3ÕMÉšªX5µ+N­«İò«íæÏŸÿ’×¼æ5÷½úÕ¯¾,óÛGFF5oŠû\0ÀĞˆÀã£`½)g8(W3#/W­%+v._Ş\\O¹*~\nZ®:-Y«¦v*}ı 6ãS«¦T°æu÷<\0`8ÄDı©ôY‘|œáĞØ!»/rOd[äÎÈí‘[kã×ŒùuäÆÈ/#×G~¹6rMäêÈU‘uQ~Ü¸ÎLúßèï×ÆO|qäÂÈ‘UñstN¬sVüù›‘¯GÎˆ|9ò…Èç\"ŸuN|:òÉøúÄÈ	‘ã\"Ç¦·E>Ëş#òïéD+1ş¾ÈáµñÏ\ZËßU?	ËA‘·Eö«Ÿ¶ù-1¾wÜ®ˆ±7ÄŸ÷ˆ,‹?/‰Ôc¼\Zy]Œ½&QŠ¡]£ôük*>ñç—Eş)–/ˆ¼hñâÅ/ˆuËş!òwéŞcùßFş:ÆŸù«J¥ò”È“\"}\\mâNpâq^¢\\?/W;*Yİ«¦vëêìë‹U‹é>\0˜»b‚>=RÍÇ+W®|P:ÑÂÂ…eà#ìœNs…á‘K—.ı³%K–<&Æ›ÊB*\rQ œJD,Z*Q ‘JFŒ=;ò÷©|ÄÏÍó#/Šå/Nå$JÉKSY‰e#¯L%&–¿:òºX¾8•œM¥\'²GŒ¿¾6~1Ğt­µ·Äâ}êã—8 r`ä1~päĞÈa‘Ãcù{#GÆ²£\"GG>ãùxä„ûD¬óÉÈ§kãŸóølmüç<•¼tÒ3b¯E¾Q/ƒß¬ªï°¦²øİÚxy¼$òƒêx©\\YùIm¼tn¨—ĞTF¯«MÜùÍsŠrUüÌ‘rÕÌùµñ’Õk‘iW°z)VM½>/\0˜[jã;š>t®ÍNïöÄïÖW\"Ïk®§\\?ù6,z*•ÊØüùóS	êõ³³é­€ù«ôu\ZïEz^©`ÍÏ\0ÀĞIÿsßú™ {ùo*Uò?@‘ÊÕ¼‰G(¶§(Ëg+säÈÕùµ¾-°×#D;:rÕî,‚êõyÀÜôém]ù8Ğ¹Æï=ñ»tZ»RÕT´rµ£±Ù^>[)x¹ÊKU«é™vÅ*?‚5‚5İç\0sWLÔk\"ÏÍÇÎÅïĞÉé$ùxN¹ê|ùl¥ åjG¥ªU·…¦]±JŸ±jw¶Àn\nV·Ï\0†CLØ—W«Õgæã@ÿ)W/Ÿ­¬\\uZªZuZl&+VÍÕny\'«Óï\0Ã§^¯ÿ´R©<5úO¹ê|ùl¥HåªSœvÅ©µX5µ[oGkªï\0Ã­V«ılddä	ù8ĞÊUçËg+CR®’ÉŠN»ÂÔ®X5µ[¿]Ášìû@yD¹úU½^T>ôŸrÕùòÙÊ•«¤]áÙ}^çÅª©]ÁZÖ²¼İ÷€ò‰rukº l>ô_ÑÊU»eùleÈÊU’ŸÖ¢ÔI±jšì~ùã@yE¹Ú¶páÂ‡äã@ÿ©\\Iûa¹Jò”ŠQ:òÔi±jÊï—?.\0”ÚNQ®îÏÁP®ŠŸ!-WI¿‹P¿\0æ¶åË—Ïrµ5C¹*~†¸\\%ı*Dız\0Q®^­VoÉÇÁP®ŠŸ!/WI¯Å¨×ûÀpªT*®Õji’f€rUü” \\%Ó-HÓ½\0¿(VOŒlÊÇÁP®ŠŸ’”«¤Û¢Ôíú\0P.õzıiQ®®ÊÇÁP®ŠŸ•«¤ÓÂÔéz\0P^###ÏªV«?ÊÇÁP®ŠŸ’•«dªâ4Õr\0 ‰bõ¼Z­¶:C¹*~JX®’É\nÔdã\0@.ŠÕ‚Èùù80ÊUñSÒr•äE*ÿ\Z\0Ø‘z½şŠ(WßÊÇÁP®ŠŸ—«¤Y¨ömÜ*V\0Ğ©(W¯ªV«_ÉÇÁP®ŠŸ’—«ä…µZ-ı(V\0Ğ(Vµ(X§åãÀ`(WÅrµı-ã¥ÿ7\0€®Åº<rr>†rUü(WÊ\0LKL {EËÇÁP®ŠåJ¹€i©×ëûU«ÕçãÀ`¬Zµêş;ï¼sÂ½#[¶l¹,ÊÕÖ|»•r\0ÓÅêQ°ÌÇÁ¸è¢‹nØ´iÓ„z)F.¿üòÏD¹*ıµÿ”+\0˜†˜@WFËÇÁ8ï¼ó­ZµêÖ\r6üÜ¬â$¶ÅõëÖ­;;ŠÕæÈ.ùv+å\n\0¦!&ĞDŞƒ“vŞÓÑ‘ôö³ôù)DÒ¶HÛ¤ôÅ*Q®\0`\ZêõúGªÕjºX$\0l§\\À4D±:>\nÖ›òq\0ÊK¹€iˆ	ôSQ®vÏÇ(/å\n\0¦!&ĞÓ#Õ|€òR®\0`\Zb=£Z­î–P^Ê\0LC«³FFF^P^Ê\0LCL Ôëõçã\0”—r\0ÓèšÈsóq\0ÊK¹€iˆ	ôòjµúÌ|€òR®\0`\ZêõúO+•ÊSóq\0ÊK¹€iˆ	ôg###OÈÇ(/å\n\0¦!&Ğ_ÕëõGåã\0”—r\0Óè­•Jeç|€òR®\0`\Zbİ¶páÂ‡äã\0”—r\0İÛ)&ĞûóA\0ÊM¹€.-_¾|~L [óq\0ÊM¹€.E¹zxµZ½% Ü”+\0èR¥RytL ›óq\0ÊM¹€.ÅäùÄÈ¦|€rS®\0 Kõzıi1^•PnÊ\0tiddäYÕjõGù8\0å¦\\@—¢X=/&ĞÕù8\0å¦\\@—bò\\9? Ü”+\0èR½^EL ßÊÇ(7å\n\0ºåêUÕjõ+ù8\0å¦\\@—¢XÕ¢`–PnÊ\0t)&Ïå‘“óq\0ÊM¹€.Åä¹Wä¸|€rS®\0 Kõz}¿jµúá|€rS®\0 KQ¬ŞëÈ|€rS®\0 K1y®Œ–PnÊ\0t)&ÏDŞPnÊ\0t©^¯¤Z­î›PnÊ\0t)ŠÕñQ°Ş”PnÊ\0t)&ÏOE¹Ú= Ü”+\0èRL§Gªù8\0å¦\\@—bò<£Z­î–PnÊ\0t)ŠÕY###/ÏÇ(7å\n\0º“çõzıÅù8\0å¦\\@—bò\\yn>@¹)W\0Ğ¥˜</¯V«ÏÌÇ(7å\n\0ºT¯×Z©TšPnÊ\0t)&ÏŸŒŒ<! Ü”+\0èRL¿ª×ëÊÇ(7å\n\0º“ç­•Jeç|€rS®\0 K1yn[¸páCòq\0ÊM¹€îì”&O‘vÉ\'\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 óÿy©ı>Mºu\0\0\0\0IEND®B`‚',1),('5002',1,'processes/MyProcess.bpmn20.xml','5001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"ç”³è¯·è¯·å‡\" activiti:assignee=\"${user}\" activiti:candidateUsers=\"${user}\" activiti:candidateGroups=\"user\">\n      <extensionElements>\n        <activiti:formProperty id=\"dayNum\" name=\"è¯·å‡å¤©æ•°\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"type\" name=\"è¯·å‡ç±»å‹\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"username\" name=\"è¯·å‡äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"userId\" name=\"è¯·å‡äººID\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"></sequenceFlow>\n    <userTask id=\"usertask2\" name=\"éƒ¨é—¨å®¡æ ¸\" activiti:assignee=\"dept\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"æ˜¯å¦åŒæ„\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"å®¡æ‰¹äººID\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"å®¡æ‰¹äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"usertask3\" name=\"æ€»ç»ç†å®¡æ ¸\" activiti:assignee=\"manager\">\n      <extensionElements>\n        <activiti:formProperty id=\"isAgree\" name=\"æ˜¯å¦åŒæ„\" type=\"String\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewId\" name=\"å®¡æ‰¹äººid\" type=\"String\" required=\"true\"></activiti:formProperty>\n        <activiti:formProperty id=\"reviewName\" name=\"å®¡æ‰¹äººå§“å\" type=\"String\" required=\"true\"></activiti:formProperty>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum < 1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${dayNum >= 1}]]></conditionExpression>\n    </sequenceFlow>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway2\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow5\" sourceRef=\"usertask3\" targetRef=\"exclusivegateway2\"></sequenceFlow>\n    <exclusiveGateway id=\"exclusivegateway3\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway3\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"exclusivegateway3\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \"Y\" || isAgree == \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"exclusivegateway2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree == \'Y\' || isAgree == \'y\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"exclusivegateway3\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" sourceRef=\"exclusivegateway2\" targetRef=\"usertask1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${isAgree != \"Y\" || isAgree != \"y\"}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"80.0\" y=\"350.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"170.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"320.0\" y=\"348.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"286.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"440.0\" y=\"389.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"340.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway2\" id=\"BPMNShape_exclusivegateway2\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"397.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway3\" id=\"BPMNShape_exclusivegateway3\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"590.0\" y=\"294.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"115.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"170.0\" y=\"367.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"275.0\" y=\"367.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"320.0\" y=\"368.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"340.0\" y=\"388.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"415.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"416.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"340.0\" y=\"348.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"340.0\" y=\"315.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"440.0\" y=\"313.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"545.0\" y=\"416.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"417.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"545.0\" y=\"313.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"314.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"630.0\" y=\"314.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"610.0\" y=\"397.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"375.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"610.0\" y=\"294.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"340.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"610.0\" y=\"437.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"610.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"306.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"218.0\" y=\"491.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"222.0\" y=\"395.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('5003',1,'processes/MyProcess.myProcess.png','5001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0W\0\0õ\0\0\0\Z‰<\0\06IDATx^íİ\r˜\\u}/ğ`mM{õb­­Z½¾T[õ¶V¯µÕëK­VS$ø6™™İ$Ô*åÅ*‚DP‘J}A*pQá\n¾£¢‚@D”HIQ#(‚@HxİûûggúÿÍÎìÌìóù<Ï÷™ìÿœ™äìÎÿ|sfÎ™7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`˜Ôjµ1‘”|\0\0º`2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S\0ó\0ôÈd\n@b>\0€™LHÌ\0Ğ#“)\0‰ù\0\0zd2 1\0@L¦\0$æ\0è‘É€Ä|\0\0=2™˜\0 G&S¼±±±_{íµŸ_³fÍ]«V­\Z;çœs¤\09÷Üsï»ğÂ¯9ï¼óåÛ¬ŒÌ\0Ğ#“)ŞÕW_ı¡.¸`lÓ¦McwŞyçØ]wİ%HÚi›D¹º#ÊÖ.ùv+ó\0ôÈd\nƒ·zõê;ÒN|¾s/ÅÈÆo‰rµ:ßnec>\0€™LağÒ[±*nÒ¶‰rµ5ßnec>\0€™LağÒç{òz)VÒ6Ê·[Ù˜\0 G&S¼NËÕ·n»öÒ“Ç®<÷ğíINcùzÒÿ(Wæ\0è™É¯“ruû-7Œ­;ûĞ±µß8ğIciY¾¾ô7Ê•ù\0\0zf2…Áë¤\\]wå×&«f®¿òëÖ—şF¹2\0@ÏL¦0x”««Î?jB©j&-Ë×—şF¹š÷ÂÆ|ğÂ|\0Ğ!å\n¯“rµîœ•JU3iY¾¾ô7%/W©PmìÛ¸U°\0`:”+<åªø)q¹j«f¡Ê¿\0:¥\\ÁàuR®ÒÙóRÕLZ–¯/ıMIËÕdEj²q\0`G”+¼NÊÕ†‹PªšIËòõ¥¿)a¹šª@Mµ\0È)W0x”«›oøñØºo6¡X¥±´,__ú›’•«N‹S§ë\0‰rƒ×I¹JÙôƒÏL(Wi,_OúŸ•«nS·ë@y)W0x•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷€rQ®`ğ¦*W·ßrÃØú‹?6¡X5“–¥uòûIÿR‚rÕkAêõş\00ü”+¼IËÕ¶mc›7œ7vÅYO(TyÒ:i]G±“!/Wı*Fız\0NÊ^»r5ÕÑªÉâ(Ö`2Äåªß…¨ß\0ÃC¹‚ÁkW®:9Z5YÒ}óÇ“Ş2¤å*/B;EvoÜv#¿_ş¸\0@¢\\Áàµ+Wyaê6ùãIoÂr• TŒNŠ¤¿gºí´`Mv¿üñ\0å\n¯]¹’beÈÊU»â“<¥¿c3¬ÖbÕÌ²–åí¾\0”—rƒ§\\?CT®&+<íŠÒ\nV»õOlŒ·šìû@ù(W0}ñûsr¥RyJ>S®ŠŸ\"•«ø¹:?² ïÀTE§]ajW°Ú­×®X5Mõ} ”+˜¾ôû¹§^¯Ÿ622ò¬|y“rUü¬\\¥Ÿ«”nJV§§]qj-Xí–ï¨X5uúı`x)W0}-;ÁÛS­V¿Ò®d)WÅOAËU§%«ÛbÓ®@¥¯Ôf¼“bÕÔíó\0€á¢\\ÁôµÙ	ş¯’y^s=åªø)x¹ÚQÉšn¡iW°®Î¾î¦X5M÷ù\0ÀÜ§\\ÁôµÙùÍ³}gX¹*~æH¹zÀÏÕ¼Ş‹L»‚ÕK±jêõyÀÜ”&ê|Œá°råÊ­X±â÷.\\ø]wİõ-Zô°J¥²säõzı‘‘G-Y²ä1£££‹±ÇG”NÎP­Vÿ*òôXş×‘¿Mos‹ü]äÒÑ˜Å‹¿ ~n^”vîbù?E^Ë^ù×øó®±În‘×Äò×EªõqKblYdøób|Eüyï¸}Käßbl¿ÈÛ\"Åø;\"ïŠñC#+#‡GŞËŒü{ä?bù‡#ÇÄø±‘ã\"\'DNŒeŸŒ|:rj|ıÙÈç\"_ˆ|9rFäë‘oÆ}ÏŠuÎ‰?¯Š\\¹0rqduäû‘ËbE~^¹*ruäšÈµ‘ŸG®¯MÜéÍsŠrUü´Ùv…Nü®ÍŸ??½~ï›ÿîw)½0?b•¾Nã½HÏ+¬ùù\0Zi’ÎÇ˜û\Z;`÷Eîl‹l‰2q[ÜŞ\Z¹9òëÈ¯\"¿Œ\\W/©4l¨—ˆŸÔÆKÅÚT2âö‘Kjãåã»µñ2r~m¼œ|;••È7\"_«—˜/ÕÆKÍéµñ’sJ£ô|2ÖùDm¼}¼6^>Ú(KGGj”¨÷ÖÆKÕaµñ’up£t9 QÆö©—³½\"+\"¯e{TÇKÜh}ÜâÚxÉ{uu¼ô½2²0•Á(‰/­—Ã×ÆËâócÙó\"yv*•Q<ŸQ/™O«—Î\'7Jh*£­µÙém$ı»½rÁ‚N%·ÈåjŞÄ#Û3SË‹’9rä*ıÎ-hYµ×#D;:rÕî,‚êõyÀÜ”&ì|Œ¹ÏvùÎouüh×nùzE/W;\Zôò¢¤àå*/U­¦[dÚ«üV×kşüùæMïù\0ÀÜg\'|8Ù®3£eç÷Šv¥ªI¹š|yQRĞrµ£RÕªÛ‚Õ®X¥ÏXµ;[`Ç+«×¾öµ÷GÖÇïÃ\'êõú›Ò[Š+•ÊäëÀP²>œl×™ÿÎbr÷ôö¿|Y+åjòåEIÁÊU§¥ªU§k²bµ£ë\\uR°¶ÿ(X/i|>3}¦ò¤ÈÚÈ–Èbìøø}yCzËmú<hş\0\00çÙ	N¶ëÌ˜ªT5)W“//JŠT®z0UÁjWœZ‹US»õvT°vø}+•Ê6>ÏøÖxmúTmüóœwD.‰±ÿ¬Ÿèæoc½ßËï\0sŠğád»‹r5ùò¢dHÊU2YÑiW˜Ú«¦vë·+X“}¿ZºtéKgbµo¼^R?#g*\\ß‹±cÒát2™tB˜ü¾\0PXvÂ‡“íZ,ÊÕäË‹’!*WI»Â³û¼Î‹US»‚µ¬ey»ï3m•Jå¡Q¸ş1ÊÕµñ³Œ¦3—Ş¹(ŠÖG\"KÒ™;.\0\nËNøp²]‹¥èåª]fjyQ2då*É‹OkQê¤X5Mv¿üñ\"]›/\n×K¢pX¿´CºÖÜï¢d}\'ò‘úÈÈÈ_Îëüï\0ƒc\'|8Ù®ÅRär%ãÂr•ä(tä©Û\"’ß/ÜeêÓuêâuîíµñëémŠÜ\Z=ë¼úø…ÆÇ:‘ß\0ÎNøp²]‹E¹*~†´\\%ı.Bı~¼¾X¶lÙŸT«Õ‰×¾ƒ#_ü\"òÛ(ZçÔÇ/LşÚøú‰ùı\0 ¯ì„\'ÛµX”«âgˆËUÒ¯BÔ¯Ç™K—.ı³(\\ãõğĞÈW#7D~cgEÙzoüùÕ‘ÿ‘ß\0¦ÍNøp²]‹E¹*~†¼\\%½£^ï_•JåÑQ®^¯‘+#gF6GnŒ±oÄíá‘E‘?Ïï\0±>œl×bQ®ŠŸ”«dºiº÷›¢p=6ÊÕnñºyDä›‘›\"¿Œ|=rXd—z½ş¨ü~\00ğád»‹rUü”¤\\%İ¥n×\nQ¸…ë5ñZú¾ÈÙ‘ßD®œ9$ÊÖ+b?Íï@ÉÙ	N¶k±(WÅO‰ÊUÒiaêt½Rˆ2õ¤xm}]ä‘s#¿ü<ò¥([ïŒ¼,ÖyD~?\0†TL\0ç§î)r~~?æ´-ó1frUü”¬\\%S§©–ªÕê“ãõ¶\Zù`c½5rm­ÏGŠ?ÿóòåËß€!/òÚ”©<òû1÷¤m™1{”«â§„å*™¬@M6ÎÔvŠÂõWñ\Z<ùPäÂ(Y·Åí†¸=-nÿOšgGGGÿ{~G\0æ Ú^9j5$”«bQ®ŠŸ’–«$/Rù×ôhåÊ•ŠÂõôx]^\Zùhä»‘Û£lı4nÿ_dÿÈ‹*•ÊCóûPpµ½Z¯ÏÜ”¶g>ÆìQ®ŠŸ—«¤Y¨ömÜ*VEê÷¢pıM¼V/|,²:rGä\'‘ÏDş-òü]wİõòûP0µöG¯µ\Z\"ÊU±(WÅOÉËUâˆÕ,[°`Áƒ£p=3^¿÷Œ|<òıÈ–È‘“#o‰<wùòåóóû0‹jí^-È×cîR®ŠE¹*~”«íì´ÌŠ+~?^ÏÿWä‘\"—5\n×å‘#{E!ûû…>$¿/\03¨öÀ£WZ\råªX”«âG¹b®¨T*¯ñÏIÅªQ°RÑJ…+¯TÀVDázv*fù}Ú^-È—3·)WÅ¢\\?ÊsYz«`¼î?·6şÖÁ“£\\ı¸Q¸Ò[‹¼>½å0½õ0¿/\0}Rk½ÊÇ™ûl×bYµjÕıwŞyç„z)F¶lÙrY”«­ùvƒ¹,#æ‚çGş­^¯:remü¤k\"ÇF–§“j¤“kä÷`\Zj£Wù8sŸíZ,]tÑ\r›6mš°S/ÅÈå—_ş™(W«óíÃ&î=æ‡EÑÚ/rjãtğ·G.®Ÿ&~i:m|:}|~_:×8’øÏñoùá¸ıVÜş(n¯‹ÜÓøs:º¸oüû¿ĞE¦)½±±±_{íµŸ_³fÍ]«V­ÚşV’¹œ´ÍÅœ{î¹÷]xá…×œwŞy‹òmVFÊU±¤ŸËx½¸uÃ†\r?w«8‰mqıºuëÎ×Í‘]òíe°hÑ¢‡ÅNş‹#ok\\è8]ğ8]øøÂÚø…G¢”=5Vİ)¿/ÿnO‹¯/4\nk~â°eC”­¯¤²•?&½«¯¾úC\\pÁXú_h;IÅIÚi›ÄNìv’”«\"J?—‘Õ‘­ùÈ¬%m‹´MJÿš­ÒÑ”ØÑÿ§ÈA‘ÏÇœrmäwµñ|0Š@-\n×Sæ)\\Û¥Ï²¥r\Zÿ6[Û§nsr<Ö#óïCkõêÕwx{Oq³qãÆ[ÒÎR¾İÊ&½@çc\00]Q¦;ı/‹¼3æ˜/E~%ë–¸=7nŠÄ*•\'å÷v£Ué\"Ğ(IQPÇ;ì°±“O>9ıÇïØÏ~ö³±{ï½wìæ›oŞşçµk×}îsŸ;øàƒór•òëxÜİóïC)½Ğ«â&m›ô¿Ñùv+å\n€AKGX\"¯ˆ9çô¶¶ÚøçŠn|;òş{M®Çç÷“­:üğÃ·—§nÜrË-c\'xb^°RÎOå-ÿŞ0TÒ[Iòz)VÒ6Ê·[Ù(W\0Ì†(Š9h—(Vï|-şüËÈM‘oEˆ±İ¢p=6¿ß\\Ò(Vç´¡t¤êì³ÏÎ{SWÖ¯_?vàækk|¯×æÏ†F§åê[7]{éÉcW{øö¤?§±|=é”+å\n€âˆ9éÏ£ ì\ZyO”«oÄ×7F~93²2Æ^¹dÉ’Çä÷+ªÆ«­ºé¦›ò®4-é­ƒ_ıêWÇ–.]ÚZ°î©¹&)Ãª“ruû-7Œ­;ûĞ±µß8ğIciY¾¾ô7Ê•r@±>.JÊ«\"ïruVÌ[¿ÜùjäĞ‘‘‘‚ñgùıf[ã3VÿõVÀ3Ï<3ïG}‘ÊÚĞZ°n§¿ÉŸÌy”«ë®üÚ„bÕÌõW~}ÂúÒß(WÊ\0sOª\'¤·ÀEl¼í.}~ë‘/G±xW,ù²eËş$¿_¯âñ?˜®–çÒÛk-\'¯HG¬)}v+;‚uUzùó‚9­“ruÕùGM(UÍ¤eùúÒß(Wó^Ø(W®—Àœ…ê/¢h-ü{Ìm«\Zg(Ü·_Œ¼cñâÅ/uş8¿_§âq™æÌx¬5N/?©Ö·¦ÏXõë­€;’>ÇÕR®RŞ?/˜Ó:)WëÎY9¡T5“–åëKSòr•\nÕæÈ¾[€a²S”©¿Œ¢SBtt”jã×àÚù\\Œ…ë%Q”vÎïØNÜg—fqi·¶×½ËßØëÉ+ºqôÑGÿW¹JÏ1şnÎŸ³,R<şøã÷ˆuÑ!‡rÓşûï¿e¯½öºwttt,ıùˆ#øÉG>ò‘Ó=öØ7¬\\¹Ò…ÌZ(WÅO‰ËU³X5Uş5\0£Rù‰â1\Zùp”‹\"·GÖG>cDáúÇE‹=,¿cz»a³¸´äˆüíw1vJsù ß˜»í¶ÛÆŞüæ7?àùµ>7fQ*JïyÏ{.yıë_ïT7»âŠ+Æ¾üå/½ûİï¾oŸ}öÙúÎw¾óò+V<9Ì²é¤\\¥³æ¥ª™´,__ú›’–«ÉŠÔdã\00´bŸ÷A•JåFyZ9&\nÉ÷\"wD®JE)ÆöBöÂêøéâór•ò­ô–ÁæãÅ×W4—u{«~¸ä’KZŸÛ†Ö¿+³äè£Şgï½÷¾+•©_üâù6Û¡-[¶l?J”²{:è æm¾L:)W.>vB©j&-Ë×—ş¦„åjª5Õr\0zQ¶~ottôQ¨öˆüg””Kâöş6Åª™M‘ç¤“]4ÇÒÁ‰Ù^µ>·‘‘‘gå?fH:ZuÈ!‡|ÿı÷¿?]œ¬é¨V”´ûßô¦7mŞ}÷İ_¯2è¤\\İ|ÃÇÖ}û°	Å*¥eùúÒß”¬\\uZœ:]\0J!¾M¡Êswääæ×é]_³e¿ıök}^Ş\Z8Şÿş÷¿iï½÷Şvê©§İ}÷İù6š¶K/½tlÅŠwíµ×^§Eƒxş}‡Y\'å*eÓ>3¡\\¥±|=éJT®º-Lİ®\0C«Z­îÖ¦LmO,»-n/«×ëéó[››ãé`³å˜ci}_Èÿ>X*Vo}ë[ïëõhÕd¶nİ:vÒI\'İ½dÉ’e*X•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷€¡’ş´”•{\"ç§\\D×ú˜øúÍõÒy\nfË7¿ùÍÖrµºõïÂ€¥·¦#Vƒ*V­:ê¨ßÄşn¬ùùóFS•«Ûo¹alıÅ›P¬šIËÒ:ùı¤)A¹êµ õz\0˜ó\ZgüXd—]D8ÖûQ³ÔÌÆÉ,š6nÜØZ®®ËŸ\'”>c•Ş\n8ÒÉ.öÜsÏ›ëõúiùóF“–«mÛÆ6o8oìŠ³P¨ò¤uÒºb\r&C^®úUŒúõ8\00Ô\ZGµ¶—š~~Ì¦[é{·”«aŞ×)–tVÀtòŠ™Üøë×¯¿7ÊÕ½©ùçÏgØ´+WS­š,b\r&C\\®ú]ˆúıx\00tÒQ¢\"¹J\'–säj†5Şx×L¼0wúé§ßëša{`»rÕÉÑªÉ’î›?ô–!-WyÚ)²{ã¶ùıòÇ€Òèä¼­oüÎw¾“ïÏ˜´ßR®|æj&qÄÏÖYLÒˆ8à€kÒEÙòç5LÚ•«¼0u›üñ¤·a¹ÊP*F\'EÒß3İvZ°&»_şø\0P\n©¤D6ÄşëWÒÉ,Ò»°Z/œÄ×ç4KÍ§?ıé|xÆ´^H8=ßÖçÈ€ì·ß~w¦C†³%6ú¯R»ÏŸ×0iW®¤X²rÕ®ø¤#OéïØL\'«µX5³¬ey»ï\0C­öÀ3>àmw-…ëëÍñÃ?<ßı1\'œpBëóû`şw¡ÏV®\\ùğw¾ó÷åb&5¯]©T’?¿a¡\\?CT®&+<íŠÒ\nV»õOlŒ·šìûÀPª×ë/lS¬&Í{î™ïşÎ˜½÷ŞûşæóHÏ;ÿ»ĞgÇü_üâóí0ãŞøÆ7ŞœZ~şüŠ.~PÏ,ÈÇsÊUñS¤rÕéÏUSv…©]Áj·^»bÕ4Õ÷€¡‘®góôíy‰jI*4ßÜÕ»é¦›òİßûéOÚúœœÌb&sÌ1§®]»6ß3îıïÿ\rµ9xÕè–Øî+WÅOÁÊUG?W™NN»âÔZ°Ú-ßQ±jêôûÀœ¶páÂ‡T«Õï¶Ì×­¹#òÏi½ÖÏ]xâ‰ùîï@¥ó\Z|ğÁ­ÏëcùßƒxßûŞwål²éK_úÒ/jsğ&m~¡Úî+WÅOAËÕ®Zt[lÚ¨ôõƒÚŒwR¬šº}\00\'D™zz:[ÌÇßŒü.ŠÓÆ6óõæÈsZî³[ëò™<3wzgZË÷¾g˜?~S(ûï¿ÿ–Ù<™ESü°İX›ƒ‡+ÛüRµİV®ŠŸ‚—«¶?W\rÓ-4í\nÖÕÙ×İ«¦é>\0(Œ‘‘‘?rT‰|\"æŞtàg‘¢T½6Š=şüÄl¾*–=-œÖS²xàÛ(\rZ:p2::ÚúÜµš)é~&6òTî¾ûî­iãçÏ¯è²_ªvÙ¾3¬\\?s¤\\=àçj^ïE¦]Áê¥X5õú¼\0`F¥ÏQ-^¼øQŞsìšÈï\"gÆ×ûT*•§æë\'±|Cc^¾4Öyt¾<É^}õ«_Íwƒû*ö©ÓeşëûÅ÷¿e²çÆ\0ìµ×^÷ám7ŞxãÚlçq¨¢\\?ù6+zâ…rlşüù©õz¸ôVÀüˆUú:÷\"=¯T°†úá\0Ì]1Ÿ>1ÊÓ›âöK©„Äíãë#£d½$æÙ?È×ÏÅúÇ¥ÏUÅºÍ—µjıìÕÒ¥Kzr‹SO=õûéï—?(½-p6¯\Zİ´fÍš/Ô†ã3WÍœ_›#oœ7ñˆÅöÌÔò¢d¹zÀÏÕ¼ŞíèÈU»³vª×ç\0}—JP”]c.ıXd}mü3RŸ‰b5\Z¥çÏòõ§’>Ç”xåã¹øŒïs]s>OG–ú}p#±JÅ*{;àqùsaÀŞõ®wız6¯\ZİtÊ)§||.^5ºƒßíŠ^®v46èåEIÁËUÛŸ«†é™vÅ*?‚5‚5İç\0ı¶Sì_>;ÊÍ;Ó\\\Z··Åí¹1v`ä™iy~‡A©_ëæÜ`}öÙù.ñ´¤¢ÖúVÀ”t´¬“âGŸuÔQÏæU£›öİwßOÇÂaùó+ºw~•«,/J\nZ®vøsÕ¢ÛBÓ®X¥ÏXµ;[`7«Ûç\0}µdÉ’ÇD±Ø=æÏÿ¹)ò“øú#Q¦îºë®”¯?“ây¼¶ÖR°R>úè±Ûn»-ß5îH:oB:+`v´j{±šê­ŠÈG?úÑ³yÕè†­ñCpÍÈÈÈ³òçWtîü*W“//J\nV®:ú¹ÊtZl&+VÍÕny\'«Óï\0}“®9µxñâ—Æ¼ùÁHúÿÍ±_ùù¸}}ääëÏ¶4¿×²¿ùÍoûáØñIæ¶lÙ2vÅWä×±jæ8G¬fÑòåËçï¾ûî÷mŞ¼9ßn3fıúõWÆÂ†ü¹\råjòåEI‘ÊU¦*8íŠSk±jj·Ş\nÖTß\0ú¦R©üÏØwÜ?ò­Æ[ı¾[­Vß·Ï]¹re¯\'d\Z¸t@!ëUy1zÃŞpÿ	\'œ0vÉ%—l¿&Vº\\Rú,ÕÆ·¿…ğØcğö¿fÒ	9œ¼¢ Şñw¬;óÌ3óÎ3c=ôĞÔæà[»¡\\M¾¼(’r•LVtÚ¦vÅª©İúí\nÖdß\0ú\"ÊÔ#¢8,ıÅ“jã\'†Øeâø¸}u,Û9_.HG—âù¿½q–Â	e©‹¤·~ÌéÖ$Zòß¥£W³q1áï}ï{ÓUº[ş¼†‰r5ùò¢dˆÊUÒ®ğì>¯óbÕÔ®`-kYŞîû\0@ORñhœ\0âˆÈ%‘[cñk‘·ŒŒüe¾ş\\–JQãïÙ¼fV§I%3•ª§äI¼ño<ïè£¾?/?ƒtÛm·İ3::ša¾->Ã¦èåª]fjyQ2då*É‹OkQê¤X5Mv¿üñ`Ú¢4ıE”…½ÒÙ£Gs.‹¼?ö_¼bÅŠßÏ×F·¦¢µıEÕ,R«Ó¿MÜ~0Ïü¾LÚ˜‘û.½ôÒ¼\rÌA”>t¸!}î+>Ã¦ÈåJÆ3„å*ÉP*FéÈS§Åª)¿_ş¸\0Ğ•E‹=,öEaøÏ´?ùeäS‘‘J¥ò§ùú0çŒ¾gÅŠwmİº5ïA}wöÙg§_¢Ûãêoòç1Œ”«âgHËUÒï\"ÔïÇ Ò‰&bßï9‘ƒëõúwÒ‰(Ò)Ããëÿû ÏÈ×‡¡°Ç{\\xÒI\'İ—¡~ºñÆ·ŒŒŒü6~™vÉ¿ÿ°R®ŠŸ!.WI¿\nQ¿€ˆ}½?,uZÜş:nÓ¢?·¯¨T*˜¯C\'~Ø¹dÉ’GuÔoÒ9ôû-±JÅªZ­î›ïa¦\\?C^®’^‹Q¯÷`È¥zÄ>Ş¿DuEä7‘ÏEö}\\¾>”B:s_ü|wÏ=÷¼yıúõ]Íl\néäÏX¥‹¦•æˆU“rUü” \\%Ó-HÓ½\0C®^¯ÿu”©\"g5®9uQä‘‘‘˜×œ‚‘şç!ÂÜ{úé§ßĞé£ÛI§[OgŒ_´\reùŒUN¹*~JR®’n‹R·ë0Ä–-[ö\'±?W‹}ÄOÆ¾İõ‘‘ãâëWÅşŞÏ×Z¤£LñËrÍşûï¿aíÚµWEWêèlé-…?üá7¿ûİï¾,N3ãme8+àd”«â§Då*é´0uº\0Cªq±ÛÅ¾Ü{ãöû‘[#_¯ßì\ZK0\r÷ÏîùQü2]·Ï>ûœzÊ)§||Íš5_¸ñÆ×Ş}÷İ[×¯_ãgœñó#<òú½öÚëÆÚø9ùÓöwB¹*~JV®’©ŠÓTËR±Ï÷äTb?îŒF™º4ò¾Å‹ÿcY®93\"ıEüÂ½«¶ã‹›–®›•ß·Ì”«â§„å*™¬@M6ÀJoç‹}¸İbîã‘k\"7DNn¼ıï‘ùú\0³J¹*~JZ®’¼Hå_0dÒ‰&¢8ı}¨C\"6NDqvúGY?Ì!ÊUñSâr•4UºD‚b0„*•Êc£8í%êôÚø)Ò×E™úû—2.˜ƒ”«â§äå*yaz‹oºÍ\00÷¤‹ôŒŒ¼<^Û?”ŠTmü\"¾§¥‚•ŠV¾>Àœ¡\\?ÊÕö³ƒ–şß HÆÆÆ|íµ×~~Íš5w­ZµjûÏ¨Ì~Î=÷Üû.¼ğÂkÎ;ï¼Eù6ƒÙ6::úŒôÖ¾x=ÿvã­~6>+ÿ×œ†Fšóy)VÒ6Ê·[Ù(WÅrõÕWè‚.Û´iÓØwŞ9ágVf\'i[¤måêxİØ%ßn0“ÒÉ&\"õxışTmü$×D™úÏtrŠE‹=,_`((WÅr¥\\ÍêÕ«ïH;ñùÏª#7n¼%^7VçÛ\r)=ºÔ‹ãõú}‘¤k‰Æíq»÷ÈÈÈ_äë¥U«Vİï‹›-[¶\\;I[óíV6ÊU±¤·zİ(nÒ¶ñºÁLH—Á‰×ç·DúZmüšSéB¾GD^”.ğ›¯0ô.ºè¢ütqsùå—Æÿ@+WEãˆwñãˆ7ƒ®9¯Ç¯¹6r}½^ÿdÜV—-[ö\'ùú\0¥“>ø¼jÕª[7lØğó¹ş?ÑÛ¶m›06WÛâúuëÖ;H›}vB¹*šNËÕ·n»öÒ“Ç®<÷ğíINcùzÒÿ(WôC:ÑÄÈÈÈ?Äkğ¡‘ï¦QT«Õ³âÏûÇŸÿ:_€yÛw”vIGGÒÛHÒ„<ó©O}j,í€çãs8i[¤mRúb•(WÅ’~Fóù<·ßrÃØº³[û4––åëK“¶Q¾İ £££‹×Ü×G>ùM”©G2õ2×œ(‰˜\0ÖFîÍÇÊU±tR®®»òkŠU3×_ùõ	ëK£\\m§t`×]wı£(N¯ˆõáx­ıIä¦Ègcl÷%K–<&_€!ÂhÚùN‰Éàiùræ>åªX:)WWÔ„RÕLZ–¯/ırµı¢ã›·db®üÛ˜;ŒÛs\Z×œº rğÈÈÈßÅâòõ(‰t6¢˜64ËUää|æ>åªX:)WëÎY9¡T5“–åëKSòrÕ,Vû6nK_°*•ÊŸÆëèH©OÇíæÈúÈ±ñõ®±ì¡ùú\0”TµZİ·¥X¥l‰âÑùzÌmÊU±(WÅO‰ËU~Ä*ÿºbüƒxİ\\åéÈ¸½¬qÍ©/GöŠeOÊ×€yË—/xãàZËUÊóu™Û”«bé¤\\¥³æ¥ª™´,__ú›’–«ÉŠÔdãC%\nÔ_EŞ\Z¯—_ü.²&røâÅ‹_àšS\0L)&ÃÚ«±ô?t©xåë3w)WÅÒI¹Úpñ±JU3iY¾¾ô7%,WS¨©–Ï9•Jeç˜ï^¯\'D6E~9±^¯/eÈ×€I¥·şÅ$r{^¬š‰Éåmù}˜»”«bé¤\\İ|ÃÇÖ}û°	Å*¥eùúÒß”¬\\uZœ:]¯bŞû½(SÏ‹¼;^/nœˆâ›q»_Œ==_\0:V¿:ü„RÕ’Í®Ç1<”«bé¤\\¥lúÁg&”«4–¯\'ıO‰ÊU·…©ÛõgUªÇGyzC¼~!rsdm|ıï‹/~éÂ…’¯\0]kµJgLoƒ¸®M±j½Ú=¿/s“rU,•«mÛÆ6|ï¸	å*¥eÖ—¾¦$åjºEiº÷¸tÍ©‘‘‘ùë#ñºwUäÆøó©Õju™“50cbòyUL>_iœšı‰)1öÈ|=æ&åªX¦*W·ßrÃØú‹?6¡X5“–¥uòûIÿR‚rÕkAêõşı²SÌ]ÏŒùê x[Õx«ßù1öÈ³Óòü\00p1	ÕbR:-g8(WÅ2i¹Ú¶mló†óÆ®8ëà	…*OZ\'­ë(Ö`2äåª_Å¨_Ó•˜«Y¯kŸ‰ü*ruÌaÇD^¹téÒÿ–¯\03.&§å5ZÊU±´+WS­š,b\r&C\\®ú]ˆúıx¤kN-^¼ø%ñ:ö(P?ŠÛßF¾Y‘Şe‘¯\0³.&¨½\"ÇåãåªXÚ•«NVM–tßüñ¤·i¹Ê‹PzË\\úlm·oËï—?nÏ¢P=5^·ş-rfmüšS«#+#ÏOgıË×€BiœŠöÃù8ÃA¹*–vå*/Lİ&<é-CX®ò”ŠÑI‘ô÷L·¬Éî—?~WÒµczm¼VıßÈÏ\"?9éqûº‘‘‘?Î×€BKş‰íÈ|œá \\ÍŒtB˜|¬våJŠ•!+WíŠO:ò”şÍtR°Z‹U3ËZ–·û>m¥£O1çüïÆÑ¨ï¥£S1}#­Šñ§åëÀœÒ˜àËÇÊÕÌˆç\réS•,åªø¢r5YáiW”vT°Ú­bc¼ÕdßoŞÈÈÈâwäQ¢¾·¿MŸŸŠ¿3ÿ”>W•¯\0sVLtˆ¼=g8(W3#ı;7rEì4î–/oR®ŠŸ\"•«øy:?² ïÀ¤E§¡]ajW°Ú­×®X5mÿ¾;ï¼óKãyï’Îäê§µñ3ûYšÎø—ß	\0†FLt‰	pß|œá \\ÍŒ–rµ=ÿ™ŸP²”«â§`åªù3ÕMÉšªX5µ+N­«İò«íæÏŸÿ’×¼æ5÷½úÕ¯¾,óÛGFF5oŠû\0ÀĞˆÀã£`½)g8(W3#/W­%+v._Ş\\O¹*~\nZ®:-Y«¦v*}ı 6ãS«¦T°æu÷<\0`8ÄDı©ôY‘|œáĞØ!»/rOd[äÎÈí‘[kã×ŒùuäÆÈ/#×G~¹6rMäêÈU‘uQ~Ü¸ÎLúßèï×ÆO|qäÂÈ‘UñstN¬sVüù›‘¯GÎˆ|9ò…Èç\"ŸuN|:òÉøúÄÈ	‘ã\"Ç¦·E>Ëş#òïéD+1ş¾ÈáµñÏ\ZËßU?	ËA‘·Eö«Ÿ¶ù-1¾wÜ®ˆ±7ÄŸ÷ˆ,‹?/‰Ôc¼\Zy]Œ½&QŠ¡]£ôük*>ñç—Eş)–/ˆ¼hñâÅ/ˆuËş!òwéŞcùßFş:ÆŸù«J¥ò”È“\"}\\mâNpâq^¢\\?/W;*Yİ«¦vëêìë‹U‹é>\0˜»b‚>=RÍÇ+W®|P:ÑÂÂ…eà#ìœNs…á‘K—.ı³%K–<&Æ›ÊB*\rQ œJD,Z*Q ‘JFŒ=;ò÷©|ÄÏÍó#/Šå/Nå$JÉKSY‰e#¯L%&–¿:òºX¾8•œM¥\'²GŒ¿¾6~1Ğt­µ·Äâ}êã—8 r`ä1~päĞÈa‘Ãcù{#GÆ²£\"GG>ãùxä„ûD¬óÉÈ§kãŸóølmüç<•¼tÒ3b¯E¾Q/ƒß¬ªï°¦²øİÚxy¼$òƒêx©\\YùIm¼tn¨—ĞTF¯«MÜùÍsŠrUüÌ‘rÕÌùµñ’Õk‘iW°z)VM½>/\0˜[jã;š>t®ÍNïöÄïÖW\"Ïk®§\\?ù6,z*•ÊØüùóS	êõ³³é­€ù«ôu\ZïEz^©`ÍÏ\0ÀĞIÿsßú™ {ùo*Uò?@‘ÊÕ¼‰G(¶§(Ëg+säÈÕùµ¾-°×#D;:rÕî,‚êõyÀÜôém]ù8Ğ¹Æï=ñ»tZ»RÕT´rµ£±Ù^>[)x¹ÊKU«é™vÅ*?‚5‚5İç\0sWLÔk\"ÏÍÇÎÅïĞÉé$ùxN¹ê|ùl¥ åjG¥ªU·…¦]±JŸ±jw¶Àn\nV·Ï\0†CLØ—W«Õgæã@ÿ)W/Ÿ­¬\\uZªZuZl&+VÍÕny\'«Óï\0Ã§^¯ÿ´R©<5úO¹ê|ùl¥HåªSœvÅ©µX5µ[oGkªï\0Ã­V«ılddä	ù8ĞÊUçËg+CR®’ÉŠN»ÂÔ®X5µ[¿]Ášìû@yD¹úU½^T>ôŸrÕùòÙÊ•«¤]áÙ}^çÅª©]ÁZÖ²¼İ÷€ò‰rukº l>ô_ÑÊU»eùleÈÊU’ŸÖ¢ÔI±jšì~ùã@yE¹Ú¶páÂ‡äã@ÿ©\\Iûa¹Jò”ŠQ:òÔi±jÊï—?.\0”ÚNQ®îÏÁP®ŠŸ!-WI¿‹P¿\0æ¶åË—Ïrµ5C¹*~†¸\\%ı*Dız\0Q®^­VoÉÇÁP®ŠŸ!/WI¯Å¨×ûÀpªT*®Õji’f€rUü” \\%Ó-HÓ½\0¿(VOŒlÊÇÁP®ŠŸ’”«¤Û¢Ôíú\0P.õzıiQ®®ÊÇÁP®ŠŸ•«¤ÓÂÔéz\0P^###ÏªV«?ÊÇÁP®ŠŸ’•«dªâ4Õr\0 ‰bõ¼Z­¶:C¹*~JX®’É\nÔdã\0@.ŠÕ‚Èùù80ÊUñSÒr•äE*ÿ\Z\0Ø‘z½şŠ(WßÊÇÁP®ŠŸ—«¤Y¨ömÜ*V\0Ğ©(W¯ªV«_ÉÇÁP®ŠŸ’—«ä…µZ-ı(V\0Ğ(Vµ(X§åãÀ`(WÅrµı-ã¥ÿ7\0€®Åº<rr>†rUü(WÊ\0LKL {EËÇÁP®ŠåJ¹€i©×ëûU«ÕçãÀ`¬Zµêş;ï¼sÂ½#[¶l¹,ÊÕÖ|»•r\0ÓÅêQ°ÌÇÁ¸è¢‹nØ´iÓ„z)F.¿üòÏD¹*ıµÿ”+\0˜†˜@WFËÇÁ8ï¼ó­ZµêÖ\r6üÜ¬â$¶ÅõëÖ­;;ŠÕæÈ.ùv+å\n\0¦!&ĞDŞƒ“vŞÓÑ‘ôö³ôù)DÒ¶HÛ¤ôÅ*Q®\0`\ZêõúGªÕjºX$\0l§\\À4D±:>\nÖ›òq\0ÊK¹€iˆ	ôSQ®vÏÇ(/å\n\0¦!&ĞÓ#Õ|€òR®\0`\Zb=£Z­î–P^Ê\0LC«³FFF^P^Ê\0LCL Ôëõçã\0”—r\0ÓèšÈsóq\0ÊK¹€iˆ	ôòjµúÌ|€òR®\0`\ZêõúO+•ÊSóq\0ÊK¹€iˆ	ôg###OÈÇ(/å\n\0¦!&Ğ_ÕëõGåã\0”—r\0Óè­•Jeç|€òR®\0`\Zbİ¶páÂ‡äã\0”—r\0İÛ)&ĞûóA\0ÊM¹€.-_¾|~L [óq\0ÊM¹€.E¹zxµZ½% Ü”+\0èR¥RytL ›óq\0ÊM¹€.ÅäùÄÈ¦|€rS®\0 Kõzıi1^•PnÊ\0tiddäYÕjõGù8\0å¦\\@—¢X=/&ĞÕù8\0å¦\\@—bò\\9? Ü”+\0èR½^EL ßÊÇ(7å\n\0ºåêUÕjõ+ù8\0å¦\\@—¢XÕ¢`–PnÊ\0t)&Ïå‘“óq\0ÊM¹€.Åä¹Wä¸|€rS®\0 Kõz}¿jµúá|€rS®\0 KQ¬ŞëÈ|€rS®\0 K1y®Œ–PnÊ\0t)&ÏDŞPnÊ\0t©^¯¤Z­î›PnÊ\0t)ŠÕñQ°Ş”PnÊ\0t)&ÏOE¹Ú= Ü”+\0èRL§Gªù8\0å¦\\@—bò<£Z­î–PnÊ\0t)ŠÕY###/ÏÇ(7å\n\0º“çõzıÅù8\0å¦\\@—bò\\yn>@¹)W\0Ğ¥˜</¯V«ÏÌÇ(7å\n\0ºT¯×Z©TšPnÊ\0t)&ÏŸŒŒ<! Ü”+\0èRL¿ª×ëÊÇ(7å\n\0º“ç­•Jeç|€rS®\0 K1yn[¸páCòq\0ÊM¹€îì”&O‘vÉ\'\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 óÿy©ı>Mºu\0\0\0\0IEND®B`‚',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('batch.schema.version','6.5.0.6',1),('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','6.5.0.6',1),('entitylink.schema.version','6.5.0.6',1),('eventsubscription.schema.version','6.5.0.6',1),('identitylink.schema.version','6.5.0.6',1),('job.schema.version','6.5.0.6',1),('next.dbid','7501',4),('schema.history','create(6.5.0.6)',1),('schema.version','6.5.0.6',1),('task.schema.version','6.5.0.6',1),('variable.schema.version','6.5.0.6',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_entitylink`
--

DROP TABLE IF EXISTS `act_hi_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_entitylink`
--

LOCK TABLES `act_hi_entitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_tsk_log`
--

DROP TABLE IF EXISTS `act_hi_tsk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_tsk_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_tsk_log`
--

LOCK TABLES `act_hi_tsk_log` WRITE;
/*!40000 ALTER TABLE `act_hi_tsk_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_tsk_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_bytearray`
--

DROP TABLE IF EXISTS `act_id_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_bytearray`
--

LOCK TABLES `act_id_bytearray` WRITE;
/*!40000 ALTER TABLE `act_id_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv`
--

DROP TABLE IF EXISTS `act_id_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv`
--

LOCK TABLES `act_id_priv` WRITE;
/*!40000 ALTER TABLE `act_id_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv_mapping`
--

DROP TABLE IF EXISTS `act_id_priv_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv_mapping`
--

LOCK TABLES `act_id_priv_mapping` WRITE;
/*!40000 ALTER TABLE `act_id_priv_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_property`
--

DROP TABLE IF EXISTS `act_id_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_property`
--

LOCK TABLES `act_id_property` WRITE;
/*!40000 ALTER TABLE `act_id_property` DISABLE KEYS */;
INSERT INTO `act_id_property` VALUES ('schema.version','6.5.0.6',1);
/*!40000 ALTER TABLE `act_id_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_token`
--

DROP TABLE IF EXISTS `act_id_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_token`
--

LOCK TABLES `act_id_token` WRITE;
/*!40000 ALTER TABLE `act_id_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1',NULL,NULL,NULL,'','2020-09-17 06:51:40',NULL,NULL,NULL,NULL),('2501',NULL,NULL,NULL,'','2020-09-18 06:14:27',NULL,NULL,NULL,NULL),('5001',NULL,NULL,NULL,'','2020-09-22 09:49:46',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('myProcess:1:4',1,'http://www.activiti.org/test','My process','myProcess',1,'1','processes/MyProcess.bpmn20.xml','processes/MyProcess.myProcess.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('myProcess:2:2504',1,'http://www.activiti.org/test','My process','myProcess',2,'2501','processes/MyProcess.bpmn20.xml','processes/MyProcess.myProcess.png',NULL,0,1,1,'',NULL,NULL,NULL,0),('myProcess:3:5004',1,'http://www.activiti.org/test','My process','myProcess',3,'5001','processes/MyProcess.bpmn20.xml','processes/MyProcess.myProcess.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_actinst`
--

DROP TABLE IF EXISTS `act_ru_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_actinst`
--

LOCK TABLES `act_ru_actinst` WRITE;
/*!40000 ALTER TABLE `act_ru_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_entitylink`
--

DROP TABLE IF EXISTS `act_ru_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_entitylink`
--

LOCK TABLES `act_ru_entitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_history_job`
--

DROP TABLE IF EXISTS `act_ru_history_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_history_job`
--

LOCK TABLES `act_ru_history_job` WRITE;
/*!40000 ALTER TABLE `act_ru_history_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_history_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL COMMENT 'idåºå·',
  `dept_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'éƒ¨é—¨åç§°',
  `dept_manager` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'éƒ¨é—¨ä¸»ç®¡',
  `parent_dept_id` int(11) DEFAULT NULL COMMENT 'çˆ¶çº§éƒ¨é—¨',
  `dept_emp_num` int(11) DEFAULT NULL COMMENT 'éƒ¨é—¨äººæ•°',
  `dept_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'éƒ¨é—¨æè¿°',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_channel_definition`
--

DROP TABLE IF EXISTS `flw_channel_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_channel_definition` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_channel_definition`
--

LOCK TABLES `flw_channel_definition` WRITE;
/*!40000 ALTER TABLE `flw_channel_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_channel_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangelog`
--

DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ev_databasechangelog` (
  `ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangelog`
--

LOCK TABLES `flw_ev_databasechangelog` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangelog` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangelog` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2020-09-17 14:51:35',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'3.8.7',NULL,NULL,'0325495870');
/*!40000 ALTER TABLE `flw_ev_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangeloglock`
--

DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ev_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangeloglock`
--

LOCK TABLES `flw_ev_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_definition`
--

DROP TABLE IF EXISTS `flw_event_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_event_definition` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_definition`
--

LOCK TABLES `flw_event_definition` WRITE;
/*!40000 ALTER TABLE `flw_event_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_deployment`
--

DROP TABLE IF EXISTS `flw_event_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_event_deployment` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_deployment`
--

LOCK TABLES `flw_event_deployment` WRITE;
/*!40000 ALTER TABLE `flw_event_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_resource`
--

DROP TABLE IF EXISTS `flw_event_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_event_resource` (
  `ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_resource`
--

LOCK TABLES `flw_event_resource` WRITE;
/*!40000 ALTER TABLE `flw_event_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch`
--

DROP TABLE IF EXISTS `flw_ru_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ru_batch` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime NOT NULL,
  `COMPLETE_TIME_` datetime DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch`
--

LOCK TABLES `flw_ru_batch` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch_part`
--

DROP TABLE IF EXISTS `flw_ru_batch_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flw_ru_batch_part` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime NOT NULL,
  `COMPLETE_TIME_` datetime DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch_part`
--

LOCK TABLES `flw_ru_batch_part` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_finish` tinyint(1) DEFAULT NULL COMMENT 'æ˜¯å¦å®Œæˆ',
  `user_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'å®Œæˆäº”æ€',0,NULL,1,'2020-08-26 14:28:49','2020-08-26 14:28:53');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `option_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æ“ä½œç±»å‹',
  `option_target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æ“ä½œå†…å®¹',
  `option_user` int(20) DEFAULT NULL COMMENT 'æ“ä½œç”¨æˆ·',
  `option_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æ“ä½œäººåç§°',
  `option_ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æ“ä½œäººip',
  `option_remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æ“ä½œå¤‡æ³¨',
  `create_time` datetime DEFAULT NULL COMMENT 'æ“ä½œæ—¶é—´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-28 13:51:34'),(2,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 13:51:34'),(3,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 13:53:04'),(4,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 13:54:58'),(5,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-28 13:55:50'),(6,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 13:55:54'),(7,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-28 13:56:03'),(8,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-28 13:58:28'),(9,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 13:59:31'),(10,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-28 14:19:30'),(11,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:19:30'),(12,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:23:19'),(13,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:29:57'),(14,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:32:28'),(15,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:33:20'),(16,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:34:00'),(17,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:37:04'),(18,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:55:02'),(19,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:58:23'),(20,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-28 14:58:37'),(21,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:20:57'),(22,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:20:58'),(23,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:21:40'),(24,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:21:53'),(25,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:22:46'),(26,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:23:07'),(27,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:23:22'),(28,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:23:22'),(29,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:24:29'),(30,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:24:38'),(31,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:24:38'),(32,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:26:33'),(33,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:26:45'),(34,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:26:45'),(35,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:48:30'),(36,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:48:43'),(37,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:48:51'),(38,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:50:22'),(39,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:53:33'),(40,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:53:34'),(41,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:55:42'),(42,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:55:51'),(43,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:56:40'),(44,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:56:40'),(45,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:57:28'),(46,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:57:32'),(47,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 11:58:30'),(48,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:58:40'),(49,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 11:58:43'),(50,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 12:03:09'),(51,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 12:03:17'),(52,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 13:43:18'),(53,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 13:43:18'),(54,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 13:55:20'),(55,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 13:55:20'),(56,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 13:55:27'),(57,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 13:55:27'),(58,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 13:55:29'),(59,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 13:55:35'),(60,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 13:56:27'),(61,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 13:56:29'),(62,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 13:56:56'),(63,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:14:39'),(64,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:18:56'),(65,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:18:56'),(66,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:19:03'),(67,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:22:26'),(68,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:22:42'),(69,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:25:47'),(70,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:27:58'),(71,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:28:19'),(72,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:31:42'),(73,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:32:36'),(74,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:34:53'),(75,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:53:15'),(76,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:56:48'),(77,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 14:58:22'),(78,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 14:58:22'),(79,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:02:01'),(80,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:02:07'),(81,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:03:02'),(82,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:11:08'),(83,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:12:55'),(84,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:14:19'),(85,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:16:27'),(86,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:17:00'),(87,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:45:12'),(88,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:46:27'),(89,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:47:00'),(90,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:48:06'),(91,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:48:37'),(92,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:49:22'),(93,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:49:27'),(94,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:50:03'),(95,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:50:05'),(96,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:50:26'),(97,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:51:38'),(98,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:51:41'),(99,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:54:54'),(100,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:54:57'),(101,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:57:10'),(102,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:57:30'),(103,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:57:33'),(104,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 15:59:29'),(105,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:59:29'),(106,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 15:59:33'),(107,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:02:27'),(108,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:02:29'),(109,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:02:53'),(110,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:02:53'),(111,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:06:21'),(112,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:06:21'),(113,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:07:22'),(114,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:07:48'),(115,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:09:34'),(116,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:09:48'),(117,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:09:48'),(118,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:10:04'),(119,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:10:14'),(120,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:11:50'),(121,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:12:14'),(122,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:12:21'),(123,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:12:21'),(124,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:13:19'),(125,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:13:19'),(126,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:14:08'),(127,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:14:08'),(128,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:15:09'),(129,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:15:09'),(130,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:15:55'),(131,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:16:24'),(132,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:16:24'),(133,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:18:31'),(134,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:20:51'),(135,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:20:52'),(136,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:39:21'),(137,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:39:21'),(138,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:40:11'),(139,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:40:14'),(140,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:40:22'),(141,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:40:31'),(142,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:40:53'),(143,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:43:32'),(144,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:43:32'),(145,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:43:48'),(146,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:46:16'),(147,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:49:25'),(148,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:50:40'),(149,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 16:58:39'),(150,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 16:58:39'),(151,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:00:07'),(152,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:00:07'),(153,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:00:11'),(154,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:08:47'),(155,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:08:48'),(156,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:10:31'),(157,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:19:05'),(158,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:19:23'),(159,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:19:33'),(160,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:19:36'),(161,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:19:53'),(162,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:19:57'),(163,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:20:49'),(164,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:21:10'),(165,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:24:44'),(166,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:27:38'),(167,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:27:38'),(168,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:28:28'),(169,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:28:28'),(170,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:29:03'),(171,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:29:03'),(172,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:29:08'),(173,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:30:46'),(174,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:30:50'),(175,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:34:36'),(176,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:34:42'),(177,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-29 17:36:36'),(178,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:36:36'),(179,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-29 17:42:46'),(180,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-30 08:31:29'),(181,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-30 08:31:29'),(182,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-30 13:42:45'),(183,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-30 13:42:45'),(184,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-30 17:11:03'),(185,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:22:17'),(186,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:22:18'),(187,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:24:03'),(188,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:24:15'),(189,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:24:49'),(190,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:26:32'),(191,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:27:02'),(192,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:27:09'),(193,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:27:50'),(194,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:28:31'),(195,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:28:32'),(196,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:28:43'),(197,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:28:58'),(198,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:28:58'),(199,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:29:36'),(200,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:29:36'),(201,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:30:10'),(202,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:30:11'),(203,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:31:21'),(204,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:32:28'),(205,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:32:36'),(206,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 09:54:35'),(207,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 09:59:22'),(208,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:22:15'),(209,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:22:26'),(210,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:28:30'),(211,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:31:37'),(212,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:31:52'),(213,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:33:20'),(214,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:34:35'),(215,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:35:33'),(216,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:35:45'),(217,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:37:13'),(218,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:39:51'),(219,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:46:19'),(220,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:46:32'),(221,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:48:15'),(222,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:48:37'),(223,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:49:54'),(224,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 10:54:50'),(225,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 11:00:32'),(226,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 11:01:29'),(227,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 11:02:37'),(228,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 11:05:25'),(229,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 14:01:42'),(230,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 14:22:41'),(231,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 14:32:05'),(232,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 14:33:17'),(233,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 14:40:38'),(234,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 14:49:12'),(235,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 14:54:34'),(236,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 14:54:49'),(237,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:00:40'),(238,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 15:01:34'),(239,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:02:48'),(240,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:23:30'),(241,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 15:24:53'),(242,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:26:29'),(243,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 15:27:04'),(244,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:28:00'),(245,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:29:51'),(246,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:31:51'),(247,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:32:07'),(248,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:35:38'),(249,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:43:02'),(250,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:43:48'),(251,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:44:22'),(252,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:44:35'),(253,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:52:34'),(254,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 15:55:48'),(255,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:55:49'),(256,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 15:56:03'),(257,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 15:56:41'),(258,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 15:56:41'),(259,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 16:00:30'),(260,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-07-31 16:14:55'),(261,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 16:14:55'),(262,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-07-31 16:25:29'),(263,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-06 17:10:58'),(264,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:10:58'),(265,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:14:57'),(266,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:16:56'),(267,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:18:45'),(268,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:23:02'),(269,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:23:30'),(270,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:25:43'),(271,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:27:02'),(272,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:28:37'),(273,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:29:48'),(274,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:30:26'),(275,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:30:55'),(276,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:31:20'),(277,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:31:51'),(278,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:32:32'),(279,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:33:18'),(280,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:33:28'),(281,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:34:03'),(282,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:34:38'),(283,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:34:53'),(284,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-06 17:35:18'),(285,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-19 08:34:56'),(286,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 08:34:56'),(287,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 08:42:31'),(288,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-19 09:36:25'),(289,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 09:36:25'),(290,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 09:40:12'),(291,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 09:46:01'),(292,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 09:48:35'),(293,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 09:55:18'),(294,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:05:26'),(295,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-19 10:06:00'),(296,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:06:53'),(297,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-19 10:07:18'),(298,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:07:18'),(299,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:12:03'),(300,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:12:14'),(301,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:16:58'),(302,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:28:13'),(303,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:37:21'),(304,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:47:17'),(305,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:47:51'),(306,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:48:06'),(307,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:48:49'),(308,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:50:39'),(309,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 10:52:58'),(310,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-19 15:35:33'),(311,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 15:35:33'),(312,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 15:43:01'),(313,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-19 15:43:37'),(314,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 10:52:49'),(315,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 10:52:49'),(316,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 10:57:31'),(317,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 11:05:46'),(318,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 11:53:52'),(319,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 11:53:53'),(320,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 13:34:38'),(321,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:34:38'),(322,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:40:25'),(323,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:50:34'),(324,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:51:49'),(325,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 13:53:30'),(326,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:53:41'),(327,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:56:57'),(328,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 13:57:13'),(329,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:58:03'),(330,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:58:31'),(331,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:59:16'),(332,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 13:59:57'),(333,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:01:59'),(334,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:05:21'),(335,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:08:37'),(336,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:08:58'),(337,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 14:18:49'),(338,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 14:19:14'),(339,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 14:19:31'),(340,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:20:24'),(341,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:22:48'),(342,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:22:58'),(343,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:24:05'),(344,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:30:01'),(345,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:31:05'),(346,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:31:43'),(347,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:31:56'),(348,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:35:47'),(349,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:36:18'),(350,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:37:07'),(351,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:37:43'),(352,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:38:24'),(353,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:38:53'),(354,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 14:38:57'),(355,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 14:47:59'),(356,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-20 15:01:12'),(357,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 15:01:12'),(358,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-20 15:10:28'),(359,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-24 09:47:06'),(360,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:47:06'),(361,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:50:57'),(362,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:53:06'),(363,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:53:21'),(364,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:53:50'),(365,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:54:03'),(366,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:54:20'),(367,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:55:34'),(368,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:55:45'),(369,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:57:36'),(370,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:57:55'),(371,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:59:12'),(372,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 09:59:22'),(373,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-24 16:08:48'),(374,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:08:48'),(375,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:21:51'),(376,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:23:02'),(377,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:23:46'),(378,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:24:01'),(379,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:39:05'),(380,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:41:21'),(381,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:42:15'),(382,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:43:52'),(383,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:44:56'),(384,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:45:15'),(385,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:45:41'),(386,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:49:00'),(387,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-24 16:51:45'),(388,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-26 09:46:06'),(389,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 09:46:07'),(390,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 10:24:34'),(391,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-26 10:56:46'),(392,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 10:56:46'),(393,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 10:58:58'),(394,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:00:22'),(395,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:01:14'),(396,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:29:51'),(397,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:40:16'),(398,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:40:33'),(399,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:47:29'),(400,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:55:40'),(401,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-26 11:58:33'),(402,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 11:58:33'),(403,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 12:00:44'),(404,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 12:01:03'),(405,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-26 13:35:26'),(406,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 13:35:26'),(407,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 13:38:44'),(408,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 13:39:19'),(409,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 13:50:40'),(410,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 14:26:28'),(411,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-26 14:37:09'),(412,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 14:37:09'),(413,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 14:50:46'),(414,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 14:53:37'),(415,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 14:53:48'),(416,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 14:53:51'),(417,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 14:55:40'),(418,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:00:26'),(419,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:00:34'),(420,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:01:47'),(421,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:15:19'),(422,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:24:41'),(423,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:28:39'),(424,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:29:24'),(425,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-26 15:42:09'),(426,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:42:09'),(427,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:42:22'),(428,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:42:54'),(429,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:43:36'),(430,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:44:27'),(431,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:44:48'),(432,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-26 15:50:02'),(433,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-31 12:00:43'),(434,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 12:00:44'),(435,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 12:00:53'),(436,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-08-31 13:37:54'),(437,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:37:59'),(438,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:41:30'),(439,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:42:10'),(440,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:42:32'),(441,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:43:01'),(442,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:43:12'),(443,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:43:22'),(444,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 13:50:18'),(445,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-08-31 14:08:09'),(446,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-09-18 14:14:28'),(447,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:14:28'),(448,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:34:49'),(449,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:34:57'),(450,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:35:40'),(451,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:35:53'),(452,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:36:00'),(453,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:36:38'),(454,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-18 14:38:07'),(455,'ç™»å½•','ç”¨æˆ·ç™»å½•',1,'æ±ŸäºŒå°‘','127.0.0.1','ç¬¬nullæ¬¡ç™»å½•','2020-09-22 17:52:54'),(456,'æŸ¥è¯¢','ç”¨æˆ·æ¨¡å—',1,'æ±ŸäºŒå°‘','127.0.0.1','è·å–ç”¨æˆ·ä¿¡æ¯','2020-09-22 17:52:54');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `producer` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'å…³äºå­¦ä¹ å°èˆ¹è­¦å‘Š','é’ˆå¯¹å­¦ä¹ å°èˆ¹ç»å¸¸å¼€è½¦ï¼Œå¤„ä»¥å…¨å‘˜å‡€èº«',1,NULL,'2020-08-26 10:58:44','2020-08-26 10:58:46');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `off_work`
--

DROP TABLE IF EXISTS `off_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `off_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'è¯·å‡äºº',
  `off_type` int(255) DEFAULT NULL COMMENT '1:äº‹å‡ 2ï¼šç—…å‡ 3ï¼šå©šå‡ 4ï¼šäº§å‡ 5:ä¸§å‡ 6ï¼šé™ªäº§å‡',
  `off_reason` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'è¯·å‡ç†ç”±',
  `off_start_time` datetime NOT NULL COMMENT 'è¯·å‡å¼€å§‹æ—¶é—´',
  `off_end_time` datetime NOT NULL COMMENT 'è¯·å‡ç»“æŸæ—¶é—´',
  `is_allow` tinyint(1) DEFAULT '0' COMMENT 'æ˜¯å¦æ‰¹å‡†(0ï¼šæœªæ‰¹å‡† 1ï¼šå·²æ‰¹å‡†)',
  `review_user_id` int(11) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'è¯·å‡å¤‡æ³¨',
  `is_del` tinyint(1) DEFAULT NULL COMMENT 'æ˜¯å¦åˆ é™¤(0ï¼šæœªåˆ é™¤ 1ï¼šå·²åˆ é™¤)',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»º æ—¶é—´',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–° æ—¶é—´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `off_work`
--

LOCK TABLES `off_work` WRITE;
/*!40000 ALTER TABLE `off_work` DISABLE KEYS */;
INSERT INTO `off_work` VALUES (1,1,NULL,'ç”Ÿç—…','2020-08-26 12:00:20','2020-08-26 18:00:22',0,NULL,NULL,NULL,'2020-08-26 12:00:34',NULL);
/*!40000 ALTER TABLE `off_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(20) DEFAULT NULL COMMENT 'çˆ¶æƒé™',
  `perm_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æƒé™åç§°',
  `perm_desc` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æƒé™æè¿°',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(20) DEFAULT NULL COMMENT 'çˆ¶è§’è‰²id',
  `role_zh_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'è§’è‰²åç§°',
  `role_en_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ä»£ç ä»£å·',
  `role_desc` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'è§’è‰²æè¿°',
  `role_enable` tinyint(4) DEFAULT NULL COMMENT 'è§’è‰²æ˜¯å¦å¯ç”¨',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,'è¶…çº§ç®¡ç†å‘˜','admin','ç³»ç»Ÿç®¡ç†å‘˜',1,NULL,NULL),(2,NULL,'æ€»ç»ç†','manager','æ€»ç»ç†',0,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_perm`
--

DROP TABLE IF EXISTS `role_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_perm` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(20) NOT NULL COMMENT 'è§’è‰²id',
  `perm_id` int(20) NOT NULL COMMENT 'æƒé™id',
  `perm_type` int(20) NOT NULL COMMENT 'æƒé™ç±»å‹ï¼ˆ0:å¯è®¿é—®ï¼Œ1:å¯æˆæƒï¼‰',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_perm`
--

LOCK TABLES `role_perm` WRITE;
/*!40000 ALTER TABLE `role_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `number` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT 'ç¼–å·',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'å¤´åƒåœ°å€',
  `username` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ç”¨æˆ·å',
  `password` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'å¯†ç ',
  `dept_id` int(20) DEFAULT NULL COMMENT 'æ‰€å±éƒ¨é—¨',
  `real_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'æ˜µç§°',
  `gender` smallint(1) unsigned DEFAULT '0' COMMENT 'æ€§åˆ«ï¼š1ï¼šç”·  2ï¼šå¥³',
  `age` smallint(10) unsigned DEFAULT NULL COMMENT 'å¹´é¾„',
  `address` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'åœ°å€',
  `login_ip` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ç™»å½•ip',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `is_account_non_expired` tinyint(1) DEFAULT '1' COMMENT 'è´¦å·æ˜¯å¦è¿‡æœŸ',
  `is_account_non_locked` tinyint(1) DEFAULT '1' COMMENT 'è´¦å·æ˜¯å¦è¢«é”å®š',
  `is_enabled` tinyint(1) DEFAULT '0' COMMENT 'è´¦å·æ˜¯å¦å¯ç”¨',
  `is_credentials_non_expired` tinyint(1) DEFAULT '1' COMMENT 'å‡­è¯æ˜¯å¦è¿‡æœŸ',
  `login_count` int(20) DEFAULT '0' COMMENT 'ç™»å½•æ¬¡æ•°',
  PRIMARY KEY (`id`,`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'hKGGlOEFYh4Rrey36fksySwRrNJIJI0I7UG6ezXk344','https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg','admin','123456',NULL,'æ±ŸäºŒå°‘',1,23,'é‡åº†ä¸°éƒ½','127.0.0.1','2020-03-15 16:30:50','2020-03-15 16:30:48',1,1,1,1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_perm`
--

DROP TABLE IF EXISTS `user_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_perm` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) unsigned NOT NULL,
  `perm_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_perm`
--

LOCK TABLES `user_perm` WRITE;
/*!40000 ALTER TABLE `user_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(20) unsigned NOT NULL COMMENT 'ç”¨æˆ·',
  `role_id` int(20) unsigned NOT NULL COMMENT 'è§’è‰²',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'swft'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-22 18:09:46
