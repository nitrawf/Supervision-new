<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RoomAssignmentTableView.aspx.cs" Inherits="TableView_RoomAssignmentTableView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="AssignmentID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="AssignmentID" HeaderText="AssignmentID" ReadOnly="True" SortExpression="AssignmentID" InsertVisible="False" />
            <asp:BoundField DataField="RoomID" HeaderText="RoomID" SortExpression="RoomID" />
            <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
            <asp:CheckBoxField DataField="MorningSlot" HeaderText="MorningSlot" SortExpression="MorningSlot" />
            <asp:BoundField DataField="AssignmentDate" HeaderText="AssignmentDate" SortExpression="AssignmentDate" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [RoomAssignment] WHERE [AssignmentID] = @original_AssignmentID AND (([RoomID] = @original_RoomID) OR ([RoomID] IS NULL AND @original_RoomID IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([AssignmentDate] = @original_AssignmentDate) OR ([AssignmentDate] IS NULL AND @original_AssignmentDate IS NULL))" InsertCommand="INSERT INTO [RoomAssignment] ([RoomID], [StaffID], [MorningSlot], [AssignmentDate]) VALUES (@RoomID, @StaffID, @MorningSlot, @AssignmentDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [RoomAssignment]" UpdateCommand="UPDATE [RoomAssignment] SET [RoomID] = @RoomID, [StaffID] = @StaffID, [MorningSlot] = @MorningSlot, [AssignmentDate] = @AssignmentDate WHERE [AssignmentID] = @original_AssignmentID AND (([RoomID] = @original_RoomID) OR ([RoomID] IS NULL AND @original_RoomID IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([AssignmentDate] = @original_AssignmentDate) OR ([AssignmentDate] IS NULL AND @original_AssignmentDate IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_AssignmentID" Type="Int32" />
            <asp:Parameter Name="original_RoomID" Type="Int32" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_AssignmentDate" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RoomID" Type="Int32" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter Name="AssignmentDate" DbType="Date" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="RoomID" Type="Int32" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="AssignmentDate" />
            <asp:Parameter Name="original_AssignmentID" Type="Int32" />
            <asp:Parameter Name="original_RoomID" Type="Int32" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_AssignmentDate" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

