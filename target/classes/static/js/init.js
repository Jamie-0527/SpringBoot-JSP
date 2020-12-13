$(document).ready(function(){
    /*学生端的初始化*/
    $("#initStudent").click(function(){
        var s_pwd= $("#s_pwd").val()
        var s_pwdConfirm = $("#s_pwdConfirm").val()

        if (s_pwd.length<6){
            alert("密码至少要六位以上！");
            return false;
        }else if (s_pwd != s_pwdConfirm){
            alert("输入的两次密码不一致！");
            return false;
        } else {
            return true;
        }
    });

    /*教师端的初始化*/
    $("#initTeacher").click(function(){
        var t_pwd= $("#t_pwd").val()
        var t_pwdConfirm = $("#t_pwdConfirm").val()

        if (t_pwd.length<6){
            alert("密码至少要六位以上！");
            return false;
        }else if (t_pwd != t_pwdConfirm){
            alert("输入的两次密码不一致！");
            return false;
        }else {
            return true;
        }
    });

    /*企业人员端的初始化*/
    $("#initCompany").click(function(){
        var c_pwd= $("#c_pwd").val()
        var c_pwdConfirm = $("#c_pwdConfirm").val()

        if (c_pwd.length<6){
            alert("密码至少要六位以上！");
            return false;
        }else if (c_pwd != c_pwdConfirm){
            alert("输入的两次密码不一致！");
            return false;
        }else {
            return true;
        }
    });

    /*添加学生*/
    $("#addStudent").click(function(){
        var addStudentId= $("#addStudentId").val()
        var addStudentName = $("#addStudentName").val()

        if(addStudentId.length==0 || addStudentName.length==0){
            alert("输入信息不能为空！");
            return false;
        }else {
            return true;
        }
    });

    /*添加教师*/
    $("#addTeacher").click(function(){
        var addTeacherId= $("#addTeacherId").val()
        var addTeacherName = $("#addTeacherName").val()

        if(addTeacherId.length==0 || addTeacherName.length==0){
            alert("输入信息不能为空！");
            return false;
        }else {
            return true;
        }
    });

    /*添加企业人员*/
    $("#addPerson").click(function(){
        var addComPersonId= $("#addComPersonId").val()
        var addComPerson = $("#addComPerson").val()

        if(addComPersonId.length==0 || addComPerson.length==0){
            alert("输入信息不能为空！");
            return false;
        }else {
            return true;
        }
    });

    /*更新账户密码*/
    $("#updatePassword").click(function(){
        var old_pwd= $("#old_pwd").val()
        var s_pwd= $("#s_pwd").val()
        var s_pwdConfirm = $("#s_pwdConfirm").val()

        if(old_pwd.length==0 ){
            alert("新密码不能为空！");
            return false;
        }else if(s_pwd.length==0 || s_pwdConfirm.length==0){
            alert("新密码不能为空！");
            return false;
        }else if (s_pwd.length<6){
            alert("新密码过短！");
            return false;
        }else if (s_pwd != s_pwdConfirm){
            alert("输入的两次密码不一致！");
            return false;
        }else {
            return true;
        }
    });
});

