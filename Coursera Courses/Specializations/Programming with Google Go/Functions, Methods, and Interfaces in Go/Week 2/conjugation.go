/*
Please note that for etical reasons this is not the assignment submitted 
in the course. I use more or less the same knowledge that I used for the 
assignment, but the problem I solve is my own creation.

The program asks for a regular German or Spanish verb, and conjugates it. The 
main goal is to practice such functional programming principles as 
functions aas return values, 
functions as variables and 
functions as arguments.
*/


package main

import(
	"fmt"
)

func scanVerb() string {
	var input string
	_, err := fmt.Scan(&input)
	if err != nil {
		fmt.Println("Something went wrong", err)
	}
	return input
}

func validateVerb(verb string) bool {
	stem := verb[len(verb)-2:]
	if len(verb) < 3 || (stem != "en" && stem != "ar" && stem != "er" && stem != "ir"){
		fmt.Println("This is not a regular verb. Please try again.")
		return false
	}
	return true
}

func askForVerb() string {
	fmt.Println("\nEnter a regular German or Spanish verb.")
	fmt.Println("(You can try \"singen\" (\"to sing\" in German)" + 
		" or \"hablar\" (\"to speak\" in Spanish).)")
	
	verbIsValid := false
	var verb string
	
	for verbIsValid == false {
		verb = scanVerb()
		verbIsValid = validateVerb(verb)
	}
	return verb
}

func addPronouns(conjugation, pronouns []string) []string {
	for i, pronoun := range pronouns {
		conjugation[i] = pronoun
	}
	return conjugation
}

func addVerbs(conjugation, suffixes []string, stem string) []string {
	for i, suffix := range suffixes {
		conjugation[i] = conjugation[i] + " " + stem + suffix
	} 
	return conjugation
}

func abstractConjugator(pronouns, suffixes []string, stem string) []string {
	conjugation := []string{"","","","","",""}
	conjugation = addPronouns(conjugation, pronouns)
	conjugation = addVerbs(conjugation, suffixes, stem)
	return conjugation
}

func constructGermanConjugator() func (string) []string {
	germanPronouns := []string{"ich", "du", "er/sie", "wir", "ihr", "sie"}
	germanSuffixes := []string{"e", "st", "t", "en", "t", "en"}
	germanConjugation := func (stem string) []string {
		return abstractConjugator(germanPronouns, germanSuffixes, stem)
	}
	return germanConjugation
}

func findSpanishSuffixes(suffix string) []string {
	var matchingSuffixes []string
	switch suffix {
	case "ar": matchingSuffixes = []string{"o", "as", "a", "amos", "áis", "an"}
	case "er": matchingSuffixes = []string{"o", "es", "e", "emos", "éis", "en"}
	case "ir": matchingSuffixes = []string{"o", "es", "e", "imos", "ís", "en"}
	}
	return matchingSuffixes
}

func constructSpanishConjugator(suffix string) func (string) []string {
	spanishPronouns := []string{"yo", "tu", "el/ella", "nosotros", "vosotros", "ellos/ellas"}
	spanishSuffixes := findSpanishSuffixes(suffix)
	spanishConjugation := func (stem string) []string {
		return abstractConjugator(spanishPronouns, spanishSuffixes, stem)
	}
	return spanishConjugation
}

func specifyConjugator(suffix string) func (string) []string {
	if suffix == "en" {
		return constructGermanConjugator()
	} else {
		return constructSpanishConjugator(suffix)
	}
}

func applyConjugationRule(stem string, conjugator func(string) []string) []string {
	return conjugator(stem)
}

func findRuleAndApply(verb string) []string {
	stem, suffix := verb[:len(verb)-2], verb[len(verb)-2:]
	return applyConjugationRule(stem, specifyConjugator(suffix))
}

func printConjugation(verb string, conjugation []string) {
	fmt.Printf("The present tense indicative conjugation of the verb %s is the following.\n", verb)
	for _, conjugated := range conjugation {
		fmt.Println(conjugated)
	}
}

func main() {

	verb := askForVerb()
	conjugation := findRuleAndApply(verb)
	printConjugation(verb, conjugation)
}
