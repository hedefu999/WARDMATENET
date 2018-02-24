Date.prototype.format = function (fmt) {
    var o = {
        "M+":this.getMonth()+1,
        "d+":this.getDate(),
        "H+":this.getHours(),
        "m+":this.getMinutes(),
        "s+":this.getSeconds(),
        "q+":Math.floor((this.getMonth()+3)/3),//向下取整数,计算季度
        "S+":this.getMilliseconds()
    };
    var year = this.getFullYear();
    var yearstr = year+'';
    if( yearstr.length < 4){
        //年份不足四位在前面补0
        yearstr = '0000'.substr(0,4-yearstr.length)+yearstr;
    }
    if(/(y+)/.test(fmt)){
        //fmt中包含多个y
        fmt = fmt.replace(RegExp.$1, (yearstr+'').substr(4-RegExp.$1.length));
    }
    for (var k in o){
        if(new RegExp('('+k+')').test(fmt)){
            var result = '';
            if (RegExp.$1.length == 1){//支持03月和3月两种格式
                result = o[k];
            }else {
                result = ('00'+o[k]).substr((''+o[k]).length);
            }
            fmt = fmt.replace(RegExp.$1,result);//将正则表达式替换为最终结果
        }
    }
    return fmt;
}