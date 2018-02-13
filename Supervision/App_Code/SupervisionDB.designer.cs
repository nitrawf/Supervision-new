﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="SupervisionDB")]
public partial class SupervisionDBDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void InsertDesignation(Designation instance);
  partial void UpdateDesignation(Designation instance);
  partial void DeleteDesignation(Designation instance);
  partial void InsertStaff(Staff instance);
  partial void UpdateStaff(Staff instance);
  partial void DeleteStaff(Staff instance);
  partial void InsertExaminationRoom(ExaminationRoom instance);
  partial void UpdateExaminationRoom(ExaminationRoom instance);
  partial void DeleteExaminationRoom(ExaminationRoom instance);
  partial void InsertException(Exception instance);
  partial void UpdateException(Exception instance);
  partial void DeleteException(Exception instance);
  partial void InsertRoomAssignment(RoomAssignment instance);
  partial void UpdateRoomAssignment(RoomAssignment instance);
  partial void DeleteRoomAssignment(RoomAssignment instance);
  #endregion
	
	public SupervisionDBDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public SupervisionDBDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public SupervisionDBDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public SupervisionDBDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public SupervisionDBDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<Designation> Designations
	{
		get
		{
			return this.GetTable<Designation>();
		}
	}
	
	public System.Data.Linq.Table<Staff> Staffs
	{
		get
		{
			return this.GetTable<Staff>();
		}
	}
	
	public System.Data.Linq.Table<ExaminationRoom> ExaminationRooms
	{
		get
		{
			return this.GetTable<ExaminationRoom>();
		}
	}
	
	public System.Data.Linq.Table<Exception> Exceptions
	{
		get
		{
			return this.GetTable<Exception>();
		}
	}
	
	public System.Data.Linq.Table<Role> Roles
	{
		get
		{
			return this.GetTable<Role>();
		}
	}
	
	public System.Data.Linq.Table<RoomAssignment> RoomAssignments
	{
		get
		{
			return this.GetTable<RoomAssignment>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="darezik.Designations")]
