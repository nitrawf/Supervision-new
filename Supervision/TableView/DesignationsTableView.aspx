<%@ Page Title="Designations" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DesignationsTableView.aspx.cs" Inherits="TableView_DesignationsTableView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
	
	<div class="jumbotron">
        <h1>Designations</h1>
		<p class="lead">Assign a staff member to a designation for a time period and shift. </p>
    </div>
    
	<div class="table-responsive"><asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="DesignationID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="DesignationID" HeaderText="Designation ID" ReadOnly="True" SortExpression="DesignationID" InsertVisible="False" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            <asp:CheckBoxField DataField="MorningSlot" HeaderText="Morning Slot" SortExpression="MorningSlot" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />
            <asp:BoundField DataField="StaffID" HeaderText="Staff ID" SortExpression="StaffID" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Designations] WHERE [DesignationID] = @original_DesignationID AND (([Role] = @original_Role) OR ([Role] IS NULL AND @original_Role IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL))" InsertCommand="INSERT INTO [Designations] ([Role], [MorningSlot], [StartDate], [EndDate], [StaffID]) VALUES (@Role, @MorningSlot, @StartDate, @EndDate, @StaffID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Designations]" UpdateCommand="UPDATE [Designations] SET [Role] = @Role, [MorningSlot] = @MorningSlot, [StartDate] = @StartDate, [EndDate] = @EndDate, [StaffID] = @StaffID WHERE [DesignationID] = @original_DesignationID AND (([Role] = @original_Role) OR ([Role] IS NULL AND @original_Role IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_DesignationID" Type="Int32" />
            <asp:Parameter Name="original_Role" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_StartDate" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter Name="StartDate" DbType="Date" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="StaffID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="original_DesignationID" Type="Int32" />
            <asp:Parameter Name="original_Role" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter Name="original_StartDate" DbType="Date" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

