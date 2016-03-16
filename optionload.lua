print("3 seconds Wi-Fi start!")
-- tmr.alarm(2, 5000, 1, function() print("WDT test 5 seconds") end )
tmr.alarm(0, 5300, 1, function() dofile("WIFI.lua") print("Re-Connecting...") end )
tmr.alarm(1, 1000, 1, function()

if wifi.sta.getip() == nil then
print("Connecting...")
else 
tmr.stop(0)
tmr.stop(1)
print("Connected! ")
print(wifi.sta.getip())

 dofile("MeteoMain.lua")

print("Server loaded")
end end)
