(function(){
  "use strict";

  const form = document.getElementById('convert');
  const input = document.getElementById('distance');
  const answer = document.getElementById('answer');
  const h1Tag = document.querySelector('h1');
  const pTag = document.querySelector('div p');
  const directions = document.getElementById('directions');

  let choiceConversion = 'miles';
  
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    
    const distance = parseFloat(input.value);
    
    if (distance && choiceConversion==='miles') {
      const conversion = (distance * 1.609344).toFixed(3);
      answer.innerHTML = `<h2>${distance} miles converts to ${conversion} kilometers</h2>`;
    }
    else if (distance && choiceConversion==='km') {
      const conversion = (distance/1.609344).toFixed(3);
      answer.innerHTML = `<h2>${distance} kilometers converts to ${conversion} miles</h2>`;
    }
    else {
      answer.innerHTML = '<h2>ERROR: You didn\'t type a number</h2>';
    }
  });
  
  window.addEventListener('keydown', (event) => {

    if(event.key.toLowerCase() === 'k'){
      h1Tag.innerText = 'Kilometers to Miles Converter';
      pTag.innerText = 'Type in a number of kilometers and click the button to convert the distance to miles.';
      directions.innerText = 'Press the "M" key to switch to mile conversion.';
      choiceConversion = 'km';
    }
    else if(event.key.toLowerCase() === 'm'){
      h1Tag.innerText = 'Miles to Kilometers Converter';
      pTag.innerText = 'Type in a number of miles and click the button to convert the distance to kilometers.';
      directions.innerText = 'Press the "K" key to switch to kilometer conversion.';
      choiceConversion = 'miles';
    }

  });

}());
