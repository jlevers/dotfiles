/*
 * This program was written as an activity for AmplifyMOOC. It takes a string 
 * with a "*" in it, then takes a second string which is inserted in the place
 * of the asterisk. If the first string doesn't have an asterisk, an error will
 * be thrown. If the first string contains characters other than upper- or lower-
 * case letters and an asterisk, and error will be thrown.
 *
 * Written by Jesse Evers on 02-22-15.
 */

import java.util.Scanner;  // For getting user input

public class Activity5 {

	public static void main(String[] args) {

		/* Declare variables */
		Scanner stdin = new Scanner(System.in);  // Gets user input
		String original;  // The string with the asterisk
		String addIn;  // The second string that the user enters
		String beginning, end;  // The text around the asterisk
		String result;  // The combination of the two user-inputted strings
		int asterisk;  // The index of the asterisk
		int count;  // Count of allowed characters
		/* Characters that can be in the first string */
		String legal = "abcdefghijklmnopqrstuvwxyz*\t ";
		
		/* Get the original text and the text to substitute */
		System.out.println("Please enter a string with an asterisk where you would like to substitute text:");
		original = stdin.nextLine();
		System.out.println("Please enter what you would like to substitute for the asterisk:");
		addIn = stdin.nextLine();

		/* Checks for asterisk */
		asterisk = -1;
		for (int i = 0; i < original.length(); i++) {
			if (original.charAt(i) == '*') {
				asterisk = i;
			}
		}

		/* Ends program if there is no asterisk */
		if (asterisk == -1) {
			System.out.println("Error: no *");
			return;
		}

		/* Checks for illegal characters */
		count = 0;
		for (int i = 0; i < original.length(); i++) {
			for (int j = 0; j < 29; j++) {
				if (original.toLowerCase().charAt(i) == legal.charAt(j)) {
					count++;
					break;
				}
			}
		}

		if (count != original.length()) {
			System.out.println("Error: incorrect characters");
			return;
		}
		
		/* Separates the string into substrings around the asterisk */
		beginning = original.substring(0, asterisk);
		end = original.substring(asterisk + 1);
		result = beginning + addIn + end;
		System.out.println(result);
			
	}
}
