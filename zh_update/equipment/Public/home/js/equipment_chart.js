$(function ($) {
    var myChart = echarts.init(document.getElementById('equipment_chart'), 'shine');

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '按环境统计',
            x: 'center'

        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'top',
            data: ['开发', '灾备', '生产', '测试']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: false, readOnly: false},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '按环境统计',
                type: 'pie',
                radius: '45%',
                center: ['50%', '50%'],
                data: [
                    {value: 335, name: '开发'},
                    {value: 310, name: '灾备'},
                    {value: 234, name: '生产'},
                    {value: 135, name: '测试'},
                ],
                itemStyle: {
                    position: 'inner',
                    normal: {
                        label: {
                            show: true,
                            size: 16,
                            formatter: '{b} : {c} \n ({d}%)'
                        },
                        labelLine: {
                            show: true
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 1,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    //设备类型
    var equipment_type_chart = echarts.init(document.getElementById('equipment_type_chart'), 'shine');
    var type_option = {
        title: {
            text: '按设备类型统计',
            x: 'center'

        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'top',
            data: ['小型机', 'PC服务器', '存储', '其它']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: false, readOnly: false},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '按设备类型统计',
                type: 'pie',
                radius: '45%',
                center: ['50%', '50%'],
                data: [
                    {value: 123, name: '小型机'},
                    {value: 723, name: 'PC服务器'},
                    {value: 323, name: '存储'},
                    {value: 23, name: '其它'}
                ],
                itemStyle: {
                    position: 'inner',
                    normal: {
                        label: {
                            show: true,
                            size: 16,
                            formatter: '{b} : {c} \n ({d}%)'
                        },
                        labelLine: {
                            show: true
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 1,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    equipment_type_chart.setOption(type_option);
    //故障部位
    var equipment_part_chart = echarts.init(document.getElementById('equipment_part_chart'), 'shine');
    var part_option = {
        title: {
            text: '按故障部位统计',
            x: 'center'

        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'top',
            data: ['CPU', '内存', '硬盘', '电源', '风扇', '其它']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show:false, readOnly: false},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '按故障部位统计',
                type: 'pie',
                radius: '45%',
                center: ['50%', '50%'],
                data: [
                    {value: 221, name: 'CPU'},
                    {value: 221, name: '内存'},
                    {value: 221, name: '硬盘'},
                    {value: 221, name: '电源'},
                    {value: 221, name: '风扇'},
                    {value: 221, name: '其它'}
                ],
                itemStyle: {
                    position: 'inner',
                    normal: {
                        label: {
                            show: true,
                            size: 16,
                            formatter: '{b} : {c} \n ({d}%)'
                        },
                        labelLine: {
                            show: true
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 1,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    equipment_part_chart.setOption(part_option);
    //设备品牌
    var equipment_brand_chart = echarts.init(document.getElementById('equipment_brand_chart'));
    var brand_option = {
        title: {
            text: '按设备品牌统计',
            x: 'center'

        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'top',
            data: ['IBM', '华为', '联想', '浪潮', 'EMC']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: false, readOnly: false},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '按故障部位统计',
                type: 'pie',
                radius: '45%',
                center: ['50%', '50%'],
                data: [
                    {value: 445, name: 'IBM'},
                    {value: 445, name: '华为'},
                    {value: 445, name: '联想'},
                    {value: 445, name: '浪潮'},
                    {value: 445, name: 'EMC'}
                ],
                itemStyle: {
                    position: 'inner',
                    normal: {
                        label: {
                            show: true,
                            size: 16,
                            formatter: '{b} : {c} \n ({d}%)'
                        },
                        labelLine: {
                            show: true
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 1,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    equipment_brand_chart.setOption(brand_option);



    //地点
    var equipment_locale_chart = echarts.init(document.getElementById('equipment_locale_chart'));
    var locale_option = {
        title: {
            text: '按地点统计',
            x: 'center'

        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'top',
            data: ['中金421', '中金422', '中金433', '中金434', '中金725', '中金726', '中金727', '中金736', '西三旗']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: false, readOnly: false},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '按环境统计',
                type: 'pie',
                radius: '45%',
                center: ['50%', '50%'],
                data: [
                    {value: 123, name: '中金421'},
                    {value: 123, name: '中金422'},
                    {value: 123, name: '中金433'},
                    {value: 123, name: '中金434'},
                    {value: 123, name: '中金725'},
                    {value: 123, name: '中金726'},
                    {value: 123, name: '中金727'},
                    {value: 123, name: '中金736'},
                    {value: 123, name: '西三旗'}
                ],
                itemStyle: {
                    position: 'inner',
                    normal: {
                        label: {
                            show: true,
                            size: 16,
                            formatter: '{b} : {c} \n ({d}%)'
                        },
                        labelLine: {
                            show: true
                        }
                    },
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 1,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    equipment_locale_chart.setOption(locale_option);

    //按月统计
    var line_part_chart = echarts.init(document.getElementById('line_part_chart'));
    var line_option = {
        title: {
            text: '按月统计(环境)',
            x: 'right'

        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {// 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            left: 'top',
            data: ['开发', '灾备', '生产', '测试']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '0',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                data: ['一月', '二月', '三月', '四月', '五月', '六月']
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '开发',
                type: 'bar',
                data: [120, 132, 101, 134, 90, 230]
            },
            {
                name: '灾备',
                type: 'bar',
                data: [220, 182, 191, 234, 290, 330]
            },
            {
                name: '生产',
                type: 'bar',
                data: [150, 232, 201, 154, 190, 330]
            },
            {
                name: '测试',
                type: 'bar',
                data: [862, 1018, 964, 1026, 1679, 1600],
                markLine: {
                    lineStyle: {
                        normal: {
                            type: 'dashed'
                        }
                    }
                }
            }
        ]
    };
    line_part_chart.setOption(line_option);
    
    $("[name=monthcharts]").on('change',function(){
        var m = $(this).val();
        var loadm = layer.load(0,{shade:false});
        $.ajax({
            url:"./get",
            success:function(){
                layer.close(loadm);
            }
        });
        console.log($(this).val());
    });
})