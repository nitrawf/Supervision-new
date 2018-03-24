<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ExceptionsTableView.aspx.cs" Inherits="TableView_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

	<div class="jumbotron">
        <h1>Exemptions</h1>
		<p class="lead">Exempt a staff member from examination duty. </p>
    </div>

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ExpectionID" DataSourceID="ExceptionsDataSource" ForeColor="Black" GridLines="Vertical">
		<AlternatingRowStyle BackColor="#CCCCCC" />
		<Columns>
			<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
			<asp:BoundField DataField="ExpectionID" HeaderText="ExpectionID" ReadOnly="True" SortExpression="ExpectionID" InsertVisible="False" />
			<asp:BoundField DataField="BreifReason" HeaderText="BreifReason" SortExpression="BreifReason" />
			<asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
			<asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
			<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
			<asp:CheckBoxField DataField="MorningSlot" HeaderText="MorningSlot" SortExpression="MorningSlot" />
			<asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
			<asp:BoundField DataField="GrantedByUserName" HeaderText="GrantedByUserName" SortExpression="GrantedByUserName" />
			<asp:BoundField DataField="GrantedDate" HeaderText="GrantedDate" SortExpression="GrantedDate" />
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
	<asp:SqlDataSource ID="ExceptionsDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Exceptions] WHERE [ExpectionID] = @original_ExpectionID AND (([BreifReason] = @original_BreifReason) OR ([BreifReason] IS NULL AND @original_BreifReason IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([GrantedByUserName] = @original_GrantedByUserName) OR ([GrantedByUserName] IS NULL AND @original_GrantedByUserName IS NULL)) AND (([GrantedDate] = @original_GrantedDate) OR ([GrantedDate] IS NULL AND @original_GrantedDate IS NULL))" InsertCommand="INSERT INTO [Exceptions] ([BreifReason], [StartDate], [EndDate], [Description], [MorningSlot], [StaffID], [GrantedByUserName], [GrantedDate]) VALUES (@BreifReason, @StartDate, @EndDate, @Description, @MorningSlot, @StaffID, @GrantedByUserName, @GrantedDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Exceptions]" UpdateCommand="UPDATE [Exceptions] SET [BreifReason] = @BreifReason, [StartDate] = @StartDate, [EndDate] = @EndDate, [Description] = @Description, [MorningSlot] = @MorningSlot, [StaffID] = @StaffID, [GrantedByUserName] = @GrantedByUserName, [GrantedDate] = @GrantedDate WHERE [ExpectionID] = @original_ExpectionID AND (([BreifReason] = @original_BreifReason) OR ([BreifReason] IS NULL AND @original_BreifReason IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([GrantedByUserName] = @original_GrantedByUserName) OR ([GrantedByUserName] IS NULL AND @original_GrantedByUserName IS NULL)) AND (([GrantedDate] = @original_GrantedDate) OR ([GrantedDate] IS NULL AND @original_GrantedDate IS NULL))">
		<DeleteParameters>
			<asp:Parameter Name="original_ExpectionID" Type="Int32" />
			<asp:Parameter Name="original_BreifReason" Type="String" />
			<asp:Parameter DbType="Date" Name="original_StartDate" />
			<asp:Parameter DbType="Date" Name="original_EndDate" />
			<asp:Parameter Name="original_Description" Type="String" />
			<asp:Parameter Name="original_MorningSlot" Type="Boolean" />
			<asp:Parameter Name="original_StaffID" Type="Int32" />
			<asp:Parameter Name="original_GrantedByUserName" Type="String" />
			<asp:Parameter DbType="Date" Name="original_GrantedDate" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="BreifReason" Type="String" />
			<asp:Parameter Name="StartDate" DbType="Date" />
			<asp:Parameter DbType="Date" Name="EndDate" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="MorningSlot" Type="Boolean" />
			<asp:Parameter Name="StaffID" Type="Int32" />
			<asp:Parameter Name="GrantedByUserName" Type="String" />
			<asp:Parameter Name="GrantedDate" DbType="Date" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="BreifReason" Type="String" />
			<asp:Parameter DbType="Date" Name="StartDate" />
			<asp:Parameter DbType="Date" Name="EndDate" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="MorningSlot" Type="Boolean" />
			<asp:Parameter Name="StaffID" Type="Int32" />
			<asp:Parameter Name="GrantedByUserName" Type="String" />
			<asp:Parameter DbType="Date" Name="GrantedDate" />
			<asp:Parameter Name="original_ExpectionID" Type="Int32" />
			<asp:Parameter Name="original_BreifReason" Type="String" />
			<asp:Parameter DbType="Date" Name="original_StartDate" />
			<asp:Parameter DbType="Date" Name="original_EndDate" />
			<asp:Parameter Name="original_Description" Type="String" />
			<asp:Parameter Name="original_MorningSlot" Type="Boolean" />
			<asp:Parameter Name="original_StaffID" Type="Int32" />
			<asp:Parameter Name="original_GrantedByUserName" Type="String" />
			<asp:Parameter DbType="Date" Name="original_GrantedDate" />
		</UpdateParameters>
	</asp:SqlDataSource>
</asp:Content>

