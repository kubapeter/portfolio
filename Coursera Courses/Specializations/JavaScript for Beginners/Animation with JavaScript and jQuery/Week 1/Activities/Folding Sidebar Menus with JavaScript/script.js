(function() {
    "use strict";
    
    const submenus = document.querySelectorAll("ul li ul");
    //const menuLinks = document.querySelectorAll(".menuLink");
    
    
    function hideSubmenus() {
        const submenus = document.querySelectorAll("ul li ul");
        
        for (let i = 0; i < submenus.length; i++) {
            submenus[i].className = "hide-menu";
        }
    }

    hideSubmenus();
 
    /*
    const menuLinks = document.querySelectorAll(".menuLink");
    
    for (let i = 0; i < menuLinks.length; i++) {
        menuLinks[i].addEventListener('click', function(event) {
            event.preventDefault();
            const thisMenu = this.parentNode.querySelector('ul');
            if (thisMenu.classList.contains('hide-menu')) {
                hideSubmenus();
                thisMenu.className = "show-menu";
            }
            else {
                thisMenu.className = "hide-menu";
            }
        
        });
    }*/

}());
//})();
