<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffTableView.aspx.cs" Inherits="TableView_Staff" %>

<asp:Content ID="StaffTableViewContent" ContentPlaceHolderID="MainContent" runat="Server">
        <asp:GridView ID="StaffGridView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="StaffID" DataSourceID="StaffDataSource" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="StaffID" HeaderText="StaffID" ReadOnly="True" SortExpression="StaffID" InsertVisible="False" />
                <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode" SortExpression="EmployeeCode" />
                <asp:BoundField DataField="TypeOfStaff" HeaderText="TypeOfStaff" SortExpression="TypeOfStaff" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
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
    <asp:SqlDataSource ID="StaffDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Staff] WHERE [StaffID] = @original_StaffID AND (([EmployeeCode] = @original_EmployeeCode) OR ([EmployeeCode] IS NULL AND @original_EmployeeCode IS NULL)) AND (([TypeOfStaff] = @original_TypeOfStaff) OR ([TypeOfStaff] IS NULL AND @original_TypeOfStaff IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([MiddleName] = @original_MiddleName) OR ([MiddleName] IS NULL AND @original_MiddleName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Designation] = @original_Designation) OR ([Designation] IS NULL AND @original_Designation IS NULL))" InsertCommand="INSERT INTO [Staff] ([EmployeeCode], [TypeOfStaff], [FirstName], [MiddleName], [LastName], [Department], [Designation]) VALUES (@EmployeeCode, @TypeOfStaff, @FirstName, @MiddleName, @LastName, @Department, @Designation)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Staff]" UpdateCommand="UPDATE [Staff] SET [EmployeeCode] = @EmployeeCode, [TypeOfStaff] = @TypeOfStaff, [FirstName] = @FirstName, [MiddleName] = @MiddleName, [LastName] = @LastName, [Department] = @Department, [Designation] = @Designation WHERE [StaffID] = @original_StaffID AND (([EmployeeCode] = @original_EmployeeCode) OR ([EmployeeCode] IS NULL AND @original_EmployeeCode IS NULL)) AND (([TypeOfStaff] = @original_TypeOfStaff) OR ([TypeOfStaff] IS NULL AND @original_TypeOfStaff IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([MiddleName] = @original_MiddleName) OR ([MiddleName] IS NULL AND @original_MiddleName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([Department] = @original_Department) OR ([Department] IS NULL AND @original_Department IS NULL)) AND (([Designation] = @original_Designation) OR ([Designation] IS NULL AND @original_Designation IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_StaffID" Type="Int32" />
            <asp:Parameter Name="original_EmployeeCode" Type="String" />
            <asp:Parameter Name="original_TypeOfStaff" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_MiddleName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Department" Type="String" />
            <asp:Parameter Name="original_Designation" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeCode" Type="String" />
            <asp:Parameter Name="TypeOfStaff" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeCode" Type="String" />
            <asp:Parameter Name="TypeOfStaff" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
            <asp:Parameter Name="original_EmployeeCode" Type="String" />
            <asp:Parameter Name="original_TypeOfStaff" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_MiddleName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_Department" Type="String" />
            <asp:Parameter Name="original_Designation" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

