package day1;

public class VariableEx2 {

	public static void main(String[] args) {
		//변수명 작성 규칙과 관례 예제
		
		int num1 =0; //가능
		//int 1um = 0; // 에러 발생. 숫자로 시작 불가능.
		//int num1 = 1;// 에러 발생. 중복 선언 불가능
		//int _; //에러 발생. _만 사용 불가
		int abc_; // 문자 + _ 가능
		//int abc^; // 에러 발생. _와 $를 제외한 특수문자 불가능
		int 변수;// 한글 가능
		//int int; //에러 발생. 키워드 사용 불가 
		int Num1 = 0; //가능. 대소문자 구분

	}

}
