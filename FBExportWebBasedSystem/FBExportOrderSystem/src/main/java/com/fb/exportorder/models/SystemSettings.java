package com.fb.exportorder.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class SystemSettings {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long systemSettingsId;
	
	@Column(name="logout_time", columnDefinition="TIME DEFAULT '00:03:00'")
	@Temporal(TemporalType.TIME)
	private Date logoutTime;
	
	@Column(name="system_backup_time", columnDefinition="TIME DEFAULT '00:00:00'")
	@Temporal(TemporalType.TIME)
	private Date systemBackupTime;

	public Long getSystemSettingsId() {
		return systemSettingsId;
	}

	public void setSystemSettingsId(Long systemSettingsId) {
		this.systemSettingsId = systemSettingsId;
	}

	public Date getLogoutTime() {
		return logoutTime;
	}

	public void setLogoutTime(Date logoutTime) {
		this.logoutTime = logoutTime;
	}

	public Date getSystemBackupTime() {
		return systemBackupTime;
	}

	public void setSystemBackupTime(Date systemBackupTime) {
		this.systemBackupTime = systemBackupTime;
	}
	
	
}
