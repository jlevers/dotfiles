2.3.1 Built-in Subroutines and Functions
=========================================

// Subroutines can be called without knowing what's going on inside them
// There are many built-in subroutines in Java that can be called without
// writing them

// Variables and subroutines contained in a class are called static members
// of the class

// Some of the standard classes that come with Java are System and Math
System.exit(0);  // Terminates the program..0 means that there were no errors
Math.PI;  // The constant π
Math.E;  // The constant e
Math.sqrt(x);  // Takes the square root of x
Math.abs();  // Takes the absolute value of x
Math.sin(x), Math.cos(x), Math.tan(x); // Trig functions and their inverses
Math.exp(x);  // Raises e to the x
Math.log(x);  // Computes log base e of x
Math.pow(x, y);  // Raises x to the y
Math.floor(x);  // Rounds x down to the nearest integer (always DOWN)
Math.random();  // Chooses a pseudorandom double between 0 and 1


2.3.2 Classes and Objects
=========================

// Classes can be used to describe objects
// Objects are collections of variables and subroutines.

// Looking at "System.out.println":
// System is a class and out is a static variable in System
// However, the value of System.out is an object and System.out.println is
// the full name of a subroutine of System.out.

// Subroutines are usually called methods


2.3.3 Operations on Strings
===========================

// Many operations can be performed on strings
// String is a class and a value of type String is an object

String advice;
advice = "Seize the day!";
System.out.println(advice.length());  // -> 14

String s1 = "Aa", s2 = "aA", s3 = " aa ";
s1.equals(s2);  // -> false
s1.equalsIgnoreCase(s2);  // -> true
s1.charAt(1);  // -> a
s2.substring(1);  // -> "A"
s1.indexOf(s2);  // -> -1
s1.compareTo(s2);  // -> ?
s1.toUpperCase();  // -> "AA"
s2.toLowerCase();  // -> "aa"
s3.trim();  // -> "aa"


2.3.4 Introduction to Enums
===========================

// Enum is short for "enumerated type"
// The enum type has a fixed list of possible values, so it is somewhat like
// a boolean.
// The definition of an enum type looks like:

enum enum-type-name { list-of-enum-values }
// Cannot be defined inside a subroutine
// enum-type-name becomes the name of the enum type in the same way that 
// boolean identifies boolean types and String identifies string types
// Here's a real example:

enum Season { SPRING, SUMMER, FALL, WINTER }

// Then a variable can be defined with Season:
Season vacation;
vacation = Season.SUMMER;
System.out.println(vacation);  // -> SUMMER

// Every enum object contains the method ordinal()
Season.SPRING.ordinal();  // -> 0
Season.SUMMER.ordinal();  // -> 1
