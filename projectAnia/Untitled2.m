clear;
a = arduino;
valueOfPin1= readVoltage(a,'A0');
valueOfPin2= readVoltage(a,'A1');
valueOfPin3= readVoltage(a,'A2');
%writeDigitalPin(a,'D9',valueOfPin1/5);
%writeDigitalPin(a,'D5',valueOfPin2/5);
%writeDigitalPin(a,'D3',valueOfPin3/5);

audio = 'C:\Users\annam.LAPTOP-4PVHIIFB\Documents\GitHub\MED4-Semester-Project\projectAnia\guitar.wav';
maxSchroeder = 1.1764;          %% I have to use those instead of nice formulas that makes sense, because MATLAB round the result, and it gives us bad schroeder effect
maxPinForSchroeder = 0.2352;
prompt = 'Choose one: \n- for Schroeder, type "s" \n- for Room Impulse Response version 1, type "r1" \n- for Room Impulse Response version 2, type "r2" '; 
str = input(prompt);

if contains(str,'s')
    s = SchroederAlgorithm(audio, valueOfPin1*maxPinForSchroeder);
    sound(s);
elseif contains(str,'r1')
    
elseif contains(str,'r2')

end

disp(valueOfPin1);
disp(valueOfPin2);
disp(valueOfPin3);