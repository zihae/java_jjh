package day2;

public class UnaryEx1 {
	

	public static void main(String[] args) {
		int num1 =10, num2 = 10;
		System.out.println("���� ��: num1 = " + num1 + ", num2 = " + num2 );
		//num1�� ������ ���������ڸ� �̿�, num2�� ������ ���������ڸ� �̿�
		System.out.println("���� ��: num1 = " + num1 + ", num2 = " + num2++ );
		System.out.println("���� ��: num1 = " + num1 + ", num2 = " + num2 );
		
		++num1; // 13��°�� �ڵ�� ���� �ڵ��num1++, num1 = num1 + 1, num1 += 1
		//num2�� 1�� ����
		num2++;
		//
		System.out.println("���� ��2: num1 =" + num1 + ", num2 = " + num2);
	}

}
