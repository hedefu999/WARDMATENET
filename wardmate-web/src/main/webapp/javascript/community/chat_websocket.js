if (!window.WebSocket){
    layer.msg("不支持websocket");
}
if (!("WebSocket" in window)) {
    alert("浏览器不能聊天");
}
var websocketService = null;
establishConnection();

$('#chatpaneinput .sendMessage').click(function () {
    var messageContent = $('#chatpaneinput textarea').val();
    if(messageContent != ''){
        var message = {
            from:currentUserId,
            to:$('#chatpane').attr('recipientId'),
            message:messageContent,
            type:$('#chatpane').attr('messageType'),
            dateTime:new Date().format('yyyy-MM-dd HH:mm:ss')
        };
        $('#chatpaneinput textarea').val('');
        sendMessage(message);
    }else {
        layer.msg('请输入聊天内容');
    }

});
function establishConnection() {
    //变量websocketServer定义在jsp中
    var WS = window.WebSocket || window.MozWebSocket;
    if (websocketService == null && WS){
        websocketService = new WS(websocketServer);
        websocketService.onopen = function (event) {};
        websocketService.onmessage = function (event) {
            parseMessage(event.data);
        }
        websocketService.onerror = function (event) { layer.msg("发生错误"); }
        websocketService.onclose = function (event) { shutdown(); }
    }else {
        layer.msg("连接已存在");
    }
}
function shutdown() {
    if(checkConnection()){
        websocketService.close();
        websocketService = null;
        layer.msg("连接已断开");
    }
}
function sendMessage(jsonMessage) {
    if (!checkConnection()){ establishConnection(); }
    websocketService.send(JSON.stringify(jsonMessage));
}
function checkConnection() {
    if(websocketService != null){return true}
    else {return false}
}
function parseMessage(message) {
    message = JSON.parse(message);
    if(message.type == 'P2P'){

    }
    if(message.type == 'GROUP'){
        if(message.to == currentRecipientId){
            $('#chatpanebody .messageContainer').append(generateMessageHtml(message,currentUserId));
            scrollChatPaneBodyToBottom();
        }else {
            //通过徽标提示未读新消息

        }
    }
    if(message.type == 'NOTIFICATION'){

    }
}