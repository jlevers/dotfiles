/* Objects */

An object is a thing that has specific attributes and operations which can be performed on it.
It is characterized by its *state* and *behavior*.


/* Classes */

A class is a blueprint for implementing specific objects.
The state of an object is given by its *data fields/instance variables*.
The *methods* of the class provide the class's behaviors.
Combining the attributes of an object into a class is called *encapsulation*.


/* Public, private, and static */

The keyword public before a class declares that any client program can access the class.
If the class is not public, it cannot be used by classes outside its package.
The same is true of public and private methods.
Private methods can only be accessed by methods of the original method's class.
The static final variable type cannot be changed once it is defined.

Example:

==================
public class Employee {
	private String name;
	private static int employeeCount = 0; // Number of employees

	public Employee ( /* parameter list */ ) {
		// Initilization of private instance variables
		employeeCount++; // Increment count of all employees
	}
}
=================

/* Methods */

All method headers look like the following:
         public            void        withdraw      (String password, double amount)
/* <access specifier> <return type> <method name>           <parameter list>         */

A constructor method creates an object of the class it is in.
A default constructor has no arguments.

Example:

=================
/* Default constructor
 * Constructs bank account with default values. */
public BankAccount() {
	myPassword = "";
	myBalance = 0.0;
}
=================

Static methods apply to all instances of the class, not just a specific object.



/* Scope */

The scope of a variable or method is the region in which that variable or method is visible and can be accessed.

