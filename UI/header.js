
var dropBtn = document.getElementById('nav__category');
    dropBtn.addEventListener('mouseover',function(){
        document.getElementById('category_menu').style.height="365px";
        
    });

    dropBtn.addEventListener('mouseout',function(){
        document.getElementById('category_menu').style.height="0";
        
    });

    document.getElementById('category_btn').addEventListener('mouseover',function(){
        document.getElementById('sub_category--first').classList.remove('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.add('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });

    var totalCategory = document.getElementById('category_menu').getElementsByTagName('a');
    var mainCategory = document.getElementById('main_category--list').getElementsByTagName('a');
    for ( var i = 0 ; i < totalCategory.length; i++){
        totalCategory[i].addEventListener('mouseover',function(){
           this.classList.add('title-on');
        });
    };

    var subCategory = document.querySelector('.sub_category').getElementsByTagName('a');
    for ( var i = 0; i < subCategory.length; i++){
        subCategory[i].addEventListener('mouseout',function(){
            this.classList.remove('title-on');
        });
    }

 
    
    document.getElementById('main_category--first').addEventListener('mouseover',function(){
 
        document.getElementById('sub_category--first').classList.remove('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');

     
    });

    document.getElementById('main_category--second').addEventListener('mouseover',function(){        
   
        document.getElementById('sub_category--second').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');

    });

    document.getElementById('main_category--third').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--third').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });

    document.getElementById('main_category--fourth').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--fourth').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });

    document.getElementById('main_category--fifth').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--fifth').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });

    document.getElementById('main_category--sixth').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--sixth').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });

    document.getElementById('main_category--seventh').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--seventh').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });

    document.getElementById('main_category--eighth').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--eighth').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });

    document.getElementById('main_category--ninth').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--ninth').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--tenth').classList.add('hide');
        
        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--tenth').classList.remove('title-on');
    });
             
    document.getElementById('main_category--tenth').addEventListener('mouseover',function(){
   
        document.getElementById('sub_category--tenth').classList.remove('hide');
        document.getElementById('sub_category--first').classList.add('hide');
        document.getElementById('sub_category--second').classList.add('hide');
        document.getElementById('sub_category--third').classList.add('hide');
        document.getElementById('sub_category--fourth').classList.add('hide');
        document.getElementById('sub_category--fifth').classList.add('hide');
        document.getElementById('sub_category--sixth').classList.add('hide');
        document.getElementById('sub_category--seventh').classList.add('hide');
        document.getElementById('sub_category--eighth').classList.add('hide');
        document.getElementById('sub_category--ninth').classList.add('hide');

        document.getElementById('main_category--first').classList.remove('title-on');
        document.getElementById('main_category--second').classList.remove('title-on');
        document.getElementById('main_category--third').classList.remove('title-on');
        document.getElementById('main_category--fourth').classList.remove('title-on');
        document.getElementById('main_category--fifth').classList.remove('title-on');
        document.getElementById('main_category--sixth').classList.remove('title-on');
        document.getElementById('main_category--seventh').classList.remove('title-on');
        document.getElementById('main_category--eighth').classList.remove('title-on');
        document.getElementById('main_category--ninth').classList.remove('title-on');
    });
