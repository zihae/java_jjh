package day7;

import java.util.Arrays;

public class ArrayRandomEx1 {

	public static void main(String[] args) {
		/* 1~9 사이의 랜덤한 수 3개를 배열에 저장하여 출력하는 코드를 작성하세요.
		 * 단, 세 수가 중복되지 않게 작성하세요.
		 * 1 => 0번지에 저장
		 * 1 :0번지와 비교 후 중복 되면 다시 랜덤 돌림 
		 * 5=> 1번지에 저장
		 * 1 :0번지와 비교 후 중복 되면 다시 돌림
		 * 5 :1번지와 비교 후 중복 되면 다시 돌림
		 * 9 => 2번지에 저장
		 *
		 *
		 */
		
		int [] num = new int[3];
		int min =1, max =3;
		int count = 0; // 중복되지 않는 숫자가 저장된 갯수. 즉, count=3이 될 때까지 실행
		do {
			//랜덤한 수 생성
			int random = (int)(Math.random()*(max-min+1)+min);
			//배열에 중복된 값이 있는지 확인하는 반복문
			int i;
			/* count가 0, 반복문이 한번도 실행 안됨
			 * count가 1, 중복된 수가 있으면 반복문 종료 후 i는 0
			 * count가 2, 중복된 수가 있으면 반복문 종료 후 i는 0 or 1
			 * */
			 
			for(i= 0; i<count ;i++) {
				//중복된 수가 있으면 반복문을 중단
				if(num[i] == random) {
					break;
				}
			}
			//반복문 종료 후 i값이 count와 같다는 건 중복된 수가 없어서 break문이 실행 안된 경우
			if(i ==count) {
				num[i] = random;
				count++;
			}
		}while(count != 3);
		System.out.println(Arrays.toString(num));
		

	}

}
