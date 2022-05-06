/*
Please note that for etical reasons this is not the assignment submitted 
in the course. I use roughly the same knowledge that I used for the 
assignment, but the problem I solve is my own creation.

The user can bulid a fleet of airplanes (slice of structs), and put a captain 
and a first officer in the cockpit (both structs). When the build is finished
the program finds the youngest and oldest of all the crews (sorting of slice) 
and prints their name, age and the name of the plane they are on. 
*/

package main

import (
    "fmt"
    "strconv"
    "sort"
)

type Person struct {
    name string
    age int
}

type Cockpit struct {
    nameOfAirplane string
    captain Person
    firstOfficer Person
}

func scanPersonalData(datatype, title string) string {
    var scanned string
    fmt.Println("Please enter the", datatype, "of the", title, "(or enter X to quit)")
    fmt.Scan(&scanned)
    return scanned
}

func createPerson(title string) Person {
    var scanned string
    var created Person

    scanned = scanPersonalData("name", title)
    if scanned == "X" {
        return Person{name: "X", age: -1}
    }
    created.name = scanned
    
    for {
        scanned = scanPersonalData("age", title)
        if scanned == "X" {
            return Person{name: "X", age: -1}
        }
        
        scannedNum, err := strconv.Atoi(scanned)
        if err != nil {
            fmt.Println("That is not an integer.")
            continue
        }
        created.age = scannedNum
        break
    }
    
    return created
}

func findPlane(person Person, fleet []Cockpit) string {
    for _, plane := range fleet {
        if (plane.captain.name == person.name && 
            plane.captain.age == person.age) ||
            (plane.firstOfficer.name == person.name && 
            plane.firstOfficer.age == person.age){
            return plane.nameOfAirplane
        }
    }
    return ""
}

func main() {
    var fleet = make([]Cockpit, 0)
    numerOfAirplanes := 0
    
    for {
        var scanned string
        fmt.Println("Please enter the name of airplane", numerOfAirplanes + 1, "(or enter X to quit)")
        fmt.Scan(&scanned)
        if scanned == "X" {
            break
        }
        cockpit := Cockpit{nameOfAirplane: scanned}
        fleet = append(fleet, cockpit)
        
        var scannedCaptain = createPerson("captain")
        if scannedCaptain.name == "X" && scannedCaptain.age == -1 {
            fleet = fleet[:len(fleet) - 1]
            break
        }
        var scannedFirstOfficer = createPerson("firstOfficer")
        if scannedFirstOfficer.name == "X" && scannedFirstOfficer.age == -1 {
            fleet = fleet[:len(fleet) - 1]
            break
        }
        fleet[numerOfAirplanes].captain = scannedCaptain
        fleet[numerOfAirplanes].firstOfficer = scannedFirstOfficer
        
        numerOfAirplanes += 1
    }
    
    fmt.Println("You finished creating your fleet.")
    fmt.Println("The numer of airplanes in your fleet is", numerOfAirplanes)
    
    if len(fleet) > 0 {
        // collecting personnel from all the crews
        var allPersonnel []Person
        for _, plane := range fleet {
            allPersonnel = append(allPersonnel, plane.captain)
            allPersonnel = append(allPersonnel, plane.firstOfficer)
        }
        
        // sorting 
        sort.Slice(allPersonnel, func(i, j int) bool { 
            return allPersonnel[i].age < allPersonnel[j].age })
        young := allPersonnel[0]
        old := allPersonnel[len(allPersonnel) - 1]
        
        // print youngest and oldest
        fmt.Println("The youngest of the personnel,", 
            young.name, 
            "is of age", young.age, 
            "and is on the plane", findPlane(young, fleet))
        fmt.Println("The oldest of the personnel,", 
            old.name, 
            "is of age", old.age, 
            "and is on the plane", findPlane(old, fleet))
    }
}
