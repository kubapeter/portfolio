class Chef {
  private String name;
  private String cuisine;
  private int michelinStars;
  
  //add constructors below this line
  
  public Chef(String n){
    name = n;
  }
  
  public Chef(String n, String c){
    name = n;
    cuisine = c;
  }
  
  public Chef(String n, String c, int m){
    name = n;
    cuisine = c;
    michelinStars = m;
  }
  
  //add constructors above this line
  
  public String display() {
    String msg = String.format("%s is known for %s cuisine and has %d Michelin stars.", name, cuisine, michelinStars);
    return msg;
  }
}

public class LabChallenge {  
  public static void main(String[] args) {
    
    //add code below this line

    Chef c1 = new Chef("Marco Pierre White");
    Chef c2 = new Chef("Rene Redzepi", "Nordic");
    Chef c3 = new Chef("Thomas Keller", "French", 3);
    
    System.out.println(c1.display());
    System.out.println(c2.display());
    System.out.println(c3.display());
    
    //add code above this line
  }
}
