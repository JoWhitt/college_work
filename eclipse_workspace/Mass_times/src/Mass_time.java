import java.util.ArrayList;

public class Mass_time {
	int hour, min; 					//24hr time
	ArrayList<String> parishes;		//parishes with mass at this time
	
	public Mass_time(int hour, int minute) {
		this.hour = hour;
		this.min = minute;
		this.parishes = new ArrayList<String>();
	}
	
	public void add_parish(String parish) {		
		if (!parishes.contains(parish))
			parishes.add(parish);
	}
	
	public void remove_parish(String parish) {
		parishes.remove(parish);
	}
	
	public void sort_parishes_alphabetically() {
		parishes.sort(null); //TODO: will this work correctly for ordering strings?
	}
	
//GET METHODS
	public String get_parishes_Str() {
		String output = hour+":"+min+"\n";
		
		for(int i=0; i<parishes.size(); i++)
			output += "	"+parishes.get(i) + "\n";
		
		return output;
	}
	
	public ArrayList<String> get_parishes_ArrayList() {
		return parishes;
	}
}
