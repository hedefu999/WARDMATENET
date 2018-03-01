/**
 * Created by hedefu on 15/10/2017.
 */
function submit() {
    var keyword = $('#searchBar .keywords').val();
    if(keyword != null && keyword.length != 0){
        $('#simpleSearchForm').submit();
    }
}
//fix second searchbox to the top of the window
var fixSearchBar = function(){
    var searchBar = $('#searchBar');
    $(searchBar).css('z-index',10);
    var searchBarTop = searchBar.offset().top;

    var screenToolBox = $('#searchResults .screenToolBox');
    $(screenToolBox).css('z-index',10);
    var screenToolBoxTop = screenToolBox.offset().top;

    $.event.add(window,"scroll",function(){
        var scrolldistance = $(window).scrollTop();
        if(scrolldistance>searchBarTop){
            $(searchBar).css('position','fixed').css('top',0);
            $(screenToolBox).css('position','fixed').css('top',screenToolBoxTop - searchBarTop).css('width','23%');
        }else{
            $(searchBar).css('position','').css('top','');
            $(screenToolBox).css('position','').css('top','').css('width','');
        }
    });
}
fixSearchBar();

function screenEvidence() {
    $('#screenEvidenceForm .pageNo').val(1);
    $('#screenEvidenceForm').submit();
}
layui.use('laypage', function() {
    var laypage = layui.laypage;
    laypage.render({
        elem: 'pageButtonTop',
        count: $('#pageButtonTop').attr('total'),
        curr:$('#screenEvidenceForm .pageNo').val(),
        limit:$('#screenEvidenceForm .countOnePage').val(),
        layout:	['prev', 'page', 'next', 'count'],
        jump: function (obj,first) {
            //直接打印obj在chrome中看不出curr的变化，奇怪... 20180225
            $('#screenEvidenceForm .pageNo').val(obj.curr);
            if(!first){
                $('#screenEvidenceForm').submit();
            }
        }
    });
    laypage.render({
        elem: 'pageButtonBottom',
        count: $('#pageButtonBottom').attr('total'),
        curr:$('#screenEvidenceForm .pageNo').val(),
        limit:$('#screenEvidenceForm .countOnePage').val(),
        layout:	['prev', 'page', 'next', 'count', 'skip'],
        jump: function (obj,first) {
            //直接打印obj在chrome中看不出curr的变化，奇怪... 20180225
            $('#screenEvidenceForm .pageNo').val(obj.curr);
            if(!first){
                $('#screenEvidenceForm').submit();
            }
        }
    });
});
$('#typeScreener input[type="checkbox"]').iCheck({
    checkboxClass: 'icheckbox_square-green'
});
$('#updateTimeScreener input[type="radio"]').iCheck({
    radioClass:'iradio_square-blue'
});
// 使用icheck带来绑定问题,onchange=""失效了
$('#typeScreener input[type="checkbox"]').on('ifChanged', function(event){
    screenEvidence();
});
$('#updateTimeScreener input[type="radio"]').on('ifChanged', function(event){
    screenEvidence();
});


