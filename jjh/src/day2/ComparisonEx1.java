package day2;

public class ComparisonEx1 {

	public static void main(String[] args) {
		//���� �Ǻ��ϴ� ����.
		//���̴� �� ���̶�� ����. ������ �� 19�� �̻�
		int age = 15;
		boolean isAudult = age >= 19;
		
		
		System.out.println(age + "���� �����ΰ�?" + isAudult);
		
		//num1�� ¦���̸� isEven�� true��, Ȧ���̸� isEven�� false�� �ǵ��� �ڵ带 �ۼ��غ�����.
		
		int num1 = 11;
		//num1�� 2�� �������� �� �������� 0�� ����.
		boolean isEven  = num1 % 2 ==0;
		boolean isOdd = num1 % 2 != 0; //!isEven
				
		System.out.println(num1  + "�� ¦���ΰ� ? " + isEven);
		System.out.println(num1  + "�� Ȧ���ΰ� ? " + isOdd);
		
	}

}
