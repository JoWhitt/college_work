import java.util.ArrayList;

public class Mass_day {
	public static final String DAYS_OF_THE_WEEK[] = { "Monday", "Tuesday",
			"Wednesday", "Thursday", "Friday", "Saturday", "Sunday" };
	public static final String SPECIAL_DAYS[] = { "Holy_days", "Bank_holidays", "Lent" };
	
	String day;
	ArrayList<Mass_time> times;
	
	public Mass_day(String day) {
		//confirm validity of day
		boolean valid_day = false;
		for (int i=0; i<DAYS_OF_THE_WEEK.length && !valid_day; i++)
			valid_day = day == DAYS_OF_THE_WEEK[i];
		for (int i=0; i<SPECIAL_DAYS.length && !valid_day; i++)
			valid_day = day == SPECIAL_DAYS[i];
		if (valid_day)
			this.day = day;
		//TODO: else? throw an exception? return -1 somehow?
				
		times = new ArrayList<Mass_time>(); 
	}
}
