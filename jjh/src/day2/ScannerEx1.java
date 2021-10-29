package day2;

import java.util.Scanner;

public class ScannerEx1 {

	public static void main(String[] args) {
		//콘솔에서 입력 받을 수 있게 Scanner를 생성. 생성된 Scanner의 이름은 scan
		Scanner scan = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 : ");
		int num1 = scan.nextInt();
		System.out.println("입력된 정수는 " + num1 + " 입니다.");
		
		System.out.print("실수를 입력하세요 : ");
		double num2 = scan.nextDouble();
		System.out.println("입력된 실수는 " + num2 + " 입니다.");
		
		System.out.print("문자를 입력하세요 : ");
		char ch1 = scan.next().charAt(0);
		System.out.println("입력된 문자는 " + ch1 + " 입니다.");
		
		//next() : 공백을 제외한 한 단어를 읽어옴.
		System.out.print("단어를 입력하세요 : ");
		String str1 = scan.next();
		System.out.println("입력된 단어는 " + str1 + " 입니다.");
		
		scan.nextLine();
		
		//nextLine() : 공백을 포함한 한 라인을 읽어옴.
		System.out.print("문장을 입력하세요 : ");
		String str2 = scan.nextLine();
		System.out.println("입력된 문장은 " + str2 + " 입니다.");
		
		//더이상 콘솔에서 입력 받을 내용이 없으면 Scanner 사용을 종료
		scan.close();
	}

}