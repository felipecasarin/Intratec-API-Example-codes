Public Function EP_series_info(accessToken As String) As String

    Dim url As String
    Dim codes As String
    
    'This is the URL to the Get Series Info - Energy Price References API:
    url = "https://intratec.azure-api.net/energy_price/v1/export/series"

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
            
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    sInfo = request.responseText
    
End Function