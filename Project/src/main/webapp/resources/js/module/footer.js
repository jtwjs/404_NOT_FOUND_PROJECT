var site_dropBtn = document.querySelector('.related_site');
var site_dropBtn_after = document.getElementById('related_site--box');
var site_wrap_list = document.getElementById('related_site--wrap');
site_dropBtn.addEventListener('click',function(){
    site_dropBtn_after.classList.toggle('open');

    if(site_dropBtn_after.style.textDecoration == 'underline'){
        site_dropBtn_after.style.textDecoration = 'none';
    }
    else{
        site_dropBtn_after.style.textDecoration = 'underline';
    }

    if(site_wrap_list.style.height == '150px'){
        site_wrap_list.style.height = "0px";
        site_wrap_list.style.border = 'none';
    } else {
        site_wrap_list.style.height = '150px';
        site_wrap_list.style.border = "1px solid rgba(239, 242, 247,0.6)";
        site_wrap_list.style.borderBottom = 'none';
    }
});