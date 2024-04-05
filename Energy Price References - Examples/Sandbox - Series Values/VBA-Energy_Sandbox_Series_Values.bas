Public Function EP_sb_series_values(accessToken As String) As String

    Dim url As String
    Dim codes As String

    'Codes you want to get the prices for (separated by commas). If you do not know the codes you have access to, run the Intratec Energy Price References - Series Info API
    codes = "68520-8-1"
    
    'This is the URL to the Get Series Values - Energy Price References API:
    url = "https://intratec.azure-api.net/energy_price/v1/sandbox/export/series/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
            
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    EP_sb_series_values = request.responseText
    
End Function