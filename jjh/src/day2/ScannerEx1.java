package day2;

import java.util.Scanner;

public class ScannerEx1 {

	public static void main(String[] args) {
		//�ֿܼ��� �Է� ���� �� �ְ� Scanner�� ����. ������ Scanner�� �̸��� scan
		Scanner scan = new Scanner(System.in); 
		
		System.out.print("������ �Է��ϼ��� : "); 
		int num1 = scan.nextInt();
		System.out.println("�Էµ� ������ " + num1 + " �Դϴ�.");
		
		System.out.print("�Ǽ��� �Է��ϼ��� : ");
		double num2 = scan.nextDouble();
		System.out.println("�Էµ� �Ǽ��� " + num2 + " �Դϴ�.");
		
		System.out.print("���ڸ� �Է��ϼ��� : ");
		char ch1 = scan.next().charAt(0);
		System.out.println("�Էµ� ���ڴ� " + ch1 + " �Դϴ�.");
		
		//next() : ������ ������ �� �ܾ �о��.
		System.out.print("�ܾ �Է��ϼ���: ");
		String str1 = scan.next();
		System.out.println("�Էµ� �ܾ�� " + str1 + " �Դϴ�.");
		
		scan.nextLine();
		
		//nexLine() : ������ ������ �� ������ �о��.
		System.out.println("������ �Է��ϼ��� : ");
		String str2 = scan.nextLine();
		System.out.println("�Էµ� ������" + str2 + " �Դϴ�.");
		
		//���̻� ū�ֿ��� �Է� ���� ������ ������ Scanner ����� ����
		scan.close();

	}

}
