<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewTourDetails.aspx.cs" Inherits="TRAVEL.Admin.ViewTourDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="main-container inner">
        <!-- start: PAGE -->
        <div class="main-content">
            <!-- start: PANEL CONFIGURATION MODAL FORM -->
            <div class="modal fade" id="panel-config" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
								
                            </button>
                            <h4 class="modal-title">Panel Configuration</h4>
                        </div>
                        <div class="modal-body">
                            Here will be a configuration form
							
                        </div>

                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- end: SPANEL CONFIGURATION MODAL FORM -->
            <div class="container">
                <!-- start: PAGE HEADER -->
                <!-- start: TOOLBAR -->

                <!-- end: TOOLBAR -->
                <!-- end: PAGE HEADER -->
                <!-- start: BREADCRUMB -->
                <div class="row">
                    <div class="col-md-12">
                        <ol class="breadcrumb">
                            <li>
                                <a href="#">Dashboard
                                </a>
                            </li>
                            <li class="active">View Tour Details
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- end: BREADCRUMB -->
                <!-- start: PAGE CONTENT -->
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



                                <div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <%-- <div id="divMsg" class="errorHandler alert alert-danger no-display">
                                                <i class="fa fa-times-sign"></i>You have some form errors. Please check below.
												
                                            </div>--%>
                                            <div id="divMsg" runat="server" class="successHandler alert alert-success no-display">
                                                <i class="fa fa-ok"></i>
                                                <asp:Label ID="lblMessage" runat="server" Text="hello"> </asp:Label>

                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Trip Type <span class="symbol required"></span>
                                                </label>
                                                <asp:DropDownList ID="ddlTripType" runat="server" CssClass="form-control"></asp:DropDownList>

                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Tour Place <span class="symbol required"></span>
                                                </label>

                                                <asp:DropDownList ID="ddlTourPlace" runat="server" CssClass="form-control"></asp:DropDownList>


                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div>
                                                    <span class="symbol required"></span>Required Fields
													
                                                <hr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8">
                                            </div>
                                            <div class="col-md-4">

                                                <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-yellow btn-block" ValidationGroup="Save" OnClick="btnSubmit_Click">
                                                 Save Details
                                                </asp:LinkButton>
                                            </div>
                                        </div>
<br />
                                       <%-- Tour Details--%>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>

                                                <div>
                                                    <asp:GridView ID="grdTourDtls" runat="server" ShowFooter="true" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" OnRowCommand="grdTourDtls_RowCommand">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S#">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex+1%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="TourInfo" SortExpression="TourInfo">
                                                                <ItemTemplate>
                                                                    <%#Eval("TourInfo") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Days" SortExpression="Days">
                                                                <ItemTemplate>
                                                                    <%#Eval("Days") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Nights" SortExpression="Nights">
                                                                <ItemTemplate>
                                                                    <%#Eval("Nights") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Discount" SortExpression="Discount">
                                                                <ItemTemplate>
                                                                    <%#Eval("Discount")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="TripName" SortExpression="TripName">
                                                                <ItemTemplate>
                                                                    <%#Eval("TripName")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="TourInfo" SortExpression="TourInfo">
                                                                <ItemTemplate>
                                                                    <%#Eval("TourInfo")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="TourPlace" SortExpression="TourPlace">
                                                                <ItemTemplate>
                                                                    <%#Eval("TourPlace")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Edit">
                                                                <ItemTemplate>

                                                                    <a href='<%#"AddTourDetails.aspx?TID=" + Eval("TourDetailsID") %>' class="btn btn-xs btn-blue tooltips" data-placement="top" data-original-title="Edit"><i class="fa fa-edit"></i></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="iDelete" CommandArgument='<%#Eval("TourDetailsID") %>' CssClass="btn btn-xs btn-red tooltips">
                                                            <i class="fa fa-times fa fa-white"></i>
                                                                    </asp:LinkButton>
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

