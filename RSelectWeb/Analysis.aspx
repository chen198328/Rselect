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
    <script src="build/esl/esl.js" type="text/javascript"></script>
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
                    <asp:DropDownList ID="domainlist" runat="server" class="selectpicker" AutoPostBack="true" data-style="btn-primary" OnSelectedIndexChanged="domainlist_SelectedIndexChanged">
                        <asp:ListItem>化学</asp:ListItem>
                        <asp:ListItem>工程技术</asp:ListItem>
                        <asp:ListItem>地学天文</asp:ListItem>
                        <asp:ListItem>医学</asp:ListItem>
                        <asp:ListItem>农林科学</asp:ListItem>
                        <asp:ListItem>管理科学</asp:ListItem>
                        <asp:ListItem>物理</asp:ListItem>
                        <asp:ListItem>环境科学与生态学</asp:ListItem>
                        <asp:ListItem>地学</asp:ListItem>
                    </asp:DropDownList>

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
                                <%=IndicatorNameList_[index] %>
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

            <asp:UpdatePanel runat="server" ID="updatepanel_content">
                <ContentTemplate>
                    <%if (PageType == 0)
                      { %>
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
                                            <div id="main" style="width: 500px; height: <%=height%>px"></div>
                                        </div>
                                        <div class="tab-pane" id="ptab2">
                                            <div>
                                                <table class="table table-bordered text-center table-striped">
                                                    <thead class="text-center">
                                                        <tr>
                                                            <th class="text-center">序号</th>
                                                            <th class="text-center">主题名称</th>
                                                            <th class="text-center">评价指标</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% for (int index = 0; index < IndicatorList.Count; index++)
                                                           { %>
                                                        <tr>
                                                            <td><%=index %></td>
                                                            <td><%=IndicatorList[index].Subject %></td>
                                                            <td><%=IndicatorList[index].Value %></td>
                                                        </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%} %>
                    <%if (PageType == 2)
                      { %>
                    <div class="col-lg-10 col-md-10 col-xs-10 col-sm-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <strong>化学综合</strong> 散点图
                            </div>
                            <div class="panel-body table-responsive">
                                <div class="tabbable">
                                    <ul class="nav nav-pills">
                                        <li class="active"><a href="#ptab1" data-toggle="tab">视图</a></li>
                                        <li><a href="#ptab2" data-toggle="tab">列表</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="ptab1">
                                            <div id="main" style="width: 750px; height: 500px"></div>
                                        </div>
                                        <div class="tab-pane" id="ptab2">
                                            <div>
                                                <table class="table table-bordered text-center table-striped">
                                                    <thead class="text-center">
                                                        <tr>
                                                            <th class="text-center">序号</th>
                                                            <th class="text-center">主题名称</th>
                                                            <th class="text-center">评价指标</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% for (int index = 0; index < IndicatorList.Count; index++)
                                                           { %>
                                                        <tr>
                                                            <td><%=index %></td>
                                                            <td><%=IndicatorList[index].Subject %></td>
                                                            <td><%=IndicatorList[index].Value %></td>
                                                        </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%} %>
                    <%if (PageType == 1)
                      { %>
                    <div class="col-lg-10 col-md-10 col-xs-10 col-sm-10">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <strong>化学综合</strong> 折线图
                            </div>
                            <div class="panel-body table-responsive">
                                <div class="tabbable">
                                    <ul class="nav nav-pills">
                                        <li class="active"><a href="#ptab1" data-toggle="tab">视图</a></li>
                                        <li><a href="#ptab2" data-toggle="tab">列表</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="ptab1">
                                            <div id="main" style="width: 750px; height: 500px"></div>
                                        </div>
                                        <div class="tab-pane" id="ptab2">
                                            <div>
                                                <table class="table table-bordered text-center table-striped">
                                                    <thead class="text-center">
                                                        <tr>
                                                            <th class="text-center">序号</th>
                                                            <th class="text-center">主题名称</th>
                                                            <th class="text-center">评价指标</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% for (int index = 0; index < IndicatorList.Count; index++)
                                                           { %>
                                                        <tr>
                                                            <td><%=index %></td>
                                                            <td><%=IndicatorList[index].Subject %></td>
                                                            <td><%=IndicatorList[index].Value %></td>
                                                        </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <%} %>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="submit" />
                </Triggers>
            </asp:UpdatePanel>

        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2"></div>

                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            核心论文
                        </div>
                        <div class="panel-body table-responsive">
                            <table class="table table-bordered table-striped ">
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                            </table>
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#paperModal">更多</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            研究力量
                        </div>
                        <div class="panel-body table-responsive">
                            <table class="table table-bordered table-striped ">
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                                <tr>
                                    <td>材料合成过程...</td>
                                </tr>
                            </table>
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#powerModal">更多</a>
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
                        <div class="modal-title" id="myModalLabel">
                            <div class="form-inline">
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" class="form-control" ID="SearchSubjectText" placeholder="主题关键词"></asp:TextBox>
                                        <asp:Button runat="server" ID="SearchSubject" class="input-group-addon" Text="搜索" OnClick="SearchSubject_Click" />

                                    </div>
                                    <div class="input-group">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" />
                                                全选
                                            </label>
                                        </div>
                                    </div>
                                    <div class="input-group">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" />
                                                全部取消
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
                                                            <input type="checkbox" value=" <%=SubjectList_[index].id %>" name="subject" <%if (selectSubjectIds.Contains(SubjectList_[index].id.ToString()))
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
            require.config({
                paths: {
                    'echarts': 'build/echarts',
                    'echarts/chart/bar': 'build/echarts'
                }
            });
            // 使用
            require(
                [
                    'echarts',
                    'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('main'));
                <%if (PageType == 0)
                  {%>
                    var option = {
                        tooltip: {
                            trigger: 'item'
                        },
                        toolbox: {
                            show: false,
                            feature: {
                                mark: { show: true },
                                dataView: { show: false, readOnly: false },
                                magicType: { show: true, type: ['line', 'bar'] },
                                restore: { show: false },
                                saveAsImage: { show: false }
                            }
                        },
                        calculable: true,
                        xAxis: [
                            {
                                name: '<%=IndicatorName%>',
                                type: 'value',
                                boundaryGap: [0, 0.0001],
                                max: 1,
                                min: 0
                            }
                        ],
                        yAxis: [
                            {
                                name: '主题',
                                type: 'category',
                                data: [<%=SubjectListString%>]
                            }
                        ],
                        series: [
                            {
                                type: 'bar',
                                data: [<%= ValueListString%>],

                            }
                        ]
                    };
                <%}
                  else if (PageType == 2)
                  {%>
                    //散点图

                    option = {
                        tooltip: {         // Option config. Can be overwrited by series or data
                            trigger: 'axis',
                            showDelay: 0,
                            axisPointer: {
                                type: 'cross',
                                lineStyle: {
                                    type: 'dashed',
                                    width: 1
                                }
                            },
                            hideDelay: 50,
                            transitionDuration: 0,
                            backgroundColor: 'rgba(255,0,255,0.7)',
                            borderColor: '#f50',
                            borderRadius: 8,
                            borderWidth: 2,
                            padding: 10,    // [5, 10, 15, 20]
                            position: function (p) {
                                // 位置回调
                                // console.log && console.log(p);
                                return [p[0] + 10, p[1] - 10];
                            }, formatter: function (params) {
                                var res = params[2][2] + "<br/>" + "<%=IndicatorNameList_[0]%>:" + params[2][0] + "<br/>" + "<%=IndicatorNameList_[1]%>:" + params[2][1];
                                return res;
                            }
                            //formatter: "Template formatter: <br/>{b}<br/>{a}:{c}<br/>{a1}:{c1}"
                        },
                        legend: {
                            data: [<%=Lengend%>]
                        },
                        xAxis: [
                            {

                                name: '<%=IndicatorNameList_[0]%>',
                                type: 'value',
                                splitNumber: 2,
                                scale: true,
                            }
                        ],
                        yAxis: [
                            {
                                name: '<%=IndicatorNameList_[1]%>',
                                type: 'value',
                                splitNumber: 2,
                                scale: true,
                            }
                        ],
                        series: [
                           <% for (int index = 0; index < datalist.Count; index++)
                              {%>
                                {
                                    name: '<%=datalist[index][0]%>',
                                    type: 'scatter',
                                    symbolSize: 8,
                                    data: [<%=datalist[index][1]%>]
                                }
                                <%}%><% if (datalist.Count > 0)
                                        {%>,
                        <%}%>
                        ]
                    };

                    <%}
                  else if (PageType == 1)
                  {%>
                    //折线图
                    var subject = {<%=DictionarySubject%> }

                    option = {
                        tooltip: {         // Option config. Can be overwrited by series or data
                            trigger: 'axis',
                            //show: true,   //default true
                            showDelay: 0,
                            hideDelay: 50,
                            transitionDuration: 0,
                            backgroundColor: 'rgba(255,0,255,0.7)',
                            borderColor: '#f50',
                            borderRadius: 8,
                            borderWidth: 2,
                            padding: 10,    // [5, 10, 15, 20]
                            position: function (p) {
                                // 位置回调
                                // console.log && console.log(p);
                                return [p[0] + 10, p[1] - 10];
                            }, formatter: function (params) {
                                var res = subject[params[0][1]] + "<br/>" + params[0][0] + ":" + params[0][2];
                                return res;
                            }
                            //formatter: "Template formatter: <br/>{b}<br/>{a}:{c}<br/>{a1}:{c1}"
                        },
                        dataZoom: {
                            show: true,
                            realtime: true,
                            //orient: 'vertical',   // 'horizontal'
                            //x: 0,
                            y: 20,
                            //width: 400,
                            height: 20,
                            //backgroundColor: 'rgba(221,160,221,0.5)',
                            //dataBackgroundColor: 'rgba(138,43,226,0.5)',
                            //fillerColor: 'rgba(38,143,26,0.6)',
                            //handleColor: 'rgba(128,43,16,0.8)',
                            //xAxisIndex:[],
                            //yAxisIndex:[],
                            start: 1,
                            end: 100,
                        },
                        legend: {
                            data: [<%=Lengend%>]
                        },
                        calculable: true,
                        xAxis: [
                            {
                                type: 'category',
                                boundaryGap: false,
                                data: [<%=XString%>]
                            }
                        ],
                        yAxis: [
                            {
                                name: '<%=IndicatorNameList_[0]%>',
                                type: 'value',
                                max: 1,
                                min: 0
                            }
                        ],
                        series: [
                        <% for (int index = 0; index < datalist.Count; index++)
                           {%>
                        {
                            name: '<%=datalist[index][0]%>',
                            type: 'line',
                            data: [ <%=datalist[index][1]%>],
                            markLine: {
                                data: [
                                    { type: 'average', name: '平均值' }
                                ]
                            }
                        }<% if (datalist.Count > 0)
                            {%>,
                        <%}%>
                        <%}%>
                        ]
                    };
                    <%}
                  else
                  {%>
                    //折线图 但指标


                    option = {
                        tooltip: {         // Option config. Can be overwrited by series or data
                            trigger: 'axis',
                            //show: true,   //default true
                            showDelay: 0,
                            hideDelay: 50,
                            transitionDuration: 0,
                            backgroundColor: 'rgba(255,0,255,0.7)',
                            borderColor: '#f50',
                            borderRadius: 8,
                            borderWidth: 2,
                            padding: 10,    // [5, 10, 15, 20]
                            position: function (p) {
                                // 位置回调
                                // console.log && console.log(p);
                                return [p[0] + 10, p[1] - 10];
                            }
                            //formatter: "Template formatter: <br/>{b}<br/>{a}:{c}<br/>{a1}:{c1}"
                        },
                        dataZoom: {
                            show: true,
                            realtime: true,
                            //orient: 'vertical',   // 'horizontal'
                            //x: 0,
                            y: 20,
                            //width: 400,
                            height: 20,
                            //backgroundColor: 'rgba(221,160,221,0.5)',
                            //dataBackgroundColor: 'rgba(138,43,226,0.5)',
                            //fillerColor: 'rgba(38,143,26,0.6)',
                            //handleColor: 'rgba(128,43,16,0.8)',
                            //xAxisIndex:[],
                            //yAxisIndex:[],
                            start: 1,
                            end: 100,
                        },
                        legend: {
                            data: ['2010-2012年', '2012-2014年']
                        },
                        calculable: true,
                        xAxis: [
                            {
                                name: '主题编号',
                                type: 'category',
                                boundaryGap: false,
                                data: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                name: '2010-2012年',
                                type: 'line',
                                data: [120, 132, 101, 134, 90, 230, 210, 200, 102, 201, 203, 203],
                                markLine: {
                                    data: [
                                        { type: 'average', name: '平均值' }
                                    ]
                                }
                            },
                            {
                                name: '2012-2014年',
                                type: 'line',
                                data: [220, 182, 191, 234, 290, 330, 310, 342, 212, 100, 102, 203, 323],
                                markLine: {
                                    data: [
                                        { type: 'average', name: '平均值' }
                                    ]
                                }
                            }
                        ]
                    };

                    <%}%>

                    // 为echarts对象加载数据 
                    myChart.setOption(option);
                }
        );
        </script>
    </form>
</body>
</html>
