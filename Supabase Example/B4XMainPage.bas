B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.85
@EndOfDesignText@
#Region Shared Files
#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Project.zip

Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Private xSupabase As Supabase

End Sub

Public Sub Initialize
	
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("frm_main")
	
	B4XPages.SetTitle(Me,"Supabase Example")
	
	xSupabase.Initialize("https://xxx.supabase.co","xxx")


'	Wait For (xSupabase.Auth.Logout) Complete (Result As SupabaseError)
'	If Result.Success Then
'		Log("User successfully logged out")
'	Else
'		Log("Error: " & Result.ErrorMessage)
'	End If

'	'UpdateUser
'	Wait For (xSupabase.Auth.UpdateUser("alexstolte7@gmail.com","")) Complete (Result As SupabaseError)
'	If Result.Success Then
'		Log("User data successfully changed")
'	Else
'		Log("Error: " & Result.ErrorMessage)
'	End If

'	Wait For (xSupabase.Auth.LogIn_MagicLink("alexstolte7@gmail.com")) Complete (Result As SupabaseError)
'	If Result.Success Then
'		Log("magic link successfully sent")
'	Else
'		Log("Error: " & Result.ErrorMessage)
'	End If

'	'Sleep(4000)
'	wait for (xSupabase.Auth.SignUp("alexstolte7@gmail.com","Test123!")) Complete (NewUser As SupabaseUser)
'	If NewUser.Error.Success Then
'		Log("successfully registered with " & NewUser.Email)
'	Else
'		Log("Error: " & NewUser.Error.ErrorMessage)
'	End If
	
'	wait for (xSupabase.Auth.PasswordRecovery("alexstolte7@gmail.com")) Complete (Response As SupabaseError)
'	If Response.Success Then
'		Log("Recovery email sent successfully")
'	Else
'		Log("Error: " & Response.ErrorMessage)
'	End If
	
'	Wait For (xSupabase.Auth.LogIn_EmailPassword("alexstolte7@gmail.com","Test123!!")) Complete (User As SupabaseUser)
'	If Result.Success Then
'		Log("successfully logged in with " & User.Email)
'	Else
'		Log("Error: " & Result.ErrorMessage)
'	End If
	
	'xSupabase.Auth.RefreshToken
	
	
	
	'***************SELECT*******************************
'	Dim Query As Supabase_DatabaseSelect = xSupabase.Database.SelectData
'	Query.Columns("*").From("dt_Tasks")
'	Wait For (Query.Execute) Complete (DatabaseResult As SupabaseDatabaseResult)

	
'	Wait For (xSupabase.Database.SelectData.Columns("*").From("dt_Tasks").Execute) Complete (DatabaseResult As SupabaseDatabaseResult)
'	
'	xSupabase.Database.PrintTable(DatabaseResult)
	
'	For Each content() As Object In DatabaseResult.Rows
'		
'		Dim m_columns As Map = DatabaseResult.Columns
'		
'		
'	Next
	
	'**********INSERT***************
	
	'One Row
'	Dim Insert As Supabase_DatabaseInsert = xSupabase.Database.InsertData
'	Insert.From("dt_Tasks")
'	Dim InsertMap As Map = CreateMap("Tasks_Name":"Task 07","Tasks_Checked":False,"Tasks_CreatedAt":DateUtils.TicksToString(DateTime.Now),"Tasks_UpdatedAt":DateUtils.TicksToString(DateTime.Now))
'	Wait For (Insert.Insert(InsertMap).Upsert.Execute) Complete (Result As SupabaseError)
	
	'Bulk
'	Dim Insert As Supabase_DatabaseInsert = xSupabase.Database.InsertData
'	Insert.From("dt_Tasks")	
'	Dim lst_BulkInsert As List
'	lst_BulkInsert.Initialize
'	lst_BulkInsert.Add(CreateMap("Tasks_Name":"Task 05","Tasks_Checked":True,"Tasks_CreatedAt":DateUtils.TicksToString(DateTime.Now),"Tasks_UpdatedAt":DateUtils.TicksToString(DateTime.Now)))
'	lst_BulkInsert.Add(CreateMap("Tasks_Name":"Task 06","Tasks_Checked":True,"Tasks_CreatedAt":DateUtils.TicksToString(DateTime.Now),"Tasks_UpdatedAt":DateUtils.TicksToString(DateTime.Now)))
'	Wait For (Insert.InsertBulk(lst_BulkInsert).Execute) Complete (Result As SupabaseError)
	
	
	'**********Update***************
'	Dim Update As Supabase_DatabaseUpdate = xSupabase.Database.UpdateData
'	Update.From("dt_Tasks")
'	Update.Update(CreateMap("Tasks_Name":"Task 08"))
'	Update.Eq(CreateMap("Tasks_Id":15))
'	Wait For (Update.Execute) Complete (Result As SupabaseError)
	
	'**********Delete***************
'	Dim Delete As Supabase_DatabaseDelete = xSupabase.Database.DeleteData
'	Delete.From("dt_Tasks")
'	Delete.Eq(CreateMap("Tasks_Id":15))	
'	Wait For (Delete.Execute) Complete (Result As SupabaseError)
	
End Sub

