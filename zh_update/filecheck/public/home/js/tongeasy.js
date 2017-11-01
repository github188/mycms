var nodenumch = echarts.init(document.getElementById('nodenumch'));
nodenumch.showLoading();  
$.ajax({
    url: '/index.php/Home/TongEasy/nodenumch',
    type: 'POST',
    dataType: 'json', 
    success:function(json){
        nodenumch.hideLoading();  
    var zjyyjy = {
        // title : {
        //     text: '每个版本的节点数量' ,
        //     left:'45%'
        // },
        tooltip : {
            trigger: 'item'
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        legend: {
            data:['数量('+json.num+')'],
            itemGap: 5
        },
        grid: {
            top: '12%',
            left: '5%',
            right: '12%',
            containLabel: true
        },
        xAxis:{
                type : 'category',
                name : '版本',
                data :json.keys,
                splitLine:{
        　　　　  show:false
            　　}
            } ,
        yAxis:{              
            type : 'value',
                name : '数量(总数:'+json.num+')', 
                axisLine:{
                    show:false
                },
                 axisTick:{
            show:false
        }
            
        }, 
        series : [ 
            {
                name: '节点数量：',
                type: 'bar',
                data: json.values 
                
                //barGap:0,//柱间距离，默认为柱形宽度的30%，可设固定值
            }
        ]
    };
    nodenumch.setOption(zjyyjy); 
    }
});
//用户图表
var userechart = echarts.init(document.getElementById('userechart'));
userechart.showLoading();  
$.ajax({
    url: '/index.php/Home/TongEasy/userechart',
    type: 'POST',
    dataType: 'json', 
    success:function(json){
        userechart.hideLoading();  
    var userset = {
        // title : {
        //     text: '每个版本的节点数量' ,
        //     left:'45%'
        // },
        tooltip : {
            trigger: 'item'
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        // legend: {
        //     data:['节点数量('+json.num+')'],
        //     itemGap: 5
        // },
        grid: {
            top: '6%',
            left: '6%',
            right: '1%',
            bottom:'1%',
            containLabel: true
        },
        xAxis:{
                type : 'value',
                splitLine:{
    　　　　show:false
    　　},
        axisLabel:{
            show:false 
        },
        axisLine:{
            show:false
        },
        axisTick:{
            show:false
        } 
            } ,
        yAxis:{              
            type : 'category',  
            type: 'category', 
        splitLine:{
    　　　　show:false
    　　},
        axisLine:{
                show:false
         }, 
         axisTick:{
            show:false,
            length:10
        },  
        axisLabel:{
            textStyle:{
                fontSize: 12
            }
        }, 
        boundaryGap:false,
        inverse:true,//是否是反向坐标轴
            data :json.keys
        }, 
        series : [ 
            { label: {
                normal: {
                    show: true,
                    position: 'insideRight'
                }
            },
            barWidth : 20,  
            itemStyle: {
                normal: {
                    color:'#256bb1' 
                }
            },
                type: 'bar',
                data: json.values 
                
                //barGap:0,//柱间距离，默认为柱形宽度的30%，可设固定值
            }
        ]
    };
    userechart.setOption(userset); 
    }
});
//NEW-js
$(document).ready(function () {
    var height = $(window).height();
    var width = $(window).width();
    $("#indexcontent").css('height', height - 94);
});
$(window).scroll(function (event) {
    var scrollTop = $(window).scrollTop();
    // $("#tabs_title").css('margin-top', scrollTop + 50);
    $(".container").css('margin-top', 0 - scrollTop - 10);
});
$(window).resize(function (event) {
    var height = $(window).height();
    var width = $(window).width();
    $("#indexcontent").css('height', height - 94);
});


