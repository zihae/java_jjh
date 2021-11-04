package day7;

import java.util.Arrays;

public class ArrayRandomEx2 {

	public static void main(String[] args) {
		/* 1~9사이의 랜덤한 수를 3개 생성하여 배열에 저장하고 코드를 출력하는 작성하세요.
		 * 1. 3개짜리 배열을 생성
		 * 2. 3번 반복
		 *   2-1. 랜덤한 수를 생성
		 *   2-2. 배열에 랜덤한 수를 저장
		 */
		
		/* 배열과 반복문을 쓰지 않고 만든 코드
		int num1, num2, num3;
		int min = 1, max = 9;
		num1 = (int)(Math.random()*(max-min+1)+min);
		num2 = (int)(Math.random()*(max-min+1)+min);
		num3 = (int)(Math.random()*(max-min+1)+min);
		System.out.println(num1 + ", " + num2 + ", " + num3);
		*/
		
		/*배열 o, 반복문 x
		int num[] = new int[3];
		int min = 1, max = 9;
		num[0] = (int)(Math.random()*(max-min+1)+min);
		num[1] = (int)(Math.random()*(max-min+1)+min);
		num[2] = (int)(Math.random()*(max-min+1)+min);
		System.out.println(Arrays.toString(num));
		*/
		
		//3개 짜리 배열을 생성
		int num[] = new int[3];
		int min = 1, max = 9;
		//3번 반복(->반복문 for), i= 몇 번째 배열인지
		for(int i = 0; i<num.length ; i++) {
			//랜덤한 수를 생성
			int random = (int)(Math.random()*(max-min+1)+min);
			// 배열에 랜덤한 수를 저장
			num[i] = random;
			//num[i] = (int)(Math.random()*(max-min+1)+min);
		}
		
		//배열을 출력
		System.out.println(Arrays.toString(num));
		
		
		
		
		
		
		

		
	}

}
