public class LabChallenge {
  public static void main(String args[]) {
    
    String myString = args[0];
    char ch;
    
    //add code below this line
    
    String newString = "";
    
    for (int i = 0; i < myString.length(); i++) {
      ch = myString.charAt(i);
      if (ch == 'a' || ch == 'e' || ch == 'i' || 
        ch == 'o' || ch == 'u' || ch == 'A' ||
        ch == 'E' || ch == 'I' || ch == 'O' ||
        ch == 'U') {
        newString += "*";
      } else {
        newString += ch;
      }
    }
    
    myString = newString;
    
    System.out.println(myString);
    
    //add code above this line
  }
}
