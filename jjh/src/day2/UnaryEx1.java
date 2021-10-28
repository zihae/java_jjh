package day2;

public class UnaryEx1 {
	

	public static void main(String[] args) {
		int num1 =10, num2 = 10;
		System.out.println("증가 전: num1 = " + num1 + ", num2 = " + num2 );
		//num1은 전위형 증가연산자를 이용, num2는 후위형 증가연산자를 이용
		System.out.println("증가 중: num1 = " + num1 + ", num2 = " + num2++ );
		System.out.println("증가 후: num1 = " + num1 + ", num2 = " + num2 );
		
		++num1; // 13번째줄 코드와 같은 코드들num1++, num1 = num1 + 1, num1 += 1
		//num2를 1순 증가
		num2++;
		//
		System.out.println("증가 후2: num1 =" + num1 + ", num2 = " + num2);
	}

}
