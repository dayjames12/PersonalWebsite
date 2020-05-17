
var total;  //total posts

function regVal(){
    var togo;
    var user = {
        'name' : document.register.username.value,
        'email' : document.register.email.value,
        'pass': document.register.password.value,
        'confirmPass' : document.register.confirmPassword.value
    }
    togo = nameVal(user.name,3);
    if(togo === false)
        return false;
    
    togo = passVal(user.pass,user.confirmPass,8)
    if(togo === false)
        return false;
    var fj  = JSON.stringify(user,null,2);
    users.add(fj);
    // console.log(fj);
    return (user);
}

function loginVal(){
    var togo;
    var user = {
        'name' : document.login.username,
        'pass' : document.login.password
    }

     togo = nameVal(user.name,3);
     if(togo=== false)
        return false;
    togo = loginPassVal(user.pass, 8);
    if(togo === false)
        return togo;
    console.log(user.name);
    console.log(user.pass);
    var fj  = JSON.stringify(user,null,2);
    console.log(fj);
    return (user);
}
function nameVal(name,min){
    var length = name.length;
    if (length < min){
        alert("Username must be 3 or more alphanumeric characters");
        return false;
    }
    // console.log('Username: ', name);
    return true;
}

function passVal(a,b,min){
    var pass = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,24}$/;
    if (a != b){
        alert("Passwords don't match");
        return false;
    }
    if (!a.match(pass)){
        alert("Password must include 1 uppercase letter, 1 number, and 1 special character");
        return false;
    }
    // console.log('Password: ', a);

    return true;
}

function loginPassVal(a,min){
    var length = a.length;
    if (length < min){
        alert("Password must be 8 or more characters");
        return false;
    }
    // console.log('Password: ', a);
    return true;
}



