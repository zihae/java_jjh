package day2;

public class IfEvenEx2 {

	public static void main(String[] args) {
		/*num�� ¦���̸� ¦����� ����ϴ� �ڵ带 �ۼ��ϼ���.
		 * ���ǽ�: num�� ¦���̴�
		 *       num�� 2�� ����̴�
		 *       num�� 2�� �������� �� �������� 0�̴�
		 *       num�� 2�� �������� �� �������� 0�� ����
		 * ���๮: ¦����� ���
		 * */
		
		int num = 11;
		if(num % 2 == 0 ) {
			System.out.println(num + "�� ¦��");	
		}else {
			System.out.println(num + "�� Ȧ��");
	
		}
		
	}

}
