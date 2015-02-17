/*
 * This program takes a first and last name and returns the two names separately,
 * the respective lengths of the first and last names, and the user's initials.
 *
 * This program was written as an exercise for the Java Notes online textbook on
 * 02-09-2015 by Jesse Evers.
 */

import java.util.Scanner;  // Import Scanner for getting user input

public class NameParse {

	public static void main(String[] args) {

		/* Declare variables */
		String fullName;  // User's full name
		String first, last;  // First name, last name
		int firstLength, lastLength;  // Length of first and last names
		String initials;  // Pretty self-explanatory
		int spaceIndex;  // Index in space in the name
		Scanner stdin;  // Scanner for user input

		/* Get the user's name */
		System.out.print("Please enter your first and last name, separated by a space: ");
		stdin = new Scanner(System.in);
		fullName = stdin.nextLine();

		/* Gets the first and last names, as well as their lengths, separately */
		spaceIndex = fullName.indexOf(" ");  // Get the index of the space
		first = fullName.substring(0, spaceIndex);
		firstLength = first.length();
		last = fullName.substring(spaceIndex + 1);
		lastLength = last.length();

		/* Gets initials and makes sure that they are capitals */
		initials = first.substring(0, 1) + last.substring(0, 1);
		initials = initials.toUpperCase();

		/* Prints out all the info */
		System.out.println("Your first name is " + first + ", which has " + firstLength + " characters");
		System.out.println("Your last name is " + last + ", which has " + lastLength + " characters");
		System.out.println("Your initials are " + initials);

	}
}
