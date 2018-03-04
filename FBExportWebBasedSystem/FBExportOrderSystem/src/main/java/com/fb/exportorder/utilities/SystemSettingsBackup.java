package com.fb.exportorder.utilities;

import java.io.File;
import java.nio.file.FileSystems;

public class SystemSettingsBackup {
	private final String file = FileSystems.getDefault().getPath("src\\main\\webapp\\system-backup") + File.separator + "fbexport_backup.sql";
	
	public String backupData(String dbname) {
		
		Process p = null;
        try {
            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec("mysqldump -u root --add-drop-database -B "+dbname+" -r " + file);
            
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
		String[] restoreCmd = new String[]{"mysql ", "--user=root", "-e", "source " + file};
		 
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
