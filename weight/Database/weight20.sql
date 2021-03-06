USE [MASTER]
GO
IF  EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'WEIGHT20')
DROP DATABASE [WEIGHT20]
GO
CREATE DATABASE [WEIGHT20]
GO
USE [WEIGHT20]
GO
/****** Object:  Table [dbo].[tbl_back_record]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_back_record]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_back_record]
GO
/****** Object:  Table [dbo].[tbl_card]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_card]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_card]
GO
/****** Object:  Table [dbo].[tbl_pay_history]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_pay_history]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_pay_history]
GO
/****** Object:  Table [dbo].[tbl_price]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_price]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_price]
GO
/****** Object:  Table [dbo].[tbl_weight_img]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_weight_img]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_weight_img]
GO
/****** Object:  Table [dbo].[备用1]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用1]
GO
/****** Object:  Table [dbo].[备用10]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用10]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用10]
GO
/****** Object:  Table [dbo].[备用11]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用11]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用11]
GO
/****** Object:  Table [dbo].[备用12]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用12]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用12]
GO
/****** Object:  Table [dbo].[备用13]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用13]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用13]
GO
/****** Object:  Table [dbo].[备用14]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用14]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用14]
GO
/****** Object:  Table [dbo].[备用2]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用2]
GO
/****** Object:  Table [dbo].[备用3]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用3]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用3]
GO
/****** Object:  Table [dbo].[备用4]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用4]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用4]
GO
/****** Object:  Table [dbo].[备用5]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用5]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[备用5]
GO
/****** Object:  Table [dbo].[超限信息]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[超限信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[超限信息]
GO
/****** Object:  Table [dbo].[车号]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[车号]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[车号]
GO
/****** Object:  Table [dbo].[称重信息]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[称重信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[称重信息]
GO
/****** Object:  Table [dbo].[发货单位]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[发货单位]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[发货单位]
GO
/****** Object:  Table [dbo].[规格]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[规格]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[规格]
GO
/****** Object:  Table [dbo].[货名]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[货名]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[货名]
GO
/****** Object:  Table [dbo].[日志]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[日志]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[日志]
GO
/****** Object:  Table [dbo].[收货单位]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[收货单位]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[收货单位]
GO
/****** Object:  Table [dbo].[套表]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[套表]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[套表]
GO
/****** Object:  Table [dbo].[用户信息]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[用户信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[用户信息]
GO
/****** Object:  Table [dbo].[作废信息]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[作废信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[作废信息]
GO
/****** Object:  Default [DF__tbl_price__price__6754599E]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_price__price__6754599E]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tbl_price__price__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_price] DROP CONSTRAINT [DF__tbl_price__price__6754599E]
END


END
GO
/****** Object:  Default [DF_车号_皮重]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_车号_皮重]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_车号_皮重]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[车号] DROP CONSTRAINT [DF_车号_皮重]
END


END
GO
/****** Object:  Default [DF__用户信息__预置维护__7F60ED59]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__预置维护__7F60ED59]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__预置维护__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__预置维护__7F60ED59]
END


END
GO
/****** Object:  Default [DF__用户信息__卡号管理__00551192]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__卡号管理__00551192]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__卡号管理__00551192]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__卡号管理__00551192]
END


END
GO
/****** Object:  Default [DF__用户信息__系统日志__014935CB]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__系统日志__014935CB]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__系统日志__014935CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__系统日志__014935CB]
END


END
GO
/****** Object:  Default [DF__用户信息__后台记录__023D5A04]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__后台记录__023D5A04]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__后台记录__023D5A04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__后台记录__023D5A04]
END


END
GO
/****** Object:  Default [DF__用户信息__打印磅单__03317E3D]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__打印磅单__03317E3D]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__打印磅单__03317E3D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__打印磅单__03317E3D]
END


END
GO
/****** Object:  Default [DF__用户信息__修改磅单__0425A276]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改磅单__0425A276]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改磅单__0425A276]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改磅单__0425A276]
END


END
GO
/****** Object:  Default [DF__用户信息__打印报表__0519C6AF]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__打印报表__0519C6AF]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__打印报表__0519C6AF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__打印报表__0519C6AF]
END


END
GO
/****** Object:  Default [DF__用户信息__用户管理__060DEAE8]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__用户管理__060DEAE8]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__用户管理__060DEAE8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__用户管理__060DEAE8]
END


END
GO
/****** Object:  Default [DF__用户信息__系统设置__07020F21]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__系统设置__07020F21]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__系统设置__07020F21]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__系统设置__07020F21]
END


END
GO
/****** Object:  Default [DF__用户信息__界面配置__07F6335A]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__界面配置__07F6335A]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__界面配置__07F6335A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__界面配置__07F6335A]
END


END
GO
/****** Object:  Default [DF__用户信息__手工重量__08EA5793]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__手工重量__08EA5793]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__手工重量__08EA5793]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__手工重量__08EA5793]
END


END
GO
/****** Object:  Default [DF__用户信息__数据库设置__09DE7BCC]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据库设置__09DE7BCC]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据库设置__09DE7BCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__数据库设置__09DE7BCC]
END


END
GO
/****** Object:  Default [DF__用户信息__数据备份__0AD2A005]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据备份__0AD2A005]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据备份__0AD2A005]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__数据备份__0AD2A005]
END


END
GO
/****** Object:  Default [DF__用户信息__数据导入__0BC6C43E]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据导入__0BC6C43E]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据导入__0BC6C43E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__数据导入__0BC6C43E]
END


END
GO
/****** Object:  Default [DF__用户信息__数据导出__0CBAE877]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据导出__0CBAE877]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据导出__0CBAE877]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__数据导出__0CBAE877]
END


END
GO
/****** Object:  Default [DF__用户信息__数据清理__0DAF0CB0]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据清理__0DAF0CB0]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据清理__0DAF0CB0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__数据清理__0DAF0CB0]
END


END
GO
/****** Object:  Default [DF__用户信息__数据初始化__0EA330E9]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据初始化__0EA330E9]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据初始化__0EA330E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__数据初始化__0EA330E9]
END


END
GO
/****** Object:  Default [DF__用户信息__仪表设置__0F975522]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__仪表设置__0F975522]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__仪表设置__0F975522]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__仪表设置__0F975522]
END


END
GO
/****** Object:  Default [DF__用户信息__视频设置__108B795B]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__视频设置__108B795B]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__视频设置__108B795B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__视频设置__108B795B]
END


END
GO
/****** Object:  Default [DF__用户信息__读卡器设置__117F9D94]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__读卡器设置__117F9D94]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__读卡器设置__117F9D94]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__读卡器设置__117F9D94]
END


END
GO
/****** Object:  Default [DF__用户信息__IO模块设置__1273C1CD]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__IO模块设置__1273C1CD]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__IO模块设置__1273C1CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__IO模块设置__1273C1CD]
END


END
GO
/****** Object:  Default [DF__用户信息__大屏幕设置__1367E606]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__大屏幕设置__1367E606]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__大屏幕设置__1367E606]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__大屏幕设置__1367E606]
END


END
GO
/****** Object:  Default [DF__用户信息__语音输出__145C0A3F]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__语音输出__145C0A3F]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__语音输出__145C0A3F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__语音输出__145C0A3F]
END


END
GO
/****** Object:  Default [DF__用户信息__数据查询__15502E78]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据查询__15502E78]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据查询__15502E78]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__数据查询__15502E78]
END


END
GO
/****** Object:  Default [DF__用户信息__添加记录__164452B1]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__添加记录__164452B1]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__添加记录__164452B1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__添加记录__164452B1]
END


END
GO
/****** Object:  Default [DF__用户信息__删除记录__173876EA]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__删除记录__173876EA]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__删除记录__173876EA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__删除记录__173876EA]
END


END
GO
/****** Object:  Default [DF__用户信息__修改车号__182C9B23]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改车号__182C9B23]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改车号__182C9B23]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改车号__182C9B23]
END


END
GO
/****** Object:  Default [DF__用户信息__修改发货单位__1920BF5C]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改发货单位__1920BF5C]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改发货单位__1920BF5C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改发货单位__1920BF5C]
END


END
GO
/****** Object:  Default [DF__用户信息__修改收货单位__1A14E395]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改收货单位__1A14E395]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改收货单位__1A14E395]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改收货单位__1A14E395]
END


END
GO
/****** Object:  Default [DF__用户信息__修改货名__1B0907CE]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改货名__1B0907CE]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改货名__1B0907CE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改货名__1B0907CE]
END


END
GO
/****** Object:  Default [DF__用户信息__修改规格__1BFD2C07]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改规格__1BFD2C07]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改规格__1BFD2C07]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改规格__1BFD2C07]
END


END
GO
/****** Object:  Default [DF__用户信息__修改毛重__1CF15040]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改毛重__1CF15040]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改毛重__1CF15040]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改毛重__1CF15040]
END


END
GO
/****** Object:  Default [DF__用户信息__修改皮重__1DE57479]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改皮重__1DE57479]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改皮重__1DE57479]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改皮重__1DE57479]
END


END
GO
/****** Object:  Default [DF__用户信息__修改扣重__1ED998B2]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改扣重__1ED998B2]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改扣重__1ED998B2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改扣重__1ED998B2]
END


END
GO
/****** Object:  Default [DF__用户信息__修改单价__1FCDBCEB]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改单价__1FCDBCEB]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改单价__1FCDBCEB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改单价__1FCDBCEB]
END


END
GO
/****** Object:  Default [DF__用户信息__修改折方系数__20C1E124]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改折方系数__20C1E124]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改折方系数__20C1E124]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改折方系数__20C1E124]
END


END
GO
/****** Object:  Default [DF__用户信息__修改过磅费__21B6055D]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改过磅费__21B6055D]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改过磅费__21B6055D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改过磅费__21B6055D]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用1__22AA2996]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用1__22AA2996]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用1__22AA2996]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用1__22AA2996]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用2__239E4DCF]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用2__239E4DCF]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用2__239E4DCF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用2__239E4DCF]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用3__24927208]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用3__24927208]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用3__24927208]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用3__24927208]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用4__25869641]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用4__25869641]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用4__25869641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用4__25869641]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用5__267ABA7A]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用5__267ABA7A]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用5__267ABA7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用5__267ABA7A]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用6__276EDEB3]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用6__276EDEB3]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用6__276EDEB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用6__276EDEB3]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用7__286302EC]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用7__286302EC]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用7__286302EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用7__286302EC]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用8__29572725]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用8__29572725]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用8__29572725]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用8__29572725]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用9__2A4B4B5E]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用9__2A4B4B5E]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用9__2A4B4B5E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用9__2A4B4B5E]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用10__2B3F6F97]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用10__2B3F6F97]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用10__2B3F6F97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用10__2B3F6F97]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用11__2C3393D0]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用11__2C3393D0]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用11__2C3393D0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用11__2C3393D0]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用12__2D27B809]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用12__2D27B809]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用12__2D27B809]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用12__2D27B809]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用13__2E1BDC42]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用13__2E1BDC42]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用13__2E1BDC42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用13__2E1BDC42]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用14__2F10007B]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用14__2F10007B]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用14__2F10007B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用14__2F10007B]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用15__300424B4]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用15__300424B4]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用15__300424B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用15__300424B4]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用16__30F848ED]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用16__30F848ED]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用16__30F848ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用16__30F848ED]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用17__31EC6D26]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用17__31EC6D26]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用17__31EC6D26]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用17__31EC6D26]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用18__32E0915F]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用18__32E0915F]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用18__32E0915F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__修改备用18__32E0915F]
END


END
GO
/****** Object:  Default [DF__用户信息__管理员__33D4B598]    Script Date: 04/21/2013 19:26:22 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__管理员__33D4B598]') AND type = 'D')
BEGIN
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__管理员__33D4B598]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] DROP CONSTRAINT [DF__用户信息__管理员__33D4B598]
END


END
GO
/****** Object:  Table [dbo].[作废信息]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[作废信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[作废信息](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[流水号] [nvarchar](50) NOT NULL,
	[车号] [nvarchar](50) NULL,
	[过磅类型] [nvarchar](5) NULL,
	[发货单位] [nvarchar](50) NULL,
	[收货单位] [nvarchar](50) NULL,
	[货名] [nvarchar](50) NULL,
	[规格] [nvarchar](50) NULL,
	[毛重] [numeric](18, 3) NULL,
	[皮重] [numeric](18, 3) NULL,
	[净重] [numeric](18, 3) NULL,
	[扣重] [numeric](18, 3) NULL,
	[实重] [numeric](18, 3) NULL,
	[单价] [numeric](18, 3) NULL,
	[金额] [numeric](18, 3) NULL,
	[折方系数] [numeric](18, 3) NULL,
	[方量] [numeric](18, 3) NULL,
	[过磅费] [numeric](18, 3) NULL,
	[毛重司磅员] [nvarchar](50) NULL,
	[皮重司磅员] [nvarchar](50) NULL,
	[毛重磅号] [nvarchar](10) NULL,
	[皮重磅号] [nvarchar](10) NULL,
	[毛重时间] [datetime] NULL,
	[皮重时间] [datetime] NULL,
	[一次过磅时间] [datetime] NULL,
	[二次过磅时间] [datetime] NULL,
	[更新人] [nvarchar](50) NULL,
	[更新时间] [datetime] NULL,
	[备注] [nvarchar](50) NULL,
	[打印次数] [int] NULL,
	[上传否] [bit] NOT NULL,
	[备用1] [nvarchar](50) NULL,
	[备用2] [nvarchar](50) NULL,
	[备用3] [nvarchar](50) NULL,
	[备用4] [nvarchar](50) NULL,
	[备用5] [nvarchar](50) NULL,
	[备用6] [numeric](18, 3) NULL,
	[备用7] [numeric](18, 3) NULL,
	[备用8] [numeric](18, 3) NULL,
	[备用9] [numeric](18, 3) NULL,
	[备用10] [nvarchar](50) NULL,
	[备用11] [nvarchar](50) NULL,
	[备用12] [nvarchar](50) NULL,
	[备用13] [nvarchar](50) NULL,
	[备用14] [nvarchar](50) NULL,
	[备用15] [numeric](18, 3) NULL,
	[备用16] [numeric](18, 3) NULL,
	[备用17] [numeric](18, 3) NULL,
	[备用18] [numeric](18, 3) NULL,
 CONSTRAINT [PK_作废信息] PRIMARY KEY CLUSTERED 
(
	[流水号] ASC
)
)
END
GO
/****** Object:  Table [dbo].[用户信息]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[用户信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[用户信息](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[用户名] [nvarchar](50) NOT NULL,
	[密码] [nvarchar](50) NULL,
	[预置维护] [bit] NULL,
	[卡号管理] [bit] NULL,
	[系统日志] [bit] NULL,
	[后台记录] [bit] NULL,
	[打印磅单] [bit] NULL,
	[修改磅单] [bit] NULL,
	[打印报表] [bit] NULL,
	[用户管理] [bit] NULL,
	[系统设置] [bit] NULL,
	[界面配置] [bit] NULL,
	[手工重量] [bit] NULL,
	[数据库设置] [bit] NULL,
	[数据备份] [bit] NULL,
	[数据导入] [bit] NULL,
	[数据导出] [bit] NULL,
	[数据清理] [bit] NULL,
	[数据初始化] [bit] NULL,
	[仪表设置] [bit] NULL,
	[视频设置] [bit] NULL,
	[读卡器设置] [bit] NULL,
	[IO模块设置] [bit] NULL,
	[大屏幕设置] [bit] NULL,
	[语音输出] [bit] NULL,
	[数据查询] [bit] NULL,
	[添加记录] [bit] NULL,
	[删除记录] [bit] NULL,
	[修改车号] [bit] NULL,
	[修改发货单位] [bit] NULL,
	[修改收货单位] [bit] NULL,
	[修改货名] [bit] NULL,
	[修改规格] [bit] NULL,
	[修改毛重] [bit] NULL,
	[修改皮重] [bit] NULL,
	[修改扣重] [bit] NULL,
	[修改单价] [bit] NULL,
	[修改折方系数] [bit] NULL,
	[修改过磅费] [bit] NULL,
	[修改备用1] [bit] NULL,
	[修改备用2] [bit] NULL,
	[修改备用3] [bit] NULL,
	[修改备用4] [bit] NULL,
	[修改备用5] [bit] NULL,
	[修改备用6] [bit] NULL,
	[修改备用7] [bit] NULL,
	[修改备用8] [bit] NULL,
	[修改备用9] [bit] NULL,
	[修改备用10] [bit] NULL,
	[修改备用11] [bit] NULL,
	[修改备用12] [bit] NULL,
	[修改备用13] [bit] NULL,
	[修改备用14] [bit] NULL,
	[修改备用15] [bit] NULL,
	[修改备用16] [bit] NULL,
	[修改备用17] [bit] NULL,
	[修改备用18] [bit] NULL,
	[管理员] [bit] NULL,
 CONSTRAINT [PK_用户信息] PRIMARY KEY CLUSTERED 
(
	[用户名] ASC
)
)
END
GO
SET IDENTITY_INSERT [dbo].[用户信息] ON
INSERT [dbo].[用户信息] ([序号], [用户名], [密码], [预置维护], [卡号管理], [系统日志], [后台记录], [打印磅单], [修改磅单], [打印报表], [用户管理], [系统设置], [界面配置], [手工重量], [数据库设置], [数据备份], [数据导入], [数据导出], [数据清理], [数据初始化], [仪表设置], [视频设置], [读卡器设置], [IO模块设置], [大屏幕设置], [语音输出], [数据查询], [添加记录], [删除记录], [修改车号], [修改发货单位], [修改收货单位], [修改货名], [修改规格], [修改毛重], [修改皮重], [修改扣重], [修改单价], [修改折方系数], [修改过磅费], [修改备用1], [修改备用2], [修改备用3], [修改备用4], [修改备用5], [修改备用6], [修改备用7], [修改备用8], [修改备用9], [修改备用10], [修改备用11], [修改备用12], [修改备用13], [修改备用14], [修改备用15], [修改备用16], [修改备用17], [修改备用18], [管理员]) VALUES (1, N'管理员', N'202cb962ac59075b964b07152d234b70', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[用户信息] ([序号], [用户名], [密码], [预置维护], [卡号管理], [系统日志], [后台记录], [打印磅单], [修改磅单], [打印报表], [用户管理], [系统设置], [界面配置], [手工重量], [数据库设置], [数据备份], [数据导入], [数据导出], [数据清理], [数据初始化], [仪表设置], [视频设置], [读卡器设置], [IO模块设置], [大屏幕设置], [语音输出], [数据查询], [添加记录], [删除记录], [修改车号], [修改发货单位], [修改收货单位], [修改货名], [修改规格], [修改毛重], [修改皮重], [修改扣重], [修改单价], [修改折方系数], [修改过磅费], [修改备用1], [修改备用2], [修改备用3], [修改备用4], [修改备用5], [修改备用6], [修改备用7], [修改备用8], [修改备用9], [修改备用10], [修改备用11], [修改备用12], [修改备用13], [修改备用14], [修改备用15], [修改备用16], [修改备用17], [修改备用18], [管理员]) VALUES (2, N'过磅员', N'202cb962ac59075b964b07152d234b70', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[用户信息] OFF
/****** Object:  Table [dbo].[套表]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[套表]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[套表](
	[车号] [nvarchar](50) NOT NULL,
	[发货单位] [nvarchar](50) NULL,
	[收货单位] [nvarchar](50) NULL,
	[货名] [nvarchar](50) NULL,
	[规格] [nvarchar](50) NULL,
	[备用1] [nvarchar](50) NULL,
	[备用2] [nvarchar](50) NULL,
	[备用3] [nvarchar](50) NULL,
	[备用4] [nvarchar](50) NULL,
	[备用5] [nvarchar](50) NULL,
	[备用10] [nvarchar](50) NULL,
	[备用11] [nvarchar](50) NULL,
	[备用12] [nvarchar](50) NULL,
	[备用13] [nvarchar](50) NULL,
	[备用14] [nvarchar](50) NULL,
 CONSTRAINT [PK_套表] PRIMARY KEY CLUSTERED 
(
	[车号] ASC
)
)
END
GO
/****** Object:  Table [dbo].[收货单位]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[收货单位]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[收货单位](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[收货单位] [nvarchar](50) NOT NULL,
	[当前金额] [money] NULL,
	[信用额度] [money] NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_收货单位] PRIMARY KEY CLUSTERED 
(
	[收货单位] ASC
)
)
END
GO
SET IDENTITY_INSERT [dbo].[收货单位] ON
INSERT [dbo].[收货单位] ([序号], [代码], [收货单位], [当前金额], [信用额度]) VALUES (1, N'001', N'C单位', NULL, NULL)
INSERT [dbo].[收货单位] ([序号], [代码], [收货单位], [当前金额], [信用额度]) VALUES (2, N'002', N'D单位', NULL, NULL)
SET IDENTITY_INSERT [dbo].[收货单位] OFF
/****** Object:  Table [dbo].[日志]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[日志]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[日志](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[修改人] [nvarchar](50) NULL,
	[时间] [datetime] NULL,
	[日志] [nvarchar](255) NULL,
 CONSTRAINT [PK_日志] PRIMARY KEY CLUSTERED 
(
	[序号] ASC
)
)
END
GO
/****** Object:  Table [dbo].[货名]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[货名]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[货名](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[货名] [nvarchar](50) NOT NULL,
	[单价] [money] NULL,
	[折方系数] [numeric](18, 3) NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_货名] PRIMARY KEY CLUSTERED 
(
	[货名] ASC
)
)
END
GO
SET IDENTITY_INSERT [dbo].[货名] ON
INSERT [dbo].[货名] ([序号], [代码], [货名], [单价], [折方系数]) VALUES (1, N'001', N'地磅', NULL, NULL)
INSERT [dbo].[货名] ([序号], [代码], [货名], [单价], [折方系数]) VALUES (2, N'002', N'皮带秤', NULL, NULL)
INSERT [dbo].[货名] ([序号], [代码], [货名], [单价], [折方系数]) VALUES (4, N'004', N'石灰', NULL, NULL)
INSERT [dbo].[货名] ([序号], [代码], [货名], [单价], [折方系数]) VALUES (3, N'003', N'水泥', NULL, NULL)
SET IDENTITY_INSERT [dbo].[货名] OFF
/****** Object:  Table [dbo].[规格]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[规格]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[规格](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[规格] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_规格] PRIMARY KEY CLUSTERED 
(
	[规格] ASC
)
)
END
GO
SET IDENTITY_INSERT [dbo].[规格] ON
INSERT [dbo].[规格] ([序号], [代码], [规格]) VALUES (1, N'1', N'100g')
SET IDENTITY_INSERT [dbo].[规格] OFF
/****** Object:  Table [dbo].[发货单位]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[发货单位]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[发货单位](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[发货单位] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_发货单位] PRIMARY KEY CLUSTERED 
(
	[发货单位] ASC
)
)
END
GO
SET IDENTITY_INSERT [dbo].[发货单位] ON
INSERT [dbo].[发货单位] ([序号], [代码], [发货单位]) VALUES (1, N'001', N'A单位')
INSERT [dbo].[发货单位] ([序号], [代码], [发货单位]) VALUES (2, N'002', N'B单位')
INSERT [dbo].[发货单位] ([序号], [代码], [发货单位]) VALUES (3, N'003', N'C单位')
INSERT [dbo].[发货单位] ([序号], [代码], [发货单位]) VALUES (4, N'004', N'D单位')
SET IDENTITY_INSERT [dbo].[发货单位] OFF
/****** Object:  Table [dbo].[称重信息]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[称重信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[称重信息](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[流水号] [nvarchar](50) NOT NULL,
	[车号] [nvarchar](50) NULL,
	[过磅类型] [nvarchar](5) NULL,
	[发货单位] [nvarchar](50) NULL,
	[收货单位] [nvarchar](50) NULL,
	[货名] [nvarchar](50) NULL,
	[规格] [nvarchar](50) NULL,
	[毛重] [numeric](18, 3) NULL,
	[皮重] [numeric](18, 3) NULL,
	[净重] [numeric](18, 3) NULL,
	[扣重] [numeric](18, 3) NULL,
	[实重] [numeric](18, 3) NULL,
	[单价] [numeric](18, 3) NULL,
	[金额] [numeric](18, 3) NULL,
	[折方系数] [numeric](18, 3) NULL,
	[方量] [numeric](18, 3) NULL,
	[过磅费] [numeric](18, 3) NULL,
	[毛重司磅员] [nvarchar](50) NULL,
	[皮重司磅员] [nvarchar](50) NULL,
	[毛重磅号] [nvarchar](10) NULL,
	[皮重磅号] [nvarchar](10) NULL,
	[毛重时间] [datetime] NULL,
	[皮重时间] [datetime] NULL,
	[一次过磅时间] [datetime] NULL,
	[二次过磅时间] [datetime] NULL,
	[更新人] [nvarchar](50) NULL,
	[更新时间] [datetime] NULL,
	[备注] [nvarchar](50) NULL,
	[打印次数] [int] NULL,
	[上传否] [bit] NOT NULL,
	[备用1] [nvarchar](50) NULL,
	[备用2] [nvarchar](50) NULL,
	[备用3] [nvarchar](50) NULL,
	[备用4] [nvarchar](50) NULL,
	[备用5] [nvarchar](50) NULL,
	[备用6] [numeric](18, 3) NULL,
	[备用7] [numeric](18, 3) NULL,
	[备用8] [numeric](18, 3) NULL,
	[备用9] [numeric](18, 3) NULL,
	[备用10] [nvarchar](50) NULL,
	[备用11] [nvarchar](50) NULL,
	[备用12] [nvarchar](50) NULL,
	[备用13] [nvarchar](50) NULL,
	[备用14] [nvarchar](50) NULL,
	[备用15] [numeric](18, 3) NULL,
	[备用16] [numeric](18, 3) NULL,
	[备用17] [numeric](18, 3) NULL,
	[备用18] [numeric](18, 3) NULL,
 CONSTRAINT [PK_称重信息] PRIMARY KEY CLUSTERED 
(
	[流水号] ASC
)
)
END
GO
INSERT [dbo].[称重信息] ([流水号], [车号], [过磅类型], [发货单位], [收货单位], [货名], [规格], [毛重], [皮重], [净重], [扣重], [实重], [单价], [金额], [折方系数], [方量], [过磅费], [毛重司磅员], [皮重司磅员], [毛重磅号], [皮重磅号], [毛重时间], [皮重时间], [一次过磅时间], [二次过磅时间], [更新人], [更新时间], [备注], [打印次数], [上传否], [备用1], [备用2], [备用3], [备用4], [备用5], [备用6], [备用7], [备用8], [备用9], [备用10], [备用11], [备用12], [备用13], [备用14], [备用15], [备用16], [备用17], [备用18]) VALUES (N'201304210001', N'闽A3521', N'PO', N'A单位', N'C单位', N'石灰', N'100g', CAST(76270.000 AS Numeric(18, 3)), CAST(60480.000 AS Numeric(18, 3)), CAST(15790.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)), CAST(15790.000 AS Numeric(18, 3)), CAST(1.000 AS Numeric(18, 3)), CAST(15790.000 AS Numeric(18, 3)), CAST(1.000 AS Numeric(18, 3)), CAST(15790.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)), N'管理员', N'管理员', N'A', N'A', CAST(0x0000A1A401370BBC AS DateTime), CAST(0x0000A1A401370CE8 AS DateTime), CAST(0x0000A1A401370BBC AS DateTime), CAST(0x0000A1A401370CE8 AS DateTime), N'管理员', CAST(0x0000A1A401370CE8 AS DateTime), N'', 0, 0, N'', N'', N'', N'', N'', CAST(0.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)), N'', N'', N'', N'', N'', CAST(0.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)))
GO
/****** Object:  Table [dbo].[车号]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[车号]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[车号](
	[车号] [nvarchar](50) NOT NULL,
	[皮重] [numeric](18, 3) NULL,
	[备注] [nvarchar](50) NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_车号] PRIMARY KEY CLUSTERED 
(
	[车号] ASC
)
)
END
GO
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'闽A3521', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'闽A8514', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'闽AT232', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'闽B452', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'闽C8541', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'闽W8526d', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'湘B8521', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'粤G2563', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
INSERT [dbo].[车号] ([车号], [皮重], [备注], [修正]) VALUES (N'粤G2564', CAST(0.000 AS Numeric(18, 3)), NULL, 0)
/****** Object:  Table [dbo].[超限信息]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[超限信息]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[超限信息](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[流水号] [nvarchar](50) NOT NULL,
	[车号] [nvarchar](50) NULL,
	[过磅类型] [nvarchar](5) NULL,
	[发货单位] [nvarchar](50) NULL,
	[收货单位] [nvarchar](50) NULL,
	[货名] [nvarchar](50) NULL,
	[规格] [nvarchar](50) NULL,
	[毛重] [numeric](18, 3) NULL,
	[皮重] [numeric](18, 3) NULL,
	[净重] [numeric](18, 3) NULL,
	[扣重] [numeric](18, 3) NULL,
	[实重] [numeric](18, 3) NULL,
	[单价] [numeric](18, 3) NULL,
	[金额] [numeric](18, 3) NULL,
	[折方系数] [numeric](18, 3) NULL,
	[方量] [numeric](18, 3) NULL,
	[过磅费] [numeric](18, 3) NULL,
	[毛重司磅员] [nvarchar](50) NULL,
	[皮重司磅员] [nvarchar](50) NULL,
	[毛重磅号] [nvarchar](10) NULL,
	[皮重磅号] [nvarchar](10) NULL,
	[毛重时间] [datetime] NULL,
	[皮重时间] [datetime] NULL,
	[一次过磅时间] [datetime] NULL,
	[二次过磅时间] [datetime] NULL,
	[更新人] [nvarchar](50) NULL,
	[更新时间] [datetime] NULL,
	[备注] [nvarchar](50) NULL,
	[打印次数] [int] NULL,
	[上传否] [bit] NOT NULL,
	[备用1] [nvarchar](50) NULL,
	[备用2] [nvarchar](50) NULL,
	[备用3] [nvarchar](50) NULL,
	[备用4] [nvarchar](50) NULL,
	[备用5] [nvarchar](50) NULL,
	[备用6] [numeric](18, 3) NULL,
	[备用7] [numeric](18, 3) NULL,
	[备用8] [numeric](18, 3) NULL,
	[备用9] [numeric](18, 3) NULL,
	[备用10] [nvarchar](50) NULL,
	[备用11] [nvarchar](50) NULL,
	[备用12] [nvarchar](50) NULL,
	[备用13] [nvarchar](50) NULL,
	[备用14] [nvarchar](50) NULL,
	[备用15] [numeric](18, 3) NULL,
	[备用16] [numeric](18, 3) NULL,
	[备用17] [numeric](18, 3) NULL,
	[备用18] [numeric](18, 3) NULL,
 CONSTRAINT [PK_超限信息] PRIMARY KEY CLUSTERED 
(
	[流水号] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用5]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用5]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用5](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用5] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用5] PRIMARY KEY CLUSTERED 
(
	[备用5] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用4]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用4]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用4](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用4] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用4] PRIMARY KEY CLUSTERED 
(
	[备用4] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用3]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用3]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用3](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用3] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用3] PRIMARY KEY CLUSTERED 
(
	[备用3] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用2]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用2](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用2] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用2] PRIMARY KEY CLUSTERED 
(
	[备用2] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用14]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用14]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用14](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用14] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用14] PRIMARY KEY CLUSTERED 
(
	[备用14] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用13]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用13]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用13](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用13] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用13] PRIMARY KEY CLUSTERED 
(
	[备用13] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用12]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用12]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用12](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用12] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用12] PRIMARY KEY CLUSTERED 
(
	[备用12] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用11]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用11]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用11](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用11] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用11] PRIMARY KEY CLUSTERED 
(
	[备用11] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用10]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用10]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用10](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用10] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用10] PRIMARY KEY CLUSTERED 
(
	[备用10] ASC
)
)
END
GO
/****** Object:  Table [dbo].[备用1]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[备用1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[备用1](
	[序号] [int] IDENTITY(1,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[备用1] [nvarchar](50) NOT NULL,
	[修正] [numeric](18,3),
 CONSTRAINT [PK_备用1] PRIMARY KEY CLUSTERED 
(
	[备用1] ASC
)
)
END
GO
/****** Object:  Table [dbo].[tbl_weight_img]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_weight_img]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbl_weight_img](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WEIGHT_ID] [nvarchar](50) NULL,
	[GROSS_IMG1] [image] NULL,
	[GROSS_IMG2] [image] NULL,
	[GROSS_IMG3] [image] NULL,
	[GROSS_IMG4] [image] NULL,
	[TARE_IMG1] [image] NULL,
	[TARE_IMG2] [image] NULL,
	[TARE_IMG3] [image] NULL,
	[TARE_IMG4] [image] NULL,
 CONSTRAINT [PK_tbl_weight_img] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
END
GO 
/****** Object:  Table [dbo].[tbl_price]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_price]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbl_price](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[shouHuo] [numeric](18, 0) NOT NULL,
	[goods] [numeric](18, 0) NOT NULL,
	[price] [numeric](18, 3) NULL,
 CONSTRAINT [PK__tbl_pric__3213E83F656C112C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
)
END
GO
/****** Object:  Table [dbo].[tbl_pay_history]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_pay_history]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbl_pay_history](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[shouHuo] [nvarchar](50) NULL,
	[updateTime] [datetime] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_tbl_pay_history] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
END
GO
/****** Object:  Table [dbo].[tbl_card]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_card]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbl_card](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[cardNum] [nvarchar](50) NULL,
	[carNum] [nvarchar](50) NULL,
	[tare] [numeric](18, 3) NULL,
	[faHuo] [nvarchar](50) NULL,
	[shouHuo] [nvarchar](50) NULL,
	[goods] [nvarchar](50) NULL,
	[spec] [nvarchar](50) NULL,
	[memo] [nvarchar](50) NULL,
	[backup1] [nvarchar](50) NULL,
	[backup2] [nvarchar](50) NULL,
	[backup3] [nvarchar](50) NULL,
	[backup4] [nvarchar](50) NULL,
	[backup5] [nvarchar](50) NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_tbl_card] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
END
GO
/****** Object:  Table [dbo].[tbl_back_record]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_back_record]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbl_back_record](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[weight] [numeric](18, 3) NULL,
	[weight_time] [datetime] NULL,
	[flag] [bit] NULL,
 CONSTRAINT [PK_tbl_back_record] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
END
GO
/****** Object:  Table [dbo].[tbl_msg]    Script Date: 04/21/2013 19:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tbl_msg]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tbl_msg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ip] [nvarchar](20) NULL,
	[update_time] [datetime] default getdate(),
	[user] [nvarchar](50) NULL,
	[content] [nvarchar](255) NULL,
 CONSTRAINT [PK_tbl_msg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
)
END
GO
/****** Object:  Default [DF__tbl_price__price__6754599E]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__tbl_price__price__6754599E]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__tbl_price__price__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[tbl_price] ADD  CONSTRAINT [DF__tbl_price__price__6754599E]  DEFAULT ((0)) FOR [price]
END


END
GO
/****** Object:  Default [DF_车号_皮重]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_车号_皮重]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_车号_皮重]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[车号] ADD  CONSTRAINT [DF_车号_皮重]  DEFAULT ((0)) FOR [皮重]
END


END
GO
/****** Object:  Default [DF__用户信息__预置维护__7F60ED59]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__预置维护__7F60ED59]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__预置维护__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__预置维护__7F60ED59]  DEFAULT ((0)) FOR [预置维护]
END


END
GO
/****** Object:  Default [DF__用户信息__卡号管理__00551192]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__卡号管理__00551192]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__卡号管理__00551192]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__卡号管理__00551192]  DEFAULT ((0)) FOR [卡号管理]
END


END
GO
/****** Object:  Default [DF__用户信息__系统日志__014935CB]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__系统日志__014935CB]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__系统日志__014935CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__系统日志__014935CB]  DEFAULT ((0)) FOR [系统日志]
END


END
GO
/****** Object:  Default [DF__用户信息__后台记录__023D5A04]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__后台记录__023D5A04]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__后台记录__023D5A04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__后台记录__023D5A04]  DEFAULT ((0)) FOR [后台记录]
END


END
GO
/****** Object:  Default [DF__用户信息__打印磅单__03317E3D]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__打印磅单__03317E3D]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__打印磅单__03317E3D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__打印磅单__03317E3D]  DEFAULT ((0)) FOR [打印磅单]
END


END
GO
/****** Object:  Default [DF__用户信息__修改磅单__0425A276]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改磅单__0425A276]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改磅单__0425A276]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改磅单__0425A276]  DEFAULT ((0)) FOR [修改磅单]
END


END
GO
/****** Object:  Default [DF__用户信息__打印报表__0519C6AF]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__打印报表__0519C6AF]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__打印报表__0519C6AF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__打印报表__0519C6AF]  DEFAULT ((0)) FOR [打印报表]
END


END
GO
/****** Object:  Default [DF__用户信息__用户管理__060DEAE8]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__用户管理__060DEAE8]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__用户管理__060DEAE8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__用户管理__060DEAE8]  DEFAULT ((0)) FOR [用户管理]
END


END
GO
/****** Object:  Default [DF__用户信息__系统设置__07020F21]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__系统设置__07020F21]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__系统设置__07020F21]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__系统设置__07020F21]  DEFAULT ((0)) FOR [系统设置]
END


END
GO
/****** Object:  Default [DF__用户信息__界面配置__07F6335A]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__界面配置__07F6335A]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__界面配置__07F6335A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__界面配置__07F6335A]  DEFAULT ((0)) FOR [界面配置]
END


END
GO
/****** Object:  Default [DF__用户信息__手工重量__08EA5793]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__手工重量__08EA5793]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__手工重量__08EA5793]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__手工重量__08EA5793]  DEFAULT ((0)) FOR [手工重量]
END


END
GO
/****** Object:  Default [DF__用户信息__数据库设置__09DE7BCC]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据库设置__09DE7BCC]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据库设置__09DE7BCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__数据库设置__09DE7BCC]  DEFAULT ((0)) FOR [数据库设置]
END


END
GO
/****** Object:  Default [DF__用户信息__数据备份__0AD2A005]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据备份__0AD2A005]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据备份__0AD2A005]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__数据备份__0AD2A005]  DEFAULT ((0)) FOR [数据备份]
END


END
GO
/****** Object:  Default [DF__用户信息__数据导入__0BC6C43E]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据导入__0BC6C43E]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据导入__0BC6C43E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__数据导入__0BC6C43E]  DEFAULT ((0)) FOR [数据导入]
END


END
GO
/****** Object:  Default [DF__用户信息__数据导出__0CBAE877]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据导出__0CBAE877]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据导出__0CBAE877]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__数据导出__0CBAE877]  DEFAULT ((0)) FOR [数据导出]
END


END
GO
/****** Object:  Default [DF__用户信息__数据清理__0DAF0CB0]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据清理__0DAF0CB0]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据清理__0DAF0CB0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__数据清理__0DAF0CB0]  DEFAULT ((0)) FOR [数据清理]
END


END
GO
/****** Object:  Default [DF__用户信息__数据初始化__0EA330E9]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据初始化__0EA330E9]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据初始化__0EA330E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__数据初始化__0EA330E9]  DEFAULT ((0)) FOR [数据初始化]
END


END
GO
/****** Object:  Default [DF__用户信息__仪表设置__0F975522]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__仪表设置__0F975522]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__仪表设置__0F975522]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__仪表设置__0F975522]  DEFAULT ((0)) FOR [仪表设置]
END


END
GO
/****** Object:  Default [DF__用户信息__视频设置__108B795B]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__视频设置__108B795B]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__视频设置__108B795B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__视频设置__108B795B]  DEFAULT ((0)) FOR [视频设置]
END


END
GO
/****** Object:  Default [DF__用户信息__读卡器设置__117F9D94]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__读卡器设置__117F9D94]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__读卡器设置__117F9D94]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__读卡器设置__117F9D94]  DEFAULT ((0)) FOR [读卡器设置]
END


END
GO
/****** Object:  Default [DF__用户信息__IO模块设置__1273C1CD]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__IO模块设置__1273C1CD]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__IO模块设置__1273C1CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__IO模块设置__1273C1CD]  DEFAULT ((0)) FOR [IO模块设置]
END


END
GO
/****** Object:  Default [DF__用户信息__大屏幕设置__1367E606]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__大屏幕设置__1367E606]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__大屏幕设置__1367E606]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__大屏幕设置__1367E606]  DEFAULT ((0)) FOR [大屏幕设置]
END


END
GO
/****** Object:  Default [DF__用户信息__语音输出__145C0A3F]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__语音输出__145C0A3F]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__语音输出__145C0A3F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__语音输出__145C0A3F]  DEFAULT ((0)) FOR [语音输出]
END


END
GO
/****** Object:  Default [DF__用户信息__数据查询__15502E78]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__数据查询__15502E78]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__数据查询__15502E78]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__数据查询__15502E78]  DEFAULT ((0)) FOR [数据查询]
END


END
GO
/****** Object:  Default [DF__用户信息__添加记录__164452B1]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__添加记录__164452B1]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__添加记录__164452B1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__添加记录__164452B1]  DEFAULT ((0)) FOR [添加记录]
END


END
GO
/****** Object:  Default [DF__用户信息__删除记录__173876EA]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__删除记录__173876EA]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__删除记录__173876EA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__删除记录__173876EA]  DEFAULT ((0)) FOR [删除记录]
END


END
GO
/****** Object:  Default [DF__用户信息__修改车号__182C9B23]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改车号__182C9B23]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改车号__182C9B23]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改车号__182C9B23]  DEFAULT ((0)) FOR [修改车号]
END


END
GO
/****** Object:  Default [DF__用户信息__修改发货单位__1920BF5C]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改发货单位__1920BF5C]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改发货单位__1920BF5C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改发货单位__1920BF5C]  DEFAULT ((0)) FOR [修改发货单位]
END


END
GO
/****** Object:  Default [DF__用户信息__修改收货单位__1A14E395]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改收货单位__1A14E395]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改收货单位__1A14E395]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改收货单位__1A14E395]  DEFAULT ((0)) FOR [修改收货单位]
END


END
GO
/****** Object:  Default [DF__用户信息__修改货名__1B0907CE]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改货名__1B0907CE]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改货名__1B0907CE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改货名__1B0907CE]  DEFAULT ((0)) FOR [修改货名]
END


END
GO
/****** Object:  Default [DF__用户信息__修改规格__1BFD2C07]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改规格__1BFD2C07]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改规格__1BFD2C07]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改规格__1BFD2C07]  DEFAULT ((0)) FOR [修改规格]
END


END
GO
/****** Object:  Default [DF__用户信息__修改毛重__1CF15040]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改毛重__1CF15040]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改毛重__1CF15040]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改毛重__1CF15040]  DEFAULT ((0)) FOR [修改毛重]
END


END
GO
/****** Object:  Default [DF__用户信息__修改皮重__1DE57479]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改皮重__1DE57479]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改皮重__1DE57479]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改皮重__1DE57479]  DEFAULT ((0)) FOR [修改皮重]
END


END
GO
/****** Object:  Default [DF__用户信息__修改扣重__1ED998B2]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改扣重__1ED998B2]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改扣重__1ED998B2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改扣重__1ED998B2]  DEFAULT ((0)) FOR [修改扣重]
END


END
GO
/****** Object:  Default [DF__用户信息__修改单价__1FCDBCEB]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改单价__1FCDBCEB]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改单价__1FCDBCEB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改单价__1FCDBCEB]  DEFAULT ((0)) FOR [修改单价]
END


END
GO
/****** Object:  Default [DF__用户信息__修改折方系数__20C1E124]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改折方系数__20C1E124]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改折方系数__20C1E124]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改折方系数__20C1E124]  DEFAULT ((0)) FOR [修改折方系数]
END


END
GO
/****** Object:  Default [DF__用户信息__修改过磅费__21B6055D]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改过磅费__21B6055D]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改过磅费__21B6055D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改过磅费__21B6055D]  DEFAULT ((0)) FOR [修改过磅费]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用1__22AA2996]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用1__22AA2996]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用1__22AA2996]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用1__22AA2996]  DEFAULT ((0)) FOR [修改备用1]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用2__239E4DCF]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用2__239E4DCF]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用2__239E4DCF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用2__239E4DCF]  DEFAULT ((0)) FOR [修改备用2]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用3__24927208]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用3__24927208]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用3__24927208]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用3__24927208]  DEFAULT ((0)) FOR [修改备用3]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用4__25869641]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用4__25869641]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用4__25869641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用4__25869641]  DEFAULT ((0)) FOR [修改备用4]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用5__267ABA7A]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用5__267ABA7A]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用5__267ABA7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用5__267ABA7A]  DEFAULT ((0)) FOR [修改备用5]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用6__276EDEB3]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用6__276EDEB3]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用6__276EDEB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用6__276EDEB3]  DEFAULT ((0)) FOR [修改备用6]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用7__286302EC]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用7__286302EC]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用7__286302EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用7__286302EC]  DEFAULT ((0)) FOR [修改备用7]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用8__29572725]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用8__29572725]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用8__29572725]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用8__29572725]  DEFAULT ((0)) FOR [修改备用8]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用9__2A4B4B5E]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用9__2A4B4B5E]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用9__2A4B4B5E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用9__2A4B4B5E]  DEFAULT ((0)) FOR [修改备用9]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用10__2B3F6F97]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用10__2B3F6F97]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用10__2B3F6F97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用10__2B3F6F97]  DEFAULT ((0)) FOR [修改备用10]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用11__2C3393D0]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用11__2C3393D0]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用11__2C3393D0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用11__2C3393D0]  DEFAULT ((0)) FOR [修改备用11]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用12__2D27B809]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用12__2D27B809]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用12__2D27B809]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用12__2D27B809]  DEFAULT ((0)) FOR [修改备用12]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用13__2E1BDC42]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用13__2E1BDC42]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用13__2E1BDC42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用13__2E1BDC42]  DEFAULT ((0)) FOR [修改备用13]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用14__2F10007B]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用14__2F10007B]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用14__2F10007B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用14__2F10007B]  DEFAULT ((0)) FOR [修改备用14]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用15__300424B4]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用15__300424B4]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用15__300424B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用15__300424B4]  DEFAULT ((0)) FOR [修改备用15]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用16__30F848ED]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用16__30F848ED]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用16__30F848ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用16__30F848ED]  DEFAULT ((0)) FOR [修改备用16]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用17__31EC6D26]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用17__31EC6D26]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用17__31EC6D26]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用17__31EC6D26]  DEFAULT ((0)) FOR [修改备用17]
END


END
GO
/****** Object:  Default [DF__用户信息__修改备用18__32E0915F]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__修改备用18__32E0915F]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__修改备用18__32E0915F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__修改备用18__32E0915F]  DEFAULT ((0)) FOR [修改备用18]
END


END
GO
/****** Object:  Default [DF__用户信息__管理员__33D4B598]    Script Date: 04/21/2013 19:26:22 ******/
IF Not EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF__用户信息__管理员__33D4B598]') AND type = 'D')
BEGIN
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__用户信息__管理员__33D4B598]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[用户信息] ADD  CONSTRAINT [DF__用户信息__管理员__33D4B598]  DEFAULT ((0)) FOR [管理员]
END


END
GO
