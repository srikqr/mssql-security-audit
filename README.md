# 🛡️ SQL Server 2022 Security Audit Script

A comprehensive, single-file security audit script for Microsoft SQL Server 2022 - All Editions.

**Created by:** srikqr (from scratch)

## 📋 Overview

This script performs a complete A-Z security extraction and analysis of your SQL Server 2022 instance, covering 15+ critical security domains including authentication, encryption, configuration, permissions, and compliance checks.

## 🚀 Quick Start

### Basic Usage
```cmd
sqlcmd -S <server_name> -d <database_name> -i sql_server_security_audit.sql -o audit_report.txt
```

### With Windows Authentication
```cmd
sqlcmd -S localhost -E -i sql_server_security_audit.sql -o security_audit_$(date +%F).txt
```

### With SQL Server Authentication
```cmd
sqlcmd -S <server_name> -U <username> -P <password> -i sql_server_security_audit.sql -o audit_results.txt
```

## 💻 Usage Examples

### Local Instance Audit
```cmd
sqlcmd -S localhost -E -i sql_server_security_audit.sql -o local_audit.txt
```

### Remote Server Audit
```cmd
sqlcmd -S server.domain.com -U sa -P YourPassword -i sql_server_security_audit.sql -o remote_audit.txt
```

### Named Instance Audit
```cmd
sqlcmd -S SERVER\INSTANCE -E -i sql_server_security_audit.sql -o instance_audit.txt
```

### Audit with Custom Port
```cmd
sqlcmd -S server.domain.com,1433 -U username -P password -i sql_server_security_audit.sql -o port_audit.txt
```

### Silent Mode (No Interactive Prompts)
```cmd
sqlcmd -S localhost -E -i sql_server_security_audit.sql -o silent_audit.txt -b
```

### Query Results in CSV Format
```cmd
sqlcmd -S localhost -E -i sql_server_security_audit.sql -o audit_results.csv -s "," -W
```

## 🔧 Command Options Explained

| Option | Description | Example |
|--------|-------------|---------|
| `-S` | Server name or IP address | `-S localhost` or `-S 192.168.1.100` |
| `-d` | Database name | `-d master` |
| `-E` | Use Windows Authentication | `-E` |
| `-U` | SQL Server username | `-U sa` |
| `-P` | SQL Server password | `-P MyPassword` |
| `-i` | Input SQL file | `-i security_audit.sql` |
| `-o` | Output file | `-o results.txt` |
| `-s` | Column separator for CSV | `-s ","` |
| `-W` | Remove trailing spaces | `-W` |
| `-b` | Exit on error | `-b` |
| `-t` | Query timeout in seconds | `-t 300` |

## 📊 What Gets Audited

✅ **Server & Instance Information**
✅ **Configuration & Security Settings**  
✅ **Authentication & Authorization**
✅ **Schema & Object Metadata**
✅ **Encryption & Security Features**
✅ **SQL Server 2022 Specific Features**
✅ **Network & Connection Security**
✅ **Backup & Recovery Security**
✅ **Linked Servers & Remote Connections**
✅ **Audit & Monitoring Configuration**
✅ **SQL Agent & Jobs Security**
✅ **Replication & HADR Security**
✅ **Performance & Resource Monitoring**
✅ **System Information & Diagnostics**
✅ **Compliance & Security Baseline Checks**

## 🔒 Security Best Practices

### Before Running
- Run during maintenance windows for production systems
- Ensure you have appropriate permissions (sysadmin recommended)
- Test on development environment first
- Review firewall and network access

### Output Security
- Store audit files in secure locations
- Encrypt sensitive audit reports
- Limit access to audit results
- Set up regular audit schedules

## 📅 Scheduled Audits

### Windows Task Scheduler
```cmd
schtasks /create /tn "SQL Security Audit" /tr "sqlcmd -S localhost -E -i C:\Scripts\security_audit.sql -o C:\Audits\audit_%date%.txt" /sc weekly /d MON /st 02:00
```

### SQL Server Agent Job
```sql
-- Create a SQL Server Agent job to run the audit script weekly
EXEC dbo.sp_add_job @job_name = N'Weekly Security Audit';
EXEC dbo.sp_add_jobstep @job_name = N'Weekly Security Audit', 
    @step_name = N'Run Security Audit', 
    @command = N'sqlcmd -S localhost -E -i "C:\Scripts\security_audit.sql" -o "C:\Audits\audit.txt"';
```

## 🛠️ Troubleshooting

### Common Issues

**Permission Denied:**
```cmd
-- Run as administrator or use account with sysadmin rights
sqlcmd -S localhost -E -i security_audit.sql -o audit.txt
```

**Connection Failed:**
```cmd
-- Check SQL Server service and enable TCP/IP protocol
sqlcmd -S localhost,1433 -E -i security_audit.sql -o audit.txt
```

**Timeout Errors:**
```cmd
-- Increase query timeout for large databases
sqlcmd -S localhost -E -i security_audit.sql -o audit.txt -t 600
```

## 📈 Output Analysis

The script generates structured output with:
- **CRITICAL** findings requiring immediate attention
- **HIGH RISK** items needing prompt action  
- **MEDIUM RISK** items for monitoring
- **COMPLIANT** items meeting security standards

Look for sections marked with:
- `HIGH RISK` - Address immediately
- `NON-COMPLIANT` - Fix for compliance
- `EXPIRED` - Update certificates/passwords
- `DISABLED` - Enable security features

## 📄 License

Created by **srikqr** - Free to use and modify.

## 🤝 Support

- Review SQL Server documentation for configuration details
- Test thoroughly in non-production environments
- Backup databases before making security changes
- Monitor system performance after implementing recommendations

---

**⚠️ Important:** Always test security changes in development environments before applying to production systems.
