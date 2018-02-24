/**
 * Created by hedefu on 15/10/2017.
 */
function submit() {
    var keyword = $('#searchBar .keywords').val();
    if(keyword != null && keyword.length != 0){
        $('#search').submit();
    }
}
//fix second searchbox to the top of the window
var fixSearchBar = function(){
    var searchBar = $('#searchBar');
    $(searchBar).css('z-index',10);
    var startposition = searchBar.offset().top;
    $.event.add(window,"scroll",function(){
        var scrolldistance = $(window).scrollTop();
        if(scrolldistance>startposition){
            $(searchBar).css('position','fixed').css('top',0);
        }else{
            $(searchBar).css('position','').css('top','');
        }
    });
}
fixSearchBar();

// icheck checkbox and radio initialization
// $('#resultschooser-catagory input').iCheck({
//     checkboxClass: 'icheckbox_square-green'
// });
// $('#sourceScreener input').iCheck({
//     checkboxClass: 'icheckbox_square-orange'
// });
// $('#resultschooser-date input').iCheck({
//     checkboxClass: 'icheckbox_square-green',radioClass: 'iradio_square-blue',increaseArea: '20%' // optional
// });

//fix this treeview to the top of the window
var fixdetailsdir = function(){
    var height = $('#secondpanel').height();
    var menutitle = $('#details .menuwrapper');
    //menutitle.offset().top;//元素的hide remove操作使得这里获取的值始终为0，导致bug，这里使用了绝对值
    var startpos = 100;
    $.event.add(window,"scroll",function(){
        var scrolldistance = $(window).scrollTop();
        //调试用。。。
        // $('#secondpanel span').html(scrolldistance+'-start-'+startpos+'-panelheight-'+height);
        if(scrolldistance+height>startpos){
            $(menutitle).css('position','fixed');$(menutitle).css('top', '4.5rem');$(menutitle).css('width','19%');
        }else{
            $(menutitle).css('position','initial');$(menutitle).css('top','');$(menutitle).css('width','100%');
        }
    });
}
// $('#details .col-md-9 thead tr th').css('width','5rem');

$(function(){
    fixdetailsdir();
    $('#searchresults .testmedicine').click(function(){
        //展示药物信息
        $('#searchresults').hide();
        setTimeout(function(){
            $('#details').show();$('#secondpanel .tools').show();
        },1000);
    });
});