<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Institute.aspx.cs" Inherits="RSelectWeb.Institute" %>


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
            <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b><%=Cluster %></b> 研究力量列表
                    </div>
                    <div class="panel-body table-responsive">
                        <table class="table table-bordered table-striped ">
                            <tr>
                                <td width="15%" class="text-center">序号</td>
                                <td width="50%" class="text-center">机构</td>
                                <td width="35%" class="text-center">国家</td>
                            </tr>
                            <% for (int index = 0; index < institutelist.Count; index++)
                               { %>
                            <tr>
                                <td class="text-center"><%=index+1 %></td>
                                <td><%=institutelist[index].Name %></td>
                                <td class="text-center"><%=institutelist[index].Country %></td>
                            </tr>
                            <%} %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
