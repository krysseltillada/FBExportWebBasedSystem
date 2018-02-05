package com.fb.exportorder.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class SystemSettings {

	@Id
	private Long systemSettingsId;
	
	@Temporal(TemporalType.TIME)
	private Date logoutTime;
	
	@Temporal(TemporalType.TIME)
	private Date systemBackupTime;
	
}
