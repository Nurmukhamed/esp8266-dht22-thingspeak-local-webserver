srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)

        buf="<html><head><title>Weather.NikitosZs</title><meta http-equiv='content-type' content='text/html; charset=windows-1251'></head>"
	buf=buf .. "<body><table border='1' cellpadding='1' cellspacing='1' style='width: 280px;'><tbody><tr>";
        buf=buf .. "<td><h3>Температура</h3></td><td><h3>" ..(t / 10000).."."..((t % 10000)/1000).. " °C</h3></td></tr>"
        buf=buf .. "<td><h3>Влажность</h3></td><td><h3>".. h .." %</h3></td></tr></tbody></table></body></html>";

        client:send(buf);
        client:close();
        collectgarbage();
        conn:close()
    end)
end)
