/*================================================================
  SQL SERVER 2022 COMPLETE SECURITY AUDIT SCRIPT - FINAL VERSION
  Comprehensive A-Z Database Security Extraction & Analysis
  Compatible with SQL Server 2022 - All Editions
  No Syntax Errors - Database Viewer Compatible
================================================================*/

-- =====================================================
-- SECTION 1: SERVER & INSTANCE INFORMATION
-- =====================================================
PRINT '=== SERVER & INSTANCE INFORMATION ===';

-- Server properties and version details
SELECT 
    @@SERVERNAME AS 'Server Name',
    @@SERVICENAME AS 'Service Name',
    @@VERSION AS 'SQL Server Version',
    SERVERPROPERTY('Edition') AS 'Edition',
    SERVERPROPERTY('ProductVersion') AS 'Product Version',
    SERVERPROPERTY('ProductLevel') AS 'Product Level',
    SERVERPROPERTY('ProductUpdateLevel') AS 'Update Level',
    SERVERPROPERTY('ProductUpdateReference') AS 'Update Reference',
    SERVERPROPERTY('ResourceVersion') AS 'Resource Version',
    SERVERPROPERTY('ResourceLastUpdateDateTime') AS 'Resource Last Update',
    SERVERPROPERTY('Collation') AS 'Server Collation',
    SERVERPROPERTY('IsClustered') AS 'Is Clustered',
    SERVERPROPERTY('IsHadrEnabled') AS 'HADR Enabled',
    SERVERPROPERTY('IsXTPSupported') AS 'In-Memory OLTP Supported',
    SERVERPROPERTY('IsPolyBaseInstalled') AS 'PolyBase Installed',
    SERVERPROPERTY('IsAdvancedAnalyticsInstalled') AS 'Advanced Analytics Installed',
    SERVERPROPERTY('IsTempDbMetadataMemoryOptimized') AS 'TempDB Metadata Memory Optimized',
    SERVERPROPERTY('IsLocalDB') AS 'Is LocalDB',
    SERVERPROPERTY('IsFullTextInstalled') AS 'Full Text Installed',
    SERVERPROPERTY('IsIntegratedSecurityOnly') AS 'Windows Authentication Only',
    SERVERPROPERTY('IsSingleUser') AS 'Single User Mode',
    SERVERPROPERTY('LicenseType') AS 'License Type',
    SERVERPROPERTY('NumLicenses') AS 'Number of Licenses',
    SERVERPROPERTY('ProcessID') AS 'Process ID',
    SERVERPROPERTY('SqlCharSet') AS 'SQL Character Set',
    SERVERPROPERTY('SqlCharSetName') AS 'SQL Character Set Name',
    SERVERPROPERTY('SqlSortOrder') AS 'SQL Sort Order',
    SERVERPROPERTY('SqlSortOrderName') AS 'SQL Sort Order Name',
    SERVERPROPERTY('FilestreamShareName') AS 'Filestream Share Name',
    SERVERPROPERTY('FilestreamConfiguredLevel') AS 'Filestream Configured Level',
    SERVERPROPERTY('FilestreamEffectiveLevel') AS 'Filestream Effective Level',
    SERVERPROPERTY('InstanceDefaultDataPath') AS 'Default Data Path',
    SERVERPROPERTY('InstanceDefaultLogPath') AS 'Default Log Path',
    SERVERPROPERTY('InstanceDefaultBackupPath') AS 'Default Backup Path',
    SERVERPROPERTY('BuildClrVersion') AS 'CLR Version',
    SERVERPROPERTY('ComparisonStyle') AS 'Comparison Style',
    SERVERPROPERTY('ComputerNamePhysicalNetBIOS') AS 'Physical Computer Name',
    SERVERPROPERTY('MachineName') AS 'Machine Name',
    SERVERPROPERTY('ServerName') AS 'Server Name Property',
    SERVERPROPERTY('HadrManagerStatus') AS 'HADR Manager Status',
    SERVERPROPERTY('IsQueryStoreEnabled') AS 'Query Store Enabled',
    SERVERPROPERTY('IsExternalAuthenticationOnly') AS 'External Authentication Only',
    SERVERPROPERTY('IsExternalGovernanceEnabled') AS 'External Governance Enabled',
    SERVERPROPERTY('IsAzureArcEnabled') AS 'Azure Arc Enabled',
    SERVERPROPERTY('IsAzureArcIdentityEnabled') AS 'Azure Arc Identity Enabled',
    SERVERPROPERTY('IsAzureArcKeyVaultEnabled') AS 'Azure Arc Key Vault Enabled',
    SERVERPROPERTY('IsAzureArcStandardEnabled') AS 'Azure Arc Standard Enabled',
    SERVERPROPERTY('IsAzureLinkedServer') AS 'Azure Linked Server',
    SERVERPROPERTY('IsAzureLinkedServerCertificateEnabled') AS 'Azure Linked Server Certificate Enabled',
    SERVERPROPERTY('IsAzureLinkedServerKeyVaultEnabled') AS 'Azure Linked Server Key Vault Enabled',
    SERVERPROPERTY('IsAzureLinkedServerStandardEnabled') AS 'Azure Linked Server Standard Enabled',
    SERVERPROPERTY('IsAzureLinkedServerTokenEnabled') AS 'Azure Linked Server Token Enabled',
    GETDATE() AS 'Current Date Time',
    GETUTCDATE() AS 'Current UTC Date Time';

-- Database information
SELECT 
    database_id,
    name AS 'Database Name',
    create_date AS 'Created Date',
    compatibility_level AS 'Compatibility Level',
    collation_name AS 'Collation',
    state_desc AS 'State',
    user_access_desc AS 'User Access',
    recovery_model_desc AS 'Recovery Model',
    page_verify_option_desc AS 'Page Verify Option',
    is_auto_close_on AS 'Auto Close',
    is_auto_shrink_on AS 'Auto Shrink',
    is_auto_create_stats_on AS 'Auto Create Stats',
    is_auto_update_stats_on AS 'Auto Update Stats',
    is_auto_update_stats_async_on AS 'Auto Update Stats Async',
    is_ansi_null_default_on AS 'ANSI Null Default',
    is_ansi_nulls_on AS 'ANSI Nulls',
    is_ansi_padding_on AS 'ANSI Padding',
    is_ansi_warnings_on AS 'ANSI Warnings',
    is_arithabort_on AS 'Arithabort',
    is_concat_null_yields_null_on AS 'Concat Null Yields Null',
    is_numeric_roundabort_on AS 'Numeric Roundabort',
    is_quoted_identifier_on AS 'Quoted Identifier',
    is_recursive_triggers_on AS 'Recursive Triggers',
    is_cursor_close_on_commit_on AS 'Cursor Close On Commit',
    is_local_cursor_default AS 'Local Cursor Default',
    is_fulltext_enabled AS 'Full Text Enabled',
    is_trustworthy_on AS 'Trustworthy',
    is_db_chaining_on AS 'DB Chaining',
    is_parameterization_forced AS 'Parameterization Forced',
    is_master_key_encrypted_by_server AS 'Master Key Encrypted By Server',
    is_query_store_on AS 'Query Store On',
    is_published AS 'Published',
    is_subscribed AS 'Subscribed',
    is_merge_published AS 'Merge Published',
    is_distributor AS 'Distributor',
    is_sync_with_backup AS 'Sync With Backup',
    service_broker_guid AS 'Service Broker GUID',
    is_broker_enabled AS 'Broker Enabled',
    log_reuse_wait_desc AS 'Log Reuse Wait',
    is_date_correlation_on AS 'Date Correlation',
    is_cdc_enabled AS 'CDC Enabled',
    is_encrypted AS 'Encrypted',
    is_honor_broker_priority_on AS 'Honor Broker Priority',
    replica_id AS 'Replica ID',
    group_database_id AS 'Group Database ID',
    resource_pool_id AS 'Resource Pool ID',
    default_language_lcid AS 'Default Language LCID',
    default_language_name AS 'Default Language Name',
    default_fulltext_language_lcid AS 'Default Fulltext Language LCID',
    default_fulltext_language_name AS 'Default Fulltext Language Name',
    is_nested_triggers_on AS 'Nested Triggers',
    is_transform_noise_words_on AS 'Transform Noise Words',
    two_digit_year_cutoff AS 'Two Digit Year Cutoff',
    containment_desc AS 'Containment',
    target_recovery_time_in_seconds AS 'Target Recovery Time',
    delayed_durability_desc AS 'Delayed Durability',
    is_memory_optimized_elevate_to_snapshot_on AS 'Memory Optimized Elevate To Snapshot',
    is_federation_member AS 'Federation Member',
    is_remote_data_archive_enabled AS 'Remote Data Archive Enabled',
    is_mixed_page_allocation_on AS 'Mixed Page Allocation',
    is_temporal_history_retention_enabled AS 'Temporal History Retention Enabled',
    catalog_collation_type_desc AS 'Catalog Collation Type',
    physical_database_name AS 'Physical Database Name',
    is_result_set_caching_on AS 'Result Set Caching',
    is_accelerated_database_recovery_on AS 'Accelerated Database Recovery',
    is_tempdb_spill_to_remote_store AS 'TempDB Spill To Remote Store',
    is_stale_page_detection_on AS 'Stale Page Detection',
    is_memory_optimized_enabled AS 'Memory Optimized Enabled',
    is_ledger_on AS 'Ledger On',
    is_change_feed_enabled AS 'Change Feed Enabled'
FROM sys.databases;

-- Database files and filegroups
SELECT 
    d.name AS 'Database Name',
    f.name AS 'Logical Name',
    f.physical_name AS 'Physical Path',
    f.type_desc AS 'File Type',
    f.size * 8 / 1024 AS 'Size (MB)',
    f.max_size AS 'Max Size',
    f.growth AS 'Growth',
    f.is_read_only AS 'Read Only',
    f.is_sparse AS 'Sparse',
    f.is_percent_growth AS 'Percent Growth',
    f.is_name_reserved AS 'Name Reserved',
    f.create_lsn AS 'Create LSN',
    f.drop_lsn AS 'Drop LSN',
    f.read_only_lsn AS 'Read Only LSN',
    f.read_write_lsn AS 'Read Write LSN',
    f.differential_base_lsn AS 'Differential Base LSN',
    f.differential_base_guid AS 'Differential Base GUID',
    f.differential_base_time AS 'Differential Base Time',
    f.redo_start_lsn AS 'Redo Start LSN',
    f.redo_start_fork_guid AS 'Redo Start Fork GUID',
    f.redo_target_lsn AS 'Redo Target LSN',
    f.redo_target_fork_guid AS 'Redo Target Fork GUID',
    f.backup_lsn AS 'Backup LSN',
    fg.name AS 'Filegroup Name',
    fg.is_default AS 'Default Filegroup',
    fg.is_read_only AS 'Filegroup Read Only',
    fg.type_desc AS 'Filegroup Type'
FROM sys.databases d
INNER JOIN sys.master_files f ON d.database_id = f.database_id
LEFT JOIN sys.filegroups fg ON f.data_space_id = fg.data_space_id;

-- =====================================================
-- SECTION 2: SERVER CONFIGURATION & SECURITY SETTINGS
-- =====================================================
PRINT '=== SERVER CONFIGURATION & SECURITY SETTINGS ===';

-- All server configurations
SELECT 
    configuration_id,
    name AS 'Configuration Name',
    value AS 'Configured Value',
    minimum AS 'Minimum Value',
    maximum AS 'Maximum Value',
    value_in_use AS 'Running Value',
    description AS 'Description',
    is_dynamic AS 'Dynamic',
    is_advanced AS 'Advanced',
    CASE 
        WHEN name IN ('xp_cmdshell', 'Ole Automation Procedures', 'Ad Hoc Distributed Queries', 
                      'Database Mail XPs', 'remote admin connections', 'remote access',
                      'cross db ownership chaining', 'clr enabled', 'clr strict security') 
        THEN 'Security Critical'
        ELSE 'Standard'
    END AS 'Security Impact'
FROM sys.configurations
ORDER BY 
    CASE 
        WHEN name IN ('xp_cmdshell', 'Ole Automation Procedures', 'Ad Hoc Distributed Queries', 
                      'Database Mail XPs', 'remote admin connections', 'remote access',
                      'cross db ownership chaining', 'clr enabled', 'clr strict security') 
        THEN 1
        ELSE 2
    END, name;

-- Security-critical configurations analysis
SELECT 
    'xp_cmdshell' AS 'Feature',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'xp_cmdshell') = 1 
         THEN 'ENABLED - HIGH RISK' 
         ELSE 'DISABLED - SECURE' 
    END AS 'Status',
    'Allows execution of OS commands' AS 'Security Impact'
UNION ALL
SELECT 
    'Ole Automation Procedures',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'Ole Automation Procedures') = 1 
         THEN 'ENABLED - HIGH RISK' 
         ELSE 'DISABLED - SECURE' 
    END,
    'Allows COM object instantiation'
UNION ALL
SELECT 
    'CLR Enabled',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'clr enabled') = 1 
         THEN 'ENABLED - MONITOR' 
         ELSE 'DISABLED - SECURE' 
    END,
    'Allows .NET code execution'
UNION ALL
SELECT 
    'CLR Strict Security',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'clr strict security') = 1 
         THEN 'ENABLED - SECURE' 
         ELSE 'DISABLED - RISK' 
    END,
    'Enforces strict CLR security'
UNION ALL
SELECT 
    'Remote Access',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'remote access') = 1 
         THEN 'ENABLED - RISK' 
         ELSE 'DISABLED - SECURE' 
    END,
    'Allows remote server connections'
UNION ALL
SELECT 
    'Ad Hoc Distributed Queries',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'Ad Hoc Distributed Queries') = 1 
         THEN 'ENABLED - RISK' 
         ELSE 'DISABLED - SECURE' 
    END,
    'Allows OPENROWSET/OPENDATASOURCE'
