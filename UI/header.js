
var dropBtn = document.getElementById('nav__category');
    dropBtn.addEventListener('mouseover',function(){
        document.getElementById("category_menu").classList.remove("hide-category");
        document.getElementById("category_menu").classList.add("show-category");
    });
    dropBtn.addEventListener('mouseout',function(){
        document.getElementById("category_menu").classList.remove("show-category");
        document.getElementById("category_menu").classList.add("hide-category");
    });


    