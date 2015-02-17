/*
 * This class implements a simple program that will compute the amount of 
 * interest that is earned on an investment and the interest rate are input
 * by the user. The value of the investment at the end of the year is output.
 * The rate must be input as a decimal, not a percentage (for example, 0.05
 * instead of 5).
 *
 * This program was copied from http://math.hws.edu/javanotes/c2/s4.html on 
 * 02-06-2015 by Jesse Evers.
 */

public class Interest2 {

	public static void main(String[] args) {

		double principal;  // The value of the investment
		double rate;  // The annual interest rate
		double interest;  // The interest earned during the year

		System.out.print("Enter the initial investment: ");
		principal = TextIO.getlnDouble();

		System.out.print("Enter the annual interest rate (as a decimal): ");
		rate = TextIO.getlnDouble();

		interest = principal * rate;  // Compute this year's interest
		principal = principal + interest;  // Add it to principal

		System.out.printf("The amount of interest is $%1.2f%n", principal);

	}  // End of main()

}  // End of class Interest2
