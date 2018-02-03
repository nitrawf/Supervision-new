﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DesignationsTableView.aspx.cs" Inherits="TableView_DesignationsTableView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="DesignationID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="DesignationID" HeaderText="DesignationID" ReadOnly="True" SortExpression="DesignationID" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            <asp:CheckBoxField DataField="MorningSlot" HeaderText="MorningSlot" SortExpression="MorningSlot" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
            <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Designations] WHERE [DesignationID] = @original_DesignationID AND (([Role] = @original_Role) OR ([Role] IS NULL AND @original_Role IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Length] = @original_Length) OR ([Length] IS NULL AND @original_Length IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL))" InsertCommand="INSERT INTO [Designations] ([DesignationID], [Role], [MorningSlot], [StartDate], [EndDate], [Length], [StaffID]) VALUES (@DesignationID, @Role, @MorningSlot, @StartDate, @EndDate, @Length, @StaffID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Designations]" UpdateCommand="UPDATE [Designations] SET [Role] = @Role, [MorningSlot] = @MorningSlot, [StartDate] = @StartDate, [EndDate] = @EndDate, [Length] = @Length, [StaffID] = @StaffID WHERE [DesignationID] = @original_DesignationID AND (([Role] = @original_Role) OR ([Role] IS NULL AND @original_Role IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Length] = @original_Length) OR ([Length] IS NULL AND @original_Length IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_DesignationID" Type="Int32" />
            <asp:Parameter Name="original_Role" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_StartDate" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
            <asp:Parameter Name="original_Length" Type="Int32" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DesignationID" Type="Int32" />
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="Length" Type="Int32" />
            <asp:Parameter Name="StaffID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Role" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="Length" Type="Int32" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="original_DesignationID" Type="Int32" />
            <asp:Parameter Name="original_Role" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_StartDate" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
            <asp:Parameter Name="original_Length" Type="Int32" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

