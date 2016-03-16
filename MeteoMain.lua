dofile("dht11.lua")
dofile("ToServerTandP.lua")

function readTPH()
 local status, t, h, temp_dec, humi_dec = dht.read(2)
 
 return tostring(tonumber(t) + tonumber(temp_dec)), tostring( tonumber(h) + tonumber(humi_dec));
end

  t, h = readTPH()

  postThingSpeakTemp()
  
  tmr.alarm(0, 60000, 1, function() 
  	postThingSpeakTemp()
  end)