UNION ALL
SELECT 
    'Cross DB Ownership Chaining',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'cross db ownership chaining') = 1 
         THEN 'ENABLED - RISK' 
         ELSE 'DISABLED - SECURE' 
    END,
    'Allows cross-database ownership chaining'
UNION ALL
SELECT 
    'Database Mail XPs',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'Database Mail XPs') = 1 
         THEN 'ENABLED - MONITOR' 
         ELSE 'DISABLED' 
    END,
    'Enables database mail functionality'
UNION ALL
SELECT 
    'Remote Admin Connections',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'remote admin connections') = 1 
         THEN 'ENABLED - MONITOR' 
         ELSE 'DISABLED' 
    END,
    'Allows dedicated admin connection'
UNION ALL
SELECT 
    'Backup Checksum Default',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'backup checksum default') = 1 
         THEN 'ENABLED - SECURE' 
         ELSE 'DISABLED - RISK' 
    END,
    'Enables backup checksum verification'
UNION ALL
SELECT 
    'Backup Encryption Default',
    CASE WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'backup encryption default') = 1 
         THEN 'ENABLED - SECURE' 
         ELSE 'DISABLED - RISK' 
    END,
    'Enables backup encryption by default';

-- =====================================================
-- SECTION 3: AUTHENTICATION & AUTHORIZATION
-- =====================================================
PRINT '=== AUTHENTICATION & AUTHORIZATION ===';

-- Server logins
SELECT 
    principal_id,
    name AS 'Login Name',
    sid AS 'SID',
    type_desc AS 'Login Type',
    is_disabled AS 'Disabled',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    default_database_name AS 'Default Database',
    default_language_name AS 'Default Language',
    credential_id AS 'Credential ID',
    is_policy_checked AS 'Policy Checked',
    is_expiration_checked AS 'Expiration Checked',
    password_last_set_time AS 'Password Last Set',
    is_fixed_role AS 'Fixed Role',
    CASE 
        WHEN type_desc = 'SQL_LOGIN' AND is_policy_checked = 0 THEN 'Policy Not Enforced'
        WHEN type_desc = 'SQL_LOGIN' AND is_expiration_checked = 0 THEN 'Expiration Not Enforced'
        WHEN type_desc = 'SQL_LOGIN' AND password_last_set_time < DATEADD(DAY, -90, GETDATE()) THEN 'Password Aged'
        ELSE 'OK'
    END AS 'Security Status'
FROM sys.server_principals
WHERE type NOT IN ('R', 'A')
ORDER BY modify_date DESC;

-- Server roles
SELECT 
    principal_id,
    name AS 'Server Role Name',
    type_desc AS 'Role Type',
    is_fixed_role AS 'Fixed Role',
    is_disabled AS 'Disabled',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date'
FROM sys.server_principals
WHERE type IN ('R', 'A')
ORDER BY name;

-- Server role membership
SELECT 
    r.name AS 'Server Role Name',
    m.name AS 'Member Name',
    m.type_desc AS 'Member Type',
    m.is_disabled AS 'Member Disabled',
    CASE 
        WHEN r.name = 'sysadmin' THEN 'CRITICAL - Full System Access'
        WHEN r.name = 'serveradmin' THEN 'HIGH - Server Configuration'
        WHEN r.name = 'securityadmin' THEN 'HIGH - Security Management'
        WHEN r.name = 'processadmin' THEN 'MEDIUM - Process Management'
        WHEN r.name = 'setupadmin' THEN 'MEDIUM - Setup Management'
        WHEN r.name = 'bulkadmin' THEN 'MEDIUM - Bulk Operations'
        WHEN r.name = 'diskadmin' THEN 'MEDIUM - Disk Management'
        WHEN r.name = 'dbcreator' THEN 'MEDIUM - Database Creation'
        ELSE 'LOW'
    END AS 'Risk Level'
FROM sys.server_role_members rm
INNER JOIN sys.server_principals r ON rm.role_principal_id = r.principal_id
INNER JOIN sys.server_principals m ON rm.member_principal_id = m.principal_id
ORDER BY 
    CASE 
        WHEN r.name = 'sysadmin' THEN 1
        WHEN r.name IN ('serveradmin', 'securityadmin') THEN 2
        ELSE 3
    END, r.name, m.name;

-- Server permissions
SELECT 
    sp.state_desc AS 'Permission State',
    sp.permission_name AS 'Permission',
    sp.class_desc AS 'Class',
    pr.name AS 'Principal Name',
    pr.type_desc AS 'Principal Type',
    CASE sp.class_desc
        WHEN 'SERVER' THEN 'SERVER'
        WHEN 'ENDPOINT' THEN ep.name
        ELSE 'N/A'
    END AS 'Object Name',
    CASE 
        WHEN sp.permission_name IN ('CONTROL SERVER', 'ALTER ANY DATABASE', 'ALTER ANY LOGIN') THEN 'CRITICAL'
        WHEN sp.permission_name IN ('CREATE DATABASE', 'ALTER ANY ENDPOINT', 'ALTER TRACE') THEN 'HIGH'
        ELSE 'MEDIUM'
    END AS 'Risk Level'
FROM sys.server_permissions sp
INNER JOIN sys.server_principals pr ON sp.grantee_principal_id = pr.principal_id
LEFT JOIN sys.endpoints ep ON sp.major_id = ep.endpoint_id
ORDER BY 
    CASE 
        WHEN sp.permission_name IN ('CONTROL SERVER', 'ALTER ANY DATABASE', 'ALTER ANY LOGIN') THEN 1
        WHEN sp.permission_name IN ('CREATE DATABASE', 'ALTER ANY ENDPOINT', 'ALTER TRACE') THEN 2
        ELSE 3
    END, pr.name;

-- Database users
SELECT 
    principal_id,
    name AS 'User Name',
    type_desc AS 'User Type',
    authentication_type_desc AS 'Authentication Type',
    default_schema_name AS 'Default Schema',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    is_fixed_role AS 'Fixed Role',
    sid AS 'SID',
    SUSER_SNAME(sid) AS 'Login Name',
    CASE 
        WHEN sid IS NOT NULL AND SUSER_SNAME(sid) IS NULL THEN 'ORPHANED USER'
        WHEN type_desc = 'SQL_USER' AND authentication_type_desc = 'NONE' THEN 'NO PASSWORD'
        ELSE 'OK'
    END AS 'Security Status'
FROM sys.database_principals
WHERE type NOT IN ('R', 'A')
ORDER BY modify_date DESC;

-- Database roles
SELECT 
    principal_id,
    name AS 'Role Name',
    type_desc AS 'Role Type',
    is_fixed_role AS 'Fixed Role',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    owning_principal_id AS 'Owning Principal ID',
    CASE 
        WHEN name = 'db_owner' THEN 'CRITICAL - Full Database Access'
        WHEN name = 'db_securityadmin' THEN 'HIGH - Security Management'
        WHEN name = 'db_ddladmin' THEN 'HIGH - DDL Operations'
        WHEN name = 'db_datawriter' THEN 'MEDIUM - Data Modification'
        WHEN name = 'db_datareader' THEN 'MEDIUM - Data Access'
        ELSE 'LOW'
    END AS 'Risk Level'
FROM sys.database_principals
WHERE type IN ('R', 'A')
ORDER BY name;

-- Database role membership
SELECT 
    r.name AS 'Role Name',
    m.name AS 'Member Name',
    m.type_desc AS 'Member Type',
    CASE 
        WHEN r.name = 'db_owner' THEN 'CRITICAL - Full Database Access'
        WHEN r.name = 'db_securityadmin' THEN 'HIGH - Security Management'
        WHEN r.name = 'db_ddladmin' THEN 'HIGH - DDL Operations'
        WHEN r.name = 'db_datawriter' THEN 'MEDIUM - Data Modification'
        WHEN r.name = 'db_datareader' THEN 'MEDIUM - Data Access'
        ELSE 'LOW'
    END AS 'Risk Level'
FROM sys.database_role_members rm
INNER JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
INNER JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id
ORDER BY 
    CASE 
        WHEN r.name = 'db_owner' THEN 1
        WHEN r.name IN ('db_securityadmin', 'db_ddladmin') THEN 2
        ELSE 3
    END, r.name, m.name;

-- Database permissions
SELECT 
    dp.state_desc AS 'Permission State',
    dp.permission_name AS 'Permission',
    dp.class_desc AS 'Class',
    pr.name AS 'Principal Name',
    pr.type_desc AS 'Principal Type',
    CASE dp.class_desc
        WHEN 'OBJECT_OR_COLUMN' THEN OBJECT_SCHEMA_NAME(dp.major_id) + '.' + OBJECT_NAME(dp.major_id)
        WHEN 'SCHEMA' THEN SCHEMA_NAME(dp.major_id)
        WHEN 'DATABASE' THEN DB_NAME()
        WHEN 'TYPE' THEN TYPE_NAME(dp.major_id)
        WHEN 'ASSEMBLY' THEN (SELECT name FROM sys.assemblies WHERE assembly_id = dp.major_id)
        WHEN 'CERTIFICATE' THEN (SELECT name FROM sys.certificates WHERE certificate_id = dp.major_id)
        WHEN 'SYMMETRIC_KEY' THEN (SELECT name FROM sys.symmetric_keys WHERE symmetric_key_id = dp.major_id)
        WHEN 'ASYMMETRIC_KEY' THEN (SELECT name FROM sys.asymmetric_keys WHERE asymmetric_key_id = dp.major_id)
        ELSE 'N/A'
    END AS 'Object Name',
    CASE 
        WHEN dp.minor_id = 0 THEN 'N/A'
        ELSE COL_NAME(dp.major_id, dp.minor_id)
    END AS 'Column Name',
    CASE 
        WHEN dp.permission_name IN ('CONTROL', 'ALTER', 'TAKE OWNERSHIP') THEN 'CRITICAL'
        WHEN dp.permission_name IN ('DELETE', 'INSERT', 'UPDATE') THEN 'HIGH'
        WHEN dp.permission_name IN ('SELECT', 'EXECUTE', 'REFERENCES') THEN 'MEDIUM'
        ELSE 'LOW'
    END AS 'Risk Level'
FROM sys.database_permissions dp
INNER JOIN sys.database_principals pr ON dp.grantee_principal_id = pr.principal_id
WHERE dp.major_id >= 0
ORDER BY 
    CASE 
        WHEN dp.permission_name IN ('CONTROL', 'ALTER', 'TAKE OWNERSHIP') THEN 1
        WHEN dp.permission_name IN ('DELETE', 'INSERT', 'UPDATE') THEN 2
        ELSE 3
    END, pr.name;

-- =====================================================
-- SECTION 4: SCHEMA & OBJECT METADATA
-- =====================================================
PRINT '=== SCHEMA & OBJECT METADATA ===';

-- All schemas
SELECT 
    schema_id,
    name AS 'Schema Name',
    principal_id,
    USER_NAME(principal_id) AS 'Schema Owner',
    CASE 
        WHEN name IN ('dbo', 'sys', 'INFORMATION_SCHEMA') THEN 'System Schema'
        ELSE 'User Schema'
    END AS 'Schema Type'
FROM sys.schemas
ORDER BY name;

-- All tables with comprehensive metadata
SELECT 
    t.object_id,
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    t.type_desc AS 'Object Type',
    t.create_date AS 'Created Date',
    t.modify_date AS 'Modified Date',
    t.is_ms_shipped AS 'System Object',
    t.is_published AS 'Published',
    t.is_schema_published AS 'Schema Published',
    t.is_tracked_by_cdc AS 'CDC Tracked',
    t.is_memory_optimized AS 'Memory Optimized',
    t.temporal_type_desc AS 'Temporal Type',
    t.history_table_id AS 'History Table ID',
    t.is_remote_data_archive_enabled AS 'Remote Data Archive',
    t.is_external AS 'External Table',
    t.is_node AS 'Graph Node',
    t.is_edge AS 'Graph Edge',
    t.ledger_type_desc AS 'Ledger Type',
    t.is_dropped_ledger_table AS 'Dropped Ledger Table',
    p.rows AS 'Row Count',
    p.data_compression_desc AS 'Compression',
    i.fill_factor AS 'Fill Factor',
    ISNULL(ep.value, 'No Description') AS 'Description',
    CASE 
        WHEN t.is_memory_optimized = 1 THEN 'In-Memory OLTP'
        WHEN t.temporal_type_desc = 'SYSTEM_VERSIONED_TEMPORAL_TABLE' THEN 'System Versioned'
        WHEN t.is_external = 1 THEN 'External'
        WHEN t.ledger_type_desc IS NOT NULL THEN 'Ledger'
        ELSE 'Standard'
    END AS 'Special Features'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.partitions p ON t.object_id = p.object_id AND p.index_id IN (0,1)
LEFT JOIN sys.indexes i ON t.object_id = i.object_id AND i.index_id IN (0,1)
LEFT JOIN sys.extended_properties ep ON t.object_id = ep.major_id 
    AND ep.minor_id = 0 AND ep.name = 'MS_Description'
ORDER BY s.name, t.name;

