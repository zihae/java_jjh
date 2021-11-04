package day7;

import java.util.Arrays;
import java.util.Scanner;

public class ArrayBaseballEx3 {

	public static void main(String[] args) {
		/*숫자 야구 게임에서 컴퓨터가 랜덤한 수를 생성하도록 코드를 작성하세요.
		 * 
		 */
		int [] com = new int[3];
		Scanner scan = new Scanner(System.in);
		
		//컴퓨터가 1~9사이의 중복되지 않은 세 수를 저장하는 코드를 작성
		
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
				if(com[i] == random) {
					break;
				}
			}
			//반복문 종료 후 i값이 count와 같다는 건 중복된 수가 없어서 break문이 실행 안된 경우
			if(i ==count) {
				com[i] = random;
				count++;
			}
		}while(count != 3);
		
		
		//사용자가 무한히 세 수를 입력받음
		int user[] = new int[3];
		int strike = 0, ball = 0;// while문의 종료 조건을 strike로 하기 위해 do 조건문 밖에 strike 씀
		
		do {
		System.out.print("사용자 : ");
		for(int i = 0; i<user.length; i++) {
			user[i] = scan.nextInt();
		}
		//스트라이크 갯수를 계산하여 스트라이크 갯수를 출력
		//컴퓨터: 1 3 2
		//사용자: 1 2 3
		//1
		strike = 0;
		
		
		for(int i =0; i<com.length; i++) {
			if(com[i] == user[i]) {
			strike++;
			}
		 }
		//볼의 갯수를 계산하여 볼의 갯수를 출력	
		ball = 0;
		
		for(int i=0; i<com.length; i++) {
			for(int j=0; j<user.length; j++) {
				//com[i], user[j]
				//스트라이크인 경우는 생략
				if(i==j) {
					continue; 
				}
				if(com[i] == user[j]) {
					ball++;
				}
			}
			
		}
		//스트라이크가 있으면 xS
		//볼만 있으면 경우는 xB
		//스트라이크와 볼이 없으면 30이 출력되도록 작성해보세요.
		
		if(strike !=0) {
			System.out.print(strike + "S");
		}if(ball !=0) {
				System.out.print(ball + "B");
		}if(strike==0 && ball==0) {
			System.out.print("3O");
		}
		System.out.println();
		
		//3S이면 반복문을 종료
		if(strike ==3) {
			System.out.println("정답입니다. 프로그램을 종료합니다.");
			break;	
		}
			
	   }while(strike != 3);
		
		
		scan.close();
	}

}
