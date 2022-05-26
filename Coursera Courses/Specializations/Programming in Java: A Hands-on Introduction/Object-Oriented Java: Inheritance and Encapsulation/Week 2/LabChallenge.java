class MP3 {
  private String artist;
  private String title;
  private String album;
  private int length;
  private String genre;
  
  public String getArtist() {
    return artist;
  }
  
  public void setArtist(String newArtist) {
    artist = newArtist;
  }
  
  public String getTitle() {
    return title;
  }
  
  public void setTitle(String newTitle) {
    title = newTitle;
  }
  
  public String getAlbum() {
    return album;
  }
  
  public void setAlbum(String newAlbum) {
    album = newAlbum;
  }
  
  public int getLength() {
    return length;
  }
  
  public void setLength(int newLength) {
    length = newLength;
  }
  
  public String getGenre() {
    return genre;
  }
  
  public void setGenre(String newGenre) {
    genre = newGenre;
  }
}

//add class definitions below this line

class Podcast extends MP3 {
  private String name;
  private String date ;
  
  public Podcast(String n, String t, int l, String g, String d) {
    name = n;
    super.setTitle(t);
    super.setLength(l);
    super.setGenre(g);
    date = d;
  }
  
  public String displayName() {
    return "The name is "+name;
  }
  
  public String displayTitle() {
    return "The title is "+getTitle();
  }
  
  public String displayLength() {
    return "The length is "+getLength()/60+" minutes and "+getLength()%60+" seconds";
  }
  
  public String displayGenre() {
    return "The genre is "+getGenre();
  }
  
  public String displayDate() {
    return "The date is "+date;
  }
}

//add class definitions above this line

public class LabChallenge {
  public static void main(String[] args) {
    
    //add code below this line
  
    Podcast p = new Podcast("Planet Money", "Hollywood's Black List", 1460, "economics", "10 July 2020");
    System.out.println(p.displayName());
    System.out.println(p.displayTitle());
    System.out.println(p.displayLength());
    System.out.println(p.displayGenre());
    System.out.println(p.displayDate());
  
    //add code above this line   
  }
}
