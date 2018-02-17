<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Supervision</h1>
        <p class="lead">Supervision is a homegrown solution to an institute's invigilation needs built by the students.</p>
        <p><a href="/Documentation.aspx" class="btn btn-primary btn-lg">Learn how to use the software &raquo;</a></p>
    </div>
    
    <div class="row">
        <div class="col-md-4">
            <h2>Staff Assignments</h2>
            <p>
				Get the details of the staff assignments which are already done.
            </p>
            <p>
                <a class="btn btn-default" href="Reports/StaffAssignedToRoom.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Assigned Staff</h2>
            <p>
                Get the list of staff members and other details which are already assigned.
            </p>
            <p>
                <a class="btn btn-default" href="Reports/StaffBusy.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>View Exemptions</h2>
            <p>
				View/Download a list of exempted staff members.
			</p>
            <p>
                <a class="btn btn-default" href="Reports/TeachersExempted.aspx">Go &raquo;</a>
            </p>
        </div>

    </div>

</asp:Content>
