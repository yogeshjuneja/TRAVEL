<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TourMaster.aspx.cs" Inherits="TRAVEL.Admin.TourMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
       
            <div class="container">
               
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
                <div class="row">
                    <div class="col-md-12">
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
                                            <div id="divMsg" runat="server" class="successHandler alert alert-success no-display">
                                                <i class="fa fa-ok"></i>
                                               
                                                <asp:label id="lblMessage" runat="server" text="hello"> </asp:label>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Trip Info <span class="symbol required"></span>
                                                </label>
                                                <asp:TextBox id="txtTourPlace" runat="server" cssclass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTourPlace" ForeColor="Red" ValidationGroup="Tour" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                      
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Display Image <span class="symbol required"></span>
                                                </label>
                                                <asp:FileUpload ID="fupDisplayImage" runat="server" />
                                            </div>
                                        </div>


                                         <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">
                                                    Images <span class="symbol required"></span>
                                                </label>

                                                <asp:FileUpload ID="fuplImages" runat="server" AllowMultiple="true" />
                                            </div>
                                        </div>
                                        

                                    </div>

                                 
                                    <div class="row">
                                        <div class="col-md-8">
                                        </div>
                                        <div class="col-md-4">

                                            <asp:linkbutton id="btnSubmit" ValidationGroup="Tour" runat="server" cssclass="btn btn-yellow btn-block"  OnClick="btnSubmit_Click" >
                                                  <asp:Label ID="lblSubmit" runat="server" Text="Submit"></asp:Label>
                                                <i class="fa fa-arrow-circle-right"></i>
                                            </asp:linkbutton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subviews">
                <div class="subviews-container"></div>
            </div>
        </div>
        <!-- end: PAGE -->
    </div>




</asp:Content>
