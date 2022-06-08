(function(){
  "use strict";

  let currentImage = 0;
  const myPhotos = ['image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg', 'image5.jpg'];
  
  const content = document.getElementById('content');
  const next = document.getElementById('next');
  const previous = document.getElementById('previous');

  next.addEventListener('click', (e) =>{
    e.preventDefault();

    currentImage++;
    if(currentImage>myPhotos.length-1){ currentImage = 0; }

    swapImage();
  });
  previous.addEventListener('click', (e) => {
    e.preventDefault();

    currentImage--;
    if(currentImage<0){ currentImage = myPhotos.length-1; }

    swapImage();
  });

  function swapImage(e){
    const newSlide = document.createElement('img');
    newSlide.src = `slides/${myPhotos[currentImage]}`;
    newSlide.className = 'fadeinimg';

    const previousSlide = document.querySelector('img');

    content.appendChild(newSlide);
    content.removeChild(previousSlide);
  }

}());
