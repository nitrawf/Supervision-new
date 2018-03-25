<%@ Page Title="Documentation" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="jumbotron">
        <h1>Documentation</h1>
        <p class="lead">This page contains instructions and documentation on how to use this website. The tasks are mentioned in the order they need to be performed.</p>
    </div>

    <div class="row">
        <div class="col-md-12" style="font-size: large;">
            As you use the website, you will come across six actions which you may choose to perform. One can proceed with an action by pressing its respective &quot;Go &gt;&gt;&quot; captioned button, placed below each of the actions.<br />

            <ol>
                <li><a href="#AddBlocks">Add Blocks</a></li>
                <li><a href="#AssignDesignations">Assign Designations</a></li>
                <li><a href="#AssignRooms">Assign Rooms</a></li>
                <li><a href="#AssignExemptions">Assign Exceptions</a></li>
                <li><a href="#Reports">Reports </a></li>
                <li><a href="#TableViews">Table Views </a></li>
            </ol>
        </div>
    </div>

    <div class="row" id="AddBlocks">
        <div class="col-md-12" style="font-size: large;">
            <br />
            <h2>Add blocks</h2>
            <p>
                You must complete this step first and add all the blocks which will be available for students to be examined in. Simply type the block's name (format - the alphabet denoting the block, followed by the 3 digit room number) in the text box and click insert, until there is a comprehensive list. At any given time, a table showing the blocks added so far will be on display. The user can edit or delete any row by clicking on the respective &quot;Edit&quot; or &quot;Delete&quot; option present in every row. 
            </p>
        </div>
    </div>

    <div class="row" id="AssignDesignations">
        <div class="col-md-12" style="font-size: large;">
            <br />

            <h2>Assign Designations</h2>
            <p>
                It is a five step task:<br />
                <ol type="a">
                    <li>Choose the designation to be assigned.</li>
                    <li>Use the radio button to specify whether the role assigned is for the morning/evening slot. If it's checked it's for the morning slot, leave it unchecked for the evening slot.</li>
                    <li>Select the start date and end date from a Virtual calender.</li>
                    <li>Choose the individual to be assigned with the task, from the list of employees including teaching and non-teaching staff.</li>
                    <li>Confirm the above mentioned choices by pressing the &quot;Insert&quot; captioned button.</li>
                </ol><br />
                (Following which, a row mentioning your latest Designation Assignment will appear at the bottom of the page, which you may consider as a confirmation of it being stored and also use it for future reference)<br />
                The user can delete any row by clicking on the respective &quot;Delete&quot; option present in every row.<br />
            </p>

        </div>
    </div>

    <div class="row" id="AssignRooms">
        <div class="col-md-12" style="font-size: large;">
            <br />
            <h2>Assign Rooms</h2>
            <p>
                It is fairly similar to the process of Assigning Designations, with the obvious exception being that the first step will require you to choose the room number of the room to be assigned with the examination session. Along with the similar radio button to specify the slot (morning/evening). One can also use the &quot;Add a new block&quot; captioned button to add more blocks in the list of options of blocks to be assinged. <br />
                The user can delete any row by clicking on the respective &quot;Delete&quot; option present in every row.<br />
            </p>

        </div>
    </div>

    <div class="row" id="AssignExemptions">
        <div class="col-md-12" style="font-size: large;">
            <br />
            <h2>Assign Exemptions</h2>
            <p>
                The requirements to perform this action are also more or less similar to the actions covered so far in this documentation. Except that we have to add three extra details as compared to the actions discussed so far. Them being, a brief reason and a detailed reason for seeking exemption. And also, before hitting the &quot;Insert&quot; button, the person granting the exemption has to be named.<br />
                The user can delete any row by clicking on the respective &quot;Delete&quot; option present in every row.<br />
            </p>
        </div>
    </div>

    <div class="row" id="Reports">
        <div class="col-md-12" style="font-size: large;">
            <br />
            <h2>Reports</h2>
            <p>
                This option allows the user to access the various records pertaining to Room Assignments, Staff Assignments and Exemptions, granted so far. All the three records have an option of being downloaded by pressing the button captioned &quot;Download as Excel&quot;, when you view them.&nbsp;&nbsp;
            </p>
        </div>
    </div>

    <div class="row" id="TableViews">
        <div class="col-md-12" style="font-size: large;">
            <br />
            <h2>TableViews</h2>
            <p>
                This option is an administrative option used to repair the backend data by the developers or maintainers when issues arise. This will not be used by the end-users of the software.&nbsp;&nbsp;
            </p>
        </div>
    </div>

    <br />
    <br />
    <br />
</asp:Content>

