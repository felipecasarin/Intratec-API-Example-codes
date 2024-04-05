Public Function EP_series_values(accessToken As String) As String

    Dim url As String
    Dim codes As String
    codes = "68520-8-1,68520-8-1[EUR-gal]"
    
    url = "https://intratec.azure-api.net/energy_price/v1/export/series/" & codes
    
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
            
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    sValues = request.responseText
    
End Function