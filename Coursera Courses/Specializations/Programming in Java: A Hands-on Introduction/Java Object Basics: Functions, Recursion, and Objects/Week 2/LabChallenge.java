public class LabChallenge {
  public static void main(String[] args) {

    //call recursive method below this line
    
    System.out.println(recursivePower(4, 5));
    
    //call recursive method above this line
  }

  //add method definitions below this line
  
  public static int recursivePower(int base, int exponent) {
    if (exponent == 0) {
      return 1;
    } else {
      return base * recursivePower(base, exponent - 1);
    }
  }
  
  //add method definitions above this line
}
