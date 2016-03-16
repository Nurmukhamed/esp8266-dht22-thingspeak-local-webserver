srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)

        buf="<html><head><title>Weather.ESP12E.001</title><meta http-equiv='content-type' content='text/html; charset=utf-8'></head>"
	buf=buf .. "<body><table border='1' cellpadding='1' cellspacing='1' style='width: 280px;'><tbody><tr>";
        buf=buf .. "<td><h3>Temperature</h3></td><td><h3>" .. temp .."."..temp_dec.. " °C</h3></td></tr>"
        buf=buf .. "<td><h3>Humidity</h3></td><td><h3>".. humi .. "." .. humi_dec .. " %</h3></td></tr></tbody></table></body></html>";

        client:send(buf);
        client:close();
        collectgarbage();
        conn:close()
    end)
end)
