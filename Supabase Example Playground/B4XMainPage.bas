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
	Public xSupabase As Supabase

	Private ImageView1 As B4XView
	Private AnotherProgressBar1 As AnotherProgressBar
	Private Realtime As SupabaseRealtime
	Private Channel1 As SupabaseRealtime_Channel

End Sub

Public Sub Initialize
	
End Sub

Private Sub B4XPage_Foreground
	#if B4A
	xSupabase.Auth.CallFromResume(B4XPages.GetNativeParent(Me).GetStartingIntent)
	#End If
End Sub

Private Sub Realtime_DataReceived(Data As SupabaseRealtime_Data)
	
	'If Data.EventType = Realtime.Event_UPDATE Then 'A record in the database was changed
      
		For Each k As String In Data.Records.Keys
			Log($"Column: "${k}" Value: "${Data.Records.Get(k)}""$)
		Next
      
	'End If
	
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("frm_main")
	
	xSupabase.Initialize("https://hzyxcepknitxzfhghsmn.supabase.co","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh6eXhjZXBrbml0eHpmaGdoc21uIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTc1NzU4NzcsImV4cCI6MTk3MzE1MTg3N30.Op1akQpHfvWJXEZCFornQeoK2J7_R-3IPK0VHLrNphY") 'b4x test
	'xSupabase.Initialize("https://nwgyagunqddfahdbnala.supabase.co","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im53Z3lhZ3VucWRkZmFoZGJuYWxhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM4NDc2NjUsImV4cCI6MjAxOTQyMzY2NX0.m0IyxMTpUDy2T9zHcsVFBaMFWAgzaRTkdxZsmnlJrn8") 'matchme
	xSupabase.InitializeEvents(Me,"Supabase")
	xSupabase.LogEvents = True
	
'	Wait For (xSupabase.Auth.Logout) Complete (Result As SupabaseError)
'	'Wait For (xSupabase.Auth.LogIn_EmailPassword("alexstolte7@gmail.com","Test123!!")) Complete (User As SupabaseUser)
'	
'	If Result.Success Then
'		Log("User successfully logged out")
'	Else
'		Log("Error: " & Result.ErrorMessage)
'	End If
	
	Wait For (xSupabase.Auth.LogIn_Anonymously) Complete (AnonymousUser As SupabaseUser)
	If AnonymousUser.Error.Success Then
		Log("Successfully created an anonymous user")
	Else
		Log("Error: " & AnonymousUser.Error.ErrorMessage)
	End If
	
'	Dim CallFunction As Supabase_DatabaseRpc = xSupabase.Database.CallFunction
'	CallFunction.Rpc("echo")
'	CallFunction.Parameters(CreateMap("say":"Hello B4X"))
'	Wait For (CallFunction.Execute) Complete (RpcResult As SupabaseRpcResult)
'	If RpcResult.Error.Success Then
'		Log(RpcResult.Data)
'	End If
	
'	Wait For (xSupabase.Auth.isUserLoggedIn) Complete (isLoggedIn As Boolean)
'	
	'If isLoggedIn = False Then
	
'	Wait For (xSupabase.Auth.LogIn_EmailPassword("yixikov644@skrank.com","Test123!")) Complete (User As SupabaseUser)
'	If User.Error.Success Then
'		Log("successfully logged in with " & User.Email)
'	Else
'		Log("Error: " & User.Error.ErrorMessage)
'	End If
	
	'End If



'	
'	Realtime.Initialize(Me,"Realtime",xSupabase)
'	Realtime.Connect
'	Wait For Realtime_Connected
'	Log("Realtime_Connected")
'	
'	Channel1 = Realtime _
'	.Channel("Room1","","") _
'	.On(Realtime.SubscribeType_Broadcast) _
'	.ReceiveOwnBroadcasts(False) _
'	.AcknowledgeBroadcasts(False) _
'	.Subscribe
'	
'	Wait For Realtime_Subscribed
'	Log("Subscribed to presence")

