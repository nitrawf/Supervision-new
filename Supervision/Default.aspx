<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Supervision</h1>
        <p class="lead">Supervision is a homegrown solution to an institute's invigilation needs built by the students.</p>
        <p><a href="/Documentation.aspx" class="btn btn-primary btn-lg">Learn how to use the software &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Add blocks</h2>
            <p>
                Add a new block which are available for exams and can be assigned to.
            </p>
            <p>
                <a class="btn btn-default" href="Admin/AddBlock.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Assign Designations</h2>
            <p>
                Assign Designation to a staff member for a particular date or a date range.
            </p>
            <p>
                <a class="btn btn-default" href="Admin/AssignDesignation.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Assign Exemptions</h2>
            <p>
                Assign exemptions to a staff member if they are unavailable for a date range.
            </p>
            <p>
                <a class="btn btn-default" href="Admin/RequestExemption.aspx">Go &raquo;</a>
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Assign Blocks</h2>
            <p>
                Assign a block to a staff member for a particular date.
            </p>
            <p>
                <a class="btn btn-default" href="Admin/AssignRoom.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Reports</h2>
            <p>
                Reports about already assigned entities.
            </p>
            <p>
                <a class="btn btn-default" href="Reports/Default.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Table Views</h2>
            <p>
                For the developers to clean up bad data. 
            </p>
            <p>
                <a class="btn btn-default" href="TableView/Default.aspx">Go &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
