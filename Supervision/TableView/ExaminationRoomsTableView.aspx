﻿<%@ Page Title="Exam Blocks" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ExaminationRoomsTableView.aspx.cs" Inherits="TableView_ExaminationRoomsTableView" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">

	<div class="jumbotron">
        <h1>Exam Blocks</h1>
		<p class="lead">Examination hall details.</p>
    </div>


    <div class="row">
        <div class="col-md-6">
            <div class="table-responsive"><asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="RoomID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="70px" Width="100%">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="RoomID" HeaderText="RoomID" ReadOnly="True" SortExpression="RoomID" InsertVisible="False" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                    <asp:CheckBoxField DataField="MorningSlot" HeaderText="MorningSlot" SortExpression="MorningSlot" />
                    <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                    <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
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
        </div>
        <div class="col-md-6">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="RoomID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">

                <InsertItemTemplate>
                    <div class="row">
                        <div class="col-md-6">
                            Block Number:
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox Width="100%" ID="RoomNumberTextBox" runat="server" Text='<%# Bind("RoomNumber") %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Check if Morning slot, else leave unchecked for evening slot:
                        </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="MorningSlotCheckBox" runat="server" Checked='<%# Bind("MorningSlot") %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Start Date:
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox Width="100%" ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            End Date:
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox Width="100%" ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-default btn-sm" />
                            <br />
                            <br />
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default btn-sm" />
                            <br />
                            <br />
                        </div>
                    </div>
                </InsertItemTemplate>

            </asp:FormView>
        </div>

    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [ExaminationRooms]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [ExaminationRooms] WHERE [RoomID] = @original_RoomID AND (([RoomNumber] = @original_RoomNumber) OR ([RoomNumber] IS NULL AND @original_RoomNumber IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL))" InsertCommand="INSERT INTO [ExaminationRooms] ([RoomNumber], [MorningSlot], [StartDate], [EndDate]) VALUES (@RoomNumber, @MorningSlot, @StartDate, @EndDate)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ExaminationRooms] SET [RoomNumber] = @RoomNumber, [MorningSlot] = @MorningSlot, [StartDate] = @StartDate, [EndDate] = @EndDate WHERE [RoomID] = @original_RoomID AND (([RoomNumber] = @original_RoomNumber) OR ([RoomNumber] IS NULL AND @original_RoomNumber IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_RoomID" Type="Int32" />
            <asp:Parameter Name="original_RoomNumber" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_StartDate" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="RoomNumber" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter Name="StartDate" DbType="Date" />
            <asp:Parameter DbType="Date" Name="EndDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="RoomNumber" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="original_RoomID" Type="Int32" />
            <asp:Parameter Name="original_RoomNumber" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_StartDate" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>