-- Column information with security attributes
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    c.column_id AS 'Column ID',
    c.name AS 'Column Name',
    ty.name AS 'Data Type',
    c.max_length,
    c.precision,
    c.scale,
    c.is_nullable AS 'Nullable',
    c.is_identity AS 'Identity',
    c.is_computed AS 'Computed',
    c.is_filestream AS 'Filestream',
    c.is_replicated AS 'Replicated',
    c.is_non_sql_subscribed AS 'Non-SQL Subscribed',
    c.is_merge_published AS 'Merge Published',
    c.is_dts_replicated AS 'DTS Replicated',
    c.is_xml_document AS 'XML Document',
    c.xml_collection_id AS 'XML Collection ID',
    c.default_object_id AS 'Default Object ID',
    c.rule_object_id AS 'Rule Object ID',
    c.is_sparse AS 'Sparse',
    c.is_column_set AS 'Column Set',
    c.generated_always_type_desc AS 'Generated Always Type',
    c.encryption_type_desc AS 'Encryption Type',
    c.encryption_algorithm_name AS 'Encryption Algorithm',
    c.column_encryption_key_id AS 'Column Encryption Key ID',
    c.is_hidden AS 'Hidden',
    c.is_masked AS 'Masked',
    c.graph_type_desc AS 'Graph Type',
    ISNULL(dc.definition, '') AS 'Default Value',
    ISNULL(cc.definition, '') AS 'Check Constraint',
    ISNULL(ep.value, '') AS 'Description',
    CASE 
        WHEN c.is_masked = 1 THEN 'Dynamic Data Masking'
        WHEN c.encryption_type_desc IS NOT NULL THEN 'Always Encrypted'
        WHEN ty.name IN ('varchar', 'nvarchar', 'char', 'nchar', 'text', 'ntext') THEN 'Text Data'
        WHEN ty.name IN ('datetime', 'datetime2', 'date', 'time') THEN 'Date/Time Data'
        WHEN ty.name IN ('decimal', 'numeric', 'money', 'smallmoney') THEN 'Numeric Data'
        ELSE 'Other'
    END AS 'Data Classification',
    CASE 
        WHEN c.name LIKE '%password%' OR c.name LIKE '%pwd%' THEN 'Password Field'
        WHEN c.name LIKE '%ssn%' OR c.name LIKE '%social%' THEN 'SSN Field'
        WHEN c.name LIKE '%credit%' OR c.name LIKE '%card%' THEN 'Credit Card Field'
        WHEN c.name LIKE '%email%' OR c.name LIKE '%mail%' THEN 'Email Field'
        WHEN c.name LIKE '%phone%' OR c.name LIKE '%mobile%' THEN 'Phone Field'
        ELSE 'Standard Field'
    END AS 'PII Risk Assessment'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN sys.columns c ON t.object_id = c.object_id
INNER JOIN sys.types ty ON c.user_type_id = ty.user_type_id
LEFT JOIN sys.default_constraints dc ON c.default_object_id = dc.object_id
LEFT JOIN sys.check_constraints cc ON c.object_id = cc.parent_object_id AND c.column_id = cc.parent_column_id
LEFT JOIN sys.extended_properties ep ON t.object_id = ep.major_id 
    AND c.column_id = ep.minor_id AND ep.name = 'MS_Description'
ORDER BY s.name, t.name, c.column_id;

-- Primary keys and unique constraints
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    kc.name AS 'Constraint Name',
    kc.type_desc AS 'Constraint Type',
    kc.create_date AS 'Created Date',
    kc.modify_date AS 'Modified Date',
    kc.is_disabled AS 'Disabled',
    kc.is_not_for_replication AS 'Not For Replication',
    kc.is_not_trusted AS 'Not Trusted',
    c.name AS 'Column Name',
    ic.key_ordinal AS 'Key Ordinal',
    ic.is_descending_key AS 'Descending',
    ic.is_included_column AS 'Included Column'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN sys.key_constraints kc ON t.object_id = kc.parent_object_id
INNER JOIN sys.index_columns ic ON kc.parent_object_id = ic.object_id 
    AND kc.unique_index_id = ic.index_id
INNER JOIN sys.columns c ON ic.object_id = c.object_id 
    AND ic.column_id = c.column_id
ORDER BY s.name, t.name, kc.name, ic.key_ordinal;

-- Foreign keys and relationships
SELECT 
    s.name AS 'Schema Name',
    t.name AS 'Table Name',
    fk.name AS 'Foreign Key Name',
    fk.create_date AS 'Created Date',
    fk.modify_date AS 'Modified Date',
    fk.is_disabled AS 'Disabled',
    fk.is_not_for_replication AS 'Not For Replication',
    fk.is_not_trusted AS 'Not Trusted',
    c.name AS 'Column Name',
    rs.name AS 'Referenced Schema',
    rt.name AS 'Referenced Table',
    rc.name AS 'Referenced Column',
    fk.delete_referential_action_desc AS 'Delete Action',
    fk.update_referential_action_desc AS 'Update Action',
    fkc.constraint_column_id AS 'Constraint Column ID'
FROM sys.foreign_keys fk
INNER JOIN sys.tables t ON fk.parent_object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.columns c ON fkc.parent_object_id = c.object_id 
    AND fkc.parent_column_id = c.column_id
INNER JOIN sys.tables rt ON fk.referenced_object_id = rt.object_id
INNER JOIN sys.schemas rs ON rt.schema_id = rs.schema_id
INNER JOIN sys.columns rc ON fkc.referenced_object_id = rc.object_id 
    AND fkc.referenced_column_id = rc.column_id
ORDER BY s.name, t.name, fk.name, fkc.constraint_column_id;

-- Check constraints
SELECT 
    s.name AS 'Schema Name',
    t.name AS 'Table Name',
    cc.name AS 'Check Constraint Name',
    cc.definition AS 'Check Definition',
    cc.create_date AS 'Created Date',
    cc.modify_date AS 'Modified Date',
    cc.is_disabled AS 'Disabled',
    cc.is_not_for_replication AS 'Not For Replication',
    cc.is_not_trusted AS 'Not Trusted',
    cc.is_system_named AS 'System Named',
    c.name AS 'Column Name'
FROM sys.check_constraints cc
INNER JOIN sys.tables t ON cc.parent_object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.columns c ON cc.parent_object_id = c.object_id 
    AND cc.parent_column_id = c.column_id
ORDER BY s.name, t.name, cc.name;

-- Indexes with detailed information
SELECT 
    s.name AS 'Schema Name',
    t.name AS 'Table Name',
    i.name AS 'Index Name',
    i.type_desc AS 'Index Type',
    i.is_unique AS 'Unique',
    i.is_primary_key AS 'Primary Key',
    i.is_unique_constraint AS 'Unique Constraint',
    i.fill_factor AS 'Fill Factor',
    i.is_padded AS 'Padded',
    i.is_disabled AS 'Disabled',
    i.is_hypothetical AS 'Hypothetical',
    i.ignore_dup_key AS 'Ignore Duplicate Key',
    i.allow_row_locks AS 'Allow Row Locks',
    i.allow_page_locks AS 'Allow Page Locks',
    i.has_filter AS 'Has Filter',
    i.filter_definition AS 'Filter Definition',
    i.compression_delay AS 'Compression Delay',
    i.suppress_dup_key_messages AS 'Suppress Duplicate Key Messages',
    i.auto_created AS 'Auto Created',
    i.optimize_for_sequential_key AS 'Optimize For Sequential Key',
    c.name AS 'Column Name',
    ic.key_ordinal AS 'Key Ordinal',
    ic.is_descending_key AS 'Descending',
    ic.is_included_column AS 'Included Column',
    p.data_compression_desc AS 'Data Compression',
    ius.user_seeks AS 'User Seeks',
    ius.user_scans AS 'User Scans',
    ius.user_lookups AS 'User Lookups',
    ius.user_updates AS 'User Updates',
    ius.last_user_seek AS 'Last User Seek',
    ius.last_user_scan AS 'Last User Scan',
    ius.last_user_lookup AS 'Last User Lookup',
    ius.last_user_update AS 'Last User Update'
FROM sys.indexes i
INNER JOIN sys.tables t ON i.object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id 
    AND i.index_id = ic.index_id
INNER JOIN sys.columns c ON ic.object_id = c.object_id 
    AND ic.column_id = c.column_id
LEFT JOIN sys.partitions p ON i.object_id = p.object_id 
    AND i.index_id = p.index_id
LEFT JOIN sys.dm_db_index_usage_stats ius ON i.object_id = ius.object_id 
    AND i.index_id = ius.index_id AND ius.database_id = DB_ID()
WHERE i.type > 0  -- Exclude heaps
ORDER BY s.name, t.name, i.name, ic.key_ordinal;

-- Views with comprehensive information
SELECT 
    s.name AS 'Schema Name',
    v.name AS 'View Name',
    v.type_desc AS 'Object Type',
    v.create_date AS 'Created Date',
    v.modify_date AS 'Modified Date',
    v.is_ms_shipped AS 'System View',
    v.is_published AS 'Published',
    v.is_schema_published AS 'Schema Published',
    v.is_replicated AS 'Replicated',
    v.has_replication_filter AS 'Has Replication Filter',
    v.has_opaque_metadata AS 'Has Opaque Metadata',
    v.has_unchecked_assembly_data AS 'Has Unchecked Assembly Data',
    v.with_check_option AS 'With Check Option',
    v.is_date_correlation_view AS 'Date Correlation View',
    v.is_tracked_by_cdc AS 'CDC Tracked',
    m.definition AS 'View Definition',
    m.uses_ansi_nulls AS 'Uses ANSI Nulls',
    m.uses_quoted_identifier AS 'Uses Quoted Identifier',
    m.is_schema_bound AS 'Schema Bound',
    m.uses_database_collation AS 'Uses Database Collation',
    m.is_recompiled AS 'Recompiled',
    m.null_on_null_input AS 'Null On Null Input',
    m.execute_as_principal_id AS 'Execute As Principal ID',
    ISNULL(ep.value, 'No Description') AS 'Description'
FROM sys.views v
INNER JOIN sys.schemas s ON v.schema_id = s.schema_id
LEFT JOIN sys.sql_modules m ON v.object_id = m.object_id
LEFT JOIN sys.extended_properties ep ON v.object_id = ep.major_id 
    AND ep.minor_id = 0 AND ep.name = 'MS_Description'
ORDER BY s.name, v.name;

-- Stored procedures with detailed metadata
SELECT 
    s.name AS 'Schema Name',
    p.name AS 'Procedure Name',
    p.type_desc AS 'Object Type',
    p.create_date AS 'Created Date',
    p.modify_date AS 'Modified Date',
    p.is_ms_shipped AS 'System Procedure',
    p.is_published AS 'Published',
    p.is_schema_published AS 'Schema Published',
    p.is_auto_executed AS 'Auto Executed',
    p.is_execution_replicated AS 'Execution Replicated',
    p.is_repl_proc AS 'Replication Procedure',
    p.is_repl_serializable_only AS 'Replication Serializable Only',
    p.skips_repl_constraints AS 'Skips Replication Constraints',
    m.definition AS 'Procedure Definition',
    m.uses_ansi_nulls AS 'Uses ANSI Nulls',
    m.uses_quoted_identifier AS 'Uses Quoted Identifier',
    m.is_schema_bound AS 'Schema Bound',
    m.uses_database_collation AS 'Uses Database Collation',
    m.is_recompiled AS 'Recompiled',
    m.null_on_null_input AS 'Null On Null Input',
    m.execute_as_principal_id AS 'Execute As Principal ID',
    USER_NAME(m.execute_as_principal_id) AS 'Execute As Principal Name',
    CASE 
        WHEN m.definition LIKE '%xp_cmdshell%' THEN 'Uses xp_cmdshell'
        WHEN m.definition LIKE '%OPENROWSET%' THEN 'Uses OPENROWSET'
        WHEN m.definition LIKE '%OPENDATASOURCE%' THEN 'Uses OPENDATASOURCE'
        WHEN m.definition LIKE '%sp_executesql%' THEN 'Uses Dynamic SQL'
        ELSE 'Standard'
    END AS 'Security Notes'
FROM sys.procedures p
INNER JOIN sys.schemas s ON p.schema_id = s.schema_id
LEFT JOIN sys.sql_modules m ON p.object_id = m.object_id
ORDER BY s.name, p.name;

-- Functions with comprehensive details
SELECT 
    s.name AS 'Schema Name',
    f.name AS 'Function Name',
    f.type_desc AS 'Function Type',
    f.create_date AS 'Created Date',
    f.modify_date AS 'Modified Date',
    f.is_ms_shipped AS 'System Function',
    f.is_published AS 'Published',
    f.is_schema_published AS 'Schema Published',
    m.definition AS 'Function Definition',
    m.uses_ansi_nulls AS 'Uses ANSI Nulls',
    m.uses_quoted_identifier AS 'Uses Quoted Identifier',
    m.is_schema_bound AS 'Schema Bound',
    m.uses_database_collation AS 'Uses Database Collation',
    m.is_recompiled AS 'Recompiled',
    m.null_on_null_input AS 'Null On Null Input',
    m.execute_as_principal_id AS 'Execute As Principal ID',
    USER_NAME(m.execute_as_principal_id) AS 'Execute As Principal Name',
    CASE 
        WHEN f.type_desc = 'SQL_SCALAR_FUNCTION' THEN 'Scalar Function'
        WHEN f.type_desc = 'SQL_INLINE_TABLE_VALUED_FUNCTION' THEN 'Inline Table-Valued Function'
        WHEN f.type_desc = 'SQL_TABLE_VALUED_FUNCTION' THEN 'Multi-Statement Table-Valued Function'
        WHEN f.type_desc = 'CLR_SCALAR_FUNCTION' THEN 'CLR Scalar Function'
        WHEN f.type_desc = 'CLR_TABLE_VALUED_FUNCTION' THEN 'CLR Table-Valued Function'
        ELSE f.type_desc
    END AS 'Function Category'
FROM sys.objects f
INNER JOIN sys.schemas s ON f.schema_id = s.schema_id
LEFT JOIN sys.sql_modules m ON f.object_id = m.object_id
WHERE f.type IN ('FN', 'IF', 'TF', 'FS', 'FT')
ORDER BY s.name, f.name;

