package chap03;

import java.util.Calendar;

import sun.util.resources.CalendarData;

public class MemberDTO {
	private String name;	// 성명
	private String jubun;	// 주민번호
	
	public MemberDTO() {}	// 기본생성자
	
	
	public MemberDTO(String name, String jubun) {	// 파라미터를 통한 생성자
		this.name = name;
		this.jubun = jubun;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getJubun() {
		return jubun;
	}
	public void setJubun(String jubun) {
		this.jubun = jubun;
	}
	
	//////////////////////////////////////////////////
	
	// 1. 성별을 알아오는 메소드 생성하기
	public String getGender() {
		if(jubun != null) {
			String n = jubun.substring(6,7); // "9703081234567" 에서 성별을 나타내어 주는 "1" 을 가져온다.
			if("1".equals(n) || "3".equals(n)) {
				return "남자";
			}
			else if("2".equals(n) || "4".equals(n)) {
				return "여자";
			}
			else {
				return "";
			}
		}
		
		else {
			return "";
		}
	}// end of public String getGender() -----------------
	
	// 2. 나이를 알아오는 메소드 생성하기
	public int getAge() {
		// 먼저 현재년도를 알아와야 한다.
		Calendar now = Calendar.getInstance();
		int currentYear = now.get(Calendar.YEAR);
		
		if(jubun != null) {
			String n = jubun.substring(6,7); // "1" 또는 "2" 라면 1900 년대생,
											 // "3" 또는 "4" 라면 2000 년대생,
			// 주민번호에서 출생년도 2자리를 가져온다.
			String jubunYear = jubun.substring(0,2);
			
			if("1".equals(n) || "2".equals(n)) {
				return currentYear - (1900 + Integer.parseInt(jubunYear)) + 1;
			}
			else if("3".equals(n) || "4".equals(n)) {
				return currentYear - (2000 + Integer.parseInt(jubunYear)) + 1;
			}
			else {
				return 0;
			}
		}
		else {
			return 0;
		}
		
		
	}// end of public int getAge()-------------------
}
