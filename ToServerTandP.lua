
-----  Температура
function postThingSpeakTemp()
    connout = nil
    connout = net.createConnection(net.TCP, 0)
 
    connout:on("receive", function(connout, payloadout)
        if (string.find(payloadout, "Status: 200 OK") ~= nil) then
            print("Temp posted OK, Humidity posted OK");
        end
    end)
 
    connout:on("connection", function(connout, payloadout)
 
	status, temp, humi, temp_dec, humi_dec = dht.read(2) 
            print("Posting T = " .. temp .. "." .. temp_dec )
            print("Posting H = " .. humi .. "." .. humi_dec )
		if temp ~= -999 and humi ~= -999 then
        	connout:send("GET /update?api_key=LTSKD514E4O5UKB4&field3=" .. temp .. "." .. temp_dec 
        	.. "&field4=" .. humi .. "." .. humi_dec
			.. " HTTP/1.1\r\n"
        	.. "Host: api.thingspeak.com\r\n"
        	.. "Connection: close\r\n"
        	.. "Accept: */*\r\n"
        	.. "User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n"
        	.. "\r\n")
		end
    end)
 
    connout:on("disconnection", function(connout, payloadout)
        connout:close();
        -- collectgarbage();
    end)
 
    connout:connect(80,'api.thingspeak.com')
end