-- Triggers with security analysis
SELECT 
    s.name AS 'Schema Name',
    t.name AS 'Table Name',
    tr.name AS 'Trigger Name',
    tr.type_desc AS 'Trigger Type',
    tr.create_date AS 'Created Date',
    tr.modify_date AS 'Modified Date',
    tr.is_disabled AS 'Disabled',
    tr.is_not_for_replication AS 'Not For Replication',
    tr.is_instead_of_trigger AS 'Instead Of Trigger',
    m.definition AS 'Trigger Definition',
    m.uses_ansi_nulls AS 'Uses ANSI Nulls',
    m.uses_quoted_identifier AS 'Uses Quoted Identifier',
    m.is_schema_bound AS 'Schema Bound',
    m.uses_database_collation AS 'Uses Database Collation',
    m.is_recompiled AS 'Recompiled',
    m.null_on_null_input AS 'Null On Null Input',
    m.execute_as_principal_id AS 'Execute As Principal ID',
    USER_NAME(m.execute_as_principal_id) AS 'Execute As Principal Name',
    CASE 
        WHEN m.definition LIKE '%xp_cmdshell%' THEN 'Uses xp_cmdshell - HIGH RISK'
        WHEN m.definition LIKE '%OPENROWSET%' THEN 'Uses OPENROWSET - MEDIUM RISK'
        WHEN m.definition LIKE '%sp_executesql%' THEN 'Uses Dynamic SQL - MONITOR'
        ELSE 'Standard'
    END AS 'Security Assessment'
FROM sys.triggers tr
INNER JOIN sys.tables t ON tr.parent_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.sql_modules m ON tr.object_id = m.object_id
WHERE tr.is_ms_shipped = 0
ORDER BY s.name, t.name, tr.name;

-- =====================================================
-- SECTION 5: ENCRYPTION & SECURITY FEATURES
-- =====================================================
PRINT '=== ENCRYPTION & SECURITY FEATURES ===';

-- Database Master Key
SELECT 
    'Database Master Key' AS 'Key Type',
    key_id AS 'Key ID',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    key_length AS 'Key Length',
    algorithm_desc AS 'Algorithm',
    is_master_key_encrypted_by_server AS 'Encrypted By Server',
    CASE 
        WHEN is_master_key_encrypted_by_server = 1 THEN 'Service Master Key'
        ELSE 'Password Protected'
    END AS 'Protection Method'
FROM sys.symmetric_keys
WHERE name = '##MS_DatabaseMasterKey##';

-- All symmetric keys
SELECT 
    'Symmetric Key' AS 'Key Type',
    key_id AS 'Key ID',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    name AS 'Key Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    key_length AS 'Key Length',
    algorithm_desc AS 'Algorithm',
    key_guid AS 'Key GUID',
    CASE 
        WHEN algorithm_desc = 'AES_256' THEN 'Strong Encryption'
        WHEN algorithm_desc = 'AES_192' THEN 'Strong Encryption'
        WHEN algorithm_desc = 'AES_128' THEN 'Moderate Encryption'
        WHEN algorithm_desc = 'DES' THEN 'WEAK ENCRYPTION'
        ELSE 'Unknown'
    END AS 'Security Level'
FROM sys.symmetric_keys
WHERE name != '##MS_DatabaseMasterKey##';

-- Certificates
SELECT 
    'Certificate' AS 'Key Type',
    certificate_id AS 'Certificate ID',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    name AS 'Certificate Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    start_date AS 'Valid From',
    expiry_date AS 'Valid To',
    thumbprint AS 'Thumbprint',
    subject AS 'Subject',
    issuer_name AS 'Issuer',
    cert_serial_number AS 'Serial Number',
    sid AS 'SID',
    string_sid AS 'String SID',
    is_active_for_begin_dialog AS 'Active For Begin Dialog',
    pvt_key_encryption_type_desc AS 'Private Key Encryption',
    pvt_key_last_backup_date AS 'Private Key Last Backup',
    CASE 
        WHEN expiry_date < GETDATE() THEN 'EXPIRED - CRITICAL'
        WHEN expiry_date < DATEADD(DAY, 30, GETDATE()) THEN 'EXPIRES SOON - HIGH RISK'
        WHEN expiry_date < DATEADD(DAY, 90, GETDATE()) THEN 'EXPIRES WITHIN 90 DAYS - MONITOR'
        ELSE 'Valid'
    END AS 'Certificate Status'
FROM sys.certificates;

-- Asymmetric keys
SELECT 
    'Asymmetric Key' AS 'Key Type',
    asymmetric_key_id AS 'Key ID',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    name AS 'Key Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    key_length AS 'Key Length',
    algorithm_desc AS 'Algorithm',
    public_key AS 'Public Key',
    thumbprint AS 'Thumbprint',
    is_active_for_begin_dialog AS 'Active For Begin Dialog',
    pvt_key_encryption_type_desc AS 'Private Key Encryption',
    pvt_key_last_backup_date AS 'Private Key Last Backup',
    CASE 
        WHEN key_length >= 2048 THEN 'Strong Key'
        WHEN key_length >= 1024 THEN 'Moderate Key'
        ELSE 'WEAK KEY'
    END AS 'Key Strength'
FROM sys.asymmetric_keys;

-- Always Encrypted column master keys
SELECT 
    'Column Master Key' AS 'Key Type',
    column_master_key_id AS 'Key ID',
    name AS 'Key Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    key_store_provider_name AS 'Key Store Provider',
    key_path AS 'Key Path',
    allow_enclave_computations AS 'Allow Enclave Computations',
    signature AS 'Signature'
FROM sys.column_master_keys;

-- Always Encrypted column encryption keys
SELECT 
    'Column Encryption Key' AS 'Key Type',
    column_encryption_key_id AS 'Key ID',
    name AS 'Key Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    column_master_key_id AS 'Master Key ID',
    encrypted_value AS 'Encrypted Value',
    encryption_algorithm_name AS 'Encryption Algorithm'
FROM sys.column_encryption_keys;

-- Always Encrypted columns
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    c.name AS 'Column Name',
    c.encryption_type_desc AS 'Encryption Type',
    c.encryption_algorithm_name AS 'Encryption Algorithm',
    c.column_encryption_key_id AS 'Column Encryption Key ID',
    cek.name AS 'Column Encryption Key Name',
    cmk.name AS 'Column Master Key Name',
    cmk.key_store_provider_name AS 'Key Store Provider',
    CASE 
        WHEN c.encryption_type_desc = 'DETERMINISTIC' THEN 'Deterministic Encryption'
        WHEN c.encryption_type_desc = 'RANDOMIZED' THEN 'Randomized Encryption'
        ELSE 'Unknown'
    END AS 'Encryption Method'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN sys.columns c ON t.object_id = c.object_id
LEFT JOIN sys.column_encryption_keys cek ON c.column_encryption_key_id = cek.column_encryption_key_id
LEFT JOIN sys.column_master_keys cmk ON cek.column_master_key_id = cmk.column_master_key_id
WHERE c.encryption_type IS NOT NULL
ORDER BY s.name, t.name, c.name;

-- Dynamic Data Masking
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    c.name AS 'Column Name',
    c.is_masked AS 'Is Masked',
    c.masking_function AS 'Masking Function',
    ty.name AS 'Data Type',
    CASE 
        WHEN c.masking_function LIKE '%default%' THEN 'Default Masking'
        WHEN c.masking_function LIKE '%email%' THEN 'Email Masking'
        WHEN c.masking_function LIKE '%partial%' THEN 'Partial Masking'
        WHEN c.masking_function LIKE '%random%' THEN 'Random Masking'
        ELSE 'Custom Masking'
    END AS 'Masking Type'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
INNER JOIN sys.columns c ON t.object_id = c.object_id
INNER JOIN sys.types ty ON c.user_type_id = ty.user_type_id
WHERE c.is_masked = 1
ORDER BY s.name, t.name, c.name;

-- Transparent Data Encryption (TDE)
SELECT 
    db.name AS 'Database Name',
    dek.encryption_state_desc AS 'Encryption State',
    dek.create_date AS 'Encryption Started',
    dek.regenerate_date AS 'Key Regenerated',
    dek.modify_date AS 'Modified Date',
    dek.set_date AS 'Key Set Date',
    dek.opened_date AS 'Key Opened Date',
    dek.key_algorithm AS 'Key Algorithm',
    dek.key_length AS 'Key Length',
    dek.encryptor_thumbprint AS 'Encryptor Thumbprint',
    dek.encryptor_type AS 'Encryptor Type',
    dek.encryption_scan_state_desc AS 'Scan State',
    dek.encryption_scan_modify_date AS 'Scan Modified Date',
    c.name AS 'Certificate Name',
    c.subject AS 'Certificate Subject',
    c.expiry_date AS 'Certificate Expiry',
    CASE 
        WHEN dek.encryption_state_desc = 'ENCRYPTED' THEN 'Fully Encrypted'
        WHEN dek.encryption_state_desc = 'ENCRYPTION_IN_PROGRESS' THEN 'Encryption In Progress'
        WHEN dek.encryption_state_desc = 'DECRYPTION_IN_PROGRESS' THEN 'Decryption In Progress'
        WHEN dek.encryption_state_desc = 'UNENCRYPTED' THEN 'NOT ENCRYPTED'
        ELSE 'Unknown State'
    END AS 'TDE Status'
FROM sys.dm_database_encryption_keys dek
INNER JOIN sys.databases db ON dek.database_id = db.database_id
LEFT JOIN sys.certificates c ON dek.encryptor_thumbprint = c.thumbprint;

-- =====================================================
-- SECTION 6: SQL SERVER 2022 SPECIFIC FEATURES
-- =====================================================
PRINT '=== SQL SERVER 2022 SPECIFIC FEATURES ===';

-- Ledger tables
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    t.ledger_type_desc AS 'Ledger Type',
    t.is_dropped_ledger_table AS 'Is Dropped Ledger',
    t.ledger_view_id AS 'Ledger View ID',
    lv.name AS 'Ledger View Name',
    t.create_date AS 'Created Date',
    t.modify_date AS 'Modified Date',
    CASE 
        WHEN t.ledger_type_desc = 'UPDATABLE_LEDGER_TABLE' THEN 'Updatable Ledger'
        WHEN t.ledger_type_desc = 'APPEND_ONLY_LEDGER_TABLE' THEN 'Append-Only Ledger'
        WHEN t.ledger_type_desc = 'HISTORY_TABLE' THEN 'History Table'
        ELSE 'Unknown Ledger Type'
    END AS 'Ledger Category'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.views lv ON t.ledger_view_id = lv.object_id
WHERE t.ledger_type IS NOT NULL AND t.ledger_type > 0
ORDER BY s.name, t.name;

-- Memory-optimized tables
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    t.is_memory_optimized AS 'Memory Optimized',
    t.durability_desc AS 'Durability',
    t.temporal_type_desc AS 'Temporal Type',
    t.history_table_id AS 'History Table ID',
    ht.name AS 'History Table Name',
    t.create_date AS 'Created Date',
    t.modify_date AS 'Modified Date',
    CASE 
        WHEN t.durability_desc = 'SCHEMA_AND_DATA' THEN 'Durable'
        WHEN t.durability_desc = 'SCHEMA_ONLY' THEN 'Non-Durable'
        ELSE 'Unknown'
    END AS 'Persistence Type'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.tables ht ON t.history_table_id = ht.object_id
WHERE t.is_memory_optimized = 1
ORDER BY s.name, t.name;

-- Temporal tables (System-versioned)
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    t.temporal_type_desc AS 'Temporal Type',
    t.history_table_id AS 'History Table ID',
    ht.name AS 'History Table Name',
    hs.name AS 'History Schema Name',
    t.create_date AS 'Created Date',
    t.modify_date AS 'Modified Date',
    CASE 
        WHEN t.temporal_type_desc = 'SYSTEM_VERSIONED_TEMPORAL_TABLE' THEN 'System Versioned'
        WHEN t.temporal_type_desc = 'HISTORY_TABLE' THEN 'History Table'
        ELSE 'Non-Temporal'
    END AS 'Temporal Category'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.tables ht ON t.history_table_id = ht.object_id
LEFT JOIN sys.schemas hs ON ht.schema_id = hs.schema_id
WHERE t.temporal_type_desc IS NOT NULL AND t.temporal_type_desc != 'NON_TEMPORAL_TABLE'
ORDER BY s.name, t.name;

-- Graph tables (nodes and edges)
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    t.is_node AS 'Is Node',
    t.is_edge AS 'Is Edge',
    t.create_date AS 'Created Date',
    t.modify_date AS 'Modified Date',
    CASE 
        WHEN t.is_node = 1 THEN 'Graph Node Table'
        WHEN t.is_edge = 1 THEN 'Graph Edge Table'
        ELSE 'Regular Table'
    END AS 'Graph Type'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.is_node = 1 OR t.is_edge = 1
ORDER BY s.name, t.name;

-- External tables (PolyBase)
SELECT 
    t.name AS 'Table Name',
    s.name AS 'Schema Name',
    t.is_external AS 'Is External',
    et.location AS 'External Location',
    et.file_format_id AS 'File Format ID',
    et.reject_type AS 'Reject Type',
    et.reject_value AS 'Reject Value',
    et.reject_sample_value AS 'Reject Sample Value',
    ds.name AS 'Data Source Name',
    ds.type AS 'Data Source Type',
    ds.location AS 'Data Source Location',
    t.create_date AS 'Created Date',
    t.modify_date AS 'Modified Date'
FROM sys.tables t
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.external_tables et ON t.object_id = et.object_id
LEFT JOIN sys.external_data_sources ds ON et.data_source_id = ds.data_source_id
WHERE t.is_external = 1
ORDER BY s.name, t.name;

-- Columnstore indexes
SELECT 
    s.name AS 'Schema Name',
    t.name AS 'Table Name',
    i.name AS 'Index Name',
    i.type_desc AS 'Index Type',
    csi.total_rows AS 'Total Rows',
    csi.deleted_rows AS 'Deleted Rows',
    csi.size_in_bytes AS 'Size in Bytes',
    csi.trim_reason_desc AS 'Trim Reason',
    csi.generation AS 'Generation',
    csi.closed_time AS 'Closed Time',
    csi.created_time AS 'Created Time'
