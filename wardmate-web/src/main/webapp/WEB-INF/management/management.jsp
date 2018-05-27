<%--
  Created by IntelliJ IDEA.
  User: hedefu
  Date: 07/10/2017
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<html>
<head>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>健康管理</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/assets/awesomefonts/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="/css/management/healman.css" type="text/css"/>
</head>
<body>
<%@include file="/WEB-INF/common/navbar.jsp"%>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
    <%@include file="/WEB-INF/management/submenu.jsp"%>
    <div class="col col-xs-8" id="leftColumn">
        <div class="healthCard">
            <div class="row healStatus">
                <div class="col col-xs-2 healBook"><img src="/image/management/healBook.png"></div>
                <div class="col col-xs-6" style="padding: 1.5rem 0;">
                    <span>病情简述：<a>2型糖尿病</a>合并<a>轻度糖尿病足</a></span><br>
                    <span>使用药物：<a>二甲双胍</a> <a>达格列净 >></a></span><br>
                    <span>其他疗法：<a>饭后散步 苦瓜 >></a></span><br>
                    <span>健康记录：84%已完成 上次记录：一天前</span><br>
                    <div class="col-xs-4" style="padding: 0;"><span>资料完整度:</span></div>
                    <div class="col-xs-8" style="padding: 0;">
                        <div class="progress" style="height: 1rem;margin-top: 0.5rem;"><div class="progress-bar progress-bar-success" role="progressbar" style="width:80%;"></div></div>
                    </div>
                </div>
                <div class="col col-xs-4 puppet">
                    <div class="col col-xs-7 description"><a>心脏功能受损</a><br><a>轻度糖尿病足</a><br><br><a>病情设置>></a></div>
                    <div class="col col-xs-5"><img src="/image/management/puppet.png"></div>
                </div>
            </div>
        </div>
        <div class="timeMachine">
            <h4 class="title">添加健康记录</h4><hr>
            <div class="row timeCapsule">
                <div class="timeLineTitle">时<br>间<br>线</div>
                <div class="timeThread"></div>
                <div class="col col-xs-3 timeLine">
                    <p><a class="timeNode">添加新纪录</a></p>
                    <p><a class="timeNode">昨天</a></p>
                    <p><a class="timeNode">前天</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                    <p><a class="timeNode">2017-12-12</a></p>
                </div>
                <div class="col col-xs-9 recordCard">
                    <div class="input-group">
                        <input type="text" placeholder="搜索以添加" class="form-control">
                        <span class="input-group-btn"><button class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i></button></span>
                    </div>
                    <div class="recordItems">
                        <p><span>在用药物：</span>二甲双胍<a>✕</a> 达格列净<a>✕</a></p>
                        <p><span>今日饮食：</span>米饭<a>✕</a> 黄酒<a>✕</a> 鸡肉<a>✕</a></p>
                        <p><span>运动疗法：</span>饭后散步<a>✕</a></p>
                    </div>

                </div>
            </div>
        </div>
        <div class="statitics">
            <h4 class="title">健康数据统计</h4><hr>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <span>血糖检测</span>
                        <a href="#chart01" data-toggle="collapse" class="chartTitleLink">点击展开 ▼</a>
                    </h4>
                </div>
                <div id="chart01" class="panel-collapse collapse" aria-expanded="true">
                    <canvas class="canvas"></canvas>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <span>体重变化</span>
                        <a href="#chart02" data-toggle="collapse" class="chartTitleLink">点击关闭 ▲</a>
                    </h4>
                </div>
                <div id="chart02" class="panel-collapse collapse in" aria-expanded="true">
                    <div class="panel-body chartDiv">
                        <canvas class="canvas"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col col-xs-4" id="rightColumn">
        <h2>病友推荐</h2>
        <div class="input-group">
            <input type="text" placeholder="搜索病友" class="form-control">
            <span class="input-group-btn"><button class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i></button></span>
        </div>
        <div class="list-group">
            <a class="list-group-item"><div>
                <img src="/image/community/avatar04.jpg" class="img-rounded"><h4>小明</h4><div class="middle">
                当前病情：糖尿病足<br>在用药物：西格列汀联合二甲双胍...<br>年龄：59
            </div><span class="rightCorner">相似度：高</span>
            </div></a>
            <a class="list-group-item"><div>
                <img src="/image/community/avatar05.jpg" class="img-rounded"><h4>大刘</h4><div class="middle">
                当前病情：2型糖尿病 视网膜病变<br>在用药物：甘精胰岛素 ...<br>年龄：...
            </div><span class="rightCorner">相似度：中</span>
            </div></a>
            <a class="list-group-item"><div>
                <img src="/image/community/avatar07.jpg" class="img-rounded"><h4>李老</h4><div class="middle">
                当前病情：2型糖尿病<br>在用药物：运动疗法 ...<br>年龄：47
            </div>
            </div></a>
        </div>
        <h2>药物推荐</h2>
        <div class="list-group">
            <div class="list-group-item">
                <h4><a>系统评价：达格列净降低2型糖尿病...</a></h4>
                <p>...达格列净与安慰剂或二甲双胍相比能显著降低2型糖尿病患者的收缩压...</p>
            </div>
            <div class="list-group-item">
                <a><h4>临床指南：2013版糖尿病防治指南解读</h4></a>
                <p>...内容包括糖尿病诊断标准、代谢控制目标、生活方式干预、降糖药物的应用...</p>
            </div>
        </div>
    </div>
