﻿<%@ page language="C#" autoeventwireup="true" inherits="Analysis, App_Web_3wnklyhr" %>


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
        <div class="container margin-bottom margin-top">
            <div class="col-lg-2"></div>
            <div class="col-lg-10">
                <div>
                    <label class="control-label">领域选择</label>
                    <select name="named=[]" class="selectpicker" data-style="btn-primary">
                        <option>化学</option>
                        <option>物理</option>
                        <option>地学</option>
                        <option>生物</option>
                        <option>医学</option>
                    </select>
                    <label class="control-label marginleft">主题选择 </label>
                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#largeModal">10/50</a>
                    <label class="control-label marginleft">时间窗 </label>

                    <select name="named=[]" class="selectpicker" data-style="btn-primary" multiple="multiple">
                        <option selected="selected">2012-2014年</option>
                        <option selected="selected">2010-2012年</option>
                        <option selected="selected">2008-2010年</option>
                        <option>2006-2008年</option>
                    </select>
                </div>
            </div>
            <hr class="col-lg-12 col-md-12 col-xs-12 col-sm-12" />
        </div>
        <div class="container">
            <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
                <ul class="list-group">
                    <li class="list-group-item active text-center"><strong>分析维度</strong></li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" checked />
                                创新度 
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                时效度 
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                鉴赏度 
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                学科交叉度 
                            </label>
                        </div>
                    </li>

                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                转化度 
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                风险度 
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                综合前沿度 
                            </label>
                        </div>
                    </li>

                </ul>
                <div class="text-right">
                    <a href="Analysis_3.aspx" type="submit" class="btn btn-primary btn-block"><strong>确 定</strong></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-xs-6 col-sm-6">
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
                                    <img src="img/line.png" width="500" height="400" />
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
                                                <tr>
                                                    <td>1</td>
                                                    <td><a href="subject.aspx">印刷电路板的回收利用</a></td>
                                                    <td>0.90</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td><a href="subject.aspx">粪便污染的追踪及量化</a></td>
                                                    <td>0.89</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td><a href="subject.aspx">银纳米材料在沸水处理中的应用</a></td>
                                                    <td>0.89</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td><a href="subject.aspx">纳米材料在水环境中吸附性能</a></td>
                                                    <td>0.89</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td><a href="subject.aspx">生物吸附的热力学与动力学研究</a></td>
                                                    <td>0.88</td>
                                                </tr>
                                                <tr>
                                                    <td>6</td>
                                                    <td><a href="subject.aspx">利用荧光光谱检测水中有机质的方法</a></td>
                                                    <td>0.88</td>
                                                </tr>
                                                <tr>
                                                    <td>7</td>
                                                    <td><a href="subject.aspx">有毒重金属对生物的影响</a></td>
                                                    <td>0.88</td>
                                                </tr>
                                                <tr>
                                                    <td>8</td>
                                                    <td><a href="subject.aspx">废水与污染的生物化处理</a></td>
                                                    <td>0.87</td>
                                                </tr>
                                                <tr>
                                                    <td>9</td>
                                                    <td><a href="subject.aspx">材料合成过程中光催化性能的研究</a></td>
                                                    <td>0.87</td>
                                                </tr>
                                                <tr>
                                                    <td>10</td>
                                                    <td><a href="subject.aspx">三氯生的危害</a></td>
                                                    <td>0.87</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
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
            <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2">
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
    </form>
    <div style="display: none;" class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <div class="modal-title" id="myModalLabel">
                        <div class="form-inline">
                            <div class="form-group">
                                <div class="input-group">
                                    <input class="form-control" type="email" placeholder="主题关键词" />
                                    <div class="input-group-addon">搜索</div>
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
                                            1/20
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-xs-4 col-sm-4">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" checked="checked" name="timeline" />
                                                印刷电路板的回收利用 
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                粪便污染的追踪及量化
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                银纳米材料在沸水处理中的应用 
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                纳米材料在水环境中吸附性能
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                生物吸附的热力学与动力学研究
                                            </label>
                                        </div>
                                    </li>

                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                利用荧光光谱检测水中有机质的方法
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                有毒重金属对生物的影响
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                废水与污染的生物化处理
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                材料合成过程中光催化性能的研究
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                三氯生的危害
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-4 col-md-4 col-xs-6 col-sm-6 col-lg-offset-1 col-xd-offset-1">
                                <ul class="list-group">
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" checked="checked" name="timeline" />
                                                印刷电路板的回收利用 
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                粪便污染的追踪及量化
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                银纳米材料在沸水处理中的应用 
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                纳米材料在水环境中吸附性能
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                生物吸附的热力学与动力学研究
                                            </label>
                                        </div>
                                    </li>

                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                利用荧光光谱检测水中有机质的方法
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                有毒重金属对生物的影响
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                废水与污染的生物化处理
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                材料合成过程中光催化性能的研究
                                            </label>
                                        </div>
                                    </li>
                                    <li class="list-group-item">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" value="" name="timeline" />
                                                三氯生的危害
                                            </label>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
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
                                <tr>
                                    <td>2</td>
                                    <td><a href="#">中科院化学所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><a href="#">中科院高能所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><a href="#">中科院过程所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td><a href="#">中科院电子所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td><a href="#">中科院半导体所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td><a href="#">中科院热物理所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td><a href="#">中科院政策所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td><a href="#">中科院政策所</a></td>
                                    <td>3,500</td>
                                    <td>1,500,234</td>
                                    <td>李定国;黄海建;史援朝</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td><a href="#">中科院热物理所</a></td>
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
                                <tr>
                                    <td>2</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature Reviews</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature Reviews</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature Reviews</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature Reviews</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature Reviews</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature Reviews</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature Reviews</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Scientometrics</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>粪便污染的追踪及量化</td>
                                    <td>Nature,Science & Cancer,Cell</td>
                                    <td>2009</td>
                                    <td>100</td>
                                    <td>Han Dachuan;Wang Jia</td>
                                    <td>Chinese Science Academic</td>
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
                var option = {
                    tooltip: {
                        trigger: 'axis',
                        showDelay: 0,
                        axisPointer: {
                            type: 'cross',
                            lineStyle: {
                                type: 'dashed',
                                width: 1
                            }
                        }
                    },
                    legend: {
                        data: ['scatter1', 'scatter2']
                    },
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
                            type: 'value',
                            power: 1,
                            splitNumber: 4,
                            scale: true
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            power: 1,
                            splitNumber: 4,
                            scale: true
                        }
                    ],
                    series: [
                        {
                            name: 'scatter1',
                            type: 'scatter',
                            symbolSize: function (value) {
                                return Math.round(value[2] / 5);
                            },
                            data: randomDataArray()
                        },
                        {
                            name: 'scatter2',
                            type: 'scatter',
                            symbolSize: function (value) {
                                return Math.round(value[2] / 5);
                            },
                            data: randomDataArray()
                        }
                    ]
                };






                // 为echarts对象加载数据 
                myChart.setOption(option);
            }
        );
    </script>
</body>
</html>