'	Sleep(4000)
'	Log("fdfsf")
'	Channel1.SendBroadcast("cursor-pos",CreateMap("x":152,"y":200))

'	Realtime.Initialize(Me,"Realtime",xSupabase)
'	'Realtime.Connect
'	'Wait For Realtime_Connected
'	Log("Realtime_Connected")
	''
	''
'	Realtime _
'	.Channel("public","dt_Chat",Realtime.BuildFilter("room_id",Realtime.Filter_Equal,"7")) _
'	.On(Realtime.SubscribeType_Broadcast) _
'	.Event(Realtime.Event_ALL) _
'	.Subscribe
	'
'	Wait For Realtime_Subscribed
'	Log("Subscribed to topic")

'	#If B4A
'	Wait For (xSupabase.Auth.SignInWithOAuth("e5e8e0e037792c30ea82","github","user")) Complete (User As SupabaseUser)
'	#Else If B4I
'	Wait For (xSupabase.Auth.SignInWithOAuth("291788264420-d2uir51jku973f1gch31l2unn6r7b9ur.apps.googleusercontent.com","apple","profile email https://www.googleapis.com/auth/userinfo.email")) Complete (User As SupabaseUser)
'	#Else If B4J
'	Wait For (xSupabase.Auth.SignInWithOAuth("e5e8e0e037792c30ea82","github","all","897f62a8252256396be1eda023a4ea626b59049c")) Complete (User As SupabaseUser)
'	#End If
	'
'	If User.Error.Success Then
'		Log("successfully logged in with " & User.Email)
'	Else
'		Log("Error: " & User.Error.ErrorMessage)
'	End If

	
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

'	Dim AdditionalUserMetadata As Map = CreateMap("first_name":"Alexander","age":25)
'	Wait For (xSupabase.Auth.SignUp("alexstolte7@gmail.com","Test123!",AdditionalUserMetadata)) Complete (NewUser As SupabaseUser)
	
'	Wait For (xSupabase.Auth.SignUp("alexstolte7@gmail.com","Test123!",Null)) Complete (NewUser As SupabaseUser)
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
	

	
	'Wait For (xSupabase.Auth.GetUser) Complete (User As SupabaseUser)
	
'	Dim Query As Supabase_DatabaseSelect = B4XPages.MainPage.xSupabase.Database.SelectData
'	Query.Columns("*").From("dt_Rooms")
'	Wait For (Query.Execute) Complete (DatabaseResult As SupabaseDatabaseResult)
'	
'	For Each Row As Map In  DatabaseResult.Rows
'		
'	Log("")
'		
'	Next
'	
'	Dim AdditionalUserMetadata As Map = CreateMap("username":"Testos")
'	
'	Dim tmpEmail As String = $"${GenerateRandomPasswordString(10)}@gmail.com"$
'	Dim tmpPassword As String = GenerateRandomPasswordString(20)
'	
'	Wait For (B4XPages.MainPage.xSupabase.Auth.SignUp(tmpEmail,tmpPassword,AdditionalUserMetadata)) Complete (User As SupabaseUser)
'	If User.Error.Success Then
'		'Log("successfully logged in with " & User.Email)
'		
'		Wait For (B4XPages.MainPage.xSupabase.Auth.LogIn_EmailPassword(tmpEmail,tmpPassword)) Complete (User As SupabaseUser)
'		If User.Error.Success Then
'			B4XPages.ClosePage(Me)
'		Else
'			Log("Error: " & User.Error.ErrorMessage)
'		End If
'		
'		
'	Else
'		Log("Error: " & User.Error.ErrorMessage)
'	End If
'	

