package day2;

public class IfOperatorEx1 {

	public static void main(String[] args) {
		//���� ���ÿ����ڸ� �̿��� A���� Ȯ��, ���� �� Y ������ �� N
		int score = 95;
		char isA = ((score <= 100) && (score >= 90)) ? 'Y' : 'N';
		
		System.out.println(score + "���� A�����ΰ���?" + isA);
		
		//num1�� Ȧ���ΰ��� ����� Ȧ���̸� yes�� ¦���̸� no�� ����ϴ� �ڵ带 �ۼ��ϼ���.
		int num1 = 10;
		String isOdd = num1 % 2 != 0 ? "yes" : "no";  
		
		System.out.println(num1 + "�� Ȧ���ΰ���?" + isOdd);
	}

}
