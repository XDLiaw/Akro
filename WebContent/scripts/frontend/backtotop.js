$(function(){
    $("#gotop").click(function(){
        jQuery("html,body").animate({
            scrollTop:0
        },500); /*往上捲動的速度0是最快,數字越大捲動速度越慢*/
    });
    $(window).scroll(function() {
        if ( $(this).scrollTop() > 300){ /*目前的位置距離網頁頂端有多遠，若大於300px就會將顯示出來，小於就會隱藏。*/
            $('#gotop').fadeIn("fast");
        } else {
            $('#gotop').stop().fadeOut("fast");
        }
    });
});