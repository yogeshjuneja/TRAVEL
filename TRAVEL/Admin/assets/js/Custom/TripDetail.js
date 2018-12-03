
$("#btnBookNow").click(function (event) {

    if (ValidateForm()) {
        $("#progressbar").removeClass("hidden");
        $(this).addClass("hidden");

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
                $("#progressbar").addClass("hidden");
                $(this).removeClass("hidden");
                var data = JSON.parse(JSON.stringify(response));
                $("#divMsgPopup").removeAttr("style");
                $("#divMsgPopup").removeClass();

                if (data.d == "success") {

                    $("#divMsgPopup").addClass("successHandler alert alert-success");
                    $("#lblMessagepopup").html("Thanks for your interest. You will got revert call back or email from our side soon");
                    ClearControls();
                }
                else {

                    $("#divMsgPopup").addClass("errorHandler alert alert-danger");
                    $("#lblMessagepopup").html("Unable to connect to server. Please try again after some time");
                }
            },
            error: function (r, x, y) {
                $("#progressbar").addClass("hidden");
                $(this).removeClass("hidden");
                $("#divMsgPopup").addClass("errorHandler alert alert-danger");
                $("#lblMessagepopup").html("Unable to connect to server. Please try again after some time");
            }
        });
    }
    //event.preventDefault();
});

function ClearControls() {
    $("#name").val("");
    $("#email").val("");
    $("#phone").val("");
    $("#from_date").val("");
    $("#to_date").val("");
    $("#number_person").val("");
    $("#hdnTourID").val("");
}
function ValidateForm() {
    var valid = true;
    var emailexp = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
    var mobexp = /^\d{10}$/;

    $(".preview-wrap").find("input").each(function () {
        var controlid = $(this).attr("id");
        if ($(this).val() == "") {
            valid = false;
            $(this).closest(".form-group").addClass("has-error");
            ShowError(controlid, "This Field is Required");
        }
        else {
            $(this).closest(".form-group").removeClass("has-error");
            $(this).closest(".form-group").find("span").remove();
        }
        if (controlid == "email" && $(this).val() != "") {
            if (!$("#email").val().match(emailexp)) {
                valid = false;
                $(this).closest(".form-group").addClass("has-error");
                ShowError(controlid, "invalid Email");
            }
            else
                $(this).closest(".form-group").find("span").remove();
        }

        if (controlid == "phone" && $(this).val() != "") {
            if (!$(this).val().match(mobexp)) {
                valid = false;
                $(this).closest(".form-group").addClass("has-error");
                ShowError(controlid, "invalid Phone");
            }
            else $(this).closest(".form-group").find("span").remove();
        }
    });

    return valid;


}

function ShowError(controlid, message) {

    if ($("#" + controlid).closest("div").find("span").length > 0) {
        $("#" + controlid).closest("div").find("span").html(message);
    }
    else
        $("<span class=\"help-block\">" + message + "</span>").insertAfter("#" + controlid);
    //$("#" + controlid).insertAfter("<span  class=\"help-block\">" + message + "</span>");
}
