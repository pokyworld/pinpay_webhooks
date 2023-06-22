<%

Function FormatDt(value)
    d = Pad(Day(value),"start","0",2)
    m = Pad(Month(value),"start","0",2)
    y = Year(value)
    FormatDt= y & "-" & m & "-" & d
End Function

Function FormatDtTime(value)
    d = Pad(Day(value),"start","0",2)
    m = Pad(Month(value),"start","0",2)
    y = Year(value)
    h = Pad(Hour(value),"start","0",2)
    mi = Pad(Minute(value),"start","0",2)
    s = Pad(Second(value),"start","0",2)
    output = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s
    FormatDtTime = output
End Function

Function LogDt(value)
    d = Pad(Day(value),"start","0",2)
    m = Pad(Month(value),"start","0",2)
    y = Year(value)
    h = Pad(Hour(value),"start","0",2)
    mi = Pad(Minute(value),"start","0",2)
    s = Pad(Second(value),"start","0",2)
    output = y & m & d & "_" & h & "00"
    LogDt = output
End Function

' Pad strings with specified character to specified length
Function Pad(value, where, char, length)
  Select case where
    Case "start","left"
      Do While Len(value) < length
        value = char & value
      Loop
    Case "end","right"
      Do While Len(value) < length
        value = value & char
      Loop
    Case "both"
      Do While Len(value) < length
        value = char & value & char
      Loop
  End Select
  Pad = value
End Function

Function Bool2Int(input)
    If input = True Then : output = 1 : Else : output = 0 :End If
    Bool2Int = output
End Function

Function BytesToStr(bytes)
		Dim Stream
		Set Stream = Server.CreateObject("Adodb.Stream")
				Stream.Type = 1 'adTypeBinary
				Stream.Open
				Stream.Write bytes
				Stream.Position = 0
				Stream.Type = 2 'adTypeText
				'Stream.Charset = "iso-8859-1"
				Stream.Charset = "utf-8"
				BytesToStr = Stream.ReadText
				Stream.Close
		Set Stream = Nothing
End Function

Function ConvertUnixTimeStampToDateTime(input_unix_timestamp)
	ConvertUnixTimeStampToDateTime = CStr(DateAdd("s", input_unix_timestamp, "01/01/1970 00:00:00"))
End Function

%>