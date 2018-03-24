<%@ Page Title="Table Views" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Table Views</h1>
        <p class="lead">This is a developer area. Beware modifying items if you don't know what they are.</p>
        <p><a href="/Documentation.aspx" class="btn btn-primary btn-lg">Learn how to use the software &raquo;</a></p>
    </div>
    
    <div class="row">
        <div class="col-md-4">
            <h2>Staff</h2>
            <p>
             Add or remove a staff member. You can also view a list of all staff members.
            </p>
            <p>
                <a class="btn btn-default" runat = "server" href="~/TableView/StaffTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Designations</h2>
            <p>
                Assign a staff member to a designation for a time period and shift. 
            </p>
            <p>
                <a class="btn btn-default" runat = "server" href="~/TableView/DesignationsTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Block Assignment</h2>
            <p>
                Assign a staff member to an exam block for duty on a day and shift.
            </p>
            <p>
                <a class="btn btn-default" runat = "server" href="~/TableView/RoomAssignmentTableView.aspx">Go &raquo;</a>
            </p>
        </div>
    </div>
    
    
    <div class="row">
        <div class="col-md-4">
            <h2>Exemptions</h2>
            <p>
                Exempt a staff member from examination duty.
            </p>
            <p>
                <a class="btn btn-default" runat = "server" href="~/TableView/ExceptionsTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Exam blocks</h2>
            <p>
                Change the list of available blocs for the examination.
            </p>
            <p>
                <a class="btn btn-default" runat = "server" href="~/TableView/ExaminationRoomsTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Reports</h2>
            <p>
                View metrics and overall statistics. Generate reports here.
            </p>
            <p>
                <a class="btn btn-default" runat = "server" href="~/Reports/">Go &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
