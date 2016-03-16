status, temp, humi, temp_dec, humi_dec = dht.read(2)
print(string.format("DHT Temperature: %d.%d; \r\nDHT Humidity: %d.%d;\r\n", temp, temp_dec, humi, humi_dec))
