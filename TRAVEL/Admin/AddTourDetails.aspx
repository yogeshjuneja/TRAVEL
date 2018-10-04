<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddTourDetails.aspx.cs" Inherits="TRAVEL.Admin.AddTourDetails" %>

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
                            <li class="active">ADD TOUR
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
                                            <div class="errorHandler alert alert-danger no-display">
                                                <i class="fa fa-times-sign"></i>You have some form errors. Please check below.
												
                                            </div>
                                            <div class="successHandler alert alert-success no-display">
                                                <i class="fa fa-ok"></i>Your form validation is successful!
												
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
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Place <span class="symbol required"></span>
                                                </label>
                                                <asp:TextBox ID="txtPlace" runat="server" MaxLength="30" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Days <span class="symbol required"></span>
                                                </label>
                                                <asp:TextBox ID="txtDays" runat="server" MaxLength="1" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Nights <span class="symbol required"></span>
                                                </label>
                                                <asp:TextBox ID="txtNights" runat="server" MaxLength="1" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Discount <span class="symbol required"></span>
                                                </label>
                                                <asp:TextBox ID="txtDiscount" runat="server" MaxLength="2" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>




                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div>
                                                <span class="symbol required"></span>Required Fields
													
                                                <hr>

                                                <h4 class="panel-title">Package Details <span class="text-bold"></span></h4>
                                                <br />
                                            </div>
                                        </div>
                                    </div>


                                    <%--PACKAGE DETAILS--%>

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                      
                                    <div>
                                        <asp:GridView ID="gvPackageDetails" OnRowCommand="gvPackageDetails_RowCommand" runat="server" ShowFooter="true" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
                                            <Columns>

                                                <asp:TemplateField HeaderText="S#">
                                                    <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                        <asp:HiddenField ID="hfPID" runat="server" Value='<%#Eval("PackageDetailsID") %>' />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Detail">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtDetails" Text='<%#Eval("Description") %>' runat="server" CssClass="form-control"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Include">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkInclude" Checked='<%# Convert.ToBoolean(Eval("IncluExcluType")) %>' runat="server" CssClass="flat-grey selectall" />
                                                    </ItemTemplate>

                                                    <FooterTemplate>

                                                       <asp:LinkButton ID="btnAddMore" OnClick="btnAddMore_Click" runat="server" CssClass="btn btn-green add-row">Add New <i class="fa fa-plus"></i></asp:LinkButton>
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="iDelete" CommandArgument='<%#Container.DataItemIndex %>'  CssClass="btn btn-xs btn-red tooltips">
                                                            <i class="fa fa-times fa fa-white"></i>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                
                                            </Columns>

                                            




                                        </asp:GridView>
                                    </div>
                                  
                                      </ContentTemplate>
                                    </asp:UpdatePanel>



                                       <div class="row">
                                        <div class="col-md-12">
                                            <div>
                                                <span class="symbol required"></span>Required Fields
													
                                                <hr>

                                                <h4 class="panel-title">Iternary Details <span class="text-bold"></span></h4>
                                                <br />
                                            </div>
                                        </div>
                                    </div>


                                    <%--Iternary DETAILS--%>

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                      
                                    <div>
                                        <asp:GridView ID="gvIternary" OnRowCommand="gvIternary_RowCommand" runat="server" ShowFooter="true" CssClass="table table-bordered table-hover" AutoGenerateColumns="false">
                                            <Columns>

                                                <asp:TemplateField HeaderText="S#">
                                                    <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                        <asp:HiddenField ID="hfIID" runat="server" Value='<%#Eval("ItnryDtlsID") %>' />

                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Heading">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtHeading" Text='<%#Eval("ItnryMainH") %>' runat="server" CssClass="form-control" placeholder="Main"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtDescription" Text='<%#Eval("ItnrySubH") %>' runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Decsription"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:FileUpload ID="fuIternary" runat="server" />
                                                    </ItemTemplate>

                                                    <FooterTemplate>

                                                       <asp:LinkButton ID="btnAddMoreIernary" OnClick="btnAddMoreIernary_Click" runat="server" CssClass="btn btn-green add-row">Add New <i class="fa fa-plus"></i></asp:LinkButton>
                                                    </FooterTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Delete">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="iDelete" CommandArgument='<%#Container.DataItemIndex %>'  CssClass="btn btn-xs btn-red tooltips">
                                                            <i class="fa fa-times fa fa-white"></i>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                
                                            </Columns>

                                            




                                        </asp:GridView>
                                    </div>
                                  
                                      </ContentTemplate>
                                    </asp:UpdatePanel>




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
                                            <button class="btn btn-yellow btn-block" type="submit">
                                                Register <i class="fa fa-arrow-circle-right"></i>
                                            </button>
                                        </div>
                                    </div>
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

</asp:Content>