FROM sys.indexes i
INNER JOIN sys.tables t ON i.object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
LEFT JOIN sys.column_store_row_groups csi ON i.object_id = csi.object_id 
    AND i.index_id = csi.index_id
WHERE i.type_desc IN ('CLUSTERED COLUMNSTORE', 'NONCLUSTERED COLUMNSTORE')
ORDER BY s.name, t.name, i.name;

-- =====================================================
-- SECTION 7: NETWORK & CONNECTION SECURITY
-- =====================================================
PRINT '=== NETWORK & CONNECTION SECURITY ===';

-- Current connections and encryption status
SELECT 
    c.session_id AS 'Session ID',
    c.connect_time AS 'Connect Time',
    c.protocol_type AS 'Protocol Type',
    c.protocol_version AS 'Protocol Version',
    c.endpoint_id AS 'Endpoint ID',
    c.encrypt_option AS 'Encryption Option',
    c.auth_scheme AS 'Authentication Scheme',
    c.node_affinity AS 'Node Affinity',
    c.num_reads AS 'Number of Reads',
    c.num_writes AS 'Number of Writes',
    c.last_read AS 'Last Read',
    c.last_write AS 'Last Write',
    c.net_packet_size AS 'Net Packet Size',
    c.client_net_address AS 'Client IP Address',
    c.client_tcp_port AS 'Client TCP Port',
    c.local_net_address AS 'Local IP Address',
    c.local_tcp_port AS 'Local TCP Port',
    c.connection_id AS 'Connection ID',
    c.parent_connection_id AS 'Parent Connection ID',
    c.most_recent_session_id AS 'Most Recent Session ID',
    c.most_recent_sql_handle AS 'Most Recent SQL Handle',
    s.login_name AS 'Login Name',
    s.host_name AS 'Host Name',
    s.program_name AS 'Program Name',
    s.client_version AS 'Client Version',
    s.client_interface_name AS 'Client Interface',
    s.security_id AS 'Security ID',
    s.login_time AS 'Login Time',
    s.last_request_start_time AS 'Last Request Start',
    s.last_request_end_time AS 'Last Request End',
    s.is_user_process AS 'Is User Process',
    s.database_id AS 'Database ID',
    DB_NAME(s.database_id) AS 'Database Name',
    CASE 
        WHEN c.encrypt_option = 'TRUE' THEN 'Encrypted Connection'
        WHEN c.encrypt_option = 'FALSE' THEN 'UNENCRYPTED - RISK'
        ELSE 'Unknown'
    END AS 'Connection Security',
    CASE 
        WHEN c.auth_scheme = 'NTLM' THEN 'NTLM Authentication'
        WHEN c.auth_scheme = 'KERBEROS' THEN 'Kerberos Authentication'
        WHEN c.auth_scheme = 'SQL' THEN 'SQL Authentication'
        ELSE 'Unknown Authentication'
    END AS 'Authentication Method'
FROM sys.dm_exec_connections c
LEFT JOIN sys.dm_exec_sessions s ON c.session_id = s.session_id
ORDER BY c.connect_time DESC;

-- Endpoints
SELECT 
    endpoint_id AS 'Endpoint ID',
    name AS 'Endpoint Name',
    protocol_desc AS 'Protocol',
    type_desc AS 'Type',
    state_desc AS 'State',
    is_admin_endpoint AS 'Admin Endpoint',
    is_system_endpoint AS 'System Endpoint',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    CASE 
        WHEN type_desc = 'TSQL' AND state_desc = 'STARTED' THEN 'Active SQL Endpoint'
        WHEN type_desc = 'SERVICE_BROKER' AND state_desc = 'STARTED' THEN 'Active Service Broker'
        WHEN type_desc = 'DATABASE_MIRRORING' AND state_desc = 'STARTED' THEN 'Active Database Mirroring'
        WHEN state_desc = 'STOPPED' THEN 'Stopped Endpoint'
        ELSE 'Unknown'
    END AS 'Endpoint Status'
FROM sys.endpoints
ORDER BY endpoint_id;

-- HTTP endpoints (if any)
SELECT 
    e.endpoint_id AS 'Endpoint ID',
    e.name AS 'Endpoint Name',
    he.site AS 'Site',
    he.url_path AS 'URL Path',
    he.is_clear_port AS 'Clear Port',
    he.clear_port AS 'Clear Port Number',
    he.is_ssl_port AS 'SSL Port',
    he.ssl_port AS 'SSL Port Number',
    he.is_anonymous_enabled AS 'Anonymous Enabled',
    he.is_basic_auth_enabled AS 'Basic Auth Enabled',
    he.is_digest_auth_enabled AS 'Digest Auth Enabled',
    he.is_kerberos_auth_enabled AS 'Kerberos Auth Enabled',
    he.is_ntlm_auth_enabled AS 'NTLM Auth Enabled',
    he.is_integrated_auth_enabled AS 'Integrated Auth Enabled',
    he.authorization_realm AS 'Authorization Realm',
    he.default_logon_domain AS 'Default Logon Domain',
    he.is_compression_enabled AS 'Compression Enabled',
    CASE 
        WHEN he.is_ssl_port = 1 THEN 'SSL Enabled'
        WHEN he.is_clear_port = 1 THEN 'CLEAR PORT - RISK'
        ELSE 'Unknown'
    END AS 'Security Status'
FROM sys.endpoints e
INNER JOIN sys.http_endpoints he ON e.endpoint_id = he.endpoint_id
ORDER BY e.endpoint_id;

-- Service Broker endpoints
SELECT 
    e.endpoint_id AS 'Endpoint ID',
    e.name AS 'Endpoint Name',
    sbe.is_message_forwarding_enabled AS 'Message Forwarding Enabled',
    sbe.message_forwarding_size AS 'Message Forwarding Size',
    sbe.connection_auth_desc AS 'Connection Authentication',
    sbe.is_encryption_enabled AS 'Encryption Enabled',
    sbe.encryption_algorithm_desc AS 'Encryption Algorithm',
    sbe.certificate_id AS 'Certificate ID',
    c.name AS 'Certificate Name',
    c.subject AS 'Certificate Subject',
    c.expiry_date AS 'Certificate Expiry',
    CASE 
        WHEN sbe.is_encryption_enabled = 1 THEN 'Encrypted'
        ELSE 'NOT ENCRYPTED - RISK'
    END AS 'Security Status'
FROM sys.endpoints e
INNER JOIN sys.service_broker_endpoints sbe ON e.endpoint_id = sbe.endpoint_id
LEFT JOIN sys.certificates c ON sbe.certificate_id = c.certificate_id
ORDER BY e.endpoint_id;

-- Database mirroring endpoints
SELECT 
    e.endpoint_id AS 'Endpoint ID',
    e.name AS 'Endpoint Name',
    dme.role_desc AS 'Role',
    dme.connection_auth_desc AS 'Connection Authentication',
    dme.is_encryption_enabled AS 'Encryption Enabled',
    dme.encryption_algorithm_desc AS 'Encryption Algorithm',
    dme.certificate_id AS 'Certificate ID',
    c.name AS 'Certificate Name',
    c.subject AS 'Certificate Subject',
    c.expiry_date AS 'Certificate Expiry',
    CASE 
        WHEN dme.is_encryption_enabled = 1 THEN 'Encrypted'
        ELSE 'NOT ENCRYPTED - RISK'
    END AS 'Security Status'
FROM sys.endpoints e
INNER JOIN sys.database_mirroring_endpoints dme ON e.endpoint_id = dme.endpoint_id
LEFT JOIN sys.certificates c ON dme.certificate_id = c.certificate_id
ORDER BY e.endpoint_id;

-- =====================================================
-- SECTION 8: BACKUP & RECOVERY SECURITY
-- =====================================================
PRINT '=== BACKUP & RECOVERY SECURITY ===';

-- Recent backup history with encryption status
SELECT TOP 100
    bs.database_name AS 'Database Name',
    bs.backup_start_date AS 'Backup Start Date',
    bs.backup_finish_date AS 'Backup Finish Date',
    bs.type AS 'Backup Type Code',
    CASE bs.type
        WHEN 'D' THEN 'Full Database'
        WHEN 'I' THEN 'Differential'
        WHEN 'L' THEN 'Transaction Log'
        WHEN 'F' THEN 'File or Filegroup'
        WHEN 'G' THEN 'Differential File'
        WHEN 'P' THEN 'Partial'
        WHEN 'Q' THEN 'Differential Partial'
        ELSE 'Unknown'
    END AS 'Backup Type',
    bs.backup_size / 1024 / 1024 AS 'Backup Size (MB)',
    bs.compressed_backup_size / 1024 / 1024 AS 'Compressed Size (MB)',
    bs.is_password_protected AS 'Password Protected',
    bs.is_encrypted AS 'Encrypted',
    bs.encryptor_type AS 'Encryptor Type',
    bs.encryptor_thumbprint AS 'Encryptor Thumbprint',
    bs.key_algorithm AS 'Key Algorithm',
    bs.is_copy_only AS 'Copy Only',
    bs.is_snapshot AS 'Snapshot',
    bs.is_readonly AS 'Read Only',
    bs.is_single_user AS 'Single User',
    bs.has_bulk_logged_data AS 'Has Bulk Logged Data',
    bs.is_damaged AS 'Is Damaged',
    bs.has_incomplete_metadata AS 'Has Incomplete Metadata',
    bs.is_force_offline AS 'Force Offline',
    bs.checkpoint_lsn AS 'Checkpoint LSN',
    bs.database_backup_lsn AS 'Database Backup LSN',
    bs.first_lsn AS 'First LSN',
    bs.last_lsn AS 'Last LSN',
    bs.fork_point_lsn AS 'Fork Point LSN',
    bs.recovery_model AS 'Recovery Model',
    bs.differential_base_lsn AS 'Differential Base LSN',
    bs.differential_base_guid AS 'Differential Base GUID',
    bs.compressed_backup_size AS 'Compressed Backup Size',
    bs.backup_start_date AS 'Backup Start Date',
    bs.backup_finish_date AS 'Backup Finish Date',
    bs.expiration_date AS 'Expiration Date',
    bs.software_name AS 'Software Name',
    bs.software_vendor_id AS 'Software Vendor ID',
    bs.software_version_major AS 'Software Version Major',
    bs.software_version_minor AS 'Software Version Minor',
    bs.software_version_build AS 'Software Version Build',
    bs.time_zone AS 'Time Zone',
    bs.mtf_family_id AS 'MTF Family ID',
    bs.first_family_number AS 'First Family Number',
    bs.last_family_number AS 'Last Family Number',
    bs.mirror_count AS 'Mirror Count',
    bs.media_count AS 'Media Count',
    bs.is_checksum AS 'Has Checksum',
    bs.checksum AS 'Checksum',
    bmf.physical_device_name AS 'Physical Device Name',
    bmf.device_type AS 'Device Type',
    CASE bmf.device_type
        WHEN 2 THEN 'Disk'
        WHEN 5 THEN 'Tape'
        WHEN 7 THEN 'Virtual Device'
        WHEN 9 THEN 'Azure Blob Storage'
        WHEN 105 THEN 'Backup Device'
        ELSE 'Unknown'
    END AS 'Device Type Description',
    CASE 
        WHEN bs.is_encrypted = 1 AND bs.key_algorithm = 'AES_256' THEN 'Strongly Encrypted'
        WHEN bs.is_encrypted = 1 AND bs.key_algorithm = 'AES_192' THEN 'Strongly Encrypted'
        WHEN bs.is_encrypted = 1 AND bs.key_algorithm = 'AES_128' THEN 'Moderately Encrypted'
        WHEN bs.is_encrypted = 1 THEN 'Encrypted (Unknown Algorithm)'
        WHEN bs.is_password_protected = 1 THEN 'Password Protected Only'
        ELSE 'NOT ENCRYPTED - RISK'
    END AS 'Security Status',
    CASE 
        WHEN bs.is_checksum = 1 THEN 'Checksum Verified'
        ELSE 'NO CHECKSUM - RISK'
    END AS 'Integrity Status'
FROM msdb.dbo.backupset bs
INNER JOIN msdb.dbo.backupmediafamily bmf ON bs.media_set_id = bmf.media_set_id
WHERE bs.backup_start_date >= DATEADD(DAY, -30, GETDATE())
ORDER BY bs.backup_start_date DESC;

-- Database restore history
SELECT TOP 50
    rh.restore_date AS 'Restore Date',
    rh.destination_database_name AS 'Database Name',
    rh.user_name AS 'User Name',
    rh.restore_type AS 'Restore Type',
    rh.replace AS 'Replace',
    rh.recovery AS 'Recovery',
    rh.restart AS 'Restart',
    rh.stop_at AS 'Stop At',
    rh.device_count AS 'Device Count',
    rh.stop_at_mark_name AS 'Stop At Mark Name',
    rh.stop_before AS 'Stop Before',
    bmf.physical_device_name AS 'Physical Device Name',
    bmf.device_type AS 'Device Type',
    CASE bmf.device_type
        WHEN 2 THEN 'Disk'
        WHEN 5 THEN 'Tape'
        WHEN 7 THEN 'Virtual Device'
        WHEN 9 THEN 'Azure Blob Storage'
        WHEN 105 THEN 'Backup Device'
        ELSE 'Unknown'
    END AS 'Device Type Description'
FROM msdb.dbo.restorehistory rh
INNER JOIN msdb.dbo.backupmediafamily bmf ON rh.media_set_id = bmf.media_set_id
ORDER BY rh.restore_date DESC;

