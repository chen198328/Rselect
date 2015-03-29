<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RSelectWeb.Default" %>


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
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="container margin-top">
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item active text-center">领域选择</li>
                    <% if (!string.IsNullOrEmpty(domain))
                       { %>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" value="<%=domain%>" checked='checked' name="domain" onclick="post()" />
                                <%=domain%>
                            </label>
                        </div>
                    </li>
                    <%} %>
                    <%for (int index = 0; index < DomainList.Count; index++)
                      { %>
                    <% if (DomainList[index].Name != domain)
                       { %>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" value="<%=DomainList[index].Name%>" name="domain" onclick="post()" />
                                <%=DomainList[index].Name%>
                            </label>
                        </div>
                    </li>
                    <%}
                      } %>
                </ul>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item text-center active">主题选择</li>
                    <% for (int index = 0; index < TopCount; index++)
                       { %>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=" <%=SubjectList[index].id%>" name="subject" />
                                <%=SubjectList[index].Name%>
                            </label>
                        </div>
                    </li>
                    <%} %>
                    <%if (SubjectList.Count > 0)
                      { %>
                    <li class="list-group-item text-right">
                        <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#largeModal">更多主题</a>
                    </li>
                    <%} %>
                </ul>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item active text-center">时间轴</li>
                    <% for (int index = 0; index < YearList.Count; index++)
                       { %>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="<%=YearList[index] %>" name="years" />
                                <%=YearList[index] %>
                            </label>
                        </div>
                    </li>
                    <%} %>
                </ul>
            </div>
            <div class="col-lg-3 col-md-3 col-xs-3 col-sm-3">
                <ul class="list-group">
                    <li class="list-group-item active text-center">分析维度</li>
                    <%for (int index = 0; index < IndicatorList.Count; index++)
                      { %>
                    <li class="list-group-item">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value=" <%=IndicatorList[index] %>" name="indicator" />
                                <%=IndicatorList[index]=="综合度"?"<b>":"" %>   <%=IndicatorList[index] %>  <%=IndicatorList[index]=="综合度"?"</b>":"" %>
                            </label>
                        </div>
                    </li>
                    <%} %>
                </ul>
            </div>
        </div>
        <%if (SubjectList.Count > 0)
          { %>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:Literal runat="server" ID="alter"></asp:Literal>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Submit" />
            </Triggers>
        </asp:UpdatePanel>
        <div class="container">
            <div class=" col-lg-offset-10 col-lg-2">
                <div class="text-right">
                    <asp:Button Text="确定" ID="Submit" runat="server" OnClick="Submit_Click" class="btn btn-primary btn-block " />
                </div>
            </div>
        </div>
        <%} %>
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
                                                <asp:UpdatePanel runat="server" ID="selectedcountupdatepanel">
                                                    <ContentTemplate>
                                                        <span id="selectedcount">1</span> /<%=SubjectList.Count %>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="SearchSubject" />
                                                        <asp:AsyncPostBackTrigger ControlID="Submit" />
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
                                                <%for (int index = 0; index < SubjectList.Count; index = index + 2)
                                                  { %>
                                                <li class="list-group-item">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value="<%=SubjectList[index].id %>" name="subject" />
                                                            <%=SubjectList[index].Name %>
                                                        </label>
                                                    </div>
                                                </li>
                                                <%} %>
                                            </ul>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-xs-3 col-sm-3">
                                            <ul class="list-group">
                                                <%for (int index = 1; index < SubjectList.Count; index = index + 2)
                                                  { %>
                                                <li class="list-group-item">
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" value=" <%=SubjectList[index].id %>" name="subject" />
                                                            <%=SubjectList[index].Name %>
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
    </form>
    <script>
        function post() {
            form1.submit();
        }
    </script>
</body>
</html>