public partial class Designation : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _DesignationID;
	
	private string _Role;
	
	private System.Nullable<bool> _MorningSlot;
	
	private System.Nullable<System.DateTime> _StartDate;
	
	private System.Nullable<System.DateTime> _EndDate;
	
	private System.Nullable<int> _StaffID;
	
	private EntityRef<Staff> _Staff;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnDesignationIDChanging(int value);
    partial void OnDesignationIDChanged();
    partial void OnRoleChanging(string value);
    partial void OnRoleChanged();
    partial void OnMorningSlotChanging(System.Nullable<bool> value);
    partial void OnMorningSlotChanged();
    partial void OnStartDateChanging(System.Nullable<System.DateTime> value);
    partial void OnStartDateChanged();
    partial void OnEndDateChanging(System.Nullable<System.DateTime> value);
    partial void OnEndDateChanged();
    partial void OnStaffIDChanging(System.Nullable<int> value);
    partial void OnStaffIDChanged();
    #endregion
	
	public Designation()
	{
		this._Staff = default(EntityRef<Staff>);
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DesignationID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int DesignationID
	{
		get
		{
			return this._DesignationID;
		}
		set
		{
			if ((this._DesignationID != value))
			{
				this.OnDesignationIDChanging(value);
				this.SendPropertyChanging();
				this._DesignationID = value;
				this.SendPropertyChanged("DesignationID");
				this.OnDesignationIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Role", DbType="VarChar(250)")]
	public string Role
	{
		get
		{
			return this._Role;
		}
		set
		{
			if ((this._Role != value))
			{
				this.OnRoleChanging(value);
				this.SendPropertyChanging();
				this._Role = value;
				this.SendPropertyChanged("Role");
				this.OnRoleChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MorningSlot", DbType="Bit")]
	public System.Nullable<bool> MorningSlot
	{
		get
		{
			return this._MorningSlot;
		}
		set
		{
			if ((this._MorningSlot != value))
			{
				this.OnMorningSlotChanging(value);
				this.SendPropertyChanging();
				this._MorningSlot = value;
				this.SendPropertyChanged("MorningSlot");
				this.OnMorningSlotChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StartDate", DbType="Date")]
	public System.Nullable<System.DateTime> StartDate
	{
		get
		{
			return this._StartDate;
		}
		set
		{
			if ((this._StartDate != value))
			{
				this.OnStartDateChanging(value);
				this.SendPropertyChanging();
				this._StartDate = value;
				this.SendPropertyChanged("StartDate");
				this.OnStartDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EndDate", DbType="Date")]
	public System.Nullable<System.DateTime> EndDate
	{
		get
		{
			return this._EndDate;
		}
		set
		{
			if ((this._EndDate != value))
			{
				this.OnEndDateChanging(value);
				this.SendPropertyChanging();
				this._EndDate = value;
				this.SendPropertyChanged("EndDate");
				this.OnEndDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StaffID", DbType="Int")]
	public System.Nullable<int> StaffID
	{
		get
		{
			return this._StaffID;
		}
		set
		{
			if ((this._StaffID != value))
			{
				if (this._Staff.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnStaffIDChanging(value);
				this.SendPropertyChanging();
				this._StaffID = value;
				this.SendPropertyChanged("StaffID");
				this.OnStaffIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Staff_Designation", Storage="_Staff", ThisKey="StaffID", OtherKey="StaffID", IsForeignKey=true)]
	public Staff Staff
	{
		get
		{
			return this._Staff.Entity;
		}
		set
		{
			Staff previousValue = this._Staff.Entity;
			if (((previousValue != value) 
						|| (this._Staff.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._Staff.Entity = null;
					previousValue.Designations.Remove(this);
				}
				this._Staff.Entity = value;
				if ((value != null))
				{
					value.Designations.Add(this);
					this._StaffID = value.StaffID;
				}
				else
				{
					this._StaffID = default(Nullable<int>);
				}
				this.SendPropertyChanged("Staff");
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="darezik.Staff")]
public partial class Staff : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _StaffID;
	
	private string _EmployeeCode;
	
	private string _TypeOfStaff;
	
	private string _FirstName;
	
	private string _MiddleName;
	
	private string _LastName;
	
	private string _Department;
	
	private string _Designation;
	
	private EntitySet<Designation> _Designations;
	
	private EntitySet<RoomAssignment> _RoomAssignments;
	
	private EntitySet<Exception> _Exceptions;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnStaffIDChanging(int value);
    partial void OnStaffIDChanged();
    partial void OnEmployeeCodeChanging(string value);
    partial void OnEmployeeCodeChanged();
    partial void OnTypeOfStaffChanging(string value);
    partial void OnTypeOfStaffChanged();
    partial void OnFirstNameChanging(string value);
    partial void OnFirstNameChanged();
    partial void OnMiddleNameChanging(string value);
    partial void OnMiddleNameChanged();
    partial void OnLastNameChanging(string value);
    partial void OnLastNameChanged();
    partial void OnDepartmentChanging(string value);
    partial void OnDepartmentChanged();
    partial void OnDesignationChanging(string value);
    partial void OnDesignationChanged();
    #endregion
	
	public Staff()
	{
		this._Designations = new EntitySet<Designation>(new Action<Designation>(this.attach_Designations), new Action<Designation>(this.detach_Designations));
		this._RoomAssignments = new EntitySet<RoomAssignment>(new Action<RoomAssignment>(this.attach_RoomAssignments), new Action<RoomAssignment>(this.detach_RoomAssignments));
		this._Exceptions = new EntitySet<Exception>(new Action<Exception>(this.attach_Exceptions), new Action<Exception>(this.detach_Exceptions));
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StaffID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int StaffID
	{
		get
		{
			return this._StaffID;
		}
		set
		{
			if ((this._StaffID != value))
			{
				this.OnStaffIDChanging(value);
				this.SendPropertyChanging();
				this._StaffID = value;
				this.SendPropertyChanged("StaffID");
				this.OnStaffIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EmployeeCode", DbType="VarChar(250)")]
	public string EmployeeCode
	{
		get
		{
			return this._EmployeeCode;
		}
		set
		{
			if ((this._EmployeeCode != value))
			{
				this.OnEmployeeCodeChanging(value);
				this.SendPropertyChanging();
				this._EmployeeCode = value;
				this.SendPropertyChanged("EmployeeCode");
				this.OnEmployeeCodeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_TypeOfStaff", DbType="VarChar(250)")]
	public string TypeOfStaff
	{
		get
		{
			return this._TypeOfStaff;
		}
		set
		{
			if ((this._TypeOfStaff != value))
			{
				this.OnTypeOfStaffChanging(value);
				this.SendPropertyChanging();
				this._TypeOfStaff = value;
				this.SendPropertyChanged("TypeOfStaff");
				this.OnTypeOfStaffChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FirstName", DbType="VarChar(250)")]
	public string FirstName
	{
		get
		{
			return this._FirstName;
		}
		set
		{
			if ((this._FirstName != value))
			{
				this.OnFirstNameChanging(value);
				this.SendPropertyChanging();
				this._FirstName = value;
				this.SendPropertyChanged("FirstName");
				this.OnFirstNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MiddleName", DbType="VarChar(250)")]
	public string MiddleName
	{
		get
		{
			return this._MiddleName;
		}
		set
		{
			if ((this._MiddleName != value))
			{
				this.OnMiddleNameChanging(value);
				this.SendPropertyChanging();
				this._MiddleName = value;
				this.SendPropertyChanged("MiddleName");
				this.OnMiddleNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastName", DbType="VarChar(250)")]
	public string LastName
	{
		get
		{
			return this._LastName;
		}
		set
		{
			if ((this._LastName != value))
			{
				this.OnLastNameChanging(value);
				this.SendPropertyChanging();
				this._LastName = value;
				this.SendPropertyChanged("LastName");
				this.OnLastNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Department", DbType="VarChar(250)")]
	public string Department
	{
		get
		{
			return this._Department;
		}
		set
		{
			if ((this._Department != value))
			{
				this.OnDepartmentChanging(value);
				this.SendPropertyChanging();
				this._Department = value;
				this.SendPropertyChanged("Department");
				this.OnDepartmentChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Designation", DbType="VarChar(250)")]
	public string Designation
	{
		get
		{
			return this._Designation;
		}
		set
		{
			if ((this._Designation != value))
			{
				this.OnDesignationChanging(value);
				this.SendPropertyChanging();
				this._Designation = value;
				this.SendPropertyChanged("Designation");
				this.OnDesignationChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Staff_Designation", Storage="_Designations", ThisKey="StaffID", OtherKey="StaffID")]
	public EntitySet<Designation> Designations
	{
		get
		{
			return this._Designations;
		}
		set
		{
			this._Designations.Assign(value);
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Staff_RoomAssignment", Storage="_RoomAssignments", ThisKey="StaffID", OtherKey="StaffID")]
	public EntitySet<RoomAssignment> RoomAssignments
	{
		get
		{
			return this._RoomAssignments;
		}
		set
		{
			this._RoomAssignments.Assign(value);
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Staff_Exception", Storage="_Exceptions", ThisKey="StaffID", OtherKey="StaffID")]
	public EntitySet<Exception> Exceptions
	{
		get
		{
			return this._Exceptions;
		}
		set
		{
			this._Exceptions.Assign(value);
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
	
	private void attach_Designations(Designation entity)
	{
		this.SendPropertyChanging();
		entity.Staff = this;
	}
	
	private void detach_Designations(Designation entity)
	{
		this.SendPropertyChanging();
		entity.Staff = null;
	}
	
	private void attach_RoomAssignments(RoomAssignment entity)
	{
		this.SendPropertyChanging();
		entity.Staff = this;
	}
	
	private void detach_RoomAssignments(RoomAssignment entity)
	{
		this.SendPropertyChanging();
		entity.Staff = null;
	}
	
	private void attach_Exceptions(Exception entity)
	{
		this.SendPropertyChanging();
		entity.Staff = this;
	}
	
	private void detach_Exceptions(Exception entity)
	{
		this.SendPropertyChanging();
		entity.Staff = null;
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="darezik.ExaminationRooms")]
public partial class ExaminationRoom : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _RoomID;
	
	private string _RoomNumber;
	
	private System.Nullable<bool> _MorningSlot;
	
	private System.Nullable<System.DateTime> _StartDate;
	
	private System.Nullable<System.DateTime> _EndDate;
	
	private EntitySet<RoomAssignment> _RoomAssignments;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnRoomIDChanging(int value);
    partial void OnRoomIDChanged();
    partial void OnRoomNumberChanging(string value);
    partial void OnRoomNumberChanged();
    partial void OnMorningSlotChanging(System.Nullable<bool> value);
    partial void OnMorningSlotChanged();
    partial void OnStartDateChanging(System.Nullable<System.DateTime> value);
    partial void OnStartDateChanged();
    partial void OnEndDateChanging(System.Nullable<System.DateTime> value);
    partial void OnEndDateChanged();
    #endregion
	
	public ExaminationRoom()
	{
		this._RoomAssignments = new EntitySet<RoomAssignment>(new Action<RoomAssignment>(this.attach_RoomAssignments), new Action<RoomAssignment>(this.detach_RoomAssignments));
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RoomID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int RoomID
	{
		get
		{
			return this._RoomID;
		}
		set
		{
			if ((this._RoomID != value))
			{
				this.OnRoomIDChanging(value);
				this.SendPropertyChanging();
				this._RoomID = value;
				this.SendPropertyChanged("RoomID");
				this.OnRoomIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RoomNumber", DbType="VarChar(250)")]
	public string RoomNumber
	{
		get
		{
			return this._RoomNumber;
		}
		set
		{
			if ((this._RoomNumber != value))
			{
				this.OnRoomNumberChanging(value);
				this.SendPropertyChanging();
				this._RoomNumber = value;
				this.SendPropertyChanged("RoomNumber");
				this.OnRoomNumberChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MorningSlot", DbType="Bit")]
	public System.Nullable<bool> MorningSlot
	{
		get
		{
			return this._MorningSlot;
		}
		set
		{
			if ((this._MorningSlot != value))
			{
				this.OnMorningSlotChanging(value);
				this.SendPropertyChanging();
				this._MorningSlot = value;
				this.SendPropertyChanged("MorningSlot");
				this.OnMorningSlotChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StartDate", DbType="Date")]
	public System.Nullable<System.DateTime> StartDate
	{
		get
		{
			return this._StartDate;
		}
		set
		{
			if ((this._StartDate != value))
			{
				this.OnStartDateChanging(value);
				this.SendPropertyChanging();
				this._StartDate = value;
				this.SendPropertyChanged("StartDate");
				this.OnStartDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EndDate", DbType="Date")]
	public System.Nullable<System.DateTime> EndDate
	{
		get
		{
			return this._EndDate;
		}
		set
		{
			if ((this._EndDate != value))
			{
				this.OnEndDateChanging(value);
				this.SendPropertyChanging();
				this._EndDate = value;
				this.SendPropertyChanged("EndDate");
				this.OnEndDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="ExaminationRoom_RoomAssignment", Storage="_RoomAssignments", ThisKey="RoomID", OtherKey="RoomID")]
	public EntitySet<RoomAssignment> RoomAssignments
	{
		get
		{
			return this._RoomAssignments;
		}
		set
		{
			this._RoomAssignments.Assign(value);
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
	
	private void attach_RoomAssignments(RoomAssignment entity)
	{
		this.SendPropertyChanging();
		entity.ExaminationRoom = this;
	}
	
	private void detach_RoomAssignments(RoomAssignment entity)
	{
		this.SendPropertyChanging();
		entity.ExaminationRoom = null;
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="darezik.Exceptions")]
public partial class Exception : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _ExpectionID;
	
	private string _BreifReason;
	
	private System.Nullable<System.DateTime> _StartDate;
	
	private System.Nullable<System.DateTime> _EndDate;
	
	private string _Description;
	
	private System.Nullable<bool> _MorningSlot;
	
	private System.Nullable<int> _StaffID;
	
	private string _GrantedByUserName;
	
	private System.Nullable<System.DateTime> _GrantedDate;
	
	private EntityRef<Staff> _Staff;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnExpectionIDChanging(int value);
    partial void OnExpectionIDChanged();
    partial void OnBreifReasonChanging(string value);
    partial void OnBreifReasonChanged();
    partial void OnStartDateChanging(System.Nullable<System.DateTime> value);
    partial void OnStartDateChanged();
    partial void OnEndDateChanging(System.Nullable<System.DateTime> value);
    partial void OnEndDateChanged();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    partial void OnMorningSlotChanging(System.Nullable<bool> value);
    partial void OnMorningSlotChanged();
    partial void OnStaffIDChanging(System.Nullable<int> value);
    partial void OnStaffIDChanged();
    partial void OnGrantedByUserNameChanging(string value);
    partial void OnGrantedByUserNameChanged();
    partial void OnGrantedDateChanging(System.Nullable<System.DateTime> value);
    partial void OnGrantedDateChanged();
    #endregion
	
	public Exception()
	{
		this._Staff = default(EntityRef<Staff>);
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ExpectionID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int ExpectionID
	{
		get
		{
			return this._ExpectionID;
		}
		set
		{
			if ((this._ExpectionID != value))
			{
				this.OnExpectionIDChanging(value);
				this.SendPropertyChanging();
				this._ExpectionID = value;
				this.SendPropertyChanged("ExpectionID");
				this.OnExpectionIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_BreifReason", DbType="VarChar(250)")]
	public string BreifReason
	{
		get
		{
			return this._BreifReason;
		}
		set
		{
			if ((this._BreifReason != value))
			{
				this.OnBreifReasonChanging(value);
				this.SendPropertyChanging();
				this._BreifReason = value;
				this.SendPropertyChanged("BreifReason");
				this.OnBreifReasonChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StartDate", DbType="Date")]
	public System.Nullable<System.DateTime> StartDate
	{
		get
		{
			return this._StartDate;
		}
		set
		{
			if ((this._StartDate != value))
			{
				this.OnStartDateChanging(value);
				this.SendPropertyChanging();
				this._StartDate = value;
				this.SendPropertyChanged("StartDate");
				this.OnStartDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EndDate", DbType="Date")]
	public System.Nullable<System.DateTime> EndDate
	{
		get
		{
			return this._EndDate;
		}
		set
		{
			if ((this._EndDate != value))
			{
				this.OnEndDateChanging(value);
				this.SendPropertyChanging();
				this._EndDate = value;
				this.SendPropertyChanged("EndDate");
				this.OnEndDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Description", DbType="VarChar(250)")]
	public string Description
	{
		get
		{
			return this._Description;
		}
		set
		{
			if ((this._Description != value))
			{
				this.OnDescriptionChanging(value);
				this.SendPropertyChanging();
				this._Description = value;
				this.SendPropertyChanged("Description");
				this.OnDescriptionChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MorningSlot", DbType="Bit")]
	public System.Nullable<bool> MorningSlot
	{
		get
		{
			return this._MorningSlot;
		}
		set
		{
			if ((this._MorningSlot != value))
			{
				this.OnMorningSlotChanging(value);
				this.SendPropertyChanging();
				this._MorningSlot = value;
				this.SendPropertyChanged("MorningSlot");
				this.OnMorningSlotChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StaffID", DbType="Int")]
	public System.Nullable<int> StaffID
	{
		get
		{
			return this._StaffID;
		}
		set
		{
			if ((this._StaffID != value))
			{
				if (this._Staff.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnStaffIDChanging(value);
				this.SendPropertyChanging();
				this._StaffID = value;
				this.SendPropertyChanged("StaffID");
				this.OnStaffIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GrantedByUserName", DbType="VarChar(100)")]
	public string GrantedByUserName
	{
		get
		{
			return this._GrantedByUserName;
		}
		set
		{
			if ((this._GrantedByUserName != value))
			{
				this.OnGrantedByUserNameChanging(value);
				this.SendPropertyChanging();
				this._GrantedByUserName = value;
				this.SendPropertyChanged("GrantedByUserName");
				this.OnGrantedByUserNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_GrantedDate", DbType="Date")]
	public System.Nullable<System.DateTime> GrantedDate
	{
		get
		{
			return this._GrantedDate;
		}
		set
		{
			if ((this._GrantedDate != value))
			{
				this.OnGrantedDateChanging(value);
				this.SendPropertyChanging();
				this._GrantedDate = value;
				this.SendPropertyChanged("GrantedDate");
				this.OnGrantedDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Staff_Exception", Storage="_Staff", ThisKey="StaffID", OtherKey="StaffID", IsForeignKey=true)]
	public Staff Staff
	{
		get
		{
			return this._Staff.Entity;
		}
		set
		{
			Staff previousValue = this._Staff.Entity;
			if (((previousValue != value) 
						|| (this._Staff.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._Staff.Entity = null;
					previousValue.Exceptions.Remove(this);
				}
				this._Staff.Entity = value;
				if ((value != null))
				{
					value.Exceptions.Add(this);
					this._StaffID = value.StaffID;
				}
				else
				{
					this._StaffID = default(Nullable<int>);
				}
				this.SendPropertyChanged("Staff");
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="darezik.Roles")]
public partial class Role
{
	
	private int _RoleID;
	
	private string _RoleName;
	
	public Role()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RoleID", AutoSync=AutoSync.Always, DbType="Int NOT NULL IDENTITY", IsDbGenerated=true)]
	public int RoleID
	{
		get
		{
			return this._RoleID;
		}
		set
		{
			if ((this._RoleID != value))
			{
				this._RoleID = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RoleName", DbType="NVarChar(250)")]
	public string RoleName
	{
		get
		{
			return this._RoleName;
		}
		set
		{
			if ((this._RoleName != value))
			{
				this._RoleName = value;
			}
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="darezik.RoomAssignment")]
public partial class RoomAssignment : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _AssignmentID;
	
	private System.Nullable<int> _RoomID;
	
	private System.Nullable<int> _StaffID;
	
	private System.Nullable<bool> _MorningSlot;
	
	private System.Nullable<System.DateTime> _AssignmentDate;
	
	private EntityRef<Staff> _Staff;
	
	private EntityRef<ExaminationRoom> _ExaminationRoom;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnAssignmentIDChanging(int value);
    partial void OnAssignmentIDChanged();
    partial void OnRoomIDChanging(System.Nullable<int> value);
    partial void OnRoomIDChanged();
    partial void OnStaffIDChanging(System.Nullable<int> value);
    partial void OnStaffIDChanged();
    partial void OnMorningSlotChanging(System.Nullable<bool> value);
    partial void OnMorningSlotChanged();
    partial void OnAssignmentDateChanging(System.Nullable<System.DateTime> value);
    partial void OnAssignmentDateChanged();
    #endregion
	
	public RoomAssignment()
	{
		this._Staff = default(EntityRef<Staff>);
		this._ExaminationRoom = default(EntityRef<ExaminationRoom>);
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AssignmentID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int AssignmentID
	{
		get
		{
			return this._AssignmentID;
		}
		set
		{
			if ((this._AssignmentID != value))
			{
				this.OnAssignmentIDChanging(value);
				this.SendPropertyChanging();
				this._AssignmentID = value;
				this.SendPropertyChanged("AssignmentID");
				this.OnAssignmentIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_RoomID", DbType="Int")]
	public System.Nullable<int> RoomID
	{
		get
		{
			return this._RoomID;
		}
		set
		{
			if ((this._RoomID != value))
			{
				if (this._ExaminationRoom.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnRoomIDChanging(value);
				this.SendPropertyChanging();
				this._RoomID = value;
				this.SendPropertyChanged("RoomID");
				this.OnRoomIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_StaffID", DbType="Int")]
	public System.Nullable<int> StaffID
	{
		get
		{
			return this._StaffID;
		}
		set
		{
			if ((this._StaffID != value))
			{
				if (this._Staff.HasLoadedOrAssignedValue)
				{
					throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
				}
				this.OnStaffIDChanging(value);
				this.SendPropertyChanging();
				this._StaffID = value;
				this.SendPropertyChanged("StaffID");
				this.OnStaffIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_MorningSlot", DbType="Bit")]
	public System.Nullable<bool> MorningSlot
	{
		get
		{
			return this._MorningSlot;
		}
		set
		{
			if ((this._MorningSlot != value))
			{
				this.OnMorningSlotChanging(value);
				this.SendPropertyChanging();
				this._MorningSlot = value;
				this.SendPropertyChanged("MorningSlot");
				this.OnMorningSlotChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AssignmentDate", DbType="Date")]
	public System.Nullable<System.DateTime> AssignmentDate
	{
		get
		{
			return this._AssignmentDate;
		}
		set
		{
			if ((this._AssignmentDate != value))
			{
				this.OnAssignmentDateChanging(value);
				this.SendPropertyChanging();
				this._AssignmentDate = value;
				this.SendPropertyChanged("AssignmentDate");
				this.OnAssignmentDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Staff_RoomAssignment", Storage="_Staff", ThisKey="StaffID", OtherKey="StaffID", IsForeignKey=true)]
	public Staff Staff
	{
		get
		{
			return this._Staff.Entity;
		}
		set
		{
			Staff previousValue = this._Staff.Entity;
			if (((previousValue != value) 
						|| (this._Staff.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._Staff.Entity = null;
					previousValue.RoomAssignments.Remove(this);
				}
				this._Staff.Entity = value;
				if ((value != null))
				{
					value.RoomAssignments.Add(this);
					this._StaffID = value.StaffID;
				}
				else
				{
					this._StaffID = default(Nullable<int>);
				}
				this.SendPropertyChanged("Staff");
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.AssociationAttribute(Name="ExaminationRoom_RoomAssignment", Storage="_ExaminationRoom", ThisKey="RoomID", OtherKey="RoomID", IsForeignKey=true)]
	public ExaminationRoom ExaminationRoom
	{
		get
		{
			return this._ExaminationRoom.Entity;
		}
		set
		{
			ExaminationRoom previousValue = this._ExaminationRoom.Entity;
			if (((previousValue != value) 
						|| (this._ExaminationRoom.HasLoadedOrAssignedValue == false)))
			{
				this.SendPropertyChanging();
				if ((previousValue != null))
				{
					this._ExaminationRoom.Entity = null;
					previousValue.RoomAssignments.Remove(this);
				}
				this._ExaminationRoom.Entity = value;
				if ((value != null))
				{
					value.RoomAssignments.Add(this);
					this._RoomID = value.RoomID;
				}
				else
				{
					this._RoomID = default(Nullable<int>);
				}
				this.SendPropertyChanged("ExaminationRoom");
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591