-- Backup devices
SELECT 
    name AS 'Device Name',
    type AS 'Device Type',
    CASE type
        WHEN 2 THEN 'Disk'
        WHEN 5 THEN 'Tape'
        WHEN 7 THEN 'Virtual Device'
        WHEN 9 THEN 'Azure Blob Storage'
        ELSE 'Unknown'
    END AS 'Device Type Description',
    physical_name AS 'Physical Name',
    description AS 'Description',
    status AS 'Status',
    cntrltype AS 'Control Type',
    size AS 'Size'
FROM msdb.dbo.backupdevice
ORDER BY name;

-- =====================================================
-- SECTION 9: LINKED SERVERS & REMOTE CONNECTIONS
-- =====================================================
PRINT '=== LINKED SERVERS & REMOTE CONNECTIONS ===';

-- Linked servers
SELECT 
    server_id AS 'Server ID',
    name AS 'Server Name',
    product AS 'Product',
    provider AS 'Provider',
    data_source AS 'Data Source',
    location AS 'Location',
    provider_string AS 'Provider String',
    catalog AS 'Catalog',
    connect_timeout AS 'Connect Timeout',
    query_timeout AS 'Query Timeout',
    is_linked AS 'Is Linked',
    is_remote_login_enabled AS 'Remote Login Enabled',
    is_rpc_out_enabled AS 'RPC Out Enabled',
    is_data_access_enabled AS 'Data Access Enabled',
    is_collation_compatible AS 'Collation Compatible',
    uses_remote_collation AS 'Uses Remote Collation',
    collation_name AS 'Collation Name',
    lazy_schema_validation AS 'Lazy Schema Validation',
    is_system AS 'Is System',
    is_publisher AS 'Is Publisher',
    is_subscriber AS 'Is Subscriber',
    is_distributor AS 'Is Distributor',
    is_nonsql_subscriber AS 'Is Non-SQL Subscriber',
    is_remote_proc_transaction_promotion_enabled AS 'Remote Proc Transaction Promotion',
    modify_date AS 'Modified Date',
    CASE 
        WHEN is_rpc_out_enabled = 1 THEN 'RPC OUT ENABLED - RISK'
        ELSE 'RPC OUT DISABLED'
    END AS 'RPC Security Status',
    CASE 
        WHEN is_data_access_enabled = 1 THEN 'Data Access Enabled'
        ELSE 'Data Access Disabled'
    END AS 'Data Access Status'
FROM sys.servers
WHERE is_linked = 1
ORDER BY name;

-- Linked server logins
SELECT 
    ll.server_id AS 'Server ID',
    s.name AS 'Server Name',
    ll.local_principal_id AS 'Local Principal ID',
    CASE 
        WHEN ll.local_principal_id IS NULL THEN 'Default Mapping'
        ELSE SUSER_NAME(ll.local_principal_id)
    END AS 'Local Principal Name',
    ll.remote_name AS 'Remote Name',
    ll.uses_self_credential AS 'Uses Self Credential',
    ll.modify_date AS 'Modified Date',
    CASE 
        WHEN ll.uses_self_credential = 1 THEN 'Self Credential'
        WHEN ll.remote_name IS NULL THEN 'Default Login'
        ELSE 'Mapped Login'
    END AS 'Authentication Method',
    CASE 
        WHEN ll.local_principal_id IS NULL AND ll.remote_name IS NULL THEN 'HIGH RISK - Default Anonymous'
        WHEN ll.uses_self_credential = 1 THEN 'MEDIUM RISK - Self Credential'
        ELSE 'Standard Mapping'
    END AS 'Security Risk'
FROM sys.linked_logins ll
INNER JOIN sys.servers s ON ll.server_id = s.server_id
ORDER BY s.name, ll.local_principal_id;

-- External data sources (PolyBase)
SELECT 
    data_source_id AS 'Data Source ID',
    name AS 'Data Source Name',
    location AS 'Location',
    type_desc AS 'Type',
    type AS 'Type Code',
    connection_options AS 'Connection Options',
    credential_id AS 'Credential ID',
    database_name AS 'Database Name',
    shard_map_name AS 'Shard Map Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    CASE 
        WHEN credential_id IS NOT NULL THEN 'Uses Credential'
        ELSE 'NO CREDENTIAL - RISK'
    END AS 'Authentication Status'
FROM sys.external_data_sources
ORDER BY name;

-- External file formats
SELECT 
    file_format_id AS 'File Format ID',
    name AS 'File Format Name',
    format_type AS 'Format Type',
    field_terminator AS 'Field Terminator',
    string_delimiter AS 'String Delimiter',
    date_format AS 'Date Format',
    use_type_default AS 'Use Type Default',
    serde_method AS 'Serde Method',
    row_terminator AS 'Row Terminator',
    encoding AS 'Encoding',
    data_compression AS 'Data Compression',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date'
FROM sys.external_file_formats
ORDER BY name;

-- =====================================================
-- SECTION 10: AUDIT & MONITORING
-- =====================================================
PRINT '=== AUDIT & MONITORING ===';

-- Server audit specifications
SELECT 
    audit_id AS 'Audit ID',
    name AS 'Audit Name',
    audit_guid AS 'Audit GUID',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    type_desc AS 'Type',
    on_failure_desc AS 'On Failure',
    is_state_enabled AS 'State Enabled',
    queue_delay AS 'Queue Delay',
    predicate AS 'Predicate',
    audit_file_path AS 'Audit File Path',
    max_file_size AS 'Max File Size',
    max_rollover_files AS 'Max Rollover Files',
    max_files AS 'Max Files',
    reserve_disk_space AS 'Reserve Disk Space',
    CASE 
        WHEN is_state_enabled = 1 THEN 'Audit Enabled'
        ELSE 'AUDIT DISABLED - RISK'
    END AS 'Audit Status'
FROM sys.server_audits
ORDER BY name;

-- Server audit action groups
SELECT 
    audit_id AS 'Audit ID',
    audit_action_name AS 'Action Name',
    class_desc AS 'Class',
    covering_principal_name AS 'Covering Principal Name',
    principal_name AS 'Principal Name',
    schema_name AS 'Schema Name',
    target_name AS 'Target Name',
    is_group AS 'Is Group',
    audited_result AS 'Audited Result'
FROM sys.server_audit_specification_details
ORDER BY audit_id, audit_action_name;

-- Database audit specifications
SELECT 
    database_specification_id AS 'Database Specification ID',
    name AS 'Audit Specification Name',
    audit_id AS 'Audit ID',
    audit_name AS 'Audit Name',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    is_state_enabled AS 'State Enabled',
    CASE 
        WHEN is_state_enabled = 1 THEN 'Database Audit Enabled'
        ELSE 'DATABASE AUDIT DISABLED - RISK'
    END AS 'Database Audit Status'
FROM sys.database_audit_specifications
ORDER BY name;

-- Database audit action groups
SELECT 
    database_specification_id AS 'Database Specification ID',
    audit_action_id AS 'Audit Action ID',
    audit_action_name AS 'Action Name',
    class_desc AS 'Class',
    major_id AS 'Major ID',
    minor_id AS 'Minor ID',
    audited_principal_id AS 'Audited Principal ID',
    audited_result AS 'Audited Result',
    is_group AS 'Is Group'
FROM sys.database_audit_specification_details
ORDER BY database_specification_id, audit_action_name;

-- Extended Events sessions
SELECT 
    s.name AS 'Session Name',
    s.event_session_id AS 'Event Session ID',
    s.startup_state AS 'Startup State',
    s.is_running AS 'Is Running',
    s.create_time AS 'Create Time',
    s.dropped_event_count AS 'Dropped Event Count',
    s.dropped_buffer_count AS 'Dropped Buffer Count',
    s.blocked_event_fire_time AS 'Blocked Event Fire Time',
    s.create_time AS 'Create Time',
    s.total_regular_buffers AS 'Total Regular Buffers',
    s.regular_buffer_size AS 'Regular Buffer Size',
    s.total_large_buffers AS 'Total Large Buffers',
    s.large_buffer_size AS 'Large Buffer Size',
    CASE 
        WHEN s.is_running = 1 THEN 'Session Running'
        ELSE 'SESSION STOPPED - MONITORING GAP'
    END AS 'Session Status'
FROM sys.dm_xe_sessions s
ORDER BY s.name;

-- Trace flags
SELECT 
    traceflag AS 'Trace Flag',
    status AS 'Status',
    global AS 'Global',
    session AS 'Session'
FROM sys.dm_db_trace_flags
ORDER BY traceflag;

-- =====================================================
-- SECTION 11: SQL AGENT & JOBS SECURITY
-- =====================================================
PRINT '=== SQL AGENT & JOBS SECURITY ===';

-- SQL Agent jobs
SELECT 
    job_id AS 'Job ID',
    originating_server_id AS 'Originating Server ID',
    name AS 'Job Name',
    enabled AS 'Enabled',
    description AS 'Description',
    start_step_id AS 'Start Step ID',
    category_id AS 'Category ID',
    owner_sid AS 'Owner SID',
    SUSER_SNAME(owner_sid) AS 'Owner Name',
    notify_level_eventlog AS 'Notify Level Eventlog',
    notify_level_email AS 'Notify Level Email',
    notify_level_netsend AS 'Notify Level Netsend',
    notify_level_page AS 'Notify Level Page',
    notify_email_operator_id AS 'Notify Email Operator ID',
    notify_netsend_operator_id AS 'Notify Netsend Operator ID',
    notify_page_operator_id AS 'Notify Page Operator ID',
    delete_level AS 'Delete Level',
    date_created AS 'Date Created',
    date_modified AS 'Date Modified',
    version_number AS 'Version Number',
    CASE 
        WHEN SUSER_SNAME(owner_sid) = 'sa' THEN 'SA OWNED - RISK'
        WHEN SUSER_SNAME(owner_sid) IS NULL THEN 'ORPHANED JOB - RISK'
        ELSE 'Standard Ownership'
    END AS 'Ownership Status'
FROM msdb.dbo.sysjobs
ORDER BY date_modified DESC;

-- SQL Agent job steps
SELECT 
    j.name AS 'Job Name',
    js.step_id AS 'Step ID',
    js.step_name AS 'Step Name',
    js.subsystem AS 'Subsystem',
    js.command AS 'Command',
    js.additional_parameters AS 'Additional Parameters',
    js.cmdexec_success_code AS 'Cmdexec Success Code',
    js.on_success_action AS 'On Success Action',
    js.on_success_step_id AS 'On Success Step ID',
    js.on_fail_action AS 'On Fail Action',
    js.on_fail_step_id AS 'On Fail Step ID',
    js.server AS 'Server',
    js.database_name AS 'Database Name',
    js.database_user_name AS 'Database User Name',
    js.retry_attempts AS 'Retry Attempts',
    js.retry_interval AS 'Retry Interval',
    js.os_run_priority AS 'OS Run Priority',
    js.output_file_name AS 'Output File Name',
    js.flags AS 'Flags',
    js.proxy_id AS 'Proxy ID',
    p.name AS 'Proxy Name',
    p.credential_id AS 'Credential ID',
    p.user_sid AS 'Proxy User SID',
    SUSER_SNAME(p.user_sid) AS 'Proxy User Name',
    p.enabled AS 'Proxy Enabled',
    CASE 
        WHEN js.subsystem = 'CmdExec' THEN 'CMDEXEC - HIGH RISK'
        WHEN js.subsystem = 'PowerShell' THEN 'POWERSHELL - HIGH RISK'
        WHEN js.subsystem = 'ActiveScripting' THEN 'ACTIVESCRIPT - HIGH RISK'
        WHEN js.command LIKE '%xp_cmdshell%' THEN 'USES XP_CMDSHELL - HIGH RISK'
        WHEN js.command LIKE '%OPENROWSET%' THEN 'USES OPENROWSET - MEDIUM RISK'
        ELSE 'Standard Step'
    END AS 'Security Assessment'
FROM msdb.dbo.sysjobsteps js
INNER JOIN msdb.dbo.sysjobs j ON js.job_id = j.job_id
LEFT JOIN msdb.dbo.sysproxies p ON js.proxy_id = p.proxy_id
ORDER BY j.name, js.step_id;

-- SQL Agent proxies
SELECT 
    proxy_id AS 'Proxy ID',
    name AS 'Proxy Name',
    credential_id AS 'Credential ID',
    enabled AS 'Enabled',
    description AS 'Description',
    user_sid AS 'User SID',
    SUSER_SNAME(user_sid) AS 'User Name',
    credential_date_created AS 'Credential Date Created',
    credential_date_modified AS 'Credential Date Modified',
    CASE 
        WHEN enabled = 1 THEN 'Proxy Enabled'
        ELSE 'Proxy Disabled'
    END AS 'Proxy Status'
FROM msdb.dbo.sysproxies
ORDER BY name;

-- SQL Agent operators
SELECT 
    id AS 'Operator ID',
    name AS 'Operator Name',
    enabled AS 'Enabled',
    email_address AS 'Email Address',
    last_email_date AS 'Last Email Date',
    last_email_time AS 'Last Email Time',
    pager_address AS 'Pager Address',
    last_pager_date AS 'Last Pager Date',
    last_pager_time AS 'Last Pager Time',
    weekday_pager_start_time AS 'Weekday Pager Start Time',
    weekday_pager_end_time AS 'Weekday Pager End Time',
    saturday_pager_start_time AS 'Saturday Pager Start Time',
    saturday_pager_end_time AS 'Saturday Pager End Time',
    sunday_pager_start_time AS 'Sunday Pager Start Time',
    sunday_pager_end_time AS 'Sunday Pager End Time',
    pager_days AS 'Pager Days',
    netsend_address AS 'Netsend Address',
    last_netsend_date AS 'Last Netsend Date',
    last_netsend_time AS 'Last Netsend Time',
    category_id AS 'Category ID'
