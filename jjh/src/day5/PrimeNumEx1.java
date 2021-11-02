package day5;

public class PrimeNumEx1 {

	public static void main(String[] args) {
		/* 2부터 100이하의 모든 소수를 출력하는 예제
		 * 소수 판별 예제 참고.
		 * 소수는 약수가 2개인 수
		 * 4는 약수가 1,2,4로 3개이므로 소수가 아님
		 * 2는 약수가 1,2로 2개이므로 소수
		 * 1은 약수가 1로 1개이므로 소수가 아님
		 * num: 2부터 100이하의 정수
		 * i: num의 약수
		 * count: 약수의 갯수
		 * 반복횟수: i는 1부터 num1까지 1씩 증가
		 * 규칙성: i가 num1의 약수이면 count(약수의 갯수)를 1 증가
		 */
		
		
		int num = 2;
		int i = 1, count = 0;
		
		while(num <= 100 ) {//num=2
		//약수는 1부터 num까지 확인
		i=1;	
		count = 0;
		while(i<=num) {
			if(num % i == 0) {
				count++;
			}
			i++;
			}
			if(count == 2) {
			System.out.print(num + " ");
			} 
			num++;
			}	
	}

 }
