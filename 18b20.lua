-- 18b20 Example
pin = 3

function ds18b20read()
ow.setup(pin)
count = 0
repeat
  count = count + 1
  addr = ow.reset_search(pin)
  addr = ow.search(pin)
until (addr ~= nil) or (count > 5)
if addr == nil then
  print("No addresses.")
else
  -- print(addr:byte(1,8))
  crc = ow.crc8(string.sub(addr,1,7))
  if crc == addr:byte(8) then
    if (addr:byte(1) == 0x10) or (addr:byte(1) == 0x28) then
          ow.reset(pin)
          ow.select(pin, addr)
          ow.write(pin, 0x44, 1)
 --         tmr.delay(1000000)

 repeat
  count = count + 1
  present = ow.reset(pin)
until (present == 1) or (count > 5)

          present = ow.reset(pin)
          ow.select(pin, addr)
          ow.write(pin,0xBE,1)
          data = nil
          data = string.char(ow.read(pin))
          for i = 1, 8 do
            data = data .. string.char(ow.read(pin))
          end
       --   print(data:byte(1,9))
          crc = ow.crc8(string.sub(data,1,8))
       --   print("CRC="..crc)
          if crc == data:byte(9) then
             t = (data:byte(1) + data:byte(2) * 256) * 625
             
                       
             if t>21110000 then 
             t = t - 40954095;
             end
       --      t1 = t / 10000
       --      t2 = t % 10000
        --     print("Temperature="..t1.."."..(t2/100).." C")
          end            
        
    end
  end
end
return t;
end
