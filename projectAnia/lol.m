a = arduino;
valueOfPin1= readVoltage(a,'A0');
brightness_step = (1-0)/20;
   for i = 1:20
      writePWMDutyCycle(a, 'D9', i*brightness_step);
      pause(0.1);
   end
