(function(){
  "use strict";

  const myImages = ['image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg', 'image5.jpg'];
  let currentImage = 0;
  const next = document.getElementById('next');
  const previous = document.getElementById('previous');

  next.addEventListener('click', nextPhoto);
  previous.addEventListener('click', previousPhoto);

  function nextPhoto() {
    currentImage = (currentImage + 1) % myImages.length;
    const img = document.getElementById('myimage');
    img.src = myImages[currentImage];
  }

  function previousPhoto() {
    currentImage = (currentImage - 1 + myImages.length) % myImages.length;
    const img = document.getElementById('myimage');
    img.src = myImages[currentImage];
  }

}());
