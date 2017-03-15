
public class Time {
	public static final int MAX_HOUR = 24;
	public static final int MAX_MIN = 60; 
	public static final int MAX_SEC = 60; 
	
	private int hour, min, sec;

//Constructors
	public Time(int hour, int min) {
		if ( valid_time(hour, min) ) {
			this.hour = hour;
			this.min = min;
			this.sec = 0;
		}
	}
	
	public Time(int hour, int min, int sec) {
		if ( valid_time(hour, min, sec) ) {
			this.hour = hour;
			this.min = min;
			this.sec = sec;
		}
	}
	
//String output methods
	public String toString_hourAndMinOnly() {
		return ( (hour<10)? ("0"+hour): hour ) 
				+ ":" 
				+ ( (min<10)? ("0"+min): min );
	}
	
	public String toString_All() {
		return toString_hourAndMinOnly()
				+ ( (sec<10)? ("0"+sec): sec );
	}
	
//time validation methods	
	private boolean valid_time(int hour, int min) {
		return ( (hour >= 0) && (hour < MAX_HOUR) &&
				 (min >= 0) && (min < MAX_MIN) );
	}
	
	private boolean valid_time(int hour, int min, int sec) {
		return ( valid_time(hour, min) &&
				 (sec >= 0) && (sec < MAX_SEC) );
	}
	
	
}
