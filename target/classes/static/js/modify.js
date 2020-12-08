$(document).ready(function(){
    $("#infoManagement").click(function(){
        $("#a1,#a2,#a3").slideToggle();
        $("#infoManagement").toggleClass("active");
    });

    $("#userManagement").click(function(){
        $("#b1,#b2,#b3").slideToggle();
        $("#userManagement").toggleClass("active");
    });
});