'	Dim Query As Supabase_DatabaseSelect = xSupabase.Database.SelectData
'	Query.Columns("*").From("dt_Tasks")
'	Query.Filter_Like(CreateMap("Tasks_Name":"01"))
'	Wait For (Query.Execute) Complete (DatabaseResult As SupabaseDatabaseResult)
'	xSupabase.Database.PrintTable(DatabaseResult)
	
	'xSupabase.Auth.RefreshToken
	
	'xSupabase.Auth.Logout
	
	'***************SELECT*******************************
	Dim Query As Supabase_DatabaseSelect = xSupabase.Database.SelectData
	Query.Columns("*").From("dt_Tasks")
	'Query.Filter_Equal(CreateMap("Tasks_Name":"Task 02"))
	Wait For (Query.Execute) Complete (DatabaseResult As SupabaseDatabaseResult)
	If DatabaseResult.Error.Success Then
		xSupabase.Database.PrintTable(DatabaseResult)
	
	End If
	
'	Wait For (xSupabase.Database.SelectData.Columns("*").From("dt_Tasks").Execute) Complete (DatabaseResult As SupabaseDatabaseResult)
'	
'	xSupabase.Database.PrintTable(DatabaseResult)
'	
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
'	Insert.Select2
'	Dim InsertMap As Map = CreateMap("Tasks_Name":"Task 14","Tasks_Checked":False,"Tasks_CreatedAt":DateUtils.TicksToString(DateTime.Now),"Tasks_UpdatedAt":DateUtils.TicksToString(DateTime.Now))
'	Wait For (Insert.Insert(InsertMap).Upsert.Execute) Complete (Result As SupabaseError)

'	Dim Insert As Supabase_DatabaseInsert = xSupabase.Database.InsertData
'	Insert.From("users")
'	Insert.Upsert
'	Insert.SelectData
'	Dim InsertMap As Map = CreateMap("id":"492422e5-4188-4b40-9324-fee7c46be527","username":"Testos")
'	Wait For (Insert.Insert(InsertMap).Execute) Complete (Result As SupabaseDatabaseResult)
	'
'	xSupabase.Database.PrintTable(Result)

'	'Bulk
'	Dim Insert As Supabase_DatabaseInsert = xSupabase.Database.InsertData
'	Insert.From("dt_Tasks")
'	Dim lst_BulkInsert As List
'	lst_BulkInsert.Initialize
'	lst_BulkInsert.Add(CreateMap("Tasks_Name":"Task 05","Tasks_Checked":True,"Tasks_CreatedAt":DateUtils.TicksToString(DateTime.Now),"Tasks_UpdatedAt":DateUtils.TicksToString(DateTime.Now)))
'	lst_BulkInsert.Add(CreateMap("Tasks_Name":"Task 06","Tasks_Checked":True,"Tasks_CreatedAt":DateUtils.TicksToString(DateTime.Now),"Tasks_UpdatedAt":DateUtils.TicksToString(DateTime.Now)))
'	Wait For (Insert.InsertBulk(lst_BulkInsert).Execute) Complete (Result As SupabaseError)
	
	
	'**********Update***************
'	Dim Update As Supabase_DatabaseUpdate = xSupabase.Database.UpdateData
'	Update.From("users")
'	Update.Update(CreateMap("username":"Alex"))
'	Update.SelectData
'	Update.Eq(CreateMap("id":"492422e5-4188-4b40-9324-fee7c46be527"))
'	Wait For (Update.Execute) Complete (Result As SupabaseDatabaseResult)
'	
'	xSupabase.Database.PrintTable(Result)
'	
'	Dim Update As Supabase_DatabaseUpdate = xSupabase.Database.UpdateData
'	Update.From("dt_Tasks")
'	Update.Update(CreateMap("Tasks_Name":"Task 08"))
'	Update.Eq(CreateMap("Tasks_Id":15))
'	Wait For (Update.Execute) Complete (Result As SupabaseDatabaseResult)
	
	'**********Delete***************
'	Dim Delete As Supabase_DatabaseDelete = xSupabase.Database.DeleteData
'	Delete.From("dt_Tasks")
'	Delete.Eq(CreateMap("Tasks_Id":15))
'	Wait For (Delete.Execute) Complete (Result As SupabaseError)
	
	'************************Storage Bucket****************************************
	
