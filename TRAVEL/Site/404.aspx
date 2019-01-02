<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Travel.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="TRAVEL.Site._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
		<div class="container page-404">
			<div class="clip-text clip-text_one" style="background-image: url('assets/img/home_img/mountain.jpg');">404</div>
			<h2>This Page Could Not Be Found!</h2>
			<h5>The page you are looking for might have been removed, had its name changed, or is temporarily unavailable.</h5>
			<div class="search-field">
				<div class="form-group pull-center">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-btn">
							<button class="btn btn-primary">Search</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
</asp:Content>
