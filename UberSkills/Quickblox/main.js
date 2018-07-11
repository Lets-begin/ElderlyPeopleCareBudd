$(document).ready(function () {

    $("#loginForm").modal("hide");
    $("#chatbox").hide();
    QB.init(QBApp.appId, QBApp.authKey, QBApp.authSecret);
    debugger;
    //var email_id = $("[id$=ContentPlaceHolder1_HiddenField2]").val();
    //var password_id = $("[id$=ContentPlaceHolder1_HiddenField3]").val();
    var email_id = $("[id$=HiddenField2]").val();
    var password_id = $("[id$=HiddenField3]").val();

    var arglogin = { email: email_id, password: password_id };
    //debugger;
    loginaccount(arglogin);

    $('#Button1').on('click', function () {
        //debugger;
        var msg = $('#ContentPlaceHolder1_TextBox2').val().trim();
        $('#ContentPlaceHolder1_TextBox2').val('').focus();

        if (msg.length > 0) {
            sendMessage($("[id$=ContentPlaceHolder1_TextBox3]").val(), msg);
        }
    });

    $('#chatmodal_toggle').on('click', function () {
      
        $("#TextArea1").toggle();
    });

    $('#close_chatbox').on('click', function () {

        $("#chatbox").hide();
    });


    $('#Button2').on('click', function () {
        $("#chatbox").show();
        //$("#jabberbox").hide();
    });

});

function loginaccount(arg) {
    $("#loginForm").modal("show");
    //debugger;
    var params = { email: arg.email, password: arg.password };
    QB.createSession(params, function (err, result) {
        console.log("session creation successful");
        QB.users.get(params, function (err, user) {
            if (user) {
                var userjid = user.id + "-" + QBApp.appId + "@chat.quickblox.com";
                QB.chat.connect({ jid: userjid, password: arg.password }, function (err, roster) {
                    if (err) {
                        console.log(err);
                    }
                })

                QB.chat.onMessageListener = showMessage;
                $('#ContentPlaceHolder1_TextBox1').val('Me : CONNECTED at ' + getLocalTime());
                $("#loginForm").modal("hide");
            }
        })
    })
};

function sendMessage(user_id, val) {
    //console.log(user_id);
    var msg = {
        type: 'chat',
        body: val,
        extension: {
            time: Math.floor(Date.now() / 1000),
        }
    }
    var user_jid = user_id + "-" + QBApp.appId + "@chat.quickblox.com";
    QB.chat.send(user_jid, msg);
    showMessage(null, msg);
};

var userMessageLookup = [];
function showMessage(userId, msg) {
    var body = msg.body,
        time = msg.extension && msg.extension.time,
        messageDate = new Date(time * 1000);

    var message = "\n";
    message += (userId === null ? "Me" : userId);
    message += " (" + messageDate.getHours() + ':' + (messageDate.getMinutes().toString().length === 1 ? '0' + messageDate.getMinutes() : messageDate.getMinutes()) + ':' + messageDate.getSeconds() + ")";
    message += ": ";
    message += body;

    var currentText = $('#ContentPlaceHolder1_TextBox1').val();
    $('#ContentPlaceHolder1_TextBox1').val(currentText + message);
 
    var currentText = $('#TextArea1').val();
    $('#TextArea1').val(currentText + message);


};

function getLocalTime() {
    return (new Date).toTimeString().split(' ')[0];
};

function addroster(arg) {
    $("#loginForm").modal("show");
    QB.init(QBApp.appId, QBApp.authKey, QBApp.authSecret);
    QB.createSession({ email: arg.email, password: arg.password }, function (err, result) {
        QB.users.get({ email: arg.email, password: arg.password }, function (err, user) {

            if (user) {
                var userjid = user.id + "-" + QBApp.appId + "@chat.quickblox.com";

                QB.chat.connect({ jid: userjid, password: arg.password }, function (err, roster) {
                    QB.chat.roster.add(arg.jid, function () {
                        console.log('roster added succesfully');
                        $("#loginForm").modal("hide");
                    })
                })
            }
        })
    })
};

function accountupdate(arg) {
    $("#loginForm").modal("show");
    QB.init(QBApp.appId, QBApp.authKey, QBApp.authSecret);
    var params = { email: arg.email, password: arg.password };
    QB.createSession(params, function (err, result) {
        QB.users.get(params, function (err, user) {
            if (user) {
                var userid = user.id;
                QB.users.update(userid, { password: arg.newpassword, full_name: arg.name }, function (error, response) {
                    console.log("user updated succesfully");
                    $("#loginForm").modal("hide");
                })
            }
        })
    })
};








