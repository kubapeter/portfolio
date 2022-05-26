//add class definitions below this line
    
class Person {
  private String name;
  private int age;
  private String occupation;

  public Person(String n, int a, String o) {
    name = n;
    age = a;
    occupation = o;
  }
  
  public String getName() {
    return name;
  }

  public void setName(String newName) {
    name = newName;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int newAge) {
    age = newAge;
  }
  
  public String getOccupation() {
    return occupation;
  }

  public void setOccupation(String newOccupation) {
    occupation = newOccupation;
  }
}
  
//add class definitions above this line

public class LabChallenge {
  public static void main(String[] args) {
    
    //add code below this line

    Person test = new Person("Citra Curie", 16, "student");
    
    System.out.println(test.getName());
    test.setName("Rowan Faraday");
    System.out.println(test.getName());
    
    System.out.println(test.getAge());
    test.setAge(18);
    System.out.println(test.getAge());
    
    System.out.println(test.getOccupation());
    test.setOccupation("plumber");
    System.out.println(test.getOccupation());

    //add code above this line
  }
}
