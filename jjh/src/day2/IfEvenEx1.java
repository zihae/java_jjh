package day2;

public class IfEvenEx1 {

	public static void main(String[] args) {
		/*num�� ¦���̸� ¦����� ����ϴ� �ڵ带 �ۼ��ϼ���.
		 * ���ǽ�: num�� ¦���̴�
		 *       num�� 2�� ����̴�
		 *       num�� 2�� �������� �� �������� 0�̴�
		 *       num�� 2�� �������� �� �������� 0�� ����
		 * ���๮: ¦����� ���
		 * */
		
		int num = 10;
		if(num % 2 == 0 ) {
			System.out.println(num + "�� ¦��");
			
		}
		if(num % 2 != 0)
			System.out.println(num + "�� Ȧ��");

	}

}
