temperatures = {
    1: {"name": 'Monday',
        "temperature": 27.4},
    2: {"name": 'Tuesday', 
        "temperature": 26.3},
    3: {"name": 'Wednesday', 
        "temperature": 22.1},
    4: {"name": 'Thursday', 
        "temperature": 24.5},
    5: {"name": 'Friday',
        "temperature": 28.3},
    6: {"name": 'Saturday',
        "temperature": 26.2},
    7: {"name": 'Sunday',
        "temperature": 20.1}
}

def calculate_average_temperature(selection):
    """ Calculates the average temperature of the selected days
    
    Args:
        selection: list of dicts that contain a name of a day and a temperature

    Returns:
        float = the average temperature of the days in selected
        
    """
    print('Calculating average temperature...')
    temperature_sum = 0.0
    for day in selection:
        temperature_sum += day["temperature"]

    return temperature_sum / len(selection)

def convert_to_fahrenheit(temperature):
    """ Converts the temperature from Celsius to Fahrenheit

    Args:
        temperature: a temperature in Celsius

    Returns:
        float - the temperature in Fahrenheit.
        
    """
    print('Conversion from Celsius to Fahrenheit...')
    return (temperature * 1.8) + 32

def summarize_selection(selection):
    """ Summarizes the selection

    Args:
        selection: list of dicts that contain a name of a day and a temperature

    Returns:
        list of names of days the average temperature of the days in Celsius and Fahrenheit 

    """
    print_selected_days(selection)
    average_temperature = calculate_average_temperature(selection)
    fahrenheit_average = convert_to_fahrenheit(average_temperature)
    names = []
    for item in selection:
        names.append(item["name"])
    return names, average_temperature, fahrenheit_average

def print_selected_days(selection):
    print('You have selected the following ' + str(len(selection)) + ' days')
    days = []
    days = [day["name"] for day in selection]
    print(days)
    return selection

def display_temperatures():
    print("----- Daily Temperatures -----")
    for day in temperatures:
        print(f"{day}. {temperatures[day]['name'] : <9} | {temperatures[day]['temperature'] : >5}")
    print()

def select_days():
    display_temperatures()
    selection = []
    count = 1
    while count < 4:
        item = input('Select day number ' + str(count) + ' (from 1 to 7): ')
        if temperatures[int(item)] in selection: 
            print('day ' + item + ' has already been choosen, please choose another day')
            continue
        count += 1
        selection.append(temperatures[int(item)])
    return selection


'''
Here are some sample function calls to help you test your implementations.
Feel free to change, uncomment, and add these as you wish.
'''

def main():
    selection = select_days()
    print_selected_days(selection)

    average_temperature = calculate_average_temperature(selection)
    print("The average temperature of the selected days is: " + str( round(average_temperature, 2)) )

    fahrenheit_average = convert_to_fahrenheit(average_temperature)
    print("The average temperature in Fahrenheit is: " + str( round(fahrenheit_average, 2) ))

    names, average_temperature, fahrenheit_average = summarize_selection(selection)

if __name__ == "__main__":
    main()
