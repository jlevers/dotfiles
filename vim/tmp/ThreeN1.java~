/*
 * This program prints out a 3N + 1 sequence starting from a positive integer
 * specified by the user. It also counts the number of terms in the sequence,
 * and prints out that number.
 *
 * Copied from http://math.hws.edu/javanotes/c3/s2.html on 02-10-2015 by
 * Jesse Evers. Modified to user java.util.Scanner instead of TextIO.
 */

import java.util.Scanner;  // For getting user input

public class ThreeN1 {

	public static void main (String[] args) {

		int N;  // For computing terms in the sequence
		int counter;  // For counting the terms
		Scanner stdin;  // For getting user input

		stdin = new Scanner(System.in);
		System.out.print("Starting point for sequence: ");
		N = stdin.nextInt();
		while (N <= 0) {
			System.out.print(
					"The starting point must be positive. Please try again: ");
			N = stdin.nextInt();
		}
		// At this point, we know that N > 0

		counter = 0;
		while (N != 1) {
			if (N % 2 == 0) {
				N = N / 2;
			} else {
				N = 3 * N + 1;
				System.out.println(N);
				counter = counter + 1;
			}
		}

		System.out.println();
		System.out.print("There were ");
		System.out.print(counter);
		System.out.println(" terms in the sequence.");

	}  // End of main()

}  // End of ThreeN1
