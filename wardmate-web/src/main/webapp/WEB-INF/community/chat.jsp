<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<html lang="zh">
<head>
    <title>病友社区</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Expires" content="0"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-control" content="no-cache"/>
    <meta http-equiv="Cache" content="no-cache"/>
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/assets/layui/layui.css"/>
    <link rel="stylesheet" href="/assets/layer/theme/default/layer.css"/>
    <link rel="stylesheet" href="/css/common/rem.css"/>
    <link rel="stylesheet" href="/css/community/chat.css"/>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>

<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
        <%@include file="/WEB-INF/community/submenu.jsp"%>
        <div id="mainbody" class="row">
            <div class="col-sm-5 col-md-5">
                <ul id="friendstabhead" class="nav nav-tabs nav-pills">
                    <li class="active"><a href="#navgroup" data-toggle="tab">疾病群组<span class="badge">2</span></a></li>
                    <li><a href="#navfriends" data-toggle="tab">我的好友<span class="badge">3</span></a></li>
                    <li><a href="#navnotes" data-toggle="tab">证据笔记</a></li>
                </ul>
                <div id="friendstabbody" class="tab-content">
                    <div class="tab-pane fade active in" id="navgroup">
                        <div class="input-group">
                            <input type="text" placeholder="搜索群组" class="form-control">
                            <span class="input-group-btn"><button class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i></button></span>
                        </div>
                        <div class="list-group">
                            <!-- 这里存放群组列表 -->
                            <c:forEach items="${myIMGroups}" varStatus="index" var="IMGroup">
                                <a href="#" class="list-group-item" recipientId="${IMGroup.id}" messageType="GROUP"><div>
                                    <img src="${IMGroup.avatarURL}" class="img-rounded"><h4>${IMGroup.name}</h4><div class="middle"></div><span class="badge">0</span><span class="last">2017-02-13</span>
                                </div></a>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="navfriends">
                        <div class="input-group">
                            <input type="text" placeholder="搜索好友" class="form-control">
                            <span class="input-group-btn"><button class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i></button></span>
                        </div>
                        <div class="list-group">
                            <a href="#" class="list-group-item"><div>
                                <img src="/image/community/avatar04.jpg" class="img-rounded"><h4>小明</h4><div class="middle">小明：你好，这个药你服用了几个疗程？</div><span class="badge">1</span><span class="last">刚刚</span>
                            </div></a>
                            <a href="#" class="list-group-item"><div>
                                <img src="/image/community/avatar05.jpg" class="img-rounded"><h4>大刘</h4><div class="middle">我：在吗？</div><span class="badge">2</span><span class="last">昨天</span>
                            </div></a>
                            <a href="#" class="list-group-item"><div>
                                <img src="/image/community/avatar07.jpg" class="img-rounded"><h4>李老</h4><div class="middle">李老：这个帖子里提的药有相关证据吗？</div><span class="last">2017-02-13</span>
                            </div></a>
                        </div>
                    </div>
                    <div class="tab-pane fade rows" id="navnotes">微笔记
                        <div class="panel-group" id="tinynotes">
                            <div id="notePagination" total="${noteBookQueryResult.totalCount}"></div>
                            <c:forEach items="${noteBookQueryResult.noteSnippets}" var="snippet" varStatus="index">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a href="#snippet${snippet.id}" data-toggle="collapse" data-parent="#tinynotes" aria-expanded="true" class="">${snippet.title}</a>
                                        </h4>
                                    </div>
                                    <div id="snippet${snippet.id}" class="panel-collapse collapse" aria-expanded="true">
                                        <div class="panel-body">${snippet.content}</div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        收藏知识列表
                        <div class="list-group" id="favornotes">
                            <!-- 这里存放群组列表 -->
                            <a href="#" class="list-group-item"><div>
                                <img src="/image/community/avatar07.jpg" class="img-rounded"><span><h4>如何加强与医生沟通</h4>收藏自用户：管理员</span><span class="last">2017-02-13</span>
                            </div></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-7 col-md-7">
                <div id="chatpane" recipientId="1" messageType="GROUP">
                    <div id="chatpanetitle">
                        <h4 class="name"></h4>
                        <a href="#" data-toggle="tooltip" title="关闭聊天窗口" class="btn btn-danger closechatpane"><i class="fa fa-remove" aria-hidden="true"></i></a>
                        <button class="btn btn-info showInfo">显示在线用户</button>
                    </div>
                    <div id="chatpanebody">
                        <div class="showMoreHistory" style="text-align: center;"><a href="#" pageNo="1">显示更多历史消息</a></div>
                        <div class="messageContainer"></div>
                        <%--<div class="date">以上是历史消息</div>--%>
                    </div>
                    <div id="chatpaneinput">
                        <div class="toolbox">
                            <button class="btn btn-success"><i class="fa fa-meh-o">&nbsp;选择表情</i></button>
                            <button class="btn btn-warning"><i class="fa fa-file-photo-o">&nbsp;添加图片</i></button>
                            <button class="btn btn-info"><i class="fa fa-heart"></i></button>
                            <button class="btn btn-primary sendMessage"><i class="fa fa-send-o"></i>&nbsp;发送</button>
                        </div>
                        <textarea class="form-control chatcontents" rows="5" placeholder="请输入聊天内容[Ueditor设计]"></textarea>
                    </div>
                </div>
                <div class="notepane" style="display: none;">
                    <h2>糖尿病的日常护理</h2>
                    <p>忌食高甜度食品，一日三餐不要吃得太饱，戒烟戒酒，多运动</p>
                    <p>口服二甲双胍一般可降低过高血糖，部分人群需要关注低血糖风险</p>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/layer/layer.js" type="text/javascript"></script>
