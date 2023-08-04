/*
 Source Server Type    : PostgreSQL
 Source Server Version : 120015 (120015)
 Source Catalog        : ApolloPortalDB
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120015 (120015)
 File Encoding         : 65001
*/

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS "public"."App";
DROP SEQUENCE IF EXISTS "public"."App_Id_seq";
CREATE TABLE "public"."App" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Name" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OrgId" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OrgName" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OwnerName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OwnerEmail" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
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
  "Name" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "Format" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'properties',
  "IsPublic" BOOLEAN NOT NULL DEFAULT FALSE,
  "Comment" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
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
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS "public"."Authorities";
DROP SEQUENCE IF EXISTS "public"."Authorities_Id_seq";
CREATE TABLE "public"."Authorities" (
  "Id" bigserial NOT NULL,
  "Username" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "Authority" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."Authorities" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Authorities"."Id" IS '自增Id';

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS "public"."Consumer";
DROP SEQUENCE IF EXISTS "public"."Consumer_Id_seq";
CREATE TABLE "public"."Consumer" (
  "Id" bigserial NOT NULL,
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Name" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OrgId" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OrgName" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OwnerName" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "OwnerEmail" varchar(500) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Consumer" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Consumer"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."Consumer"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."Consumer"."Name" IS '应用名';
COMMENT ON COLUMN "public"."Consumer"."OrgId" IS '部门Id';
COMMENT ON COLUMN "public"."Consumer"."OrgName" IS '部门名字';
COMMENT ON COLUMN "public"."Consumer"."OwnerName" IS 'ownerName';
COMMENT ON COLUMN "public"."Consumer"."OwnerEmail" IS 'ownerEmail';
COMMENT ON COLUMN "public"."Consumer"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Consumer"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Consumer"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Consumer"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Consumer"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Consumer"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Consumer" IS '开放API消费者';

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS "public"."ConsumerAudit";
DROP SEQUENCE IF EXISTS "public"."ConsumerAudit_Id_seq";
CREATE TABLE "public"."ConsumerAudit" (
  "Id" bigserial NOT NULL,
  "ConsumerId" int8 DEFAULT NULL,
  "Uri" varchar(1024) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "Method" varchar(16) COLLATE "pg_catalog"."default" NOT NULL  DEFAULT '',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."ConsumerAudit" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ConsumerAudit"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."ConsumerAudit"."ConsumerId" IS 'Consumer Id';
COMMENT ON COLUMN "public"."ConsumerAudit"."Uri" IS '访问的Uri';
COMMENT ON COLUMN "public"."ConsumerAudit"."Method" IS '访问的Method';
COMMENT ON COLUMN "public"."ConsumerAudit"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."ConsumerAudit"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."ConsumerAudit" IS 'consumer审计表';

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS "public"."ConsumerRole";
DROP SEQUENCE IF EXISTS "public"."ConsumerRole_Id_seq";
CREATE TABLE "public"."ConsumerRole" (
  "Id" bigserial NOT NULL,
  "ConsumerId" int8 DEFAULT NULL,
  "RoleId" int8 DEFAULT NULL,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."ConsumerRole" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ConsumerRole"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."ConsumerRole"."ConsumerId" IS 'Consumer Id';
COMMENT ON COLUMN "public"."ConsumerRole"."RoleId" IS 'Role Id';
COMMENT ON COLUMN "public"."ConsumerRole"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."ConsumerRole"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."ConsumerRole"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."ConsumerRole"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."ConsumerRole"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."ConsumerRole"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."ConsumerRole" IS 'consumer和role的绑定表';

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS "public"."ConsumerToken";
DROP SEQUENCE IF EXISTS "public"."ConsumerToken_Id_seq";
CREATE TABLE "public"."ConsumerToken" (
  "Id" bigserial NOT NULL,
  "ConsumerId" int8 DEFAULT NULL,
  "Token" varchar(128) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "Expires" timestamp(6) NOT NULL DEFAULT '2099-01-01 00:00:00',
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."ConsumerToken" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ConsumerToken"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."ConsumerToken"."ConsumerId" IS 'ConsumerId';
COMMENT ON COLUMN "public"."ConsumerToken"."Token" IS 'token';
COMMENT ON COLUMN "public"."ConsumerToken"."Expires" IS 'token失效时间';
COMMENT ON COLUMN "public"."ConsumerToken"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."ConsumerToken"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."ConsumerToken"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."ConsumerToken"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."ConsumerToken"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."ConsumerToken"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."ConsumerToken" IS 'consumer token表';

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS "public"."Favorite";
DROP SEQUENCE IF EXISTS "public"."Favorite_Id_seq";
CREATE TABLE "public"."Favorite" (
  "Id" bigserial NOT NULL,
  "UserId" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "AppId" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Position" int4 NOT NULL DEFAULT 10000,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Favorite" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Favorite"."Id" IS '主键';
COMMENT ON COLUMN "public"."Favorite"."UserId" IS '收藏的用户';
COMMENT ON COLUMN "public"."Favorite"."AppId" IS 'AppID';
COMMENT ON COLUMN "public"."Favorite"."Position" IS '收藏顺序';
COMMENT ON COLUMN "public"."Favorite"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Favorite"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Favorite"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Favorite"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Favorite"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Favorite"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Favorite" IS '应用收藏表';

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."Permission";
DROP SEQUENCE IF EXISTS "public"."Permission_Id_seq";
CREATE TABLE "public"."Permission" (
  "Id" bigserial NOT NULL,
  "PermissionType" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "TargetId" varchar(256) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Permission" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Permission"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."Permission"."PermissionType" IS '权限类型';
COMMENT ON COLUMN "public"."Permission"."TargetId" IS '权限对象类型';
COMMENT ON COLUMN "public"."Permission"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Permission"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Permission"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Permission"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Permission"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Permission"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Permission" IS 'permission表';

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS "public"."Role";
DROP SEQUENCE IF EXISTS "public"."Role_Id_seq";
CREATE TABLE "public"."Role" (
  "Id" bigserial NOT NULL,
  "RoleName" varchar(256) COLLATE "pg_catalog"."default" NOT NULL DEFAULT '',
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."Role" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Role"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."Role"."RoleName" IS 'Role name';
COMMENT ON COLUMN "public"."Role"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."Role"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."Role"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."Role"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."Role"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."Role"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."Role" IS '角色表';

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS "public"."RolePermission";
DROP SEQUENCE IF EXISTS "public"."RolePermission_Id_seq";
CREATE TABLE "public"."RolePermission" (
  "Id" bigserial NOT NULL,
  "RoleId" int8 DEFAULT NULL,
  "PermissionId" int8  DEFAULT NULL,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."RolePermission" OWNER TO "postgres";
COMMENT ON COLUMN "public"."RolePermission"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."RolePermission"."RoleId" IS 'Role Id';
COMMENT ON COLUMN "public"."RolePermission"."PermissionId" IS 'Permission Id';
COMMENT ON COLUMN "public"."RolePermission"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."RolePermission"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."RolePermission"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."RolePermission"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."RolePermission"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."RolePermission"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."RolePermission" IS '角色和权限的绑定表';

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS "public"."ServerConfig";
DROP SEQUENCE IF EXISTS "public"."ServerConfig_Id_seq";
CREATE TABLE "public"."ServerConfig" (
  "Id" bigserial NOT NULL,
  "Key" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Value" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Comment" varchar(1024) COLLATE "pg_catalog"."default" DEFAULT '',
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'apollo',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."ServerConfig" OWNER TO "postgres";
COMMENT ON COLUMN "public"."ServerConfig"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."ServerConfig"."Key" IS '配置项Key';
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
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS "public"."UserRole";
DROP SEQUENCE IF EXISTS "public"."UserRole_Id_seq";
CREATE TABLE "public"."UserRole" (
  "Id" bigserial NOT NULL,
  "UserId" varchar(128) COLLATE "pg_catalog"."default" DEFAULT '',
  "RoleId" int8 DEFAULT NULL,
  "IsDeleted" BOOLEAN NOT NULL DEFAULT FALSE,
  "DeletedAt" int8 NOT NULL DEFAULT 0,
  "DataChange_CreatedBy" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "DataChange_CreatedTime" timestamp(6) NOT NULL DEFAULT now(),
  "DataChange_LastModifiedBy" varchar(64) COLLATE "pg_catalog"."default" DEFAULT '',
  "DataChange_LastTime" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "public"."UserRole" OWNER TO "postgres";
COMMENT ON COLUMN "public"."UserRole"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."UserRole"."UserId" IS '用户身份标识';
COMMENT ON COLUMN "public"."UserRole"."RoleId" IS 'Role Id';
COMMENT ON COLUMN "public"."UserRole"."IsDeleted" IS '1: deleted, 0: normal';
COMMENT ON COLUMN "public"."UserRole"."DeletedAt" IS 'Delete timestamp based on milliseconds';
COMMENT ON COLUMN "public"."UserRole"."DataChange_CreatedBy" IS '创建人邮箱前缀';
COMMENT ON COLUMN "public"."UserRole"."DataChange_CreatedTime" IS '创建时间';
COMMENT ON COLUMN "public"."UserRole"."DataChange_LastModifiedBy" IS '最后修改人邮箱前缀';
COMMENT ON COLUMN "public"."UserRole"."DataChange_LastTime" IS '最后修改时间';
COMMENT ON TABLE "public"."UserRole" IS '用户和role的绑定表';

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS "public"."Users";
DROP SEQUENCE IF EXISTS "public"."Users_Id_seq";
CREATE TABLE "public"."Users" (
  "Id" bigserial NOT NULL,
  "Username" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Password" varchar(512) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "UserDisplayName" varchar(512) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Email" varchar(64) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'default',
  "Enabled" int2 DEFAULT NULL
)
;
ALTER TABLE "public"."Users" OWNER TO "postgres";
COMMENT ON COLUMN "public"."Users"."Id" IS '自增Id';
COMMENT ON COLUMN "public"."Users"."Username" IS '用户登录账户';
COMMENT ON COLUMN "public"."Users"."Password" IS '密码';
COMMENT ON COLUMN "public"."Users"."UserDisplayName" IS '用户名称';
COMMENT ON COLUMN "public"."Users"."Email" IS '邮箱地址';
COMMENT ON COLUMN "public"."Users"."Enabled" IS '是否有效';
COMMENT ON TABLE "public"."Users" IS '用户表';

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
-- Indexes structure for table App
-- ----------------------------
CREATE INDEX "App_DataChange_LastTime" ON "public"."App" USING btree (
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
CREATE INDEX "AppNamespace_DataChange_LastTime" ON "public"."AppNamespace" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "AppNamespace_Name_AppId" ON "public"."AppNamespace" USING btree (
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "AppNamespace_UK_AppId_Name_DeletedAt" ON "public"."AppNamespace" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "Name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
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
-- Primary Key structure for table Authorities
-- ----------------------------
ALTER TABLE "public"."Authorities" ADD CONSTRAINT "Authorities_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Consumer
-- ----------------------------
CREATE INDEX "Consumer_DataChange_LastTime" ON "public"."Consumer" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Consumer_UK_AppId_DeletedAt" ON "public"."Consumer" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Consumer
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Consumer"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Consumer
-- ----------------------------
ALTER TABLE "public"."Consumer" ADD CONSTRAINT "Consumer_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ConsumerAudit
-- ----------------------------
CREATE INDEX "ConsumerAudit_IX_ConsumerId" ON "public"."ConsumerAudit" USING btree (
  "ConsumerId" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "ConsumerAudit_IX_DataChange_LastTime" ON "public"."ConsumerAudit" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table ConsumerAudit
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."ConsumerAudit"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table ConsumerAudit
-- ----------------------------
ALTER TABLE "public"."ConsumerAudit" ADD CONSTRAINT "ConsumerAudit_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ConsumerRole
-- ----------------------------
CREATE INDEX "ConsumerRole_IX_DataChange_LastTime" ON "public"."ConsumerRole" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "ConsumerRole_IX_RoleId" ON "public"."ConsumerRole" USING btree (
  "RoleId" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ConsumerRole_UK_ConsumerId_RoleId_DeletedAt" ON "public"."ConsumerRole" USING btree (
  "ConsumerId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "RoleId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table ConsumerRole
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."ConsumerRole"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table ConsumerRole
-- ----------------------------
ALTER TABLE "public"."ConsumerRole" ADD CONSTRAINT "ConsumerRole_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ConsumerToken
-- ----------------------------
CREATE INDEX "ConsumerToken_DataChange_LastTime" ON "public"."ConsumerToken" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ConsumerToken_UK_Token_DeletedAt" ON "public"."ConsumerToken" USING btree (
  "Token" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table ConsumerToken
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."ConsumerToken"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table ConsumerToken
-- ----------------------------
ALTER TABLE "public"."ConsumerToken" ADD CONSTRAINT "ConsumerToken_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Favorite
-- ----------------------------
CREATE INDEX "Favorite_AppId" ON "public"."Favorite" USING btree (
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "Favorite_DataChange_LastTime" ON "public"."Favorite" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Favorite_UK_UserId_AppId_DeletedAt" ON "public"."Favorite" USING btree (
  "UserId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "AppId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Favorite
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Favorite"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Favorite
-- ----------------------------
ALTER TABLE "public"."Favorite" ADD CONSTRAINT "Favorite_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Permission
-- ----------------------------
CREATE INDEX "Permission_IX_DataChange_LastTime" ON "public"."Permission" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Permission_UK_TargetId_PermissionType_DeletedAt" ON "public"."Permission" USING btree (
  "PermissionType" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "TargetId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Permission
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Permission"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Permission
-- ----------------------------
ALTER TABLE "public"."Permission" ADD CONSTRAINT "Permission_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Role
-- ----------------------------
CREATE INDEX "Role_IX_DataChange_LastTime" ON "public"."Role" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "Role_UK_RoleName_DeletedAt" ON "public"."Role" USING btree (
  "RoleName" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table Role
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."Role"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table Role
-- ----------------------------
ALTER TABLE "public"."Role" ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table RolePermission
-- ----------------------------
CREATE INDEX "RolePermission_IX_DataChange_LastTime" ON "public"."RolePermission" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "RolePermission_IX_PermissionId" ON "public"."RolePermission" USING btree (
  "PermissionId" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "RolePermission_UK_RoleId_PermissionId_DeletedAt" ON "public"."RolePermission" USING btree (
  "RoleId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "PermissionId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table RolePermission
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."RolePermission"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table RolePermission
-- ----------------------------
ALTER TABLE "public"."RolePermission" ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table ServerConfig
-- ----------------------------
CREATE INDEX "ServerConfig_IX_DataChange_LastTime" ON "public"."ServerConfig" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "ServerConfig_UK_Key_DeletedAt" ON "public"."ServerConfig" USING btree (
  "Key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
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
-- Indexes structure for table UserRole
-- ----------------------------
CREATE INDEX "UserRole_IX_DataChange_LastTime" ON "public"."UserRole" USING btree (
  "DataChange_LastTime" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);
CREATE INDEX "UserRole_IX_RoleId" ON "public"."UserRole" USING btree (
  "RoleId" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "UserRole_UK_UserId_RoleId_DeletedAt" ON "public"."UserRole" USING btree (
  "UserId" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "RoleId" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "DeletedAt" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table UserRole
-- ----------------------------
CREATE TRIGGER "Update_LastModifiedTime" BEFORE UPDATE ON "public"."UserRole"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_changetimestamp_column"();

-- ----------------------------
-- Primary Key structure for table UserRole
-- ----------------------------
ALTER TABLE "public"."UserRole" ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY ("Id");

-- ----------------------------
-- Indexes structure for table Users
-- ----------------------------
CREATE UNIQUE INDEX "Users_UK_Username" ON "public"."Users" USING btree (
  "Username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE "public"."Users" ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("Id");


-- ----------------------------
-- Init Env Config And SuperAdmin User
-- ----------------------------
INSERT INTO "ServerConfig" ("Key", "Value", "Comment")
VALUES
    ('apollo.portal.envs', 'dev', '可支持的环境列表'),
    ('organizations', '[{"orgId":"DEFAULT","orgName":"默认部门"}]', '部门列表'),
    ('superAdmin', 'apollo', 'Portal超级管理员'),
    ('api.readTimeout', '10000', 'http接口read timeout'),
    ('consumer.token.salt', 'someSalt', 'consumer token salt'),
    ('admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace'),
    ('configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔'),
    ('apollo.portal.meta.servers', '{}', '各环境Meta Service列表');


INSERT INTO "Users" ("Username", "Password", "UserDisplayName", "Email", "Enabled")
VALUES
	('apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo', 'apollo@acme.com', 1);

INSERT INTO "Authorities" ("Username", "Authority") VALUES ('apollo', 'ROLE_user');