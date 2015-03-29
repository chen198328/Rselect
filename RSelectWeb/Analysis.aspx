<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analysis.aspx.cs" Inherits="RSelectWeb.Analysis_bar" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap-select.js" type="text/javascript"> </script>
    <script src="bootstrap/js/bootstrap-tabdrop.js" type="text/javascript"></script>
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script>
        function unselectall() {
            $("input[name*=subject]").each(function () {
                $(this).attr("checked", '');
            })
        }
        function CheckAll() {
            $("input[name*=subject]").each(function () {
                $(this).attr("checked", 'true');
            })
        }</script>

    <style type="text/css">
        .margin-bottom {
            margin-bottom: 20px;
        }

        .margin-top {
            margin-top: 70px;
        }

        .floatright {
            float: right;
        }

        .marginleft {
            margin-left: 22px;
        }
    </style>
    <script type="text/javascript">
        window.onload = function () {
            $('.selectpicker').selectpicker();
        }
    </script>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse-top">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand active" href="default.aspx"><span style="color: white">R-Select学科前沿领域遴选平台</span></a>
            </div>
            <div class="collapse navbar-collapse floatright" id="collapse-top">
                <ul class="nav navbar-nav">
                    <li><a href="#">系统介绍</a></li>
                    <li><a href="#">帮助</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
    <form id="form2" runat="server" class="form-inline">
        <asp:ScriptManager runat="server" ID="scriptmanager"></asp:ScriptManager>

        <div class="container margin-bottom margin-top">
            <div class="col-lg-2"></div>
            <div class="col-lg-10">
                <div>
                    <label class="control-label">领域选择</label>

                    <select name="domain" class="selectpicker" id="domainlist" data-style="btn-primary">
                        <% if (!string.IsNullOrEmpty(domain))
                           { %>
                        <option selected="selected"><%=domain %></option>
                        <%} %>
                        <%for (int index = 0; index < DomainList.Count; index++)
                          { %>
                        <%if (DomainList[index].Name != domain)
                          { %>
                        <option><%=DomainList[index].Name %></option>
                        <%}
                          }%>
                    </select>

                    <label class="control-label marginleft">主题选择 </label>
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#largeModal"><span id="TitleCount"><%=selectSubjectIds.Count %>/<%=SubjectList_.Count %></span></a>
                    <label class="control-label marginleft">时间窗 </label>

                    <select name="year" class="selectpicker" id="yearlist" data-style="btn-primary" multiple="multiple">
                        <%for (int index = 0; index < YearList_.Count; index++)
                          {%>
                        <option <%if (selectYears.Contains(YearList_[index]))
                                  { %>
                            selected="selected" <%} %>><%=YearList_[index] %></option>
                        <%} %>
                    </select>
                </div>
            </div>
            <hr class="col-lg-12 col-md-12 col-xs-12 col-sm-12" />
        </div>

        <div class="container">
            <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
                <ul class="list-group">
                    <li class="list-group-item active text-center"><strong>分析维度</strong></li>
                    <% for (int index = 0; index < IndicatorNameList_.Count; index++)
                       { %>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" <%if (selectIndicatorName.Contains(IndicatorNameList_[index]))
                                                         { %>
                                    checked="checked" <%} %> value="<%=IndicatorNameList_[index] %>" name="indicator" />
                                <%=IndicatorNameList_[index]=="综合度"?"<b>":"" %>   <%=IndicatorNameList_[index] %>  <%=IndicatorNameList_[index]=="综合度"?"</b>":"" %>
                            </label>
                        </div>
                    </li>
                    <%} %>
                </ul>
                <%if (IndicatorNameList_.Count > 0)
                  { %>
                <div class="text-right">
                    <asp:Button class="btn btn-primary btn-block" ID="submit" runat="server" OnClick="submit_Click" Text="确定"></asp:Button>
                </div>
                <%} %>
            </div>
            <div class="col-lg-10 col-md-10 col-xs-10 col-sm-10">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>化学综合</strong> 研究主题概况
                    </div>
                    <div class="panel-body table-responsive">
                        <div class="tabbable">
                            <ul class="nav nav-pills">
                                <li class="active"><a href="#ptab1" data-toggle="tab">视图</a></li>
                                <li><a href="#ptab2" data-toggle="tab">列表</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="ptab1">
                                    <div id="main" style="width: 800px; height: 500px;"></div>
                                </div>
                                <div class="tab-pane active" id="ptab2">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>序号</td>
                                                <td>主题</td>
                                                <td>核心论文</td>
                                                <td>研究力量</td>
                                            </tr>
                                            <% for (int index = 0; index < SelectedSubjectList.Count; index++)
                                               { %>
                                            <tr>
                                                <td><%=index+1 %></td>
                                                <td><%=SelectedSubjectList[index].Name %></td>
                                                <td><a target="_blank" href="Paper.aspx?sid=<%=SelectedSubjectList[index].id %>">查看</a></td>
                                                <td><a target="_blank" href="Institute.aspx?sid=<%=SelectedSubjectList[index].id %>">查看</a></td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="display: none;" class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <div class="modal-title" id="myModalLabe">
                            <div class="form-inline">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" class="form-control" ID="SearchSubjectText" placeholder="主题关键词"></asp:TextBox>
                                        <asp:Button runat="server" ID="SearchSubject" class="input-group-addon" Text="搜索" OnClick="SearchSubject_Click" />

                                    </div>
                                    <div class="input-group">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" onclick="CheckAll()" />
                                                全选
                                            </label>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" onclick="unselectall()" />
                                                取消
                                            </label>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <div class="checkbox">
                                            <label>
                                                <span id="selectedcount"><%=selectSubjectIds.Count %></span>
                                                <asp:UpdatePanel runat="server" ID="selectedcountupdatepanel">
                                                    <ContentTemplate>
                                                        /<%=SubjectList_.Count %>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="SearchSubject" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-xs-3 col-sm-3">
                                            <ul class="list-group">
                                                <%for (int index = 0; index < SubjectList_.Count; index = index + 2)
                                                  { %>
                                                <li class="list-group-item">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="<%=SubjectList_[index].id %>" name="subject" <%if (selectSubjectIds.Contains(SubjectList_[index].id.ToString()))
                                                                                                                                         {%>checked="checked"
                                                                <%} %> />
                                                            <%=SubjectList_[index].Name %>
                                                        </label>
                                                    </div>
                                                </li>
                                                <%} %>
                                            </ul>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-xs-3 col-sm-3">
                                            <ul class="list-group">
                                                <%for (int index = 1; index < SubjectList_.Count; index = index + 2)
                                                  { %>
                                                <li class="list-group-item">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value=" <%=SubjectList_[index].id %>" name="subject" <% =selectSubjectIds.Contains(SubjectList_[index].id.ToString())?"checked=\"checked\"":"" %> />
                                                            <%=SubjectList_[index].Name %>
                                                        </label>
                                                    </div>
                                                </li>
                                                <%} %>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="SearchSubject" />

                            </Triggers>
                        </asp:UpdatePanel>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                    </div>
                </div>

            </div>
        </div>
        <div style="display: none;" class="modal fade" id="powerModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <div class="modal-title" id="myModalLabel">
                            <h4>研究力量列表</h4>
                        </div>
                    </div>
                    <div class="modal-body row">
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                            <table class="table table-hover table-striped text-center">
                                <thead class="text-center">
                                    <tr>
                                        <th class="text-center">序号</th>
                                        <th class="text-center">机构名称</th>
                                        <th class="text-center">论文数量</th>
                                        <th class="text-center">被引频次</th>
                                        <th class="text-center">主要研究人员</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td><a href="#">中科院物理所</a></td>
                                        <td>3,500</td>
                                        <td>1,500,234</td>
                                        <td>李定国;黄海建;史援朝</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: none;" class="modal fade" id="paperModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <div class="modal-title" id="myModalLabel">
                            <h4>核心论文列表</h4>
                        </div>
                    </div>
                    <div class="modal-body row">
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                            <table class="table table-bordered table-responsive text-center">
                                <thead class="text-center">
                                    <tr>
                                        <th class="text-center">序号</th>
                                        <th class="text-center">标题</th>
                                        <th class="text-center">期刊</th>
                                        <th class="text-center">发表时间</th>
                                        <th class="text-center">被引频次</th>
                                        <th class="text-center">通讯作者</th>
                                        <th class="text-center">通讯机构</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>印刷电路板的回收利用</td>
                                        <td>Nature</td>
                                        <td>2009</td>
                                        <td>13</td>
                                        <td>AA</td>
                                        <td>Ins1</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            // 路径配置
            require.config({
                paths: {
                    echarts: 'http://echarts.baidu.com/build/dist'
                }
            });
            // 使用
            require(
                [
                    'echarts',
                    'echarts/chart/bar',
                    'echarts/chart/line',
                    'echarts/chart/scatter'
                    // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('main'));
                    // 为echarts对象加载数据 

                    <% if (showType == RSelectWeb.ShowType.BarChart)
                       {%>
                    option = {
                        title: {
                            text: '<%=barchartmodel.Title%>'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['<%=barchartmodel.Legend%>']
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: { show: true },
                                dataView: { show: true, readOnly: false },
                                magicType: { show: true, type: ['line', 'bar'] },
                                restore: { show: true },
                                saveAsImage: { show: true }
                            }
                        },
                        calculable: true,
                        xAxis: [
                            {
                                name: '主题',
                                type: 'category',
                                data: [<%=barchartmodel.xAxisData%>]

                            }
                        ],
                        yAxis: [
                            {
                                name: '评价指标',
                                type: 'value',
                                max: 1.0,
                                min: 0.0,
                                splitnumber: 4
                            }
                        ],
                        series: [
                            {
                                name: '<%=barchartmodel.yAxisName%>',
                                type: 'bar',
                                data: [<%=barchartmodel.yAxisData%>],
                                markLine: {
                                    data: [
                                        { type: 'average', name: '平均值' }
                                    ]
                                }
                            }
                        ]
                    };
                    <%}
                       else if (showType == RSelectWeb.ShowType.Line)
                       {%>
                    option = {
                        title: {
                            text: '<%= linemodel.Title.Substring(0,linemodel.Title.Length>10?10:linemodel.Title.Length-1)%>'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: [<%=linemodel.Legend%>]
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: { show: true },
                                dataView: { show: true, readOnly: false },
                                magicType: { show: true, type: ['line', 'bar'] },
                                restore: { show: true },
                                saveAsImage: { show: true }
                            }
                        },
                        calculable: true,
                        xAxis: [
                            {
                                name: '<%=linemodel.xAxisName%>',
                                type: 'category',
                                boundaryGap: false,
                                data: [<%=linemodel.xAxisData%>]
                            }
                        ],
                        yAxis: [
                            {
                                name: '<%=linemodel.yAxisName%>',
                                type: 'value',
                                max: 1.0,
                                min: 0.0
                            }
                        ],
                        series: [
                            <%for (int index = 0; index < linemodel.yAxisDatas.Count; index++)
                              {%>
                            {
                                name: '<%=linemodel.yAxisDatas[index].Name%>',
                                type: 'line',
                                data: [<%=linemodel.yAxisDatas[index].Data%>],
                                markPoint: {
                                    data: [
                                        { type: 'max', name: '最大值' },
                                        { type: 'min', name: '最小值' }
                                    ]
                                },
                                markLine: {
                                    data: [
                                        { type: 'average', name: '平均值' }
                                    ]
                                }
                            }<%=index<linemodel.yAxisDatas.Count-1?",":""%>
                            
                            <%}%>
                        ]
                    };

                    <%}
                       else if (showType == RSelectWeb.ShowType.Scatter)
                       {%>
                    option = {
                        tooltip: {
                            trigger: 'axis',
                            showDelay: 0,
                            formatter: function (params) {
                                if (params.value.length > 1) {
                                    return params.value[2] + ' :<br/>'
                                       + '<%=scattermodel.xAxisName%>' + params.value[0] + '<br/>'
                                       + '<%=scattermodel.yAxisName%>' + params.value[1];
                                }
                            },
                            axisPointer: {
                                show: true,
                                type: 'cross',
                                lineStyle: {
                                    type: 'dashed',
                                    width: 1
                                }
                            }
                        },
                        legend: {
                            data: [<%=scattermodel.Legend%>]
                        },
                        color: ['#FF0000 '],
                        toolbox: {
                            show: true,
                            feature: {
                                mark: { show: true },
                                dataZoom: { show: true },
                                dataView: { show: true, readOnly: false },
                                restore: { show: true },
                                saveAsImage: { show: true }
                            }
                        },
                        xAxis: [
                            {
                                name: '<%=scattermodel.xAxisName%>',
                                type: 'value',
                                splitNumber: 2,
                                scale: true,
                                max: 1.0,
                                min: 0.0
                            }
                        ],
                        yAxis: [
                            {
                                name: '<%=scattermodel.yAxisName%>',
                                type: 'value',
                                splitNumber: 2,
                                scale: true,
                                max: 1.0,
                                min: 0.0

                            }
                        ],
                        series: [
                            <%for (int index = 0; index < scattermodel.SeriesData.Count; index++)
                              {%>
                            {
                                name: '<%=scattermodel.SeriesData[index].name%>',
                                type: 'scatter',
                                symbolSize: function (value) {
                                    return Math.round(value[0] * value[1] * 20);
                                },
                                data: [<%=scattermodel.SeriesData[index].data%>]
                            }<%=index<scattermodel.SeriesData.Count-1?",":""%>
                            <%}%>
                        ]
                    };

                    <%}%>
                    myChart.setOption(option);
                }
        );
        </script>
    </form>
</body>
</html>