'	Dim CreateBucket As Supabase_StorageBucket = xSupabase.Storage.CreateBucket("Avatar")
'	CreateBucket.Options_isPublic(False)
'	CreateBucket.Options_FileSizeLimit(1048576 )
'	CreateBucket.Options_AllowedMimeTypes(Array("image/png","image/jpg"))
'	Wait For (CreateBucket.Execute) Complete (Bucket As SupabaseStorageBucket)
'	If Bucket.Error.Success Then
'		Log($"Bucket ${Bucket.Name} successfully created "$)
'	Else
'		Log("Error: " & Bucket.Error.ErrorMessage)
'	End If
	
'	Dim GetBucket As Supabase_StorageBucket = xSupabase.Storage.GetBucket("Avatar")
'	Wait For (GetBucket.Execute) Complete (Bucket As SupabaseStorageBucket)
'	If Bucket.Error.Success Then
'		Log($"Bucket ${Bucket.Name} was created at ${DateUtils.TicksToString(Bucket.CreatedAt)}"$)
'	Else
'		Log("Error: " & Bucket.Error.ErrorMessage)
'	End If
	
'	Dim UpdateBucket As Supabase_StorageBucket = xSupabase.Storage.UpdateBucket("Avatar")
'	UpdateBucket.Options_isPublic(True)
'	UpdateBucket.Options_FileSizeLimit(1048576 )
'	UpdateBucket.Options_AllowedMimeTypes(Array("image/png"))
'	Wait For (UpdateBucket.Execute) Complete (Bucket As SupabaseStorageBucket)
'	If Bucket.Error.Success Then
'		Log($"Bucket ${Bucket.Name} successfully updated "$)
'	Else
'		Log("Error: " & Bucket.Error.ErrorMessage)
'	End If
	
'	Dim DelteBucket As Supabase_StorageBucket = xSupabase.Storage.DeleteBucket("Avatar")
'	Wait For (DelteBucket.Execute) Complete (Bucket As SupabaseStorageBucket)
'	If Bucket.Error.Success Then
'		Log($"Bucket ${Bucket.Name} successfully deleted "$)
'	Else
'		Log("Error: " & Bucket.Error.ErrorMessage)
'	End If
	

	
'	Wait For (xSupabase.Storage.EmptyBucket("Avatar").Execute) Complete (Bucket As SupabaseStorageBucket)
'	If Bucket.Error.Success Then
'		Log($"Bucket ${Bucket.Name} successfully cleared "$)
'	Else
'		Log("Error: " & Bucket.Error.ErrorMessage)
'	End If
	
	'************************Storage File********************************************
	
'	Dim UploadFile As Supabase_StorageFile = xSupabase.Storage.UploadFile("Avatar","test.png")
'	UploadFile.FileBody(xSupabase.Storage.ConvertFile2Binary(File.DirAssets,"test.jpg"))
'	Wait For (UploadFile.Execute) Complete (StorageFile As SupabaseStorageFile)
'	If StorageFile.Error.Success Then
'		Log($"File ${"test.jpg"} successfully uploaded "$)
'	Else
'		Log("Error: " & StorageFile.Error.ErrorMessage)
'	End If
	
'	Dim DownloadFile As Supabase_StorageFile = xSupabase.Storage.DownloadFile("Avatar","test.png")
'	Wait For (DownloadFile.Execute) Complete (StorageFile As SupabaseStorageFile)
'	If StorageFile.Error.Success Then
'		Log($"File ${"test.jpg"} successfully downloaded "$)
'		ImageView1.SetBitmap(xSupabase.Storage.BytesToImage(StorageFile.FileBody))
'	Else
'		Log("Error: " & StorageFile.Error.ErrorMessage)
'	End If
	
'	Dim UpdateFile As Supabase_StorageFile = xSupabase.Storage.UpdateFile("Avatar","test.png")
'	UpdateFile.FileBody(xSupabase.Storage.ConvertFile2Binary(File.DirAssets,"test2.jpg"))
'	Wait For (UpdateFile.Execute) Complete (StorageFile As SupabaseStorageFile)
'	If StorageFile.Error.Success Then
'		Log($"File ${"test.jpg"} successfully updated "$)
'	Else
'		Log("Error: " & StorageFile.Error.ErrorMessage)
'	End If
	
