package com.fb.exportorder.utilities;

import java.io.File;
import java.nio.file.FileSystems;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
public class SystemSettingsBackup {
	
	@Value("${fbexport.database.mysql.bin.path}")
	private String mysqlBinPath;
	
	private final String file = FileSystems.getDefault().getPath("src\\main\\webapp\\system-backup") + File.separator + "fbexport_backup.sql";
	
	public String backupData(String dbname) {
		
		Process p = null;
        try {
        	
        	System.out.println(mysqlBinPath);
        	
        	
            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec(mysqlBinPath + "mysqldump -u root --add-drop-database -B "+dbname+" -r " + file);
            
            //change the dbpass and dbname with your dbpass and dbname
            int processComplete = p.waitFor();

            if (processComplete == 0)
                return "Success";
            else
            	return "Could not create the backup";

        } catch (Exception e) {
            return e.getMessage();
        }
	}
	
	public String restoreData() {
		String[] restoreCmd = new String[]{mysqlBinPath + "mysql ", "--user=root", "-e", "source " + file};
		 
        Process runtimeProcess;
        try {
 
            runtimeProcess = Runtime.getRuntime().exec(restoreCmd);
            int processComplete = runtimeProcess.waitFor();
 
            if (processComplete == 0)
                return "Success";
            else 
                return "Could not restore the backup!";
        } catch (Exception ex) {
            return ex.getMessage();
        }
	}
}
