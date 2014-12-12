<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_3wnklyhr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap-modal.js" type="text/javascript"></script>
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
    </style>
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
                <a class="navbar-brand active" href="#"><span style="color: white">R-Select学科前沿领域遴选平台</span>
                </a>
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
    <form id="form1" runat="server" class="form-inline">

        <div class="container margin-top">
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item active text-center">领域选择</li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                化学
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="option1">
                                工程技术
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios3" value="option1">
                                地学天文
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios4" value="option1">
                                医学
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios5" value="option1">
                                农林医学
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios6" value="option1">
                                管理科学
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios7" value="option1">
                                物理
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios8" value="option1">
                                环境科学与生态学
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios9" value="option1">
                                地学
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item text-center active">主题选择</li>
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
                    <li class="list-group-item text-right">
                        <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#largeModal">更多主题</a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item active text-center">时间轴</li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" checked="checked" name="timeline" />
                                2012-2014年
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                2010-2012年
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                2008-2010年
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" name="timeline" />
                                2006-2008年
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item active text-center">分析维度</li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" />
                                创新度
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" />
                                时效度
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" />
                                鉴赏度
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" />
                                学科交叉度
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" />
                                转化度
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" />
                                风险度
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" checked="checked" />
                                综合前沿度
                            </label>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="container">
            <div class=" col-lg-offset-10 col-lg-2">
                <div class="text-right">
                    <a href="Analysis.aspx" class="btn btn-primary btn-block ">
                        <strong>确 定</strong>
                    </a>
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
                            <div class="col-lg-4 col-md-4 col-xs-3 col-sm-3">
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
                            <div class="col-lg-4 col-md-4 col-xs-3 col-sm-3 col-lg-offset-1 col-xd-offset-1">
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
</body>
</html>
