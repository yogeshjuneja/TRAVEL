<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="TRAVEL.Admin.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="main-container inner">
            <div class="container">
                
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li>
                                <a href="#">Dashboard
                                </a>
                            </li>
                            <li class="active">Reviews
                            </li>
                        </ol>
                    </div>
                </div>
               
                <div class="row">
                    <div class="col-md-12">
                        <!-- start: FORM VALIDATION 1 PANEL -->
                        <div class="panel panel-white">
                            <div class="panel-heading">
                                <h4 class="panel-title">Fill Details <span class="text-bold"></span></h4>
                                <div class="panel-tools">
                                    <div class="dropdown">
                                        <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                                            <i class="fa fa-cog"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                                            <li>
                                                <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i><span>Collapse</span> </a>
                                            </li>
                                            <li>
                                                <a class="panel-refresh" href="#">
                                                    <i class="fa fa-refresh"></i><span>Refresh</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="panel-config" href="#panel-config" data-toggle="modal">
                                                    <i class="fa fa-wrench"></i><span>Configurations</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="panel-expand" href="#">
                                                    <i class="fa fa-expand"></i><span>Fullscreen</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <a class="btn btn-xs btn-link panel-close" href="#">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="panel-body">
                                  <div id="divMsg" runat="server" class="successHandler alert alert-success no-display">
                                                <i class="fa fa-ok"></i>
                                                <asp:Label ID="lblMessage" runat="server"> </asp:Label>

                                            </div>
                                <div>
                                    <div class="row">
                                        <br />
                                        <%-- Tour Details--%>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div>
                                                    <asp:GridView ID="gvReview" runat="server" ShowFooter="true" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" OnRowCommand="gvReview_RowCommand">
                                                        <Columns>

                                                            <asp:TemplateField HeaderText="S#">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex+1%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Comment" SortExpression="ReviewInfo">
                                                                <ItemTemplate>
                                                                    <%#Eval("ReviewInfo") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                           

                                                            <asp:TemplateField HeaderText="Place" SortExpression="NAme">
                                                                <ItemTemplate>
                                                                    <%#Eval("NAme") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>


                                                             <asp:TemplateField HeaderText="Is Approved" SortExpression="EnumIsApproved">
                                                                <ItemTemplate>

                                                             
                                                                      <asp:LinkButton ID="btnReject" runat="server" CommandName="iDisapprove" CommandArgument='<%#Eval("ReviewID") %>' Visible='<%#Convert.ToBoolean(Eval("EnumIsApproved")) %>'><span class="label label-warning"> Reject</span></asp:LinkButton>

                                                                    <asp:LinkButton ID="btnApprove" runat="server" CommandName="iApprove" CommandArgument='<%#Eval("ReviewID") %>' Visible='<%#!Convert.ToBoolean(Eval("EnumIsApproved")) %>'><span class="label label-info"> Approve</span></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                               

                                                        </Columns>

                                                    </asp:GridView>
                                                </div>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>


                                    </div>
                                </div>
                            </div>
                            <!-- end: FORM VALIDATION 1 PANEL -->
                        </div>
                    </div>

                    <!-- end: PAGE CONTENT-->
                </div>
                <div class="subviews">
                    <div class="subviews-container"></div>
                </div>
            </div>
            <!-- end: PAGE -->
        </div>

    </div>
</asp:Content>
