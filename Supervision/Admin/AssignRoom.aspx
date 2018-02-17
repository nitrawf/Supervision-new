﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssignRoom.aspx.cs" Inherits="Admin_AssignRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>Assign Room</h1>
    </div>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="AssignmentID" DataSourceID="RoomsDataSource" DefaultMode="Insert">
        <InsertItemTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                            Room to be assigned:
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="RoomDownList" SelectedValue='<%# Bind("Room") %>' DataSourceID="RoomsDataSource" DataTextField="RoomNumber" DataValueField="RoomNumber" runat="server" Width="100%" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Morning(checked)/Evening(unchecked):
                        </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="MorningSlotCheckBox" runat="server" Checked='<%# Bind("MorningSlot") %>' AutoPostBack="true" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Date of the assignment:
                        </div>
                        <div class="col-md-6">
                            <asp:Calendar ID="Calendar1" SelectedDate='<%# Bind("Date") %>' runat="server" ></asp:Calendar>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                           
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            The staff member to be assigned:
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="StaffDropDownList" SelectedValue='<%# Bind("StaffID") %>' DataSourceID="StaffDataSource" DataTextField="aggregate" DataValueField="StaffID" runat="server" Width="100%"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                     
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel> 
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-lg"  />
                            <br />
                            <br />
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary btn-lg" />
                            <br />
                            <br />
                        </div>
                    </div>
                </ContentTemplate>
             </asp:UpdatePanel>
        </InsertItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="AssignmentDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [RoomAssignment] WHERE [AssignmentID] = @original_AssignmentID AND (([RoomID] = @original_RoomID) OR ([RoomID] IS NULL AND @original_RoomID IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([AssignmentDate] = @original_AssignmentDate) OR ([AssignmentDate] IS NULL AND @original_AssignmentDate IS NULL))" InsertCommand="INSERT INTO [RoomAssignment] ([RoomID], [StaffID], [MorningSlot], [AssignmentDate]) VALUES (@RoomID, @StaffID, @MorningSlot, @AssignmentDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [RoomAssignment] ORDER BY [RoomID]" UpdateCommand="UPDATE [RoomAssignment] SET [RoomID] = @RoomID, [StaffID] = @StaffID, [MorningSlot] = @MorningSlot, [AssignmentDate] = @AssignmentDate WHERE [AssignmentID] = @original_AssignmentID AND (([RoomID] = @original_RoomID) OR ([RoomID] IS NULL AND @original_RoomID IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([AssignmentDate] = @original_AssignmentDate) OR ([AssignmentDate] IS NULL AND @original_AssignmentDate IS NULL))">
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
            <asp:Parameter DbType="Date" Name="AssignmentDate" />
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
    <asp:SqlDataSource ID="RoomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ExaminationRooms]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="StaffDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select 
        StaffID,
[EmployeeCode]
           ,[TypeOfStaff]
           ,[FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[Department]
           ,[Designation],
		   concat([FirstName],' ',[LastName], ' - ',[Department], ',',[Designation], ' | ',[TypeOfStaff]) as aggregate

 from [darezik].[Staff]
           order by firstname"></asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="JoinedDataSource" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                    <asp:BoundField DataField="AssignmentID" HeaderText="AssignmentID" InsertVisible="False" ReadOnly="True" SortExpression="AssignmentID" />
                                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" SortExpression="RoomID" />
                                    <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                                    <asp:CheckBoxField DataField="MorningSlot" HeaderText="MorningSlot" SortExpression="MorningSlot" />
                                    <asp:BoundField DataField="StaffID" HeaderText="StaffID" InsertVisible="False" ReadOnly="True" SortExpression="StaffID" />
                                    <asp:BoundField DataField="StaffDetails" HeaderText="StaffDetails" ReadOnly="True" SortExpression="StaffDetails" />
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
         <asp:SqlDataSource ID="JoinedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT 
       [AssignmentID]
      ,RoomAssignment.[RoomID]
      ,[RoomNumber]
      ,RoomAssignment.[MorningSlot]
      ,[Staff].[StaffID]
	  ,concat([FirstName],' ',[LastName], ' - ',[Department], ',',[Designation], ' | ',[TypeOfStaff]) as StaffDetails
  FROM [SupervisionDB].[darezik].[ExaminationRooms]
  inner join [SupervisionDB].[darezik].[RoomAssignment] 
  on [ExaminationRooms].RoomID = RoomAssignment.RoomID inner join [SupervisionDB].[darezik].[Staff] 
  on [RoomAssignment].StaffID = [Staff].StaffID"
             DeleteCommand="DELETE FROM RoomAssignment WHERE (AssignmentID = @AssignmentID)">
                <DeleteParameters>
                    <asp:Parameter Name="AssignementID" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
