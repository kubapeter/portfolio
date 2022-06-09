(function(){
  "use strict";

  const form = document.getElementById('convert');
  const input = document.getElementById('distance');
  const answer = document.getElementById('answer');

  form.addEventListener('submit', (event) => {
    event.preventDefault();

    const distanceMiles = parseFloat(input.value);

    if(distanceMiles){
      const distanceKm = (distanceMiles * 1.609344).toFixed(3);
      answer.innerHTML = `<h2>${distanceMiles} miles converts to ${distanceKm} kilometers</h2>`;
    }
    else{
      answer.innerHTML = '<h2>ERROR: You didn\'t type a number</h2>';
    }
  
  });

}());
