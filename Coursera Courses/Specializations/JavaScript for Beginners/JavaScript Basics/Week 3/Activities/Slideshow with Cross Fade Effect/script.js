(function(){
  "use strict";

  let currentImage = 0;
  const myPhotos = ['image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg', 'image5.jpg'];
  
  const content = document.getElementById('content');
  const nextButton = document.getElementById('next');
  const previousButton = document.getElementById('previous');

  nextButton.addEventListener('click', (event) => {
    event.preventDefault();

    /*currentImage++;
    if(currentImage>myPhotos.length-1){ currentImage = 0; }*/
    currentImage = (currentImage + 1) % myPhotos.length;

    swapImage();
  });
  
  previousButton.addEventListener('click', (event) => {
    event.preventDefault();

    currentImage--;
    if(currentImage<0){ currentImage = myPhotos.length-1; }
    //currentImage = (currentImage - 1 + myImages.length) % myImages.length;

    swapImage();
  });

  function swapImage(event){
    const newSlide = document.createElement('img');
    newSlide.src = `slides/${myPhotos[currentImage]}`;
    newSlide.className = 'fadeinimg';

    const previousSlide = document.querySelector('img');

    content.appendChild(newSlide);
    content.removeChild(previousSlide);
  }

}());
