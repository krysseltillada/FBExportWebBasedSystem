package com.fb.exportorder.utilities;



public class Time {
	public static long convertTimeToMilliseconds(int hour, int min, int sec) {
		long hoursToMill = hour * 60 * 60 * 1000;
		long minutesToMill = min * 60 * 1000;
		long secondsToMill = sec * 1000;
		
		long mill = hoursToMill + minutesToMill + secondsToMill;
		
		return mill;
	}
}
