clear;
a = arduino;
valueOfPin1= readVoltage(a,'A0');
valueOfPin2= readVoltage(a,'A1');
valueOfPin3= readVoltage(a,'A2');
yesOrNo = true;
%writeDigitalPin(a,'D9',valueOfPin1/5);
%writeDigitalPin(a,'D5',valueOfPin2/5);
%writeDigitalPin(a,'D3',valueOfPin3/5); 
audio = 'C:\Users\annam.LAPTOP-4PVHIIFB\Documents\GitHub\MED4-Semester-Project\projectAnia\guitar.wav';
maxSchroeder = 1.1764;          %% I have to use those instead of nice formulas that makes sense, because MATLAB round the result, and it gives us bad schroeder effect
maxPinForSchroeder = 0.2352;
      %writePWMDutyCycle(a, 'D9', 1);
      writePWMDutyCycle(a, 'D5', 0.5);
      writePWMDutyCycle(a, 'D3', 0.1);
      valueOfPinN = 0;
          writePWMDutyCycle(a, 'D9', valueOfPin1/5);



% brightness_step = (1-0)/20;
%    for i = 1:20
%       writePWMDutyCycle(a, 'D9', i*brightness_step);
%       pause(0.1);
%    end

prompt = 'Choose one: \n- for Schroeder, type "sch" \n- for Room Impulse Response version 1, type "r1" \n- for Room Impulse Response version 2, type "r2" \n'; 
firstUserInput = input(prompt, 's');



% if strcmp(firstUserInput,'sch')
%     prompt = 'Now, choose how intense the Schroeder reverb will be by turning potentiometer and type "done", to hear filtered sound \n';
%     schroederUserInput = input(prompt, 's');
%         if strcmp(schroederUserInput,'done')
%             schroederAudio = SchroederAlgorithm(audio, valueOfPin1*maxPinForSchroeder);
%             sound(schroederAudio);
%             disp( valueOfPin1);
%         end
% elseif strcmp(firstUserInput,'r1')
%     rir(44100, [19 18 1.6], 12, 0.3, [20 19 21], [5 2 1])
% elseif strcmp(firstUserInput,'r2')
%     while true
%     prompt = 'Turn each potentiometer to establish dimensions of your room (it is measured in meters and the max is 100m) \nFirst potentiometer is lenght of the room \nSecond is the width of the room \nThird is height of the room \nType "done" to see the result \n';
%     roomUserInput = input(prompt, 's');
%     valueOfPin1= readVoltage(a,'A0');
%     valueOfPin2= readVoltage(a,'A1');
%     valueOfPin3= readVoltage(a,'A2');
%         if strcmp(roomUserInput,'done')
%             disp("Dimensions of your room are:");
%             disp("Lenght =" + valueOfPin1*20);
%             disp("Width =" + valueOfPin2*20);
%             disp("Height =" + valueOfPin3*20);
%             sizeOfRoom = [valueOfPin1*20 valueOfPin2*20 valueOfPin3*20];
%             prompt = 'Do you want to change any of them? Type "yes" if you want to, or "no" if you want to continue \n';
%             sizeOfRoomYesorNo = input(prompt, 's');
%             if strcmp(sizeOfRoomYesorNo,'yes') 
%                 true;
%             elseif strcmp(sizeOfRoomYesorNo,'no')
%                 
%                 prompt = 'Turn each potentiometer to establish receiver position (it is measured in meters) \nFirst potentiometer is "x" position \nSecond is "y" position \nThird is "z" position \nType "done" to see the result \n';
%                 receiverUserInput = input(prompt, 's');
%                 valueOfPin1= readVoltage(a,'A0');
%                 valueOfPin2= readVoltage(a,'A1');
%                 valueOfPin3= readVoltage(a,'A2');
%                     if strcmp(receiverUserInput,'done')
%                     disp("Dimensions of your room are:");
%                     disp("X =" + valueOfPin1*20);
%                     disp("Y =" + valueOfPin2*20);
%                     disp("Z =" + valueOfPin3*20);
%                     receiverPosition = [valueOfPin1*20 valueOfPin2*20 valueOfPin2*20];
%                     prompt = 'Do you want to change any of them? Type "yes" if you want to, or "no" if you want to continue';
%                     receiverYesorNo = input(prompt, 's');
%                     if strcmp(receiverYesorNo,'no')
%                     prompt = 'Turn each potentiometer to establish source position (it is measured in meters) \nFirst potentiometer is "x" position \nSecond is "y" position \nThird is "z" position \nType "done" to see the result \n';
%                     sourceUserInput = input(prompt, 's');
%                     valueOfPin1= readVoltage(a,'A0');
%                     valueOfPin2= readVoltage(a,'A1');
%                     valueOfPin3= readVoltage(a,'A2');
%                         if strcmp(sourceUserInput,'done')
%                         disp("Dimensions of your room are:");
%                         disp("X =" + valueOfPin1*20);
%                         disp("Y =" + valueOfPin2*20);
%                         disp("Z =" + valueOfPin3*20);
%                         sourcePosition = [valueOfPin1*20 valueOfPin2*20 valueOfPin2*20];
%                         prompt = 'Do you want to change any of them? Type "yes" if you want to, or "no" if you want to continue';
%                         sourceYesorNo = input(prompt, 's');
%                         if strcmp(receiverYesorNo,'no')
%                             disp(sizeOfRoom);
%                             disp(receiverPosition);
%                             disp(sourcePosition);
%                             rirAudio = RirFunction(audio, sizeOfRoom, receiverPosition, sourcePosition);
%                             %sound(rirAudio);
%                         end
%                      
%                         end
%                     end
% 
%                     end
%             end
%             
%         end
%     end
%     end
