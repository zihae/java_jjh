package day4;

public class ForEx1 {

	public static void main(String[] args) {
		/* for문 사용시 조심해야 하는 상황 */
		//1부터 5까지 출력하는 예제에서 발생한 실수
		int i;
		System.out.println("1부터 5까지 출력 : ");
		/* 원인 : for문 뒤에 ;이 와서 for문의 실행문이 없는 경우, for 문 뒤에 ;이 오면 거기서 for문이 끝남 (아래)*/
		for (i = 1 ; i <=5 ; i++ );
		{
			System.out.println(i + " ");
		}
		System.out.println();
		/* 원인: 조건식을 잘못 설정하여 한번도 실행 안되는 경우 (아래 예제)*/
		System.out.println("1부터 5까지 출력 : ");
		for (i = 1 ; i >=5 ; i++ ) {
			System.out.println(i + " ");
		}
		System.out.println();
		/* 원인: 조건식을 잘못 설정하여 무수히 많이 실행 되는 경우 (아래)*/
		/*
		System.out.println("1부터 5까지 출력 : ");
		for (i = 1 ; i <=5 ; i-- ) {
			System.out.println(i + " ");
		}
		System.out.println();
		*/
		System.out.println("int 최대값 : " + Integer.MAX_VALUE); //int로 표현할 수 있는 가장 큰 수
		System.out.println("int 최소값 : " + Integer.MIN_VALUE); //int로 표현할 수 있는 가장 작은 수
		int maxNum = Integer.MAX_VALUE + 1; //int 최대값 + 1 : 오버플로우
		int minNum = Integer.MIN_VALUE - 1; //int 최소값 -1  : 언더플로우
		System.out.println("int 최대값 + 1 : " + maxNum);
		System.out.println("int 최소값 - 1 : " + minNum);
		
	}

}
