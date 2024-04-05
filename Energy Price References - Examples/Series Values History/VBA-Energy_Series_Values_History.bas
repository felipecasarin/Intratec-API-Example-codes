Public Function EP_series_values(accessToken As String) As String

    Dim url As String
    Dim codes As String

    'Codes you want to get the prices for (separated by commas). If you do not know the codes you have access to, run the Intratec Energy Price References - Series Info API

    'You can also specify the currency and unit, following the available currency and unit for that assessment, according to Intratec Energy Price References - Series Info API

    'For conversion, add [currency-unit] after your code. If you don't want to convert one of them, just leave it blank. Ex: 68520-8-1[-gal],68520-8-1[EUR-]

    codes = "68520-8-1,68520-8-1[EUR-gal]"
    
    'This is the URL to the Get Series Values - Energy Price References API:
    url = "https://intratec.azure-api.net/energy_price/v1/export/series-hist/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
            
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    sValues = request.responseText
    
End Function