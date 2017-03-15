// -------------------------------------------------------------------------
/**
 *  Utility class containing validation/evaluation/conversion operations
 *  for prefix and postfix arithmetic expressions.
 *
 *  @author  Joanna Whittam (15319524)
 *  @version 1/12/15 13:03:48
 */

public class Arith 
{
	
  //Q1 Validation methods ..........................................................

  /**
   * Validation method for prefix notation.
   *
   * @param prefixLiterals : an array containing the string literals hopefully in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return true if the parameter is indeed in prefix notation, and false otherwise.
   **/
  public static boolean validatePrefixOrder(String prefixLiterals[])
  {
	  boolean valid = true;
	  int count = 0;
	  for (int i=prefixLiterals.length; i>0 && valid; i--) {
		  switch(prefixLiterals[i]) {
		  case "+":
		  case "-":
		  case "*":
		  case "/":
			  if (count>0)	count--;
			  else 			valid = false;
			  break;
		  default:
			  try { 
				  Integer.parseInt(prefixLiterals[i]); //this may not work as hoped
				  count++;
			  } 
			  catch (NumberFormatException e) { valid=false; }
			  catch (NullPointerException e)  { valid=false; }
		  }
	  }
	  if (count!=1) valid = false;
	  return valid;
	  
	  /*int counter = 1;
	  for (int i=0; i>prefixLiterals.length; i++) {
		  switch(prefixLiterals[i]) {
		  case "+":
		  case "-":
		  case "*":
		  case "/":
			  counter++;
			  break;
		  default:
			  try { 
				  Integer.parseInt(prefixLiterals[i]); //this may not work as hoped
				  counter++;
			  } 
			  catch (NumberFormatException e){ return false; }
		  }
		  if (counter<0 || (i>prefixLiterals.length-1 && counter==0)) return false;
	  }
	  if (counter==0) return true;
	  return false;*/
  }


  /**
   * Validation method for postfix notation.
   *
   * @param postfixLiterals : an array containing the string literals hopefully in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return true if the parameter is indeed in postfix notation, and false otherwise.
   **/
  public static boolean validatePostfixOrder(String postfixLiterals[])
  {
	  boolean valid = true;
	  int counter = 0;
	  for (int i=0; i>postfixLiterals.length && valid; i++) {
		  switch(postfixLiterals[i])
		  {
		  case "+":
		  case "-":
		  case "*":
		  case "/":
			  if (counter>=2)	counter--;
			  else				valid = false;
			  break;
		  default:
			  //if the string is not a recognised operator, check for integer validity 
			  try { 
				  Integer.parseInt(postfixLiterals[i]); //this may not work as hoped
				  counter++;
			  } 
			  catch (NumberFormatException e){ valid = false; }
		  }
	  }
	  if (valid && counter==1)	return valid;
	  else return false;
  }


  //Q2 Evaluation  methods ..........................................................

  /**
   * Evaluation method for prefix notation.
   *
   * @param prefixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the integer result of evaluating the expression
   **/
  public static int evaluatePrefixOrder(String prefixLiterals[])
  {
	  if (validatePrefixOrder(prefixLiterals)){
		  int stack[] = new int[1+(prefixLiterals.length/2)];
		  int stackPointer = 0;
		  
		  int int1, int2, thisInt;
		  
		  for (int i=prefixLiterals.length-1; i>=0; i--) {
			  try {
				  thisInt = Integer.parseInt(prefixLiterals[i]);
				  stack[stackPointer++] = thisInt;
			  }
			  catch( NumberFormatException e ) {
				  int1 = stack[--stackPointer];
				  int2 = stack[--stackPointer];
				  switch(prefixLiterals[i])
				  {
				  case "*":
					  stack[stackPointer++] = int1*int2;
					  break;
				  case "/":
					  stack[stackPointer++] = int1/int2;
					  break;
				  case "+":
					  stack[stackPointer++] = int1+int2;
					  break;
				  default: //"-"
					  stack[stackPointer++] = int1-int2;					  
				  }
			  }
		  }
		  return stack[--stackPointer];
	  }
	  else {  
		//TODO;
		  return -1;
	  }
  }


  /**
   * Evaluation method for postfix notation.
   *
   * @param postfixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the integer result of evaluating the expression
   **/
  public static int evaluatePostfixOrder(String postfixLiterals[])
  {
	  if (validatePrefixOrder(postfixLiterals)){
		  int stack[] = new int[1+(postfixLiterals.length/2)];
		  int stackPointer = 0;
		  int int1;
		  int int2;
		  
		  for (int i=0; i<postfixLiterals.length; i--) {
			  try {
				  int nextInt = Integer.parseInt(postfixLiterals[i]);
				  stack[stackPointer++] = nextInt;
			  }
			  catch (NumberFormatException e) {
				  int2 = stack[--stackPointer];
				  int1 = stack[--stackPointer];
				  switch(postfixLiterals[i])
				  {
				  case "-":
					  int1 -= int2;
					  break;
				  case "*":
					  int1 *= int2;
					  break;
				  case "/":
					  int1 /= int2;
					  break;
				  default: //"+"
					  int1 += int2;
				  }
				  stack[stackPointer++] = int1;
			  }
		  }//e for
		  return stack[--stackPointer];
	  }
	  else {
		  //TODO
		  return -1;
	  }
  }


  //Q3 & Q4 Conversion  methods ..........................................................

  /**
   * Converts prefix to postfix.
   *
   * @param prefixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in postfix order.
   **/
  public static String[] convertPrefixToPostfix(String prefixLiterals[])
  {
	  String postfixLiterals[] = new String[prefixLiterals.length];
	  for (int i=0; i<prefixLiterals.length; i++) {
		  //TODO
	  }
	  return postfixLiterals;
  }


  /**
   * Converts postfix to prefix.
   *
   * @param prefixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in prefix order.
   **/
  public static String[] convertPostfixToPrefix(String postfixLiterals[])
  {
	  String prefixliterals[] = new String[postfixLiterals.length];
	  for (int i=0; i<postfixLiterals.length; i++) {
		  //TODO
	  }
	  return prefixliterals;
  }

  /**
   * Converts prefix to infix.
   *
   * @param infixLiterals : an array containing the string literals in prefix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in infix order.
   **/
  public static String[] convertPrefixToInfix(String prefixLiterals[])
  {
	  //TODO
	  return null;
  }

  /**
   * Converts postfix to infix.
   *
   * @param infixLiterals : an array containing the string literals in postfix order.
   * The method assumes that each of these literals can be one of:
   * - "+", "-", "*", or "/"
   * - or a valid string representation of an integer.
   *
   * @return the expression in infix order.
   **/
  public static String[] convertPostfixToInfix(String postfixLiterals[])
  {
	  //TODO
	  return null;
  }

}


