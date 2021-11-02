package day5;

public class WhileMultipleTableEx1 {

	public static void main(String[] args) {
		/* while문을 이용하여 구구단 7단을 출력하는 코드를 작성하세요.
		 * a는 1부터 시작함 int a = 1;
		 * a가 9 이하일때까지 a <= 9
		 * a를 1씩 증가 a++;
		 * 반복횟수: a는 1부터 9까지 1씩 증가
		 * 규칙성: 7 x a = 7*a를 출력 
		 */
		
		int a = 1, num = 7;
		while(a <= 9)
		{
			System.out.println( num + "x" + a + "=" + (num * a));
			a++;
		}
		
		// 더 깔끔한 코드
		a = 1; 
		num =6;
		while( a <= 9 ) {
			System.out.println( num + "x" + a + "=" + (num * a++));
			
		}

	}

}
