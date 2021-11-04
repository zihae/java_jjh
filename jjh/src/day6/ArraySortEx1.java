package day6;

public class ArraySortEx1 {

	public static void main(String[] args) {
		// 다음과 같은 배열이 있을 때 정렬하는 코드를 작성하세요.
		int num [] = {1,10,9,3,6,2,3,4};
		/*버블 정렬: 옆에 있는 값과 비교하여 정렬하는 방법
		 * 1,10,9,3,6,2,3,4
		 * 1,9,3,6,2,3,4,10   10-9 비교 후 큰 숫자를 오른쪽으로 위치하게 순서 바꿈, 마지막에 가장 큰 숫자가 올 때까지 두 숫자를 비교해서 순서를 바꿈
		 * 1,3,6,2,3,4,9,10
		 * 1,3,2,3,4,6,9,10
		 * 1,2,3,3,4,6,9,10
		 * 1,2,3,3,4,6,9,10 
		 * 1,2,3,3,4,6,9,10 
		 * 1,2,3,3,4,6,9,10
		 */
		
		//i< num.length-1 하는 이유: e.g. 8개 중에 7개가 정렬 되면 모든 수가 정렬됨
		// j< num.length-1 하는 이유: j는 앞 번지수를 지칭하고 2개씩 비교하기 때문에 마지막 번지수를 비교할 필요 없음 
		for( int i =0; i<num.length-1; i++) {
			for(int j = 0; j< num.length -1; j++) {
				if(num[j]>num[j+1]) {
					//두 값의 위치를 바꾸는 코드 아래(중요)
					int tmp = num[j];
					num[j] = num[j+1];
					num[j+1] = tmp;
				}
				
			}
			
		}
		for(int tmp : num) {
			System.out.print(tmp + " ");
		}
	}

}
