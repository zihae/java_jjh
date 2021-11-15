package day14;

public class ExaStringEx2 {

	public static void main(String[] args) {
		/* 5명의 이름을 저장하고, 저장된 이름 중 홍길동이 있는지 확인하세요 */
		String names [] = new String [5];
		names[0] = "장지혜";
		names[1] = "홍길동";
		names[2] = "홍길동이";
		names[3] = "김홍길동";
		names[4] = "장미소";
		/* indexOf : 이용 가능하나 추가 작업이 필요
		 * contains: 이용 가능하나 추가 작업이 필요
		 * startsWith, endsWith : 이용 가능하나 추가 작업이 필요
		 * equals : 이용 가능
		 */
		
		//eqals
		int count = 0;
		String search = "홍길동";
		for(String name: names) {
			if(name.equals(search)) {
				count++;
			}
		}
		if(count != 0) {
			System.out.println(search + "는 " + count + "명 있습니다.");
		}else {
			System.out.println(search + "는 없습니다.");
		}
		
		//indexOf
		count = 0;
		for(String name: names) {
			if(name.indexOf(search) == 0 && name.length() == search.length()) {
				count++;
			}
		}
		if(count != 0) {
			System.out.println(search + "는 " + count + "명 있습니다.");
		}else {
			System.out.println(search + "는 없습니다.");
		}
		
		
		//startsWith, endsWith
		count = 0;
		for(String name: names) {
			if(name.startsWith(search) && name.length() == search.length()) {
				count++;
			}
		}
		if(count != 0) {
			System.out.println(search + "는 " + count + "명 있습니다.");
		}else {
			System.out.println(search + "는 없습니다.");
		}
		
		//contains
				count = 0;
				for(String name: names) {
					if(name.contains(search) && name.length() == search.length()) {
						count++;
					}
				}
				if(count != 0) {
					System.out.println(search + "는 " + count + "명 있습니다.");
				}else {
					System.out.println(search + "는 없습니다.");
				}
		
	}

}
