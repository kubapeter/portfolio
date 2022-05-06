package main
 
import (
    "encoding/json"
    "io/ioutil"
	  "fmt"
	  "bufio"
	  "os"
)
 
type Flight struct {
    Departure string
    Arrival   string
    Airline string
}

func contains(slice []string, element string) bool {
    isElementInSlice := false
    for _, sliceElement := range slice {
        if sliceElement == element {
            isElementInSlice = true
        }
    }
    return isElementInSlice
}

func getUserInputFrom(pleaseChoose string, from []string) string {
    scanner := bufio.NewScanner(os.Stdin)
    var chosen string
	  fmt.Println(pleaseChoose)
    for {
        scanner.Scan()
        chosen = scanner.Text()
        if contains(from, chosen) {
            break
        }
        fmt.Println("You can choose from these: ", from)
    }
    return chosen
}

func get(flight Flight, attribute string) string {
    switch attribute {
        case "departure": return flight.Departure
        case "arrival": return flight.Arrival
        case "airline": return flight.Airline
    }
    return ""
}

func printAndReturnAllOptionsOnce(allFlights []Flight, category string) ([]string) {
    var alreadyPrinted []string
    
    fmt.Printf("\nThe %ss of the flights are \n", category)
    for _, flight := range allFlights {
        maybePrint := get(flight, category)
        if contains(alreadyPrinted, maybePrint) {
            continue
        }
        fmt.Printf("%s \n", maybePrint)
        alreadyPrinted = append(alreadyPrinted, maybePrint)
    }
    return alreadyPrinted
}

func selectAndPrintFlights(allFlights []Flight, category, attribute string) ([]Flight) {
    var selectedFlights []Flight
    for _, flight := range allFlights {
        if get(flight, category) == attribute {
            fmt.Println(flight)
            selectedFlights = append(selectedFlights, flight)
        }
    }
    return selectedFlights
}

func writeFlights(flightsToWrite []Flight) {
	  stringToWrite := "Departure, Arrival, Airline \n"
    for _, flight := range flightsToWrite {
        stringToWrite = stringToWrite + flight.Departure + ", " + flight.Arrival + ", " + flight.Airline + "\n"
    }
    stringToByte := []byte(stringToWrite)

	  ioutil.WriteFile("outfile.txt", stringToByte, 0644)
}
 
func main() {
    // Read file with JSON
    content, err := ioutil.ReadFile("infile.txt")
    if err != nil {
        fmt.Println("Error when opening file: ", err)
    }
 
    // Unmarshall the data into `flights`
    var flights []Flight
    err = json.Unmarshal(content, &flights)
    if err != nil {
        fmt.Println("Error during Unmarshal(): ", err)
    }

	  // Greeting user
    fmt.Println("The flights are read from infile.txt and now are structs")
	  fmt.Println("Choose which ones to write to outfile.txt")
	  fmt.Println("You can choose by departure, by arrival and by airline")

    // Ask to choose field
    pleaseChoose := "Which one will it be? Type \"departure\", \"arrival\" or \"airline\"\n"
    fromthese := []string{"departure", "arrival", "airline"}
    choosenBy := getUserInputFrom(pleaseChoose, fromthese)

    //Ask to choose attribute
    possibleAttributes := printAndReturnAllOptionsOnce(flights, choosenBy)
    pleaseChooseAttribute := fmt.Sprintf("Choose one of these %ss\n", choosenBy)
    choosenAttribute := getUserInputFrom(pleaseChooseAttribute, possibleAttributes)

    // Select and write flights
    fmt.Println("\nThe following flights will be written to outfile.txt in csv format: ")
    flightsToBeWritten := selectAndPrintFlights(flights, choosenBy, choosenAttribute)
    writeFlights(flightsToBeWritten)
}