FROM msdb.dbo.sysoperators
ORDER BY name;

-- =====================================================
-- SECTION 12: REPLICATION & HADR SECURITY
-- =====================================================
PRINT '=== REPLICATION & HADR SECURITY ===';

-- Replication publications
SELECT 
    publication_id AS 'Publication ID',
    name AS 'Publication Name',
    description AS 'Description',
    task_id AS 'Task ID',
    database_id AS 'Database ID',
    DB_NAME(database_id) AS 'Database Name',
    is_updateable AS 'Is Updateable',
    is_sync_tran AS 'Is Sync Tran',
    is_snapshot AS 'Is Snapshot',
    has_subscription AS 'Has Subscription',
    snapshot_ready AS 'Snapshot Ready',
    enabled_for_internet AS 'Enabled For Internet',
    immediate_sync AS 'Immediate Sync',
    allow_push AS 'Allow Push',
    allow_pull AS 'Allow Pull',
    allow_anonymous AS 'Allow Anonymous',
    independent_agent AS 'Independent Agent',
    immediate_sync_ready AS 'Immediate Sync Ready',
    allow_sync_tran AS 'Allow Sync Tran',
    autogen_sync_procs AS 'Autogen Sync Procs',
    snapshot_in_defaultfolder AS 'Snapshot In Default Folder',
    alt_snapshot_folder AS 'Alt Snapshot Folder',
    pre_snapshot_script AS 'Pre Snapshot Script',
    post_snapshot_script AS 'Post Snapshot Script',
    compress_snapshot AS 'Compress Snapshot',
    ftp_address AS 'FTP Address',
    ftp_port AS 'FTP Port',
    ftp_subdirectory AS 'FTP Subdirectory',
    ftp_login AS 'FTP Login',
    allow_dts AS 'Allow DTS',
    allow_subscription_copy AS 'Allow Subscription Copy',
    centralized_conflicts AS 'Centralized Conflicts',
    conflict_policy AS 'Conflict Policy',
    conflict_retention AS 'Conflict Retention',
    queue_type AS 'Queue Type',
    ad_guidname AS 'AD Guidname',
    backward_comp_level AS 'Backward Comp Level',
    allow_initialize_from_backup AS 'Allow Initialize From Backup',
    min_autonosync_lsn AS 'Min Autonosync LSN',
    enabled_for_p2p AS 'Enabled For P2P',
    originator_id AS 'Originator ID',
    CASE 
        WHEN allow_anonymous = 1 THEN 'ANONYMOUS ACCESS - HIGH RISK'
        WHEN enabled_for_internet = 1 THEN 'INTERNET ENABLED - MEDIUM RISK'
        ELSE 'Standard Publication'
    END AS 'Security Assessment'
FROM sys.publications
ORDER BY name;

-- Replication subscriptions
SELECT 
    publication_id AS 'Publication ID',
    article_id AS 'Article ID',
    subscription_id AS 'Subscription ID',
    subscriber_id AS 'Subscriber ID',
    subscriber_db AS 'Subscriber Database',
    subscription_type AS 'Subscription Type',
    sync_type AS 'Sync Type',
    status AS 'Status',
    subscription_seqno AS 'Subscription Seqno',
    snapshot_seqno_flag AS 'Snapshot Seqno Flag',
    independent_agent AS 'Independent Agent',
    subscription_time AS 'Subscription Time',
    loopback_detection AS 'Loopback Detection',
    agent_id AS 'Agent ID',
    update_mode AS 'Update Mode',
    publisher_seqno AS 'Publisher Seqno',
    ss_cplt_seqno AS 'SS Cplt Seqno'
FROM sys.subscriptions
ORDER BY subscription_id;

-- Always On Availability Groups
SELECT 
    group_id AS 'Group ID',
    name AS 'Availability Group Name',
    resource_id AS 'Resource ID',
    resource_group_id AS 'Resource Group ID',
    failure_condition_level AS 'Failure Condition Level',
    health_check_timeout AS 'Health Check Timeout',
    automated_backup_preference_desc AS 'Automated Backup Preference',
    version AS 'Version',
    basic_features AS 'Basic Features',
    dtc_support AS 'DTC Support',
    db_failover AS 'DB Failover',
    is_distributed AS 'Is Distributed',
    cluster_type_desc AS 'Cluster Type',
    required_synchronized_secondaries_to_commit AS 'Required Synchronized Secondaries To Commit',
    sequence_number AS 'Sequence Number',
    is_contained AS 'Is Contained',
    CASE 
        WHEN automated_backup_preference_desc = 'PRIMARY' THEN 'Backup on Primary'
        WHEN automated_backup_preference_desc = 'SECONDARY_ONLY' THEN 'Backup on Secondary Only'
        WHEN automated_backup_preference_desc = 'SECONDARY' THEN 'Backup on Secondary Preferred'
        ELSE 'Default Backup Preference'
    END AS 'Backup Strategy'
FROM sys.availability_groups
ORDER BY name;

-- Always On Availability Group Listeners
SELECT 
    group_id AS 'Group ID',
    listener_id AS 'Listener ID',
    dns_name AS 'DNS Name',
    port AS 'Port',
    is_conformant AS 'Is Conformant',
    ip_configuration_string_from_cluster AS 'IP Configuration String From Cluster'
FROM sys.availability_group_listeners
ORDER BY dns_name;

-- Always On Database Replica States
SELECT 
    database_id AS 'Database ID',
    group_id AS 'Group ID',
    replica_id AS 'Replica ID',
    group_database_id AS 'Group Database ID',
    is_local AS 'Is Local',
    synchronization_state_desc AS 'Synchronization State',
    is_commit_participant AS 'Is Commit Participant',
    synchronization_health_desc AS 'Synchronization Health',
    database_state_desc AS 'Database State',
    is_suspended AS 'Is Suspended',
    suspend_reason_desc AS 'Suspend Reason',
    recovery_lsn AS 'Recovery LSN',
    truncation_lsn AS 'Truncation LSN',
    last_sent_lsn AS 'Last Sent LSN',
    last_sent_time AS 'Last Sent Time',
    last_received_lsn AS 'Last Received LSN',
    last_received_time AS 'Last Received Time',
    last_hardened_lsn AS 'Last Hardened LSN',
    last_hardened_time AS 'Last Hardened Time',
    last_redone_lsn AS 'Last Redone LSN',
    last_redone_time AS 'Last Redone Time',
    log_send_queue_size AS 'Log Send Queue Size',
    log_send_rate AS 'Log Send Rate',
    redo_queue_size AS 'Redo Queue Size',
    redo_rate AS 'Redo Rate',
    filestream_send_rate AS 'Filestream Send Rate',
    end_of_log_lsn AS 'End Of Log LSN',
    last_commit_lsn AS 'Last Commit LSN',
    last_commit_time AS 'Last Commit Time',
    low_water_mark_for_ghosts AS 'Low Water Mark For Ghosts',
    secondary_lag_seconds AS 'Secondary Lag Seconds',
    CASE 
        WHEN synchronization_health_desc = 'HEALTHY' THEN 'Healthy Replica'
        WHEN synchronization_health_desc = 'PARTIALLY_HEALTHY' THEN 'Partially Healthy Replica'
        WHEN synchronization_health_desc = 'NOT_HEALTHY' THEN 'UNHEALTHY REPLICA - RISK'
        ELSE 'Unknown Health State'
    END AS 'Health Assessment'
FROM sys.dm_hadr_database_replica_states
ORDER BY database_id, replica_id;

-- =====================================================
-- SECTION 13: PERFORMANCE & RESOURCE MONITORING
-- =====================================================
PRINT '=== PERFORMANCE & RESOURCE MONITORING ===';

-- Resource Governor configuration
SELECT 
    classifier_function_id AS 'Classifier Function ID',
    is_enabled AS 'Is Enabled',
    max_outstanding_io_per_volume AS 'Max Outstanding IO Per Volume',
    CASE 
        WHEN is_enabled = 1 THEN 'Resource Governor Enabled'
        ELSE 'Resource Governor Disabled'
    END AS 'Resource Governor Status'
FROM sys.resource_governor_configuration;

-- Resource Governor resource pools
SELECT 
    pool_id AS 'Pool ID',
    name AS 'Pool Name',
    min_cpu_percent AS 'Min CPU Percent',
    max_cpu_percent AS 'Max CPU Percent',
    min_memory_percent AS 'Min Memory Percent',
    max_memory_percent AS 'Max Memory Percent',
    cap_cpu_percent AS 'Cap CPU Percent',
    min_iops_per_volume AS 'Min IOPS Per Volume',
    max_iops_per_volume AS 'Max IOPS Per Volume',
    min_io_percent AS 'Min IO Percent',
    max_io_percent AS 'Max IO Percent'
FROM sys.resource_governor_resource_pools
ORDER BY pool_id;

-- Resource Governor workload groups
SELECT 
    group_id AS 'Group ID',
    name AS 'Group Name',
    importance AS 'Importance',
    request_max_memory_grant_percent AS 'Request Max Memory Grant Percent',
    request_max_cpu_time_sec AS 'Request Max CPU Time Sec',
    request_memory_grant_timeout_sec AS 'Request Memory Grant Timeout Sec',
    max_dop AS 'Max DOP',
    group_max_requests AS 'Group Max Requests',
    pool_id AS 'Pool ID'
FROM sys.resource_governor_workload_groups
ORDER BY group_id;

-- Query Store settings
SELECT 
    actual_state_desc AS 'Actual State',
    readonly_reason AS 'Readonly Reason',
    current_storage_size_mb AS 'Current Storage Size MB',
    flush_interval_seconds AS 'Flush Interval Seconds',
    interval_length_minutes AS 'Interval Length Minutes',
    max_storage_size_mb AS 'Max Storage Size MB',
    stale_query_threshold_days AS 'Stale Query Threshold Days',
    max_plans_per_query AS 'Max Plans Per Query',
    query_capture_mode_desc AS 'Query Capture Mode',
    capture_policy_execution_count AS 'Capture Policy Execution Count',
    capture_policy_total_compile_cpu_time_ms AS 'Capture Policy Total Compile CPU Time MS',
    capture_policy_total_execution_cpu_time_ms AS 'Capture Policy Total Execution CPU Time MS',
    capture_policy_stale_threshold_hours AS 'Capture Policy Stale Threshold Hours',
    size_based_cleanup_mode_desc AS 'Size Based Cleanup Mode',
    wait_stats_capture_mode_desc AS 'Wait Stats Capture Mode',
    CASE 
        WHEN actual_state_desc = 'READ_WRITE' THEN 'Query Store Active'
        WHEN actual_state_desc = 'READ_ONLY' THEN 'Query Store Read Only'
        WHEN actual_state_desc = 'OFF' THEN 'Query Store Disabled'
        ELSE 'Unknown State'
    END AS 'Query Store Status'
FROM sys.database_query_store_options
WHERE DB_ID() = database_id;

-- =====================================================
-- SECTION 14: SYSTEM INFORMATION & DIAGNOSTICS
-- =====================================================
PRINT '=== SYSTEM INFORMATION & DIAGNOSTICS ===';

-- System information
SELECT 
    cpu_count AS 'CPU Count',
    hyperthread_ratio AS 'Hyperthread Ratio',
    physical_memory_kb / 1024 AS 'Physical Memory MB',
    virtual_memory_kb / 1024 AS 'Virtual Memory MB',
    committed_kb / 1024 AS 'Committed Memory MB',
    committed_target_kb / 1024 AS 'Committed Target MB',
    visible_target_kb / 1024 AS 'Visible Target MB',
    stack_size_in_bytes AS 'Stack Size In Bytes',
    os_quantum AS 'OS Quantum',
    os_error_mode AS 'OS Error Mode',
    os_priority_class AS 'OS Priority Class',
    max_workers_count AS 'Max Workers Count',
    scheduler_count AS 'Scheduler Count',
    scheduler_total_count AS 'Scheduler Total Count',
    deadlock_monitor_serial_number AS 'Deadlock Monitor Serial Number',
    sqlserver_start_time_ms_ticks AS 'SQL Server Start Time MS Ticks',
    sqlserver_start_time AS 'SQL Server Start Time',
    affinity_type_desc AS 'Affinity Type',
    virtual_machine_type_desc AS 'Virtual Machine Type',
    softnuma_configuration_desc AS 'Soft NUMA Configuration',
    sql_memory_model_desc AS 'SQL Memory Model',
    process_kernel_time_ms AS 'Process Kernel Time MS',
    process_user_time_ms AS 'Process User Time MS',
    time_source_desc AS 'Time Source',
    available_commit_limit_kb / 1024 AS 'Available Commit Limit MB',
    process_physical_memory_low AS 'Process Physical Memory Low',
    process_virtual_memory_low AS 'Process Virtual Memory Low'
FROM sys.dm_os_sys_info;

-- Operating system information
SELECT 
    windows_release AS 'Windows Release',
    windows_service_pack_level AS 'Windows Service Pack Level',
    windows_sku AS 'Windows SKU',
    os_language_version AS 'OS Language Version'
FROM sys.dm_os_windows_info;

-- CLR assemblies
SELECT 
    assembly_id AS 'Assembly ID',
    name AS 'Assembly Name',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    assembly_class AS 'Assembly Class',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    is_visible AS 'Is Visible',
    clr_name AS 'CLR Name',
    permission_set_desc AS 'Permission Set',
    is_user_defined AS 'Is User Defined',
    CASE 
        WHEN permission_set_desc = 'SAFE' THEN 'Safe Permission Set'
        WHEN permission_set_desc = 'EXTERNAL_ACCESS' THEN 'External Access - MEDIUM RISK'
        WHEN permission_set_desc = 'UNSAFE' THEN 'UNSAFE PERMISSION SET - HIGH RISK'
        ELSE 'Unknown Permission Set'
    END AS 'Security Assessment'