<script src="/assets/layui/layui.js" type="text/javascript"></script>
<%--<script src="/assets/sockjs.min.js" type="text/javascript"></script>--%>
<script src="/javascript/utils/formatdate.js" type="text/javascript"></script>

<script type="text/javascript">
    var websocketServer='ws://'+location.host+'${pageContext.request.contextPath}'+'/instantMessageServer';
    var currentUserId = ${sessionScope.LOGIN_USER_ID};
    var currentRecipientId;
    var currentMessageType;
    $('#navgroup .list-group-item').click(function () {
        currentRecipientId = $(this).attr('recipientId');
        currentMessageType = $(this).attr('messageType');
        //初始化聊天窗口，填充属性,清除内容
        $('#chatpane').attr('recipientId',currentRecipientId);
        $('#chatpane').attr('messageType',currentMessageType);
        $('#chatpanetitle h4').html('<i class="fa fa-users">&emsp;</i>'+$(this).find('h4').html());
        $('#chatpanebody .messageContainer').html('');
        //展示历史消息
        loadHistoryMessage(1);
        $('#chatpane').show();
        scrollChatPaneBodyToBottom();
    });
    $('#chatpane .closechatpane').click(function () {
        $('#chatpane').hide();
    });
    $('#chatpanebody .showMoreHistory a').click(function () {
        loadHistoryMessage($(this).attr('pageNo'));
        return false;
    });
    function scrollChatPaneBodyToBottom() {
        //聊天窗口自动滚动至底部，scrollTop()函数进行设置，prop('scrollHeight') prop('scrollTop')都能获取
        //$('#chatpanebody').scrollTop = $('#chatpanebody').scrollHeight; 不起作用，原因不明
        $('#chatpanebody').scrollTop($('#chatpanebody').prop('scrollHeight'));
    }
    function generateMessageHtml(message,currentUserId) {
        var messageHtml;
        if(currentUserId == message.from){ //自己发送的消息
            messageHtml =
                '<div class="me"><table border="0">\n' +
                '    <tr><td colspan="2" style="text-align: right;padding-right: 1rem;">用户ID:'+message.from+'</td>' +
                '        <td rowspan="2"><img class="avatar img-circle" src="/image/community/avatar07.jpg" alt="..."></td></tr>' +
                '    <tr><td><div class="rmessage">'+message.message+'</div></td>' +
                '        <td><div class="rightarrow"></div></td></tr>' +
                '</table></div>';
        }else {
            messageHtml =
                '<div class="others"><table border="0">' +
                '    <tr><td rowspan="2"><img class="avatar img-circle" src="/image/community/avatar05.jpg" alt="..."></td>' +
                '        <td colspan="2" style="text-align: left;padding-left: 1rem;">用户ID:'+message.from+'</td></tr>' +
                '    <tr><td><div class="leftarrow"></div></td>' +
                '        <td><div class="lmessage">'+message.message+'</div></td></tr>' +
                '</table></div>';
        }
        return messageHtml;
    }
    function loadHistoryMessage(pageNo) {
        var queryConditions = {
            toId:currentRecipientId,
            type:currentMessageType,
            pageNo:pageNo
        };
        $.ajax({
            url:'/community/getChatHistory',
            type:'post',
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            data:queryConditions,
            success:function (result) {
                var historyMessages = JSON.parse(result);
                if(historyMessages.length == 0){
                    layer.msg("已无更多消息");
                }else {
                    $.each(historyMessages,function (index, message) {
                        $('#chatpanebody .messageContainer').prepend(generateMessageHtml(message,currentUserId));
                    });
                    $('#chatpanebody .showMoreHistory a').attr('pageNo',++pageNo);
                }
            }
        });
    }
    layui.use('laypage', function() {
        var laypage = layui.laypage;
        laypage.render({
            elem: 'notePagination',
            count: $('#notePagination').attr('total'),
            //curr:$('#screenEvidenceForm .pageNo').val(),
            limit: 5,
            layout: ['prev', 'page', 'next', 'count'],
            jump: function (obj, first) {
                if (!first) {
                    var pageNo = obj.curr;
                    $.post('/knowledge/collect/getSnippet',{userId:currentUserId,pageNo:pageNo},function (result) {
                        $('#notePagination').nextAll().remove();
                        var snippets = JSON.parse(result);
                        $.each(snippets,function (index,element) {
                            var snippet =
                                '<div class="panel panel-default">' +
                                    '<div class="panel-heading">' +
                                        '<a href="#snippet'+element.id+'" data-toggle="collapse" data-parent="#tinynotes" aria-expanded="true" class="">'+element.title+'</a>' +
                                        '<button class="btn btn-primary deleteBtn" id="'+element.id+'">删除</button>'+
                                    '</div>' +
                                    '<div id="snippet'+element.id+'" class="panel-collapse collapse" aria-expanded="true">\n' +
                                        '<div class="panel-body">'+element.content+'</div>' +
                                    '</div>' +
                                '</div>';
                            $('#notePagination').after(snippet);
                        });
                        //添加事件代码不能放在外面
                        $('#tinynotes .deleteBtn').click(function () {
                            var _this = this;
                            //使用nth-child移除元素有诡异的问题
                            layer.confirm('确定删除这条笔记？', {icon: 3, title:'提示'}, function(index){
                                //分页在删除内容的情况下必须刷新才能更新按钮和技术，但不会引起bug，只会显示空白
                                $.get('/knowledge/collect/deleteSnippet',{noteId:$(_this).attr('id')},function () {
                                    layer.close(index);
                                    $(_this).parent().parent().remove();
                                });
                            });
                        });
                    });
                }
            }
        });
    });

</script>
<script type="text/javascript" src="/javascript/community/chat_websocket.js"></script>
</body>
</html>