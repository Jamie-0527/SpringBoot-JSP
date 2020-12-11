$(document).ready(function(){
    $("#infoManagement").click(function(){
        $("#a1,#a2,#a3").slideToggle();
        $("#infoManagement").toggleClass("active");
    });

    $("#userManagement").click(function(){
        $("#b1,#b2,#b3").slideToggle();
        $("#userManagement").toggleClass("active");
    });

    $("#personalCenter").click(function(){
        $("#b4").slideToggle();
        $("#personalCenter").toggleClass("active");
    });

    $("#studentPersonalCenter").click(function(){
        $("#b4,#b5").slideToggle();
        $("#studentPersonalCenter").toggleClass("active");
    });

    $("#teacherPersonalCenter").click(function(){
        $("#b4,#b5").slideToggle();
        $("#teacherPersonalCenter").toggleClass("active");
    });

    $("#companyPersonalCenter").click(function(){
        $("#b4,#b5").slideToggle();
        $("#companyPersonalCenter").toggleClass("active");
    });
});