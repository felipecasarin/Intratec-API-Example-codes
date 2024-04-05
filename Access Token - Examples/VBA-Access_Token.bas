Public Function accessToken(Username As String, Password As String) As String

    Dim url As String
    Dim request As Object
    Dim jsonBody As String
    Dim response As String
    
    url = "https://intratec.azure-api.net/access_token/v1"
    
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    jsonBody = "{""username"": """ & Username & """, ""password"": """ & Password & """}"
 
    request.Open "POST", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Content-Type", "application/json"
    request.send jsonBody
    
    'set accessToken with api response token value
    accessToken = JsonConverter.ParseJson(request.responseText)("access_token")

End Function