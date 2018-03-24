<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffAssignedToRoom.aspx.cs" Inherits="Reports_StaffAssignedToRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

	<div class="jumbotron">
		<h1>Staff assigned to room</h1>
		<p class="lead">Get the details of the staff assigned to each room. </p>
	</div>

<div class ="row">
    <div class="col-md-12" style="color: red;">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="StaffAssignedToRoomSql" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" SortExpression="EmployeeCode" />
                <asp:BoundField DataField="TypeOfStaff" HeaderText="Type Of Staff" SortExpression="TypeOfStaff" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" SortExpression="MiddleName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                <asp:TemplateField HeaderText="Slot" SortExpression="MorningSlot" >
                        <ItemTemplate><%#Eval("MorningSlot").ToString().Equals("")? "Both" :((Boolean.Parse(Eval("MorningSlot").ToString())) ? "Morning" : "Evening")  %></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="AssignmentDate" HeaderText="Assignment Date" SortExpression="AssignmentDate" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="RoomNumber" HeaderText="Block Number" SortExpression="RoomNumber" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="StaffAssignedToRoomSql" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [StaffAssignedToRoom]"></asp:SqlDataSource>
    </div>
</div>    
        <br />
        <br />
    <asp:Button class="btn btn-primary btn-default" ID="downloadStaffAssignedToRoomExcel" runat="server" OnClick="downloadStaffAssignedToRoomExcel_Click" Text="Download as Excel" />
</asp:Content>

