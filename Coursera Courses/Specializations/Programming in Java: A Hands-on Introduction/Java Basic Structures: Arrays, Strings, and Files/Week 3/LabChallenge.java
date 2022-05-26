import java.io.*;
import java.util.ArrayList;

public class LabChallenge {
  public static void main(String args[]) {
    
    String path = args[0];
    //add code below this line
    
    ArrayList<String> text = new ArrayList<String>();
    try {
      BufferedReader reader = new BufferedReader(new FileReader(path));
      while (reader.ready()) {
        text.add(reader.readLine());
      }
      reader.close();
    } catch (IOException e) {
      System.out.println(e);
    } finally {
      System.out.println("Finished reading a file.\n");
    }
    for (String line : text) {
      String replaceLine = line.replace("Burma", "Myanmar");
      System.out.println(replaceLine);
    }
