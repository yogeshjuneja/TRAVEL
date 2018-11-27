<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TRAVEL.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>
<body>

<table id="tbl1">
<tr>
<td><input type="radio" disabled/> </td>
<td><input type="radio" disabled/> </td>
<td><input type="radio" disabled /> </td>
<td> <input type="checkbox"/> </td>
</tr>

<tr>
<td><input type="radio" disabled/> </td>
<td><input type="radio" disabled/> </td>
<td><input type="radio" disabled/> </td>
<td> <input type="checkbox"/> </td>
</tr>
</table>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        $("#tbl1").find("input[type='checkbox']").change(function() {
            if ($(this).is(":checked")) 
                $(this).closest("tr").find("input[type='radio']").removeAttr("disabled");
            else
                $(this).closest("tr").find("input[type='radio']").attr("disabled","disabled");
        });
    </script>
</body>
</html>
