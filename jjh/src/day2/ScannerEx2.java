package day2;

import java.util.Scanner;

public class ScannerEx2 {

	public static void main(String[] args) {
		/* �ֿܼ��� �� ������ �Է¹޾� �Է¹��� �������� �հ�, ���� ����� ���ϴ� �ڵ带 �ۼ��ϼ���. */
		
		
		int num1, num2;
		System.out.print("�� ������ �Է��ϼ��� (��: 1 2) : ");
		Scanner scan = new Scanner(System.in);
		
		num1 =scan.nextInt();
		num2 =scan.nextInt();
		
		int result1 = num1 + num2;
		double result2 = num1 / (double) num2;
		
		
		
		System.out.println(num1 + "+" + num2 + "=" + result1);
		System.out.println(num1 + "/" + num2 + "=" + result2);
		
		
		
		scan.close();

	}

}
