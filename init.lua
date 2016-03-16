print('Hello, NikitosZs!')
v=nil
tmr.alarm(0, 1000, 0, function() 
if gpio.read(3)==1 then
print("Optionboot")
  dofile("optionload.lua")
else print("Cleanboot")
end end)
