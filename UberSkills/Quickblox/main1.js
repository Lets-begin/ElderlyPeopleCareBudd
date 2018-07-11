


function createaccount(arg) {
    $("#loginForm").modal("show");
    QB.init(QBApp.appId, QBApp.authKey, QBApp.authSecret);

    QB.createSession(function (err, result) {
        var params = { email: arg.email, password: arg.password,full_name:arg.full_name };
        QB.users.create(params, function (err, result) {
            console.log("acccount creation successful");
            $("#loginForm").modal("hide");
        })
    })
};

$(document).ready(function () {
  
    $("#loginForm").modal("hide");
});

