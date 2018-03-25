<%@ Page Title="Documentation" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="jumbotron">
        <h1>Documentation</h1>
        <p class="lead">This page contains instructions and documentation on how to use this website. The tasks are mentioned in the order they need to be performed.</p>
    </div>

    <div class="row">
        <div class="col-md-12" style="font-size: large;">
            As you visit the Supervision Software website, you will come across six actions which you may choose to perform.One can proceed with an action by pressing its respective&quot;Go &gt;&gt;&quot; captioned button, placed below each of the actions.<br />

            <ol>
                <li>&quot;Assign Designations&quot;</li>
                <li>&quot;Assign Rooms&quot;</li>
                <li>&quot;Assign Exceptions&quot;</li>
                <li>&quot;Reports&quot;</li>
                <li>&quot;Table Views&quot;</li>
                <li>&quot;Add Blocks&quot;</li>
            </ol>

            <br />
            <h2>First Step : Add blocks.
            </h2>
            <p>
                <strong>Assign Designations</strong> - It is a five step task:<br />
                1. Choose the designation to be assigned.<br />
                2. Use the radio button to specify whether the role assigned is for the morning/evening slot.<br />
                3. Select the start date and end date from a Virtual calender.<br />
                4. Choose the individual to be assigned with the task, from the list of employees including teaching and non-teaching staff.<br />
                5. Confirm the above mentioned choices by pressing the&quot;Insert&quot; captioned button.<br />
                (Following which, a row mentioning your latest Designation Assignment will appear at the bottom of the page, which you may consider as a confirmation of it being stored and also use it for future reference)<br />
            </p>
            <p>
                <strong>Assign Rooms</strong> -&nbsp; It is fairly similar to the process of Assigning Designations, with the obvious exception being that the first step will require you to choose the room number of the room to be assigned with the examination session. Along with the similar radio button to specify the slot (morning/evening).<br />
            </p>
            <p>
                <strong>Assign Exemptions</strong> - The requirements to perform this action is also more or less similar to the actions covered so far in this documentation. Except that we have to add three extra details as compared to the actions discussed so far. Them being, a brief reason and adetailed reason for seeking exemption. And also, before hitting the&quot;Insert&quot; button, the person granting the exemption has to be named.<br />
            </p>
            <p>
                <strong>Reports</strong> - This option allows the user to access the various records pertaining to Room Assignments, Staff Assignments and Exemptions granted, so far.&nbsp;&nbsp;
            </p>
            &nbsp;<br />
        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>

