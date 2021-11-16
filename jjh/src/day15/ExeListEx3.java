package day15;

import java.util.*;


public class ExeListEx3 {

	public static void main(String[] args) {
		/* 오늘의 할 일을 5개 입력받아 출력하는 코드를 작성하세요. 단, 리스트를 이용
		 * 방법1. 오늘의 할 일을 String으로 관리하는 방법
		 * 방법2. 오늘의 할 일을 ToDo로 관리하는 방법*/
		
		//방법1.
		ArrayList<String> todoList1 = new ArrayList<String>();
		Scanner scan = new Scanner(System.in);
		for(int i=0; i<5; i++) {
			System.out.print("오늘의 할 일: ");
			//String tmp = scan.nextLine();
			//todoList1.add(tmp);	
			//-> 위 두 줄을 아래 한 줄로 실행 가능 
			todoList1.add(scan.nextLine());
		}
			
		System.out.println(todoList1);
		scan.close();
	}

}
