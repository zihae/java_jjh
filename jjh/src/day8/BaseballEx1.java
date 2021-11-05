package day8;

import java.util.Arrays;
import java.util.Scanner;

public class BaseballEx1 {

	public static void main(String[] args) {
		/* 6일차 숫자 야구게임 예제와 lotto 예제를 이용하여 숫자 야구 게임을 작성하세요.
		 * 단, 메소드를 사용하여 만들고 컴퓨터가 생성하는 번호는 랜덤으로 중복되지 않게한다. 
		 */
				
	int [] com = new int[3];
	
	
	//컴퓨터가 1~9사이의 중복되지 않은 세 수를 저장하는 코드를 작성
	int min =1, max =3;
	Scanner scan = new Scanner(System.in);
	com = randomArray (min, max, 3);
	System.out.println(Arrays.toString(com));
	
	//사용자가 무한히 세 수를 입력받음
	int user[] = new int[3];
	int strike = 0, ball = 0;// while문의 종료 조건을 strike로 하기 위해 do 조건문 밖에 strike 씀
	
	do {
	System.out.print("사용자 : ");
	inputArray(user,scan);
	//스트라이크 개수
	strike = getStrike(com,user);
	
	//볼의 개수
	ball=getBall(com,user);
	
	//결과 판별
	printResult(strike,ball); 
	
	
		
   }while(strike != 3);
	System.out.println("정답입니다. 프로그램을 종료합니다.");
	scan.close();
}
	
	public static int [] randomArray(int min, int max, int size) {
		int[]arr= new int[size];
		for(int count =0; count<size; ) {
			int random = (int)(Math.random()*(max-min+1)+min);
			//random과 배열을 비교하여 중복된 숫자가 없으면 
			if(!containsArray(arr, random, count)) {
				arr[count++] = random;
			}
		}
		return arr;
	}

	public static boolean containsArray(int [] arr, int num, int n) {
		//배열의 길이보다 검사하는 개수가 많으면 검사 개수를 배열의 길이로,
		//아니면 원래 검사 개수로 변경
		n= arr.length < n ? arr.length : n;
		for(int i =0; i<n; i++) {
			if(arr[i] == num) {
				return true;				
		}
		}
		return false;
		}
	
	/* 기능: 두 배열이 주어지면 스트라이크 갯수를 알려주는 메소드
	 * 매개변수: 두 배열 => int []com, int []user
	 * 리턴타입: 스트라이크 개수 => 정수 => int
	 * 메소드명: getStrike
	 */
	public static int getStrike(int [] com, int [] user) {
		int count = 0;
		for(int i = 0; i<com.length; i++) {
			if(com [i] == user[i]) {
				count++;
			}
			}
		return count;
			}
	/* 기능: 두 배열이 주어지면 볼의 개수를 알려주는 메소드
	 * 매개변수: 두 배열 => int []com, int []user
	 * 리턴타입: 스트라이크 개수 => 정수 => int
	 * 메소드명: getBall
	 */
	public static int getBall(int [] com, int [] user) {
		//count : 볼+스트라이크 개수. 볼과 스트라이크 구분 하지 않음
		int count = 0;
		for(int tmp: com) {
			if(containsArray(user, tmp, user.length)) {
				count ++;
			}
			}
		return count - getStrike(com, user);
			} 
	/* 기능: 스트라이크와 볼의 개수가 주어지면 결과를 콘솔에 출력하는 메소드
	 * 매개변수: 스트라이크와 볼의 개수 => int strike, int ball
	 * 리턴타입: 없음 => void
	 * 메소드명: printResult
	 */
	public static void printResult(int strike, int ball) {
		if(strike !=0) {
			System.out.print(strike + "S");
		}if(ball !=0) {
				System.out.print(ball + "B");
		}if(strike==0 && ball==0) {
			System.out.print("3O");
		}
		System.out.println();
	}
	/* 기능: Scanner와 배열이 주어지면 Scanner를 통해 주어진 배열의 길이만큼 배열에 정수를 입력하는 메소드
	 * 매개변수: Scanner와 배열 => int [] arr, Scanner scan
	 * 리턴타입: 없음 => void
	 * 메소드명: inputArray
	 */
	public static void inputArray(int []arr, Scanner scan) {
		for(int i = 0; i<arr.length; i++) {
			arr[i] = scan.nextInt();
		}	
		
		}
}
	


