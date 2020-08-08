# compiler_DLAC2020
This is a YACC/LEX compiler for a simple calculator made during the course *Languages and Their Compilers (DLAC)*


**Features**:

- negative values and floating point numbers, seperated by (.) are possible
- all operations can be combined with all other operations 
- brackets can be added like in standard algebra

*arithmetic operations*:
- Addition +
- Subtraction -
- Multiplication *
- Division /
- Modulus %

*Functions*: 
- val^n       returns val to the power of the number n.
- sqrt(val)   returns the quare root of val
- abs(val)    returns the absolute value of an integer. 
- CtoF(val)   converts a degree in fahrenheit to celsius
- FtoC(val)   converts a degree in celsius to fahrenheit
- printFib(n) prints the first n fibonacci numbers to the screen


**How to use**:

Once your terminal is opened in the calculators directory:
- Use command "make clear" to remove the automatically generated files (calc, calc.tab.c, calc.tab.h, lex.yy.c).
- Use command "make calc" to compile and create the executable.

Alternatively you can use the command "make all" to do both (clearing and compilation) at once.

Now you can start the calculator with ./calc

Exit with 'E'