FROM sys.assemblies
WHERE is_user_defined = 1
ORDER BY name;

-- Service Broker configuration
SELECT 
    name AS 'Service Name',
    service_id AS 'Service ID',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    service_queue_id AS 'Service Queue ID'
FROM sys.services
ORDER BY name;

-- Service Broker queues
SELECT 
    name AS 'Queue Name',
    object_id AS 'Object ID',
    principal_id AS 'Principal ID',
    USER_NAME(principal_id) AS 'Principal Name',
    schema_id AS 'Schema ID',
    SCHEMA_NAME(schema_id) AS 'Schema Name',
    parent_object_id AS 'Parent Object ID',
    type_desc AS 'Type',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    is_ms_shipped AS 'Is MS Shipped',
    is_published AS 'Is Published',
    is_schema_published AS 'Is Schema Published',
    max_readers AS 'Max Readers',
    activation_procedure AS 'Activation Procedure',
    execute_as_principal_id AS 'Execute As Principal ID',
    is_activation_enabled AS 'Is Activation Enabled',
    is_receive_enabled AS 'Is Receive Enabled',
    is_enqueue_enabled AS 'Is Enqueue Enabled',
    is_retention_enabled AS 'Is Retention Enabled',
    is_poison_message_handling_enabled AS 'Is Poison Message Handling Enabled'
FROM sys.service_queues
ORDER BY name;

-- Database scoped credentials
SELECT 
    credential_id AS 'Credential ID',
    name AS 'Credential Name',
    credential_identity AS 'Credential Identity',
    create_date AS 'Created Date',
    modify_date AS 'Modified Date',
    target_type AS 'Target Type',
    target_id AS 'Target ID'
FROM sys.database_scoped_credentials
ORDER BY name;

-- =====================================================
-- SECTION 15: COMPLIANCE & SECURITY BASELINE CHECKS
-- =====================================================
PRINT '=== COMPLIANCE & SECURITY BASELINE CHECKS ===';

-- CIS Benchmark compliance checks
SELECT 
    'CIS-2.1' AS 'Control ID',
    'Ad Hoc Distributed Queries' AS 'Control Name',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'Ad Hoc Distributed Queries') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END AS 'Status',
    'Ad Hoc Distributed Queries should be disabled' AS 'Description'
UNION ALL
SELECT 
    'CIS-2.2',
    'CLR Enabled',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'clr enabled') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - MONITOR' 
    END,
    'CLR should be disabled unless required'
UNION ALL
SELECT 
    'CIS-2.3',
    'Cross DB Ownership Chaining',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'cross db ownership chaining') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END,
    'Cross DB ownership chaining should be disabled'
UNION ALL
SELECT 
    'CIS-2.4',
    'Database Mail XPs',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'Database Mail XPs') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - MONITOR' 
    END,
    'Database Mail XPs should be disabled unless required'
UNION ALL
SELECT 
    'CIS-2.5',
    'Ole Automation Procedures',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'Ole Automation Procedures') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - HIGH RISK' 
    END,
    'Ole Automation Procedures should be disabled'
UNION ALL
SELECT 
    'CIS-2.6',
    'Remote Access',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'remote access') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END,
    'Remote access should be disabled'
UNION ALL
SELECT 
    'CIS-2.7',
    'Remote Admin Connections',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'remote admin connections') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - MONITOR' 
    END,
    'Remote admin connections should be disabled unless required'
UNION ALL
SELECT 
    'CIS-2.8',
    'Scan For Startup Procs',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'scan for startup procs') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - MONITOR' 
    END,
    'Scan for startup procs should be disabled'
UNION ALL
SELECT 
    'CIS-2.9',
    'Trustworthy Database Property',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.databases WHERE is_trustworthy_on = 1 AND name != 'msdb') 
        THEN 'NON-COMPLIANT - HIGH RISK' 
        ELSE 'COMPLIANT' 
    END,
    'Trustworthy database property should be disabled'
UNION ALL
SELECT 
    'CIS-2.10',
    'SQL Server Browser Service',
    'MANUAL CHECK REQUIRED',
    'SQL Server Browser Service should be disabled if not required'
UNION ALL
SELECT 
    'CIS-2.11',
    'SQL Server Agent Service',
    'MANUAL CHECK REQUIRED',
    'SQL Server Agent Service should run under dedicated account'
UNION ALL
SELECT 
    'CIS-2.12',
    'SQL Server Service',
    'MANUAL CHECK REQUIRED',
    'SQL Server Service should run under dedicated account'
UNION ALL
SELECT 
    'CIS-2.13',
    'xp_cmdshell',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'xp_cmdshell') = 0 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - CRITICAL RISK' 
    END,
    'xp_cmdshell should be disabled'
UNION ALL
SELECT 
    'CIS-3.1',
    'Server Authentication',
    CASE 
        WHEN SERVERPROPERTY('IsIntegratedSecurityOnly') = 1 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END,
    'Server authentication should be Windows Authentication mode'
UNION ALL
SELECT 
    'CIS-3.2',
    'Guest User Access',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.database_permissions dp 
                    INNER JOIN sys.database_principals pr ON dp.grantee_principal_id = pr.principal_id 
                    WHERE pr.name = 'guest' AND dp.permission_name = 'CONNECT' AND dp.state_desc = 'GRANT') 
        THEN 'NON-COMPLIANT - RISK' 
        ELSE 'COMPLIANT' 
    END,
    'Guest user should not have CONNECT permission'
UNION ALL
SELECT 
    'CIS-3.3',
    'Orphaned Users',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.database_principals dp 
                    WHERE dp.type IN ('S', 'U') AND dp.sid IS NOT NULL 
                    AND SUSER_SNAME(dp.sid) IS NULL 
                    AND dp.name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys')) 
        THEN 'NON-COMPLIANT - RISK' 
        ELSE 'COMPLIANT' 
    END,
    'Orphaned users should be removed'
UNION ALL
SELECT 
    'CIS-3.4',
    'SQL Authentication Users',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.database_principals 
                    WHERE type = 'S' AND authentication_type_desc = 'DATABASE') 
        THEN 'NON-COMPLIANT - MONITOR' 
        ELSE 'COMPLIANT' 
    END,
    'SQL Authentication users should be reviewed'
UNION ALL
SELECT 
    'CIS-4.1',
    'Symmetric Keys Encryption',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.symmetric_keys 
                    WHERE algorithm_desc NOT IN ('AES_128', 'AES_192', 'AES_256')) 
        THEN 'NON-COMPLIANT - RISK' 
        ELSE 'COMPLIANT' 
    END,
    'Symmetric keys should use strong encryption'
UNION ALL
SELECT 
    'CIS-4.2',
    'Asymmetric Keys Strength',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.asymmetric_keys WHERE key_length < 2048) 
        THEN 'NON-COMPLIANT - RISK' 
        ELSE 'COMPLIANT' 
    END,
    'Asymmetric keys should be at least 2048 bits'
UNION ALL
SELECT 
    'CIS-4.3',
    'Certificate Expiration',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.certificates 
                    WHERE expiry_date < DATEADD(DAY, 90, GETDATE())) 
        THEN 'NON-COMPLIANT - RISK' 
        ELSE 'COMPLIANT' 
    END,
    'Certificates should not expire within 90 days'
UNION ALL
SELECT 
    'CIS-5.1',
    'Default Trace Enabled',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'default trace enabled') = 1 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END,
    'Default trace should be enabled'
UNION ALL
SELECT 
    'CIS-5.2',
    'Login Auditing',
    'MANUAL CHECK REQUIRED',
    'Login auditing should be configured'
UNION ALL
SELECT 
    'CIS-5.3',
    'SQL Server Audit',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.server_audits WHERE is_state_enabled = 1) 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END,
    'SQL Server Audit should be enabled'
UNION ALL
SELECT 
    'CIS-6.1',
    'CLR Assemblies',
    CASE 
        WHEN EXISTS (SELECT 1 FROM sys.assemblies 
                    WHERE is_user_defined = 1 AND permission_set_desc IN ('EXTERNAL_ACCESS', 'UNSAFE')) 
        THEN 'NON-COMPLIANT - RISK' 
        ELSE 'COMPLIANT' 
    END,
    'CLR assemblies should use SAFE permission set'
UNION ALL
SELECT 
    'CIS-6.2',
    'CLR Strict Security',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'clr strict security') = 1 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END,
    'CLR strict security should be enabled'
UNION ALL
SELECT 
    'CIS-7.1',
    'Backup Encryption',
    CASE 
        WHEN EXISTS (SELECT 1 FROM msdb.dbo.backupset 
                    WHERE backup_start_date >= DATEADD(DAY, -7, GETDATE()) 
                    AND is_encrypted = 0) 
        THEN 'NON-COMPLIANT - RISK' 
        ELSE 'COMPLIANT' 
    END,
    'Recent backups should be encrypted'
UNION ALL
SELECT 
    'CIS-7.2',
    'Backup Checksum',
    CASE 
        WHEN (SELECT value_in_use FROM sys.configurations WHERE name = 'backup checksum default') = 1 
        THEN 'COMPLIANT' 
        ELSE 'NON-COMPLIANT - RISK' 
    END,
    'Backup checksum should be enabled by default';

-- Security summary report
SELECT 
    'HIGH RISK FINDINGS' AS 'Risk Level',
    COUNT(*) AS 'Count'
FROM (
    SELECT 'xp_cmdshell Enabled' AS Finding 
    WHERE (SELECT value_in_use FROM sys.configurations WHERE name = 'xp_cmdshell') = 1
    UNION ALL
    SELECT 'Ole Automation Procedures Enabled' 
    WHERE (SELECT value_in_use FROM sys.configurations WHERE name = 'Ole Automation Procedures') = 1
    UNION ALL
    SELECT 'Trustworthy Database Found' 
    WHERE EXISTS (SELECT 1 FROM sys.databases WHERE is_trustworthy_on = 1 AND name != 'msdb')
    UNION ALL
    SELECT 'Orphaned Users Found' 
    WHERE EXISTS (SELECT 1 FROM sys.database_principals dp 
                 WHERE dp.type IN ('S', 'U') AND dp.sid IS NOT NULL 
                 AND SUSER_SNAME(dp.sid) IS NULL 
                 AND dp.name NOT IN ('dbo', 'guest', 'INFORMATION_SCHEMA', 'sys'))
    UNION ALL
    SELECT 'Unsafe CLR Assemblies Found' 
    WHERE EXISTS (SELECT 1 FROM sys.assemblies 
                 WHERE is_user_defined = 1 AND permission_set_desc = 'UNSAFE')
    UNION ALL
    SELECT 'Expired Certificates Found' 
    WHERE EXISTS (SELECT 1 FROM sys.certificates WHERE expiry_date < GETDATE())
    UNION ALL
    SELECT 'Unencrypted Backups Found' 
    WHERE EXISTS (SELECT 1 FROM msdb.dbo.backupset 
                 WHERE backup_start_date >= DATEADD(DAY, -7, GETDATE()) 
                 AND is_encrypted = 0)
    UNION ALL
    SELECT 'Sysadmin Role Members' 
    WHERE EXISTS (SELECT 1 FROM sys.server_role_members rm 
                 INNER JOIN sys.server_principals r ON rm.role_principal_id = r.principal_id 
                 WHERE r.name = 'sysadmin')
) findings
UNION ALL
SELECT 
    'MEDIUM RISK FINDINGS',
    COUNT(*)
FROM (
    SELECT 'CLR Enabled' AS Finding 
    WHERE (SELECT value_in_use FROM sys.configurations WHERE name = 'clr enabled') = 1
    UNION ALL
    SELECT 'Mixed Mode Authentication' 
    WHERE SERVERPROPERTY('IsIntegratedSecurityOnly') = 0
    UNION ALL
    SELECT 'External Access CLR Assemblies' 
    WHERE EXISTS (SELECT 1 FROM sys.assemblies 
                 WHERE is_user_defined = 1 AND permission_set_desc = 'EXTERNAL_ACCESS')
    UNION ALL
    SELECT 'Certificates Expiring Soon' 
    WHERE EXISTS (SELECT 1 FROM sys.certificates 
                 WHERE expiry_date < DATEADD(DAY, 90, GETDATE()) 
                 AND expiry_date >= GETDATE())
    UNION ALL
    SELECT 'Linked Servers with RPC OUT' 
    WHERE EXISTS (SELECT 1 FROM sys.servers WHERE is_rpc_out_enabled = 1)
) findings
UNION ALL
SELECT 
    'COMPLIANCE GAPS',
    COUNT(*)
FROM (
    SELECT 'No SQL Server Audit' AS Finding 
    WHERE NOT EXISTS (SELECT 1 FROM sys.server_audits WHERE is_state_enabled = 1)
    UNION ALL
    SELECT 'Default Trace Disabled' 
    WHERE (SELECT value_in_use FROM sys.configurations WHERE name = 'default trace enabled') = 0
    UNION ALL
    SELECT 'Backup Checksum Disabled' 
    WHERE (SELECT value_in_use FROM sys.configurations WHERE name = 'backup checksum default') = 0
    UNION ALL
    SELECT 'CLR Strict Security Disabled' 
    WHERE (SELECT value_in_use FROM sys.configurations WHERE name = 'clr strict security') = 0
) findings;

-- Final summary
PRINT '=== SECURITY AUDIT SUMMARY ===';
PRINT 'Security audit extraction completed successfully.';
PRINT 'Review all findings for compliance and security posture assessment.';
PRINT 'Pay special attention to HIGH RISK findings and address immediately.';
PRINT 'Implement monitoring for MEDIUM RISK findings.';
PRINT 'Address COMPLIANCE GAPS to meet regulatory requirements.';
PRINT 'Run this script periodically to maintain security baseline.';

-- End of script
PRINT '=== END OF SECURITY AUDIT SCRIPT ===';
