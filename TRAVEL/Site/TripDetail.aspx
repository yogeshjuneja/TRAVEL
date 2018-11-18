<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Travel.Master" AutoEventWireup="true" CodeBehind="TripDetail.aspx.cs" Inherits="TRAVEL.Site.TripDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .no-display {
            display: none;
        }

        .Star {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(images/FilledStar.gif);
            height: 17px;       
            width: 17px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="carousel slide carousel-fade with-overlay full-height stick-top" id="carousel" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="active"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
        </ol>

        <div class="carousel-inner" role="listbox">
            <div class="item active" style="background-image: url('assets/img/trip_detail/6.jpg');">
            </div>
            <div class="item" style="background-image: url('assets/img/trip_detail/5.jpg');">
            </div>
            <div class="item" style="background-image: url('assets/img/trip_detail/4.jpg');">
            </div>
            <div class="carousel-caption center-txt">
                <h1 class="main-header" id="tripheading" runat="server"></h1>
                <hr />
                <h4 class="sub-header" id="shortdesc" runat="server"></h4>
            </div>
        </div>

        <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
            <span class="icon-arrow-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
            <span class="icon-arrow-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="container">
        <div class="trip-insight">
            <div class="insight-list-wrap row">
                <div>
                    <div class="insight-list">
                        <span class="icon-mountain"></span>
                        <div class="txt">
                            <p>Max Height</p>
                            <h3>5,416 m</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="insight-list">
                        <span class="icon-calendar"></span>
                        <div class="txt">
                            <p>Trip Days</p>
                            <h3><asp:Label ID="lbltripdays" runat="server"></asp:Label></h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="insight-list">
                        <span class="icon-tent"></span>
                        <div class="txt">
                            <p>Type</p>
                            <h3>Trekking</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="insight-list">
                        <span class="icon-easy"></span>
                        <div class="txt">
                            <p>Difficulty</p>
                            <h3><asp:Label ID="lbldifficulty" runat="server"></asp:Label></h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="main-price">
                
                <div class="price">
                    <asp:Label ID="lblPrice" runat="server"></asp:Label>
                </div>
                <button class="btn btn-primary btn-lg hvr-sweep-to-right" data-toggle="modal" data-target="#myModal">Book Now</button>
            </div>
            <ul class="social-icon">
                <li><span class="icon-facebook"></span>Share</li>
                <li><span class="icon-twitter"></span>Tweet</li>
                <li><span class="icon-google"></span>Google +1</li>
                <li><span class="icon-pinterest"></span>Pin it</li>
            </ul>
        </div>
    </div>

    <div class="trip-detail">
        <div class="container">
            <div class="tab-wrap">

                <ul id="trip-tab" class="nav nav-tabs affix-top" data-spy="affix" data-offset-top="1290">
                    <li class="active"><a href="#overview" data-toggle="tab">Overview</a></li>
                    <li class=""><a href="#itenary" data-toggle="tab">Itenary</a></li>
                    <%--  <li class=""><a href="#dateprice" data-toggle="tab">Date &amp; Price</a></li>--%>
                    <li class=""><a href="#reveiws" data-toggle="tab">Reviews</a></li>
                </ul>

                <div class="tab-content paper-effect">

                    <div class="tab-pane active" id="overview">
                        <div class="row">
                            <div class="col-sm-6">
                                <h3>
                                    <asp:Label ID="lblTourName" runat="server" /></h3>
                                <asp:HiddenField ID="hdnTourID" runat="server" ClientIDMode="Static" />
                                <p>
                                    <asp:Label ID="lblTourInfo" runat="server"></asp:Label>
                                </p>
                                <%-- <p>Dolor sit amet, consectetur adipisicing elit. Incidunt consequatur iusto odio quis magnam, aut assumenda ipsa magni ea, veritatis, nostrum rerum necessitatibus excepturi eos et nemo iste? Illo temporibus mollitia ducimus aspernatur numquam, sint sunt consequatur rerum aliquam odio!</p>
                                <p>Consectetur adipisicing elit. Debitis natus eum autem nisi cumque optio. Quis, necessitatibus laboriosam, alias, ea aut atque facere fugiat iusto tenetur minima itaque vero aperiam! Veniam exercitationem, distinctio laborum magnam rerum quia et commodi hic quis suscipit! Molestias, eaque. Incidunt, a, molestias! Veniam, nobis, recusandae.</p>--%>
                                <%-- <blockquote class="with-icon">
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis laboriosam repudiandae eligendi illum vero cum corrupti impedit nihil, aliquid. Veniam!
									<footer>Someone famous in <cite title="Source Title">Source Title</cite></footer>
                                </blockquote>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, deleniti optio similique nobis.
                                </p>--%>
                            </div>
                            <div class="col-sm-6">
                                <div class="border-box">
                                    <div class="box-title">Trip Overview</div>
                                    <ul class="trip-overview">
                                     <%--   <li>
                                            <span class="icon-road-sign"></span>
                                            <div class="detail">
                                                <div class="title">Trip profile</div>
                                                <div class="desc">21 Day Trip 14 days point-to-point trekdiv nights</div>
                                            </div>
                                        </li>--%>
                                        <li>
                                            <span class="icon-dollar"></span>
                                            <div class="detail">
                                                <div class="title">Cost</div>
                                                <div class="desc"> <asp:Label ID="lblcost" runat="server"></asp:Label></div>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="icon-camp-fire"></span>
                                            <div class="detail">
                                                <div class="title">Type</div>
                                                <div class="desc">Camping</div>
                                            </div>
                                        </li>
                                 <%--       <li>
                                            <span class="icon-barcode"></span>
                                            <div class="detail">
                                                <div class="title">Trip Code</div>
                                                <div class="desc">AD 23</div>
                                            </div>
                                        </li>--%>
                                 <%--       <li>
                                            <span class="icon-calendar"></span>
                                            <div class="detail">
                                                <div class="title">Trek Days</div>
                                                <div class="desc">18</div>
                                            </div>
                                        </li>--%>
                                      <%--  <li>
                                            <span class="icon-door-tag "></span>
                                            <div class="detail">
                                                <div class="title">Accomodation</div>
                                                <div class="desc">6 Night hotel, 3 night Tea House</div>
                                            </div>
                                        </li>--%>
                                       <%-- <li>
                                            <span class="icon-home"></span>
                                            <div class="detail">
                                                <div class="title">Trek Accomodation</div>
                                                <div class="desc">6 Night hotel, 3 night Tea House</div>
                                            </div>
                                        </li>--%>
                                        <li>
                                            <span class="icon-bus"></span>
                                            <div class="detail">
                                                <div class="title">Transportation</div>
                                                <div class="desc">
                                                    <asp:Label ID="lblTransaportation" runat="server"></asp:Label>

                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane" id="itenary">
                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="itenary-steps">
                                    <asp:Repeater ID="rptIternary" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <div class="icon-plane"></div>
                                                <div class="day-number"><%# "Day"+ Eval("Day") %></div>
                                                <div class="detail">
                                                    <%#Eval("ItnrySubH") %>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                    <%--<li>
                                        <div class="icon-tent"></div>
                                        <div class="day-number">Day 2</div>
                                        <div class="detail">Fly to Dhampur from city airport</div>
                                    </li>
                                    <li>
                                        <div class="icon-hiking"></div>
                                        <div class="day-number">Day 3</div>
                                        <div class="detail">Set up Base(2,140m)</div>
                                    </li>
                                    <li>
                                        <div class="icon-tree"></div>
                                        <div class="day-number">Day 4</div>
                                        <div class="detail">Trek through the arid hilly landscapes and remote settlements to Kelrap (3,944m)</div>
                                    </li>
                                    <li>
                                        <div class="icon-none"></div>
                                        <div class="day-number">Day 5</div>
                                        <div class="detail">Cross the difficult Simera (5,238m) and Tognepse (5,214m) and trek through yak pastures to the remote village</div>
                                    </li>
                                    <li>
                                        <div class="icon-camera"></div>
                                        <div class="day-number">Day 6</div>
                                        <div class="detail">Explore Rinpmo village and turquoise coloured Phikus Lake</div>
                                    </li>
                                    <li>
                                        <div class="icon-tent"></div>
                                        <div class="day-number">Day 7</div>
                                        <div class="detail">Retrace steps back to base to end trek</div>
                                    </li>
                                    <li>
                                        <div class="icon-none"></div>
                                        <div class="day-number">Day 8</div>
                                        <div class="detail">Fly back</div>
                                    </li>
                                    <li>
                                        <div class="icon-plane"></div>
                                        <div class="day-number">Day 9</div>
                                        <div class="detail">At leisure in City</div>
                                    </li>
                                    <li>
                                        <div class="icon-flag"></div>
                                        <div class="day-number">Day 10</div>
                                        <div class="detail">Trip concludes</div>
                                    </li>--%>
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <br>

                                <div class="panel-group" id="accordion1" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="heading1One">
                                            <h4 class="panel-title">
                                                <a role="button" data-toggle="collapse" data-parent="#accordion1" href="#collapse1One" aria-expanded="true" aria-controls="collapse1One">Included
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse1One" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1One">
                                            <div class="panel-body">
                                                <ul class="clean-ul">

                                                    <asp:Repeater ID="rptPkgInclude" runat="server">
                                                        <ItemTemplate>
                                                            <li><span class="icon-tick"></span>
                                                                <div class="desc"><%#Eval("PackageName")%></div>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>


                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="heading1Two">
                                            <h4 class="panel-title">
                                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion1" href="#collapse1Two" aria-expanded="false" aria-controls="collapse1Two">Not Included
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapse1Two" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading1Two">
                                            <div class="panel-body">
                                                <ul class="clean-ul">

                                                    <asp:Repeater ID="rptExclude" runat="server">
                                                        <ItemTemplate>
                                                            <li><span class="icon-cross"></span>
                                                                <div class="desc"><%#Eval("PackageName")%></div>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>


                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>

                    <%--<div class="tab-pane" id="dateprice">
                        <div class="table-responsive-wrap">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>Trip Dates</th>
                                        <th>Availability</th>
                                        <th>Discount</th>
                                        <th>Price</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>12 July to 18 July 2015</td>
                                        <td>Yes</td>
                                        <td>3%</td>
                                        <td><b>USD 239</b></td>
                                        <td><a href="#" class="btn btn-primary">Book Now</a></td>
                                    </tr>
                                    <tr>
                                        <td>12 July to 18 July 2015</td>
                                        <td>No</td>
                                        <td>3%</td>
                                        <td><b>USD 239</b></td>
                                        <td><a href="#" class="btn btn-default">Book Now</a></td>
                                    </tr>
                                    <tr>
                                        <td>12 July to 18 July 2015</td>
                                        <td>Yes</td>
                                        <td><i>with Promotional Code</i></td>
                                        <td><b>USD 239</b></td>
                                        <td><a href="#" class="btn btn-primary">Book Now</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>--%>

                    <div class="tab-pane" id="reveiws">
                        <div class="review-comment">
                            <br>
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="media-list review-comment">

                                        <asp:Repeater ID="rptReviews" runat="server">
                                            <ItemTemplate>
                                                <li class="media">

                                                    <div class="media-body">
                                                        <h4 class="media-heading"><%#Eval("Name") %></h4>
                                                        <div class="rating">
                                                            <%#StarsCountString(Convert.ToInt32(Eval("Rating"))) %>
                                                        </div>
                                                        <p><%#Eval("ReviewInfo") %></p>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                    </ul>
                                </div>

                                <asp:UpdatePanel ID="upd1" runat="server">
                                    <ContentTemplate>
                                        <div class="col-sm-6">
                                            <div class="add-comment">
                                                <div class="border-box">
                                                    <div class="box-title">Leave a Review</div>
                                                    <div class="form-group">
                                                        <label>Full Name</label>
                                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Email Address</label>
                                                        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label>Rating</label>

                                                        <asp:Rating ID="Rating1" AutoPostBack="true" runat="server"
                                                            StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                                            FilledStarCssClass="FilledStar">
                                                        </asp:Rating>
                                                    </div>
                                                    <br />
                                                    <div class="form-group">
                                                        <label>Add Comment</label>
                                                        <asp:TextBox ID="txtCommentField" runat="server" CssClass="form-control" placeholder="Comment"></asp:TextBox>
                                                        <asp:LinkButton ID="btnnSaveComment" runat="server" OnClick="btnnSaveComment_Click" CssClass="btn btn-primary" Text="Add Comment"></asp:LinkButton>

                                                        <br />
                                                        <div id="divMsg" runat="server" class="successHandler alert alert-success no-display">
                                                            <i class="fa fa-ok"></i>
                                                            <asp:Label ID="lblMessage" runat="server"> </asp:Label>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>


                        </div>
                    </div>

                </div>
            </div>


            <br>
            <br>



            <div class="row">
                <div class="gallery" id="trip-gallery-1">

                    <asp:Repeater ID="rptImages" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-3">
                                <a href="<%#"../Upload/"+Eval("Image") %>" class="gallery-item" data-lightbox="trip-detail-gallery" data-title="Lorem ipsum dolor.">
                                    <img src="<%#"../Upload/"+Eval("Image") %>" class="img-responsive" style="height: auto; width=100%">
                                    <div class="hover-overlay">
                                        <span class="icon-search"></span>
                                    </div>
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
            <br>
            <br>
           <%-- <div class="section-title center">
                <h3>Find Map</h3>
            </div>
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d37319.30096857599!2d-111.50394094053527!3d44.81298564157587!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5351e55555555555%3A0xaca8f930348fe1bb!2sYellowstone+National+Park!5e0!3m2!1sen!2snp!4v1493435077252" style="width: 100%; border: 0" height="450" allowfullscreen></iframe>
            </div>--%>

        </div>

    </div>


    <div class="banner white">
        <div class="container">
            <div class="section-title center">
                <h3>Similar Trips</h3>
            </div>
            <div class="row item">
                 <asp:Repeater ID="rptTours" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-6 col-md-4">
                            <div class="item-grid">
                                <div class="item-img" style="<%#"background-image: url('../../Upload/"+Eval("ImagePath")+"');"%>">
                                    <div class="item-overlay">
                                        <a href='<%#"TripDetail.aspx?TID="+Eval("TourDetailsID") %>'><span class="icon-binocular"></span></a>
                                    </div>
                                </div>
                                <div class="item-desc">
                                    <div class="item-info">
                                        <span class="icon-easy"></span>
                                        <h4 class="title"><a href="#"><%#Eval("Place") %></a></h4>
                                          <span class="location"><%#Eval("TourPlace") %></span>
                                    </div>

                                    <div class="sub-title">
                                        <span class="location"><%#Eval("TripName") %></span>
                                        <span class="grade">Easy</span>
                                    </div>

                                    

                                    <div class="item-detail">
                                        <div class="left">
                                            <div class="day"><span class="icon-sun"></span><%#Eval("Days") %> Days</div>
                                            <div class="night"><span class="icon-moon"></span><%#Eval("Nights") %> Nights</div>
                                        </div>
                                        <div class="right">
                                            <div class="price">INR <%#Eval("Price") %></div>
                                            <a href='<%#"TripDetail.aspx?TID="+Eval("TourDetailsID") %>' class="btn btn-primary hvr-sweep-to-right">Book Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <div class="modal fade modal-book-now" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Book Now</h4>
                </div>
                <div class="modal-body">

                    <div class="preview-wrap">
                        <div class="preview-img" style="background-image: url('assets/img/home_img/mountain.jpg')"></div>

                        <div class="form-wrap">
                            <div id="form-messages" class="alert" role="alert" style="display: none;"></div>
                            <input type="hidden" name="trip" id="trip" value="annapurna">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="Enter Your Name" value="" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" id="email" class="form-control" placeholder="Email Address" value="" required>
                            </div>

                            <div class="form-group">
                                <label>Phone</label>
                                <input type="number" name="phone" id="phone" class="form-control" placeholder="Phone Number" value="" required>
                            </div>

                            <div class="form-group">
                                <label>Duration</label>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="from_date" id="from_date" class="form-control datepicker" placeholder="From" value="" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" name="to_date" id="to_date" class="form-control datepicker" placeholder="To" value="" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Number of Person</label>
                                <input type="text" name="number_person" id="number_person" class="form-control" value="2" required>
                            </div>
                            <button class="btn btn-primary hvr-sweep-to-right" id="btnBookNow">BooK Now</button>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/dist/jquery.min.js"></script>
    <script src="vendor/jqueryui/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="vendor/jquery.ui.touch-punch.min.js"></script>
    <script src="vendor/bootstrap/dist/js/bootstrap.min.js"></script>

    <script src="vendor/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="vendor/owlcarousel/owl.carousel.min.js"></script>
    <script src="vendor/retina.min.js"></script>
    <script src="vendor/jquery.imageScroll.min.js"></script>
    <script src="assets/js/min/responsivetable.min.js"></script>
    <script src="assets/js/bootstrap-tabcollapse.js"></script>

    <script src="assets/js/min/countnumbers.min.js"></script>
    <script src="assets/js/main.js"></script>


    <link href="assets/css/controlpanel.css" rel="stylesheet" />
    <link href="vendor/colpick-jQuery-Color-Picker-master/css/colpick.css" rel="stylesheet" type="text/css" />
    <link href="vendor/colorpicker/css/evol-colorpicker.min.css" rel="stylesheet" type="text/css" />
    <script src="vendor/colpick-jQuery-Color-Picker-master/js/colpick.js"></script>
    <script src="vendor/colorpicker/js/evol-colorpicker.min.js"></script>
    <script src="assets/js/controlpanel.js"></script>

    <!-- Current Page JS -->
    <script src="vendor/lightbox/js/lightbox.js"></script>
    <script src="assets/js/min/tripdetailpage.min.js"></script>
    <script src="assets/js/min/img_gallery.min.js"></script>

    <!-- Current Page JS || Ajax Contact -->
    <script src="assets/js/book_trip.js"></script>

    <script type="text/javascript">
        $("#btnBookNow").click(function (event) {
            event.preventDefault();
            var formdata = {
                name: $("#name").val(),
                email: $("#email").val(),
                phone: $("#phone").val(),
                durationfrom: $("#from_date").val(),
                duarationto: $("#to_date").val(),
                noofperson: $("#number_person").val(),
                TourID: $("#hdnTourID").val()
            };
            $.ajax({
                type: "Post",
                url: "/Enquiry.asmx/SaveEnquiry",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(formdata),
                dataType: "json",
                success: function (response, x, r) {
                    debugger;
                     
                    alert(JSON.stringify(response));
                },
                error: function (r, x, y) {
                    debugger;
                    alert("error");
                    alert(JSON.stringify(r));
                    alert(x);
                    alert(y);
                }
                 
            });

        });
    </script>
</asp:Content>
