<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Travel.Master" AutoEventWireup="true" CodeBehind="TourList.aspx.cs" Inherits="TRAVEL.Site.TourList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        #loadingcircle {
            position: absolute;
            left:787px;
            top: 538px;
            z-index: 1;
        }
    </style>
    <div id="loadingcircle" style="display:none">
        <img src="assets/img/loading.gif" />
    </div>
    <section class="page-img" style="background-image: url('assets/img/home_img/mountain.jpg');">
        <div class="container">
            <div class="col-sm-8">
                <h1 class="main-head">Trip List</h1>
                <h5 class="sub-head">Two Column Grid Listing with Sidebar</h5>
            </div>
            <div class="col-sm-4">
                <ul class="breadcrumb">
                    <li><a href="#"><span class="icon-home"></span></a></li>
                    <li><a href="#">List</a></li>
                </ul>
            </div>

        </div>
    </section>

    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">

                    <div class="sidebar">
                        <div class="border-box">
                            <div class="box-title">Tour Search</div>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search Trips" id="searchtrips">
                                <div class="input-group-btn">
                                    <a class="btn btn-primary" onclick="GetTrips();">Search</a>
                                </div>
                            </div>
                        </div>

                        <%-- <div class="border-box">
                            <div class="box-title">Choose Country</div>
                            <select class="form-control selectpicker">
                                <option value="">Choose</option>
                            </select>
                        </div>--%>

                        <div class="border-box">
                            <div class="box-title">Difficulty</div>
                            <div>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default active" data-toggle="tooltip" data-placement="bottom" title="Easy">
                                        <input type="radio" name="options" id="option1" checked>
                                        <span class="icon-easy"></span>
                                    </label>
                                    <label class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Easy">
                                        <input type="radio" name="options" id="option2">
                                        <span class="icon-medium"></span>
                                    </label>
                                    <label class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Difficult">
                                        <input type="radio" name="options" id="option3">
                                        <span class="icon-difficult"></span>
                                    </label>
                                    <label class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Hard">
                                        <input type="radio" name="options" id="option4">
                                        <span class="icon-hard"></span>
                                    </label>
                                    <label class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Extreme">
                                        <input type="radio" name="options" id="option5">
                                        <span class="icon-extreme"></span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="border-box">
                            <div class="box-title">Price Range</div>
                            <div class="price-widget">
                                <div id="price-slider"></div>
                                <div id="amount-min" class="pull-left"></div>
                                <div id="amount-max" class="pull-right"></div>
                            </div>
                        </div>

                        <div class="border-box">
                            <div class="box-title">Category</div>
                            <asp:CheckBoxList ID="chkCategory" CssClass="checklist" runat="server" RepeatDirection="Vertical" RepeatLayout="UnorderedList"></asp:CheckBoxList>

                          <%--  <ul >
                                <li>
                                    <input type="checkbox" value="hello hello hello">
                                    All Style</li>
                                <li>
                                    <input type="checkbox">
                                    Trekking</li>
                                <li>
                                    <input type="checkbox">
                                    Hiking &amp; Sightseeing</li>
                                <li>
                                    <input type="checkbox">
                                    Relaxation</li>
                                <li>
                                    <input type="checkbox">
                                    Adventure</li>
                            </ul>--%>
                        </div>

                        <div class="border-box">
                            <div class="box-title">Duration</div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Days</label>
                                        <select class="form-control selectpicker">
                                            <option value="">1</option>
                                            <option value="">2</option>
                                            <option value="">3</option>
                                            <option value="">4</option>
                                            <option value="">5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Nights</label>
                                        <select class="form-control selectpicker">
                                            <option value="">1</option>
                                            <option value="">2</option>
                                            <option value="">3</option>
                                            <option value="">4</option>
                                            <option value="">5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>




                </div>

                <div class="col-sm-8">
                    <div class="sort-wrap">
                        <div class="sort-title"><span id="tripcount"></span>Matching Result</div>
                        <div class="toogle-view">
                            <a href="trip_list.html" class="icon icon-list"></a>
                            <a href="trip_grid_withsidebar.html" class="icon icon-grid active"></a>
                        </div>
                    </div>
                    <div class="row item" id="trippdata">


                        <%--  <div class="col-sm-12 col-md-6">
                            <div class="item-grid">
                                <div class="item-img" style="background-image: url('assets/img/trip_detail/thumb_1.jpg');">
                                    <div class="item-overlay">
                                        <a href="trip_detail.html"><span class="icon-binocular"></span></a>
                                    </div>
                                </div>
                                <div class="item-desc">
                                    <div class="item-info">
                                        <span class="icon-hard"></span>
                                        <h4 class="title"><a href="#">Routeburn Track</a></h4>
                                    </div>

                                    <div class="sub-title">
                                        <span class="location">New Zealand</span>
                                        <span class="grade">Hard</span>
                                    </div>

                                    <div class="item-detail">
                                        <div class="left">
                                            <div class="day"><span class="icon-sun"></span>3 Days</div>
                                            <div class="night"><span class="icon-moon"></span>2 Nights</div>
                                        </div>
                                        <div class="right">
                                            <div class="price">USD 121</div>
                                            <a href="trip_detail.html" class="btn btn-primary hvr-sweep-to-right">Book Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <div class="pagination-wrap">
                        <span class="total">Total 127</span>
                        <nav class="pull-right">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="First">First</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><span class="page-link">..</span></li>
                                <li class="page-item"><a class="page-link" href="#">99</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Last">Last</a>
                                </li>
                            </ul>
                        </nav>
                        <div class="clearfix"></div>
                    </div>


                </div>
            </div>
        </div>
    </main>

    <script src="vendor/Jquery/dist/Jquery.min.js"></script>
    <script src="vendor/Jqueryui/Jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript">



        $(window).load(function () {
            GetTrips();
            
        $("#ContentPlaceHolder1_chkCategory").find("li:first >input").on('change',function () {

            $("#ContentPlaceHolder1_chkCategory").find("input").attr("checked", $(this).prop("checked"));
        });
        });
        $("#price-slider").on('mouseleave', function () {

            GetTrips();
        });
        //mousedown
        function GetTrips() {
            $("#trippdata").fadeIn("slow").html("");
            $("#loadingcircle").removeAttr("style");
            var MinPrice = $("#amount-min").html().replace('₹', "");
            var MaxPrice = $("#amount-max").html().replace('₹', "");
            var tourinfo = $("#searchtrips").val();
            var APIURL = "/api/Trip/GetTrips?tourinfo=" + tourinfo + "&startprice=" + MinPrice + "&endprice=" + MaxPrice + "&difficulty=0&category=&days=0&nights=0";

            $.ajax({
                type: "Get",
                url: APIURL,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response, x, r) {
                    debugger;

                    $("#loadingcircle").css("display", "none");
                    var Trips = [];
                    var data = JSON.parse(JSON.stringify(response));
                    if (data.Root.Message == "success") {
                        Trips = data.TourData;
                        $("#tripcount").text(Trips.length);
                        $.each(Trips, function (key, value) {
                            var Tour = value;
                            var HTML = "<div class=\"col-sm-12 col-md-6\"><div class=\"item-grid\"><div class=\"item-img\" style=\"background-image: url('../../Upload/" + value.ImagePath + "');\" >";
                            HTML += "<div class=\"item-overlay\">";
                            HTML += "<a href=\"trip_detail.html\"><span class=\"icon - binocular\"></span></a>";
                            HTML += "</div></div>";
                            HTML += "<div class=\"item-desc\">";
                            HTML += "<div class=\"item-info\">";
                            HTML += "<span class=\"icon-hard\"></span>";
                            HTML += "<h4 class=\"title\"><a href=\"#\">" + value.Place + "</a></h4></div>";
                            HTML += "<div class=\"sub-title\">";
                            HTML += "<span class=\"location\">" + value.TourPlace + "</span>";
                            HTML += "<span class=\"grade\">Hard</span></div>";
                            HTML += "<div class=\"item-detail\">";
                            HTML += "<div class=\"left\">";
                            HTML += "<div class=\"day\"><span class=\"icon-sun\"></span>" + value.Days + " Days</div>";
                            HTML += "<div class=\"night\"><span class=\"icon-moon\"></span>" + value.Nights + " Nights</div> </div>";
                            HTML += "<div class=\"right\">";
                            HTML += "<div class=\"price\">INR " + value.Price + "</div>";
                            HTML += "<a href=\"TripDetail.aspx?TID=" + value.TourDetailsID + "\" class=\"btn btn-primary hvr-sweep-to-right\">Book Now</a>";
                            HTML += "</div></div></div></div></div>";
                            $("#trippdata").append(HTML);

                        });
                    }
                },
                error: function (r, x, y) {

                }
            });
        }
    </script>
</asp:Content>
