<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Enquiry.aspx.cs" Inherits="TRAVEL.Admin.Enquiry" %>
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
                            <li class="active">Enquiry Details
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
                                                    Name 
                                                </label>
                                              <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Email 
                                                </label>
                                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                                          
                                            </div>
                                        </div>

                                           <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Duration From  
                                                </label>
                                                <asp:TextBox ID="txtDatefrom" runat="server" CssClass="form-control"></asp:TextBox>
                                          
                                            </div>
                                        </div>
                                           <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Duration To 
                                                </label>
                                                <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control"></asp:TextBox>
                                          
                                            </div>
                                        </div>

                                             <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    TourID 
                                                </label>
                                                <asp:TextBox ID="txtTourID" runat="server" CssClass="form-control"></asp:TextBox>
                                          
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    &nbsp; 
                                                </label>
                                                 <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-yellow btn-block" ValidationGroup="Save" OnClick="btnSubmit_Click">
                                                Search
                                                </asp:LinkButton>
                                          
                                            </div>
                                        </div>
 
                                        
                                        <br />
                                        <%-- Tour Details--%>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div >
                                                    <asp:GridView ID="grdEnquiryDetails" runat="server" ShowFooter="true" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" OnRowCommand="grdEnquiryDetails_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S#">
                                                                <ItemTemplate>
                                                                    <%# Container.DataItemIndex+1%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                                <ItemTemplate>
                                                                    <%#Eval("Name") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                                                <ItemTemplate>
                                                                    <%#Eval("Email") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                                                                <ItemTemplate>
                                                                    <%#Eval("Phone") %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="DurationFrom" SortExpression="DurationFrom">
                                                                <ItemTemplate>
                                                                    <%# Convert.ToDateTime(Eval("DurationFrom")).ToString("dd-MMM-yyyy")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="DurationTo" SortExpression="DurationTo">
                                                                <ItemTemplate>
                                                                    <%# Convert.ToDateTime( Eval("DurationTo")).ToString("dd-MMM-yyyy")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="TourPlace" SortExpression="TourID">
                                                                <ItemTemplate>
                                                                    <%#Eval("TourPlace")%>
                                                                    <asp:HiddenField ID="hfCreatedDate" runat="server" Value='<%# Convert.ToDateTime(Eval("Createddate")).ToString("dd-MMM-yyyy") %>' />

                                                                    <asp:HiddenField ID="hfPersons" runat="server"  Value='<%#Eval("Number_of_Person") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            


                                                             <asp:TemplateField HeaderText="View">
                                                                <ItemTemplate>
                                                                     <a id="apopup"  href="#responsive" data-toggle="modal" class="demo btn btn-blue">View
                                                                    </a>
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

    <div id="responsive" class="modal extended-modal fade no-display" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
						
                    </button>
                    <h4 class="modal-title">Enquiry Details</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12 table-responsive">
                          
                          <table class="table table-bordered table-hover" >
                              <tr>
                                  <td>
                                      Name
                                  </td>
                                  <td id="tdName">

                                  </td>
                              </tr>

                               <tr>
                                  <td>
                                      Email
                                  </td>
                                  <td id="tdEmail">

                                  </td>
                              </tr>

                               <tr>
                                  <td>
                                      Phone
                                  </td>
                                  <td id="tdPhone">

                                  </td>
                              </tr>


                                 <tr>
                                  <td>
                                      Duration From
                                  </td>
                                  <td id="tdDurationFrom">

                                  </td>
                              </tr>

                                 <tr>
                                  <td>
                                      Duration To
                                  </td>
                                  <td id="tdDurationTo">

                                  </td>
                              </tr>

                                 <tr>
                                  <td>
                                    Tour Place
                                  </td>
                                  <td id="tdTourPlace">

                                  </td>
                              </tr>

                               <tr>
                                  <td>
                                   Persons
                                  </td>
                                  <td id="tdPersons">

                                  </td>
                              </tr>


                                <tr>
                                  <td>
                                   Enquiry Date
                                  </td>
                                  <td id="tdcreateddate">

                                  </td>
                              </tr>
                          </table>    
                        </div>
                        
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-light-grey">
                        Close
                    </button>
                  
                </div>
            </div>
        </div>
    </div>

   <script type="text/javascript">
       $("td #apopup").click(function () {
           $("#tdName").html($(this).closest("tr").find("td").eq(1).html());
           $("#tdEmail").html($(this).closest("tr").find("td").eq(2).html());
           $("#tdPhone").html($(this).closest("tr").find("td").eq(3).html());
           $("#tdDurationFrom").html($(this).closest("tr").find("td").eq(4).html());
           $("#tdDurationTo").html($(this).closest("tr").find("td").eq(5).html());
           $("#tdTourPlace").html($(this).closest("tr").find("td").eq(6).html());
           $("#tdPersons").html($(this).closest("tr").find("input[id*='hfPersons']").val());
           $("#tdcreateddate").html($(this).closest("tr").find("input[id*='hfCreatedDate']").val());
       });

       $("#ContentPlaceHolder1_grdEnquiryDetails tr td:not('last')").click(function () {
           var index = $(this).index();
           if (index > 1) {
               $(this).find("td:last").find("#apopup").click();
           }
       });
   </script>


</asp:Content>

