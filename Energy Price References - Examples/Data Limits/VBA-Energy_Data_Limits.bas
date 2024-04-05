Public Function EP_data_limits(accessToken As String) As String

    Dim url As String
    Dim codes As String
    
    'This is the URL to the Data Limits - Energy Price References API:
    url = "https://intratec.azure-api.net/energy_price/v1/data_limits"

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
            
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    EP_data_limits = request.responseText
    
End Function