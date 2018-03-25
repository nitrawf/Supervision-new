<%@ Page Title="View Exemptions" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TeachersExempted.aspx.cs" Inherits="Reports_TeachersExempted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="jumbotron">
        <h1>Staff Exempted from new assignment</h1>
		<p class="lead">View/Download a list of exempted staff members. </p>
    </div>

    <div class ="row">
        <div class="col-md-12" style="color: red;">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ExpectionID" DataSourceID="TeachersExemptedSql" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="ExpectionID" HeaderText="Expection ID" ReadOnly="True" SortExpression="ExpectionID" />
                    <asp:BoundField DataField="BreifReason" HeaderText="Breif Reason" SortExpression="BreifReason" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:TemplateField HeaderText="Slot" SortExpression="MorningSlot" >
                        <ItemTemplate><%#Eval("MorningSlot").ToString().Equals("")? "Both" :((Boolean.Parse(Eval("MorningSlot").ToString())) ? "Morning" : "Evening")  %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="StaffID" HeaderText="Staff ID" SortExpression="StaffID" />
                    <asp:BoundField DataField="GrantedByUserName" HeaderText="Granted By User Name" SortExpression="GrantedByUserName" />
                    <asp:BoundField DataField="GrantedDate" HeaderText="Granted Date" SortExpression="GrantedDate" />
                    <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" SortExpression="EmployeeCode" />
                    <asp:BoundField DataField="TypeOfStaff" HeaderText="Type Of Staff" SortExpression="TypeOfStaff" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="MiddleName" HeaderText="Middle Name" SortExpression="MiddleName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                    <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
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
        </div>
    </div>
    <asp:SqlDataSource ID="TeachersExemptedSql" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [TeachersExempted]"></asp:SqlDataSource>
    <br />
    <br />
    
    <asp:Button class="btn btn-primary btn-default" ID="downloadExcel" runat="server" OnClick="downloadExcel_Click" Text="Download as Excel" />
</asp:Content>
