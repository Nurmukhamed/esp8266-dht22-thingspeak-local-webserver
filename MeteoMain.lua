dofile("dht11.lua")
dofile("ToServerTandP.lua")
dofile("webtabl2.lua")

  readDHT22()
  postThingSpeakTemp()
  
  tmr.alarm(0, 60000, 1, function() 
  	readDHT22()
	postThingSpeakTemp()
  end)
