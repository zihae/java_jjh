package day2;

public class UnaryEx2 {
	

	public static void main(String[] args) {
		int num1 =10, num2 = 10;
		System.out.println("���� ��: num1 = " + num1 + ", num2 = " + num2 );
		//num1�� ���������� ����� ���ϰ�, num2�� ���������� ����� ����
		num1++; //num1�� ������ ȿ���� �ؾ��ϱ� ������ �����ϴ� �κ� �տ� ������ ��. ++num1����
		System.out.println("���� ��: num1 = " + num1 + ", num2 = " + num2++ );
		num2++; //num2�� ������ ȿ���� �����ϱ� ������ �����ϴ� �κ� �ڿ� ������ ��. ++num2 ����
		System.out.println("���� ��: num1 = " + num1 + ", num2 = " + num2 );
		
	
	}

}
