-- mydataway.interface_info definition

CREATE TABLE `interface_info` (
  `api_id` varchar(64) NOT NULL COMMENT 'ID',
  `api_method` varchar(12) NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `api_path` varchar(512) NOT NULL COMMENT '拦截路径',
  `api_status` varchar(4) NOT NULL COMMENT '状态：-1-删除, 0-草稿，1-发布，2-有变更，3-禁用',
  `api_comment` varchar(255) NOT NULL COMMENT '注释',
  `api_type` varchar(24) NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `api_script` mediumtext NOT NULL COMMENT '查询脚本：xxxxxxx',
  `api_schema` mediumtext NOT NULL COMMENT '接口的请求/响应数据结构',
  `api_sample` mediumtext NOT NULL COMMENT '请求/响应/请求头样本数据',
  `api_option` mediumtext NOT NULL COMMENT '扩展配置信息',
  `api_create_time` varchar(32) NOT NULL COMMENT '创建时间',
  `api_gmt_time` varchar(32) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`api_id`),
  UNIQUE KEY `uk_interface_info` (`api_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dataway 中的API';


-- mydataway.interface_release definition

CREATE TABLE `interface_release` (
  `pub_id` varchar(64) NOT NULL COMMENT 'Publish ID',
  `pub_api_id` varchar(64) NOT NULL COMMENT '所属API ID',
  `pub_method` varchar(12) NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `pub_path` varchar(512) NOT NULL COMMENT '拦截路径',
  `pub_status` varchar(4) NOT NULL COMMENT '状态：-1-删除, 0-草稿，1-发布，2-有变更，3-禁用',
  `pub_comment` varchar(255) NOT NULL COMMENT '注释',
  `pub_type` varchar(24) NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `pub_script` mediumtext NOT NULL COMMENT '查询脚本：xxxxxxx',
  `pub_script_ori` mediumtext NOT NULL COMMENT '原始查询脚本，仅当类型为SQL时不同',
  `pub_schema` mediumtext NOT NULL COMMENT '接口的请求/响应数据结构',
  `pub_sample` mediumtext NOT NULL COMMENT '请求/响应/请求头样本数据',
  `pub_option` mediumtext NOT NULL COMMENT '扩展配置信息',
  `pub_release_time` varchar(32) NOT NULL COMMENT '发布时间（下线不更新）',
  PRIMARY KEY (`pub_id`),
  KEY `idx_interface_release_api` (`pub_api_id`),
  KEY `idx_interface_release_path` (`pub_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dataway API 发布历史。';


INSERT INTO mydataway.interface_info
(api_id, api_method, api_path, api_status, api_comment, api_type, api_script, api_schema, api_sample, api_option, api_create_time, api_gmt_time)
VALUES('i_ekglgna6e-32a', 'GET', '/api/test', '1', '', 'DataQL', 'var sss= "666";
var now = @@sql() <%
    select date_format(now(),''%Y-%m-%d %H:%i:%s'')  as a;
%>
var rs = [{"请求参数":${param}},{"mysql查询":now()}];
 return rs;', '{"requestHeader":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{}},"requestBody":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"param":{"type":"string"}}},"responseHeader":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{}},"responseBody":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"executionTime":{"type":"number"},"code":{"type":"number"},"data":{"type":"array","items":{"type":"object","properties":{"mysql查询":{"type":"string"},"请求参数":{"type":"string"}}}},"success":{"type":"boolean"},"lifeCycleTime":{"type":"number"},"message":{"type":"string"}}}}', '{"requestHeader":"[]","requestBody":"{\\n  \\"param\\": \\"233\\"\\n}","responseHeader":"{}","responseBody":"{\\n\\t\\"success\\":true,\\n\\t\\"message\\":\\"OK\\",\\n\\t\\"code\\":0,\\n\\t\\"lifeCycleTime\\":4,\\n\\t\\"executionTime\\":2,\\n\\t\\"data\\":[\\n\\t\\t{\\n\\t\\t\\t\\"请求参数\\":\\"233\\"\\n\\t\\t},\\n\\t\\t{\\n\\t\\t\\t\\"mysql查询\\":\\"2021-11-04 08:55:08\\"\\n\\t\\t}\\n\\t]\\n}"}', '{"wrapAllParameters":false,"enableCrossDomain":true,"API_BASE_URL":"/api/","ALL_MAC":"00155D50FE77,B07B251DC2F4,00155D35F088,001A7DDA7115","resultStructure":true,"showGitButton":true,"DATAWAY_VERSION":"4.2.2","checkDatawayVersion":true,"CONTEXT_PATH":"","responseFormat":"{\\n    \\"success\\"      : \\"@resultStatus\\",\\n    \\"message\\"      : \\"@resultMessage\\",\\n    \\"code\\"         : \\"@resultCode\\",\\n    \\"lifeCycleTime\\": \\"@timeLifeCycle\\",\\n    \\"executionTime\\": \\"@timeExecution\\",\\n    \\"data\\"        : \\"@resultData\\"\\n}","wrapParameterName":"root"}', '1636014321951', '1636016097359');
