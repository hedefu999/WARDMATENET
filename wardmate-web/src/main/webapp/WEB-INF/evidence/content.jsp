<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>证据内容</title>
</head>
<body>
<div class="toolBar">
    <a href="#"><i class="fa fa-star"></i>&nbsp;收藏到笔记</a>&emsp;
    <a href="#"><i class="fa fa-thumbs-o-up"></i>&nbsp;此内容有帮助</a>&emsp;
    <a href="#"><i class="fa fa-commenting-o"></i>&nbsp;评价此文章</a>&emsp;
    <a href="#"><i class="fa fa-share-alt"></i>&nbsp;复制文章链接</a>
</div>
${contentId}
<div id="leftMenu">
    左侧目录
</div>
<div id="content">
    正文内容
    <%@include file="evidencepages/20180203001.html"%>
</div>
</body>
<script src="/assets/bootstrap/treeview/bootstrap-treeview.min.js" type="text/javascript"></script>
<script>
    //treeview of contents,evidence articles,namely.
    var articlemenu = [{
        text: '药物介绍',href: '#parent4',tags: ['0']
    },{
        text: '药物分析',href: '#parent1',tags: ['4'],
        nodes: [{
            text: '药理分析',href: '#child1',tags: ['2'],
            nodes: [{
                text: '作用',href: '#grandchild1',tags: ['0']
            },{
                text: 'sinomed',href: '#grandchild2',tags: ['0']
            }]
        },{
            text: '毒理分析',href: '#child2',tags: ['0']
        }]
    },{
        text: '适应症',href: '#parent2',tags: ['0']
    },{
        text: '不良反应',href: '#parent2',tags: ['0']
    },{
        text: '经济学评价',href: '#parent4',tags: ['0']
    },{
        text: 'EVIDEM循证评价',href: '#sectable',tags: ['0']
    },{
        text: '参考文献',href: '#parent5',tags: ['0']
    }];
    //generate a treeview
    $('#contentmenu').treeview({
        color: "#428bca",
        expandIcon: 'fa fa-chevron-circle-right',
        collapseIcon: 'fa fa-chevron-circle-down',
        nodeIcon: 'fa fa-bookmark-o',
        data: articlemenu
    });
    $('#searchresults .testmedicine').click(function(){
        //展示药物信息
        $('#searchresults').hide();
        setTimeout(function(){
            $('#details').show();$('#secondpanel .tools').show();
        },1000);
    });
</script>
</html>
