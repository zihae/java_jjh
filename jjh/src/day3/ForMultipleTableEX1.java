package day3;

public class ForMultipleTableEX1 {

	public static void main(String[] args) {
		/* 구구단 7단을 출력하는 코드를 작성하세요.
		 * 출력 예시
		 * 7 * 1 = 7    i=1 일때 7 x 1 =7
		 * 7 * 2 = 14   i=2 일때 7 x 2 = 7*2
		 * ...
		 * 7 * 9 = 63   i=9 일때 7 x 9 = 7*9
		 *                      7 x i = 7*i
		 * 반복횟수 : 9번, 1부터 9까지 (같다를 포함) 7씩 증가
		 * */
		
		int i;
		int num = 7;
		for(i =1 ; i <= 9 ; i++ ) {
			
			System.out.println(num + "x " + i + "=" + num * i);
			
		}

	}

}
