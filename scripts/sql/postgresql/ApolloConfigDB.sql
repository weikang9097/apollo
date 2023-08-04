/*
 Source Server Type    : PostgreSQL
 Source Server Version : 120015 (120015)
 Source Catalog        : ApolloConfigDB
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120015 (120015)
 File Encoding         : 65001
*/

-- ----------------------------
-- Table structure for AccessKey
-- ----------------------------
DROP TABLE IF EXISTS "public"."AccessKey";
DROP SEQUENCE IF EXISTS "public"."AccessKey_Id_seq";
CREATE TABLE "public"."AccessKey" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Secret" varchar(128) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "IsEnabled" BOOLEAN NOT NULL DEFAULT TRUE,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "public"."AccessKey" OWNER TO "postgres";
COMMENT ON COLUMN "public"."AccessKey"."Id" IS '自增主键';
COMMENT ON COLUMN "public"."AccessKey"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."AccessKey"."Secret" IS 'Secret';
COMMENT ON COLUMN "public"."AccessKey"."IsEnabled" IS '1: enabled, 0: disabled';
COMMENT ON COLUMN "public"."AccessKey"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."AccessKey"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."AccessKey"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."AccessKey"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."AccessKey"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."AccessKey"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."AccessKey" IS '访问密钥';

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS "public"."App";
DROP SEQUENCE IF EXISTS "public"."App_Id_seq";
CREATE TABLE "public"."App" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Name" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "OrgId" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "OrgName" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "OwnerName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "OwnerEmail" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."App" OWNER TO "postgres";
COMMENT ON COLUMN "public"."App"."Id" IS '主键';
COMMENT ON COLUMN "public"."App"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."App"."Name" IS '应用名';
COMMENT ON COLUMN "public"."App"."OrgId" IS '部门Id';
COMMENT ON COLUMN "public"."App"."OrgName" IS '部门名字';
COMMENT ON COLUMN "public"."App"."OwnerName" IS 'ownerName';
COMMENT ON COLUMN "public"."App"."OwnerEmail" IS 'ownerEmail';
COMMENT ON COLUMN "public"."App"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."App"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."App"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."App"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."App"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."App"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."App" IS '应用表';

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS "public"."AppNamespace";
DROP SEQUENCE IF EXISTS "public"."AppNamespace_Id_seq";
CREATE TABLE "public"."AppNamespace" (
  "Id" bigserial NOT NULL,
  "Name" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "Format" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'properties'::character varying,
  "IsPublic" BOOLEAN NOT NULL DEFAULT FALSE,
  "Comment" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."AppNamespace" OWNER TO "postgres";
COMMENT ON COLUMN "public"."AppNamespace"."Id" IS '自增主键';
COMMENT ON COLUMN "public"."AppNamespace"."Name" IS 'namespace名字，注意，需要全局唯一';
COMMENT ON COLUMN "public"."AppNamespace"."AppId" IS 'app id';
COMMENT ON COLUMN "public"."AppNamespace"."Format" IS 'namespace的format类型';
COMMENT ON COLUMN "public"."AppNamespace"."IsPublic" IS 'namespace是否为公共';
COMMENT ON COLUMN "public"."AppNamespace"."Comment" IS '注释';
COMMENT ON COLUMN "public"."AppNamespace"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."AppNamespace"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."AppNamespace"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."AppNamespace"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."AppNamespace"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."AppNamespace"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."AppNamespace" IS '应用namespace定义';

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS "public"."Audit";
DROP SEQUENCE IF EXISTS "public"."Audit_Id_seq";
CREATE TABLE "public"."Audit" (
  "Id" bigserial NOT NULL,
  "EntityName" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "EntityId" int8,
  "OpName" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Comment" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Audit" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Audit"."Id" IS '主键';
COMMENT ON COLUMN "public"."Audit"."EntityName" IS '表名';
COMMENT ON COLUMN "public"."Audit"."EntityId" IS '记录ID';
COMMENT ON COLUMN "public"."Audit"."OpName" IS '操作类型';
COMMENT ON COLUMN "public"."Audit"."Comment" IS '备注';
COMMENT ON COLUMN "public"."Audit"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Audit"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Audit"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Audit"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Audit"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Audit"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Audit" IS '日志审计表';

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS "public"."Cluster";
DROP SEQUENCE IF EXISTS "public"."Cluster_Id_seq";
CREATE TABLE "public"."Cluster" (
  "Id" bigserial NOT NULL,
  "Name" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "ParentClusterId" int8 NOT NULL,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Cluster" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Cluster"."Id" IS '自增主键';
COMMENT ON COLUMN "public"."Cluster"."Name" IS '集群名字';
COMMENT ON COLUMN "public"."Cluster"."AppId" IS 'App id';
COMMENT ON COLUMN "public"."Cluster"."ParentClusterId" IS '父cluster';
COMMENT ON COLUMN "public"."Cluster"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Cluster"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Cluster"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Cluster"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Cluster"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Cluster"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Cluster" IS '集群';

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS "public"."Commit";
DROP SEQUENCE IF EXISTS "public"."Commit_Id_seq";
CREATE TABLE "public"."Commit" (
  "Id" bigserial NOT NULL,
  "ChangeSets" text COLLATE "pg_catalog"."default" NOT NULL,
  "AppId" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ClusterName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "NamespaceName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Comment" varchar(500) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Commit" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Commit"."Id" IS '主键';
COMMENT ON COLUMN "public"."Commit"."ChangeSets" IS '修改变更集';
COMMENT ON COLUMN "public"."Commit"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."Commit"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "public"."Commit"."NamespaceName" IS 'namespaceName';
COMMENT ON COLUMN "public"."Commit"."Comment" IS '备注';
COMMENT ON COLUMN "public"."Commit"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Commit"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Commit"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Commit"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Commit"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Commit"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Commit" IS 'commit 历史表';

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS "public"."GrayReleaseRule";
DROP SEQUENCE IF EXISTS "public"."GrayReleaseRule_Id_seq";
CREATE TABLE "public"."GrayReleaseRule" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ClusterName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "NamespaceName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "BranchName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Rules" varchar(16000) COLLATE "pg_catalog"."default" DEFAULT '[]'::character varying,
  "ReleaseId" int8 NOT NULL DEFAULT 0,
  "BranchStatus" int2 DEFAULT 1,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."GrayReleaseRule" OWNER TO "postgres";
COMMENT ON COLUMN "public"."GrayReleaseRule"."Id" IS '主键';
COMMENT ON COLUMN "public"."GrayReleaseRule"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."GrayReleaseRule"."ClusterName" IS 'Cluster Name';
COMMENT ON COLUMN "public"."GrayReleaseRule"."NamespaceName" IS 'Namespace Name';
COMMENT ON COLUMN "public"."GrayReleaseRule"."BranchName" IS 'branch name';
COMMENT ON COLUMN "public"."GrayReleaseRule"."Rules" IS '灰度规则';
COMMENT ON COLUMN "public"."GrayReleaseRule"."ReleaseId" IS '灰度对应的release';
COMMENT ON COLUMN "public"."GrayReleaseRule"."BranchStatus" IS '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布';
COMMENT ON COLUMN "public"."GrayReleaseRule"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."GrayReleaseRule"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."GrayReleaseRule"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."GrayReleaseRule"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."GrayReleaseRule"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."GrayReleaseRule"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."GrayReleaseRule" IS '灰度规则表';

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS "public"."Instance";
DROP SEQUENCE IF EXISTS "public"."Instance_Id_seq";
CREATE TABLE "public"."Instance" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ClusterName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataCenter" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Ip" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastTime" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "public"."Instance" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Instance"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."Instance"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."Instance"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "public"."Instance"."DataCenter" IS 'Data Center Name';
COMMENT ON COLUMN "public"."Instance"."Ip" IS 'instance ip';
COMMENT ON COLUMN "public"."Instance"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Instance"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Instance" IS '使用配置的应用实例';

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS "public"."InstanceConfig";
DROP SEQUENCE IF EXISTS "public"."InstanceConfig_Id_seq";
CREATE TABLE "public"."InstanceConfig" (
  "Id" bigserial NOT NULL,
  "InstanceId" int8,
  "ConfigAppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ConfigClusterName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ConfigNamespaceName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ReleaseKey" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "ReleaseDeliveryTime" timestamp(6),
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastTime" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "public"."InstanceConfig" OWNER TO "postgres";
COMMENT ON COLUMN "public"."InstanceConfig"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."InstanceConfig"."InstanceId" IS 'Instance Id';
COMMENT ON COLUMN "public"."InstanceConfig"."ConfigAppId" IS 'Config App Id';
COMMENT ON COLUMN "public"."InstanceConfig"."ConfigClusterName" IS 'Config Cluster Name';
COMMENT ON COLUMN "public"."InstanceConfig"."ConfigNamespaceName" IS 'Config Namespace Name';
COMMENT ON COLUMN "public"."InstanceConfig"."ReleaseKey" IS '发布的Key';
COMMENT ON COLUMN "public"."InstanceConfig"."ReleaseDeliveryTime" IS '配置获取时间';
COMMENT ON COLUMN "public"."InstanceConfig"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."InstanceConfig"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."InstanceConfig" IS '应用实例的配置信息';

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS "public"."Item";
CREATE TABLE "public"."Item" (
  "Id" bigserial NOT NULL,
  "NamespaceId" int8 NOT NULL DEFAULT 0,
  "Key" varchar(128) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Type" int2 NOT NULL DEFAULT 0,
  "Value" text COLLATE "pg_catalog"."default" NOT NULL,
  "Comment" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "LineNum" int8 DEFAULT 0,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Item" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Item"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."Item"."NamespaceId" IS '集群NamespaceId';
COMMENT ON COLUMN "public"."Item"."Key" IS '配置项Key';
COMMENT ON COLUMN "public"."Item"."Type" IS '配置项类型，0: String，1: Number，2: Boolean，3: JSON';
COMMENT ON COLUMN "public"."Item"."Value" IS '配置项值';
COMMENT ON COLUMN "public"."Item"."Comment" IS '注释';
COMMENT ON COLUMN "public"."Item"."LineNum" IS '行号';
COMMENT ON COLUMN "public"."Item"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Item"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Item"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Item"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Item"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Item"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Item" IS '配置项目';

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS "public"."Namespace";
DROP SEQUENCE IF EXISTS "public"."Namespace_Id_seq";
CREATE TABLE "public"."Namespace" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ClusterName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "NamespaceName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Namespace" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Namespace"."Id" IS '自增主键';
COMMENT ON COLUMN "public"."Namespace"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."Namespace"."ClusterName" IS 'Cluster Name';
COMMENT ON COLUMN "public"."Namespace"."NamespaceName" IS 'Namespace Name';
COMMENT ON COLUMN "public"."Namespace"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Namespace"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Namespace"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Namespace"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Namespace"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Namespace"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Namespace" IS '命名空间';

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS "public"."NamespaceLock";
DROP SEQUENCE IF EXISTS "public"."NamespaceLock_Id_seq";
CREATE TABLE "public"."NamespaceLock" (
  "Id" bigserial NOT NULL,
  "NamespaceId" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now(),
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0
)
;
ALTER TABLE "public"."NamespaceLock" OWNER TO "postgres";
COMMENT ON COLUMN "public"."NamespaceLock"."Id" IS '自增id';
COMMENT ON COLUMN "public"."NamespaceLock"."NamespaceId" IS '集群NamespaceId';
COMMENT ON COLUMN "public"."NamespaceLock"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."NamespaceLock"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."NamespaceLock"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."NamespaceLock"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON COLUMN "public"."NamespaceLock"."IsDeleted" IS '软删除';
COMMENT ON COLUMN "public"."NamespaceLock"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON TABLE "public"."NamespaceLock" IS 'namespace的编辑锁';

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS "public"."Release";
DROP SEQUENCE IF EXISTS "public"."Release_Id_seq";
CREATE TABLE "public"."Release" (
  "Id" bigserial NOT NULL,
  "ReleaseKey" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "Name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Comment" varchar(256) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "AppId" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ClusterName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "NamespaceName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Configurations" text COLLATE "pg_catalog"."default" NOT NULL,
  "IsAbandoned" BOOLEAN NOT NULL DEFAULT FALSE,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Release" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Release"."Id" IS '自增主键';
COMMENT ON COLUMN "public"."Release"."ReleaseKey" IS '发布的Key';
COMMENT ON COLUMN "public"."Release"."Name" IS '发布名字';
COMMENT ON COLUMN "public"."Release"."Comment" IS '发布说明';
COMMENT ON COLUMN "public"."Release"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."Release"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "public"."Release"."NamespaceName" IS 'namespaceName';
COMMENT ON COLUMN "public"."Release"."Configurations" IS '发布配置';
COMMENT ON COLUMN "public"."Release"."IsAbandoned" IS '是否废弃';
COMMENT ON COLUMN "public"."Release"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Release"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Release"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Release"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Release"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Release"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Release" IS '发布';

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS "public"."ReleaseHistory";
DROP SEQUENCE IF EXISTS "public"."ReleaseHistory_Id_seq";
CREATE TABLE "public"."ReleaseHistory" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ClusterName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "NamespaceName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "BranchName" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "ReleaseId" int8 NOT NULL DEFAULT 0,
  "PreviousReleaseId" int8 NOT NULL DEFAULT 0,
  "Operation" int2 NOT NULL DEFAULT 0,
  "OperationContext" text COLLATE "pg_catalog"."default" NOT NULL,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."ReleaseHistory" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ReleaseHistory"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."ReleaseHistory"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."ReleaseHistory"."ClusterName" IS 'ClusterName';
COMMENT ON COLUMN "public"."ReleaseHistory"."NamespaceName" IS 'namespaceName';
COMMENT ON COLUMN "public"."ReleaseHistory"."BranchName" IS '发布分支名';
COMMENT ON COLUMN "public"."ReleaseHistory"."ReleaseId" IS '关联的Release Id';
COMMENT ON COLUMN "public"."ReleaseHistory"."PreviousReleaseId" IS '前一次发布的ReleaseId';
COMMENT ON COLUMN "public"."ReleaseHistory"."Operation" IS '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度';
COMMENT ON COLUMN "public"."ReleaseHistory"."OperationContext" IS '发布上下文信息';
COMMENT ON COLUMN "public"."ReleaseHistory"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."ReleaseHistory"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."ReleaseHistory"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."ReleaseHistory"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."ReleaseHistory"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."ReleaseHistory"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."ReleaseHistory" IS '发布历史';

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS "public"."ReleaseMessage";
DROP SEQUENCE IF EXISTS "public"."ReleaseMessage_Id_seq";
CREATE TABLE "public"."ReleaseMessage" (
  "Id" bigserial NOT NULL,
  "Message" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "public"."ReleaseMessage" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ReleaseMessage"."Id" IS '自增主键';
COMMENT ON COLUMN "public"."ReleaseMessage"."Message" IS '发布的消息内容';
COMMENT ON COLUMN "public"."ReleaseMessage"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."ReleaseMessage" IS '发布消息';

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS "public"."ServerConfig";
DROP SEQUENCE IF EXISTS "public"."ServerConfig_Id_seq";
CREATE TABLE "public"."ServerConfig" (
  "Id" bigserial NOT NULL,
  "Key" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Cluster" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Value" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "Comment" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."ServerConfig" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ServerConfig"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."ServerConfig"."Key" IS '配置项Key';
COMMENT ON COLUMN "public"."ServerConfig"."Cluster" IS '配置对应的集群，default为不针对特定的集群';
COMMENT ON COLUMN "public"."ServerConfig"."Value" IS '配置项值';
COMMENT ON COLUMN "public"."ServerConfig"."Comment" IS '注释';
COMMENT ON COLUMN "public"."ServerConfig"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."ServerConfig"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."ServerConfig"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."ServerConfig"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."ServerConfig"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."ServerConfig"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."ServerConfig" IS '配置服务自身配置';

-- ----------------------------
-- Table structure for ServiceRegistry
-- ----------------------------
DROP TABLE IF EXISTS "public"."ServiceRegistry";
DROP SEQUENCE IF EXISTS "public"."ServiceRegistry_Id_seq";
CREATE TABLE "public"."ServiceRegistry" (
  "Id" bigserial NOT NULL,
  "ServiceName" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "Uri" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "Cluster" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "Metadata" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '{}'::character varying,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastTime" timestamp(6) NOT NULL DEFAULT now()
)
;
ALTER TABLE "public"."ServiceRegistry" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ServiceRegistry"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."ServiceRegistry"."ServiceName" IS '服务名';
COMMENT ON COLUMN "public"."ServiceRegistry"."Uri" IS '服务地址';
COMMENT ON COLUMN "public"."ServiceRegistry"."Cluster" IS '集群，可以用来标识apollo.cluster或者网络分区';
COMMENT ON COLUMN "public"."ServiceRegistry"."Metadata" IS '元数据，key value结构的json object，为了方面后面扩展功能而不需要修改表结构';
COMMENT ON COLUMN "public"."ServiceRegistry"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."ServiceRegistry"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."ServiceRegistry" IS '注册中心';

-- ----------------------------
-- Function structure for update_changetimestamp_column
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."update_changetimestamp_column"();
CREATE OR REPLACE FUNCTION "public"."update_changetimestamp_column"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
   NEW."DataChange_LastTime" = now(); 
   RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "public"."update_changetimestamp_column"() OWNER TO "postgres";

-- ----------------------------
-- Indexes structure for table AccessKey
-- ----------------------------
CREATE INDEX "AccessKey_IX_DataChange_LastTime" ON "public"."AccessKey" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "AccessKey_UK_AppId_Secret_DeletedAt" ON "public"."AccessKey" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Secret" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table AccessKey
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."AccessKey"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table AccessKey
-- ----------------------------
ALTER TABLE "public"."AccessKey" ADD CONSTRAINT "AccessKey_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table App
-- ----------------------------
CREATE INDEX "App_IX_DataChange_LastTime" ON "public"."App" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "App_IX_Name" ON "public"."App" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "App_UK_AppId_DeletedAt" ON "public"."App" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table App
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."App"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table App
-- ----------------------------
ALTER TABLE "public"."App" ADD CONSTRAINT "App_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table AppNamespace
-- ----------------------------
CREATE INDEX "AppNamespace_IX_DataChange_LastTime" ON "public"."AppNamespace" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "AppNamespace_IX_Name_AppId" ON "public"."AppNamespace" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "AppNamespace_UK_AppId_Name_DeletedAt" ON "public"."AppNamespace" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table AppNamespace
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."AppNamespace"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table AppNamespace
-- ----------------------------
ALTER TABLE "public"."AppNamespace" ADD CONSTRAINT "AppNamespace_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Audit
-- ----------------------------
CREATE INDEX "Audit_IX_DataChange_LastTime" ON "public"."Audit" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Audit
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Audit"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Audit
-- ----------------------------
ALTER TABLE "public"."Audit" ADD CONSTRAINT "Audit_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Cluster
-- ----------------------------
CREATE INDEX "Cluster_IX_DataChange_LastTime" ON "public"."Cluster" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "Cluster_IX_ParentClusterId" ON "public"."Cluster" USING btree (
  "ParentClusterId" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Cluster_UK_AppId_Name_DeletedAt" ON "public"."Cluster" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Cluster
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Cluster"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Cluster
-- ----------------------------
ALTER TABLE "public"."Cluster" ADD CONSTRAINT "Cluster_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Commit
-- ----------------------------
CREATE INDEX "Commit_IX_AppId" ON "public"."Commit" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "Commit_IX_ClusterName" ON "public"."Commit" USING btree (
  "ClusterName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "Commit_IX_DataChange_LastTime" ON "public"."Commit" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "Commit_IX_NamespaceName" ON "public"."Commit" USING btree (
  "NamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Commit
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Commit"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Commit
-- ----------------------------
ALTER TABLE "public"."Commit" ADD CONSTRAINT "Commit_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table GrayReleaseRule
-- ----------------------------
CREATE INDEX "GrayReleaseRule_IX_DataChange_LastTime" ON "public"."GrayReleaseRule" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "GrayReleaseRule_IX_Namespace" ON "public"."GrayReleaseRule" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ClusterName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "NamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table GrayReleaseRule
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."GrayReleaseRule"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table GrayReleaseRule
-- ----------------------------
ALTER TABLE "public"."GrayReleaseRule" ADD CONSTRAINT "GrayReleaseRule_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Instance
-- ----------------------------
CREATE INDEX "Instance_IX_DataChange_LastTime" ON "public"."Instance" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "Instance_IX_IP" ON "public"."Instance" USING btree (
  "Ip" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Instance_UK_AppId_ClusterName_Ip_DataCenter" ON "public"."Instance" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ClusterName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DataCenter" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Ip" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Instance
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Instance"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Instance
-- ----------------------------
ALTER TABLE "public"."Instance" ADD CONSTRAINT "Instance_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table InstanceConfig
-- ----------------------------
CREATE INDEX "InstanceConfig_IX_DataChange_LastTime" ON "public"."InstanceConfig" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "InstanceConfig_IX_ReleaseKey" ON "public"."InstanceConfig" USING btree (
  "ReleaseKey" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "InstanceConfig_IX_UNIQUE_KEY" ON "public"."InstanceConfig" USING btree (
  "InstanceId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "ConfigAppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ConfigNamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "InstanceConfig_IX_Valid_Namespace" ON "public"."InstanceConfig" USING btree (
  "ConfigAppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ConfigClusterName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ConfigNamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table InstanceConfig
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."InstanceConfig"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table InstanceConfig
-- ----------------------------
ALTER TABLE "public"."InstanceConfig" ADD CONSTRAINT "InstanceConfig_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Item
-- ----------------------------
CREATE INDEX "Item_IX_DataChange_LastTime" ON "public"."Item" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "Item_IX_NamespaceId" ON "public"."Item" USING btree (
  "NamespaceId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Item
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Item"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Item
-- ----------------------------
ALTER TABLE "public"."Item" ADD CONSTRAINT "Item_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Namespace
-- ----------------------------
CREATE INDEX "Namespace_IX_DataChange_LastTime" ON "public"."Namespace" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "Namespace_IX_NamespaceName" ON "public"."Namespace" USING btree (
  "NamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Namespace_UK_AppId_ClusterName_NamespaceName_DeletedAt" ON "public"."Namespace" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ClusterName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "NamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Namespace
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Namespace"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Namespace
-- ----------------------------
ALTER TABLE "public"."Namespace" ADD CONSTRAINT "Namespace_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table NamespaceLock
-- ----------------------------
CREATE INDEX "NamespaceLock_IX_DataChange_LastTime" ON "public"."NamespaceLock" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "NamespaceLock_UK_NamespaceId_DeletedAt" ON "public"."NamespaceLock" USING btree (
  "NamespaceId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table NamespaceLock
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."NamespaceLock"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table NamespaceLock
-- ----------------------------
ALTER TABLE "public"."NamespaceLock" ADD CONSTRAINT "NamespaceLock_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Release
-- ----------------------------
CREATE INDEX "Release_IX_AppId_ClusterName_GroupName" ON "public"."Release" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ClusterName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "NamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "Release_IX_DataChange_LastTime" ON "public"."Release" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Release_UK_ReleaseKey_DeletedAt" ON "public"."Release" USING btree (
  "ReleaseKey" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Release
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Release"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Release
-- ----------------------------
ALTER TABLE "public"."Release" ADD CONSTRAINT "Release_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ReleaseHistory
-- ----------------------------
CREATE INDEX "ReleaseHistory_IX_DataChange_LastTime" ON "public"."ReleaseHistory" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ReleaseHistory_IX_Namespace" ON "public"."ReleaseHistory" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "ClusterName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "NamespaceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "BranchName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "ReleaseHistory_IX_PreviousReleaseId" ON "public"."ReleaseHistory" USING btree (
  "PreviousReleaseId" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "ReleaseHistory_IX_ReleaseId" ON "public"."ReleaseHistory" USING btree (
  "ReleaseId" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table ReleaseHistory
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."ReleaseHistory"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table ReleaseHistory
-- ----------------------------
ALTER TABLE "public"."ReleaseHistory" ADD CONSTRAINT "ReleaseHistory_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ReleaseMessage
-- ----------------------------
CREATE INDEX "ReleaseMessage_IX_DataChange_LastTime" ON "public"."ReleaseMessage" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ReleaseMessage_IX_Message" ON "public"."ReleaseMessage" USING btree (
  "Message" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table ReleaseMessage
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."ReleaseMessage"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table ReleaseMessage
-- ----------------------------
ALTER TABLE "public"."ReleaseMessage" ADD CONSTRAINT "ReleaseMessage_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ServerConfig
-- ----------------------------
CREATE INDEX "ServerConfig_IX_DataChange_LastTime" ON "public"."ServerConfig" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ServerConfig_UK_Key_Cluster_DeletedAt" ON "public"."ServerConfig" USING btree (
  "Key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Cluster" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table ServerConfig
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."ServerConfig"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table ServerConfig
-- ----------------------------
ALTER TABLE "public"."ServerConfig" ADD CONSTRAINT "ServerConfig_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ServiceRegistry
-- ----------------------------
CREATE INDEX "ServiceRegistry_IX_DataChange_LastTime" ON "public"."ServiceRegistry" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ServiceRegistry_IX_UNIQUE_KEY" ON "public"."ServiceRegistry" USING btree (
  "ServiceName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Uri" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table ServiceRegistry
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."ServiceRegistry"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table ServiceRegistry
-- ----------------------------
ALTER TABLE "public"."ServiceRegistry" ADD CONSTRAINT "ServiceRegistry_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Init Server Config Data
-- ----------------------------
INSERT INTO "ServerConfig" ("Key", "Cluster", "Value", "Comment")
VALUES
    ('eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔'),
    ('namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关'),
    ('item.key.length.limit', 'default', '128', 'item key 最大长度限制'),
    ('item.value.length.limit', 'default', '20000', 'item value最大长度限制'),
    ('config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！');