'	Dim DeleteFile As Supabase_StorageFile = xSupabase.Storage.DeleteFile("Avatar")
'	DeleteFile.Remove(Array("test.png"))
'	Wait For (DeleteFile.Execute) Complete (StorageFile As SupabaseStorageFile)
'	If StorageFile.Error.Success Then
'		Log($"File ${"test.jpg"} successfully deleted "$)
'	Else
'		Log("Error: " & StorageFile.Error.ErrorMessage)
'	End If
	
	'Move File
'	Wait For (xSupabase.Storage.CreateSignedUrl("Avatar","test.png",60).Execute) Complete (StorageFile As SupabaseStorageFile)
'	If StorageFile.Error.Success Then
'		Log(StorageFile.SignedURL)
		
'	Dim DownloadFile As Supabase_StorageFile = xSupabase.Storage.DownloadFileProgress("Avatar","test.png",Me,"DownloadProfileImage",File.DirTemp)
'	Wait For (DownloadFile.Execute) Complete (StorageFile As SupabaseStorageFile)
'	If StorageFile.Error.Success Then
'		Log($"File ${"test.jpg"} successfully downloaded "$)
'		ImageView1.SetBitmap(xSupabase.Storage.BytesToImage(StorageFile.FileBody))
'		If File.Exists(File.DirTemp,"test.png") Then File.Delete(File.DirTemp,"test.png") 'Clean the download path, or do what ever you want
'	Else
'		Log("Error: " & StorageFile.Error.ErrorMessage)
'	End If


End Sub

Private Sub DownloadProfileImage_RangeDownloadTracker(Tracker As SupabaseRangeDownloadTracker)
	If Tracker.CurrentLength > 0 Then
	Log($"$1.2{Tracker.CurrentLength / 1024 / 1024}MB / $1.2{Tracker.TotalLength / 1024 / 1024}MB"$)
	AnotherProgressBar1.Value = Tracker.CurrentLength / Tracker.TotalLength * 100
	End If
End Sub

Private Sub Supabase_AuthStateChange(StateType As String)
	Select StateType
		Case "passwordRecovery"
			Log("Reset password was requested")
		Case "signedIn"
			Log("The user has logged in")
		Case "signedOut"
			Log("The user has logged out")
		Case "tokenRefreshed"
			Log("The Auth Token was updated")
		Case "userUpdated"
			Log("The email address and or password has been changed")
		Case Else
			Log("Unknown State Type")
	End Select
End Sub

Private Sub GenerateRandomPasswordString(Length As Int) As String
	Dim sb As StringBuilder
	sb.Initialize
	For i = 1 To Length
		Dim C As Int = Rnd(48, 122)
    
		Do While (C>= 58 And C<=64) Or (C>= 91 And C<=96)
			C = Rnd(48, 122)
		Loop
    
		sb.Append(Chr(C))
	Next
	Return sb.ToString
End Sub

#If B4J
Private Sub Label1_MouseClicked (EventData As MouseEvent)
	'Channel1.SendBroadcast("cursor-pos",CreateMap("x":"198","y":"50"))
	
	Channel1.Untrack
	
End Sub
#End If

Private Sub Realtime_BroadcastDataReceived(BroadcastData As SupabaseRealtime_BroadcastData)
	
	Log("Broadcast data for event: " & BroadcastData.Event)
	Log("Data:")
	For Each k As String In BroadcastData.Payload.Keys
		Log(k & ":" & BroadcastData.Payload.Get(k))
	Next
	
End Sub

Private Sub Realtime_PresenceDataReceived(PresenceData As SupabaseRealtime_PresenceData)
	
	Log("Presence data:")
	
	Dim json As JSONGenerator
	json.Initialize(PresenceData.Joins)
	Log("Joins: " & json.ToString)
	
	json.Initialize(PresenceData.Leaves)
	Log("Leaves: " & json.ToString)
	
End Sub