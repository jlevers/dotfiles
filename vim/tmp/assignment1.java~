/*
 * This program takes 2 test grades, 3 quiz grades, and a homework average,
 * and weights the grades of each differently to find a final grade. 
 * 
 * This program was written as an exercise for AmplifyMOOC on 02-12-2015 by 
 * Jesse Evers 
 */

import java.util.Scanner;  // For getting user input

public class assignment1 {

	public static void main(String[] args) {

		Scanner stdin = new Scanner(System.in);
		System.out.println("This program takes a bunch of your grades, weights them, and returns your average.");
		System.out.println("Please enter your test grades.");
		System.out.print("Test 1: ");
		int test1 = stdin.nextInt();
		System.out.print("Test 2: ");
		int test2 = stdin.nextInt();
		System.out.println();

		System.out.println("Please enter your quiz grades.");
		System.out.print("Quiz 1: ");
		int quiz1 = stdin.nextInt();
		System.out.print("Quiz 2: ");
		int quiz2 = stdin.nextInt();
		System.out.print("Quiz 3: ");
		int quiz3 = stdin.nextInt();
		System.out.println();

		System.out.println("Please enter your homework average in decimal form.");
		System.out.print("Homework: ");
		double homework = stdin.nextDouble();

		double testAvg = (double)(test1 + test2) / 2;
		double quizAvg = (double)(quiz1 + quiz2 + quiz3) / 3;

		double finalGrade = (0.5 * testAvg) + (0.3 * quizAvg) + (0.2 * homework);

		System.out.println("Test Average: " + testAvg);
		System.out.println("Quiz Average: " + quizAvg);
		System.out.println("Final Grade: " + finalGrade);
	}
}