</div>


<script src="/assets/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="/assets/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/chart/Chart.bundle.min.js" type="text/javascript"></script>
<script>
    $('#navbar .nav li:nth-child(5)').addClass('active');

    var yaxisArray01 = ['空腹','早餐后','午餐前','午餐后','晚餐前','晚餐后'];
    var diabetesLevel = [5.1,7.2,4.9,6.9,4.7,5.2];
    var config01 = {
        type:'line',
        data:{
            labels:yaxisArray01,
            datasets:[{
                label:'测量值',
                backgroundColor:'#f1ad4e',
                borderColor:'#f1ad4e',
                data:diabetesLevel,
                fill:false
            }]

        },
        options:{
            responsive:true,
            title:{
                display:true,
                text:'上一次全天血糖监测记录'
            },
            tooltips:{
                mode:'index',
                intersect:false
            },
            hover:{
                mode:'nearest',
                intersect:true
            },
            scales:{
                xAxes:[{
                    display:true,
                    scaleLabel:{
                        display:true,
                        labelString:''
                    }
                }],
                yAxes:[{
                    display:true,
                    scaleLabel:{
                        display:true,
                        labelString:'记录值（mol/L）'
                    }
                }]
            }
        }
    };
    var ctx = $('#chart01 .canvas')[0].getContext('2d');
    window.myLine = new Chart(ctx,config01);

    var months = ['1','2','3','4','5','6','7','8','9','10','11','12'];
    var config02 = {
        type:'line',
        data:{
            labels:months,
            datasets:[{
                label:'当月记录',
                backgroundColor:'#428bca',
                borderColor:'#357ebd',
                data:[126,127,128,130,128,128,127,128,129,126,127,128],
                fill:false
            }]

        },
        options:{
            responsive:true,
            title:{
                display:true,
                text:'体重变化曲线'
            },
            tooltips:{
                mode:'index',
                intersect:false
            },
            hover:{
                mode:'nearest',
                intersect:true
            },
            scales:{
                xAxes:[{
                    display:true,
                    scaleLabel:{
                        display:true,
                        labelString:'月份'
                    }
                }],
                yAxes:[{
                    display:true,
                    scaleLabel:{
                        display:true,
                        labelString:'体重（单位：斤）'
                    }
                }]
            }
        }
    };
    var ctx = $('#chart02 .canvas')[0].getContext('2d');
    window.myLine = new Chart(ctx,config02);




</script>
</body>
</html>
