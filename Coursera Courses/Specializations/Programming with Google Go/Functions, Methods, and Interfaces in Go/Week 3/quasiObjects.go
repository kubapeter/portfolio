/*
Please note that for etical reasons this is not the assignment submitted 
in the course. I use roughly the same knowledge that I used for the 
assignment, but the problem I solve is my own creation.

This is an upgraded version of the code I shared at week 4 of the previous 
course. The main goal of the assignment of this week was to store related 
data in structs and bind related functions to the struct. This program 
fulfills this goal too. 
It 
- reads flights stored in JSON format (they have 3 fields)
- asks the user to choose a field
- lists all the values of the chosen field across the loaded planes
- ask the user to choose one of these values
- writes all the planes that have the chosen value at the chosen field into a csv file.
*/

package main
 
import (
    "encoding/json"
    "io/ioutil"
    "fmt"
    "bufio"
    "os"
    "strings"
)
 
type Flight struct {
    Departure string
    Arrival string
    Airline string
}

func (flight Flight) GetDeparture() string {
	return flight.Departure
}

func (flight Flight) GetArrival() string {
	return flight.Arrival
}

func (flight Flight) GetAirline() string {
	return flight.Airline
}

func (flight Flight) toString() string {
	return "A " + flight.Airline + " flight that \t departs from " + flight.Departure + 
        " and \t arrives in " + flight.Arrival + "."
}

func readJSON(filename string ) []byte {
    content, err := ioutil.ReadFile("infile.txt")
    if err != nil {
        fmt.Println("Error when opening file: ", err)
    }
    return content
}

func unmarshalContent(content []byte) []Flight {
    var flights []Flight
    err := json.Unmarshal(content, &flights)
    if err != nil {
        fmt.Println("Error during Unmarshal(): ", err)
    }
    return flights
}

func getJSONFromFile(filename string) []Flight {
    content := readJSON(filename)
    return unmarshalContent(content)
}

func contains(slice []string, element string) bool {
    joinedSlice := " " + strings.Join(slice, " ") + " "
    return strings.Contains(joinedSlice, " " + element + " ")
}

func getUserInputFrom(pleaseChoose string, from []string) string {
    scanner := bufio.NewScanner(os.Stdin)
	fmt.Println(pleaseChoose)
    for {
        scanner.Scan()
        chosen := scanner.Text()
        if contains(from, chosen) {
            return chosen
        }
        printMessageAndOptions("You can choose from these:", from)
    }
}

func printFlights(flights []Flight) {
    for _, flight := range flights {
        fmt.Println("  ", flight.toString())
    }
}

func printMessageAndOptions(message string, options []string) {
    fmt.Println(message)
    for _, option := range options {
        fmt.Println("  ", option)
    }
}

func greeting(filename string, flights []Flight) {
    fmt.Printf("The flights read from %s are\n", filename)
    printFlights(flights)
    fmt.Println("\nYou can choose some of them to be written to outfile.txt")
    fmt.Println("You can choose by departure, by arrival or by airline")
}

func (flight Flight) get(field string) string {
    switch field {
        case "departure": return flight.GetDeparture()
        case "arrival": return flight.GetArrival()
        case "airline": return flight.GetAirline()
    }
    return ""
}

func selectDistinctValues(allFlights []Flight, field string) []string {
    var selectedValues []string
    for _, flight := range allFlights {
        newValue := flight.get(field)
        if !contains(selectedValues, newValue) {
            selectedValues = append(selectedValues, newValue)
        }
    }
    return selectedValues
}

func selectFlights(allFlights []Flight, field, value string) []Flight {
    var selectedFlights []Flight
    for _, flight := range allFlights {
        if flight.get(field) == value {
            selectedFlights = append(selectedFlights, flight)
        }
    }
    return selectedFlights
}

func writeFlights(flightsToWrite []Flight) {
	stringToWrite := "Departure, Arrival, Airline \n"
    for _, flight := range flightsToWrite {
        stringToWrite = stringToWrite + flight.Departure + ", " + 
            flight.Arrival + ", " + flight.Airline + "\n"
    }
    stringToByte := []byte(stringToWrite)
    ioutil.WriteFile("outfile.txt", stringToByte, 0644)
}

func main() {
    inputFile := "infile.txt"
    outputFile := "outfile.txt"
    flights := getJSONFromFile(inputFile)

    greeting(inputFile, flights)

    // Ask to choose field
    pleaseChooseField := "Which one will it be? Type \"departure\", \"arrival\" or \"airline\"\n"
    flightFields := []string{"departure", "arrival", "airline"}
    choosenField := getUserInputFrom(pleaseChooseField, flightFields)

    // Ask to choose value
    possibleValues := selectDistinctValues(flights, choosenField)
    printMessageAndOptions("\nThe "+choosenField+"s of the flights are", possibleValues)
    pleaseChooseValue := fmt.Sprintf("Choose one of these %ss\n", choosenField)
    choosenValue := getUserInputFrom(pleaseChooseValue, possibleValues)

    // Select and write flights
    flightsToWrite := selectFlights(flights, choosenField, choosenValue)
    fmt.Printf("\nThe following flights are written to %s in csv format:\n", outputFile)
    printFlights(flightsToWrite)
    writeFlights(flightsToWrite)
}
