package day5;

public class PrintAlphabetEx1 {

	public static void main(String[] args) {
		/* zyx...cba가 출력되도록 코드를 작성하세요.
		 * 반복횟수: i는 0부터 25까지 1씩 증가
		 * 규칙성: 문자 'z' - i 출력
		 */
		
		char ch; 
		for( ch = 'z'; ch>= 'a' ; ch-- ) {
			System.out.print(ch);
		}
		System.out.println();
		
		int i=0;
		while(i<26) {
			System.out.print((char)('z'-i));
			i++;
		}
	}
}
