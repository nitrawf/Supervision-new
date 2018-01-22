<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Supervision</h1>
        <p class="lead">Supervision is a homegrown solution to an institute's invigilation needs built by the students.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>
    
    <div class="row">
        <div class="col-md-4">
            <h2>Staff</h2>
            <p>
             Add or remove a staff member. You can also view a list of all staff members.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Designations</h2>
            <p>
                Assign a staff member to a designation for a time period and shift. 
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Go &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Exam Room</h2>
            <p>
                Assign a staff member to an exam room for duty on a day and shift.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Go &raquo;</a>
            </p>
        </div>
    </div>
    
</asp:Content>
