﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Supervision</h1>
        <p class="lead">Supervision is a homegrown solution to an institute's invigilation needs built by the students.</p>
        <p><a href="/Documentation.aspx" class="btn btn-primary btn-lg">Learn how to use the software &raquo;</a></p>
    </div>
    
    <div class="row">
        <div class="col-md-4">
            <h2>Staff</h2>
            <p>
             Add or remove a staff member. You can also view a list of all staff members.
            </p>
            <p>
                <a class="btn btn-default" href="TableView/StaffTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Designations</h2>
            <p>
                Assign a staff member to a designation for a time period and shift. 
            </p>
            <p>
                <a class="btn btn-default" href="TableView/DesignationsTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Block Assignment</h2>
            <p>
                Assign a staff member to an exam room for duty on a day and shift.
            </p>
            <p>
                <a class="btn btn-default" href="TableView/RoomAssignmentTableView.aspx">Go &raquo;</a>
            </p>
        </div>
    </div>
    
    
    <div class="row">
        <div class="col-md-4">
            <h2>Exemptions</h2>
            <p>
             Exempt a staff member from examination duty for a time period.
            </p>
            <p>
                <a class="btn btn-default" href="TableView/ExceptionsTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Exam blocks</h2>
            <p>
                Change the list of available blocs for the examination.
            </p>
            <p>
                <a class="btn btn-default" href="TableView/ExaminationRoomsTableView.aspx">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Queries</h2>
            <p>
                View metrics and overall statistics. Generate reports here.
            </p>
            <p>
                <a class="btn btn-default" href="#">Go &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
