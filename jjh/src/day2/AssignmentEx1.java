package day2;

public class AssignmentEx1 {

	public static void main(String[] args) {
		int num1 = 10, num2 = 20;
		num1 = num2; // num2�� �մ� 20�� num1�� ���� (���), num1�� 20�̵�
		System.out.println("num1 = " + num1 + ", num2 =" + num2);
		
		num1 = 10;
		num2 =20;
		
		num2 = num1; //num1�� �ִ� 10�� num2�� ���� (���), num2�� 10�̵�
		System.out.println("num1 = " + num1 + ", num2 =" + num2);
		
		num1 = num1 + num2; //num1�� �մ� 10�� num2�� �մ� 10�� ���ؼ� num1�� ����
		System.out.println("num1 = " + num1 + ", num2 =" + num2);
		
				
		//num1 + num2 = num1; // ���� �߻�, ���� ������ ���ʿ��� ���� 1���� �;� �Ѵ�. (��� ����)
		//num1 + 1 = num1; //���� �߻�

	}

}
