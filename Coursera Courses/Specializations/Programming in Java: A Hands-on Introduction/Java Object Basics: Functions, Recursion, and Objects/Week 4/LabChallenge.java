import java.util.ArrayList;

//add class definitions below this line

class Zoo {
  int bigCats;
  int primates;
  int reptiles;
  int birds;
  
  Zoo(int bc, int p, int r, int b) {
    bigCats = bc;
    primates = p;
    reptiles = r;
    birds = b;
  }
  
  int totalAnimals() {
    return bigCats+primates+reptiles+birds;
  }
  
  int totalMammals() {
    return bigCats+primates;
  }
  
  String mostAnimals() {
    int max = bigCats;
    String name = "bigCats";
    
    if (primates > max) {
      max = primates;
      name = "primates";
    }
    if (reptiles > max) {
      max = reptiles;
      name = "reptiles";
    }
    if (birds > max) {
      max = birds;
      name = "birds";
    }
    return name;
  }
}

//add class definitions above this line

public class LabChallenge {  
  public static void main(String[] args) {
    
    //add code below this line
    
    Zoo myZoo = new Zoo(10, 30, 90, 120);
    System.out.println(myZoo.totalAnimals());
    System.out.println(myZoo.totalMammals());
    System.out.println(myZoo.mostAnimals());

    //add code above this line
  }
}
