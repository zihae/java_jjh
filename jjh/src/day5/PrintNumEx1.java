package day5;

public class PrintNumEx1 {

	public static void main(String[] args) {
		/* 다음과 같이 출력하도록 코드를 작성하세요.
		 * 1 2 3  
		 * 4 5 6  
		 * 7 8 9
		 */

		/* 내가 짠 코드
		 * int num1, num2, num3;
		for(num1=1; num1<=3 ; num1++) {
			System.out.print(num1 + " ");
		}System.out.println();
		for(num2=4; num2<=6 ; num2++) {
			System.out.print(num2 + " ");
		}System.out.println();
		for(num3=7; num3<=9 ; num3++) {
			System.out.print(num3 + " ");
		
		}*/
		
		/*방법 1: 3의 배수마다 숫자 출력 후 엔터를 침*/
		int i,j;
		for(i=1; i<=9 ; i++) {
			System.out.print(i + " ");
			//i가 3의 배수이면 엔터를 출력
			if(i % 3 == 0) {
				System.out.println(" ");
			}
		}
		
		/*방법 2
		 *1 2 3  i=1  시작숫자: 1
		 *4 5 6  i=2  시작숫자: 4 
		 *7 8 9  i=3  시작숫자: 7
		 *            시작숫자: 3*i-2
		 *  */
		
		for(i = 1; i<=3; i++) {
			for(j= 3*i-2; j<=3*i; j++) {
				System.out.print(j + " ");
			}
			System.out.println();
		}
		
	}
}
