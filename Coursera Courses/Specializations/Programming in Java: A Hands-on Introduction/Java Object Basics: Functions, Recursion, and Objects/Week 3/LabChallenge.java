public class LabChallenge {
  public static void main(String[] args) {
    
    //add code below this line

    Dog dog1 = new Dog("Marceline", "German Shepherd");
    Dog dog2 = new Dog(dog1);
    dog2.name = "Cajun";
    dog2.breed = "Belgian Malinois";
    
    System.out.println(dog1.name + " " + dog1.breed);
    System.out.println(dog2.name + " " + dog2.breed);
    System.out.println(dog2 == dog1);

    //add code above this line
  }
}
