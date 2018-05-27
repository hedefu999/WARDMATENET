<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
    <%--自定义layer样式--%>
    body .mylayer .layui-layer-title{background-color:#ececec;color:#008080; border: none;}
    body .mylayer .layui-layer-content{background-color: #f7f7f7;}
    body .mylayer .layui-layer-btn{background-color: #f7f7f7;}
    body .mylayer .layui-layer-btn a{background: #008080;width: 100%;text-align: center;}

    .snippetSavePane{font-size: 1.8rem;}
    .snippetSavePane p{text-indent: 0;font-size: 2rem;color: #008080;}
    .snippetSavePane .title{width: 100%;margin-bottom: 2rem;border: 0.2rem solid #00c4ff;border-radius: 0.5rem;}
    .snippetSavePane .content{width: 100%;height:10rem;border: 0.2rem solid #ffa78d;border-radius: 0.5rem;}
</style>
<script type="text/javascript" src="/assets/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/assets/layer/layer.js"></script>
<%--在网页中自定义右键菜单，使用了bootstrap menu,同类的还有jquery-contextMenu--%>
<script type="text/javascript" src="/assets/bootstrap/bootstrapmenu.min.js"></script>
<script type="text/javascript">
    //目标页面只需要在顶级div添加 class="knowledge" 和%@include file="/WEB-INF/common/saveSnippet.jsp"%> 两项操作便可以添加保存笔记功能

    //验证用户是否登录
    //缺少引号在获取值为空时会引起javascript编译错误
    var userId = '${sessionScope.LOGIN_USER_ID}';
    if (userId != null && userId != ''){
        //右键菜单演示文档：http://dgoguerra.github.io/bootstrap-menu/demos.html
        new BootstrapMenu('.knowledge',{
            actions:[{
                name:'保存到笔记',
                onClick:function () {
                    saveSnippet(userId);
                }
            }]
        });
    }
    function saveSnippet(userId) {
        var selecteObj = window.getSelection();
        //1 选择文本的变色标记效果，暂未开发存入数据库的功能，刷新后无效
        var parentNode = selecteObj.extentNode.parentNode;
        var entireContent = $(parentNode).html();
        var start = selecteObj.anchorOffset;
        var end = selecteObj.focusOffset;
        var before = entireContent.substring(0,start);
        var after = entireContent.substring(end);
        var selectStr = selecteObj.toString();
        var resultToSet = before+'<span style="background-color: #ffe000;">'+selectStr+'</span>'+after;


        //selecteObj.getRangeAt(0)可以获取选择区域的更详细信息
        if(selectStr != null && selectStr != ''){
            //2 显示添加标题的对话框
            var saveSnippetPaneHtml = '<div class="snippetSavePane"><p>编辑标题（限50字）</p><input class="title" type="text" placeholder="请输入标题"><br><p>编辑内容</p><textarea class="content">'+selectStr+'</textarea></div>';
            layer.open({
                title:'添加微笔记',
                anim:1,
                shadeClose:true,
                offset:'t',
                skin:'mylayer',
                area:['60rem','40rem'],
                content:saveSnippetPaneHtml,
                yes:function (index,layero) {
                    var title = $('.snippetSavePane .title').val();
                    var content = $('.snippetSavePane .content').html();
                    var noteSnippet = {
                        userId:userId,
                        title:title,
                        content:content
                    };
                    if(title != '' && content != ''){
                        $.ajax({
                            url:'/knowledge/collect/snippet',
                            type:'post',
                            contentType:"application/json;charset=UTF-8",
                            data:JSON.stringify(noteSnippet),
                            success:function (result) {
                                try {
                                    var resultObj = JSON.parse(result);
                                    if (resultObj.title == 'feedback'){
                                        layer.close(index);
                                        //标记刚才选中的内容
                                        $(parentNode).html(resultToSet);
                                        layer.msg(resultObj.content,{icon:1,offset:'t'});
                                    }
                                } catch (error) {
                                    console.log('未登录，返回了HTML,不能进行JSON解析');
                                    layer.open({
                                        type:1,
                                        closeBtn:1,
                                        offset:'t',
                                        anim:6,
                                        shadeClose:true,
                                        maxmin: true, //开启最大化最小化按钮
                                        area: ['100rem', '60rem'],
                                        content:result
                                    });
                                }
                            }
                        });
                    }else {
                        alert("请不要遗漏内容");
                    }

                }
            });
        }else {
            layer.msg("请先选择内容",{icon:0,offset:'rt'});
        }
    }
</script>
