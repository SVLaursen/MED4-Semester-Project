clear;
clc;
a = arduino;
valueOfPin1= 5-readVoltage(a,'A0');
valueOfPin2= 5-readVoltage(a,'A1');
valueOfPin3= 5-readVoltage(a,'A2');
writeDigitalPin(a,'D9',0);
writeDigitalPin(a,'D5',0);
writeDigitalPin(a,'D3',0); 
%audio = 'C:\Users\annam.LAPTOP-4PVHIIFB\Documents\GitHub\MED4-Semester-Project\projectAnia\guitar.wav';
%audioNew = audioread('WashingMachine-16-8-mono-1000secs.wav');
%[data, samplerate] = audioread('guitar.wav');
%[data, samplerate] = audioread('speech_dft_8kHz.wav');
maxSchroeder = 1.1764;          %% I have to use those instead of nice formulas that makes sense, because MATLAB round the result, and it gives us bad schroeder effect
maxPinForSchroeder = 0.2352;

prompt = 'Choose one: \n- for Schroeder, type "sch" \n- for Room Impulse Response type "rir" \n'; 
firstUserInput = input(prompt, 's');

if strcmp(firstUserInput,'sch')
    while true
    writeDigitalPin(a,'D9',0);
    writeDigitalPin(a,'D5',0);
    writeDigitalPin(a,'D3',0);
    prompt = 'Choose how intense the Schroeder reverb will be by turning potentiometer and type "done" \n';
    schroederUserInput = input(prompt, 's');
    valueOfPin1= 5 -readVoltage(a,'A0');
            if strcmp(schroederUserInput,'done')
            writePWMDutyCycle(a, 'D9', valueOfPin1/5);
            disp("Schroeder's reverb intensity:" + valueOfPin1*20 + "%")
            prompt = 'Continue with these parameters? yes/no \n';
            schroederYesOrNo = input(prompt, 's');
                if strcmp(schroederYesOrNo,'no')
                elseif strcmp(schroederYesOrNo,'yes')
                schroederAudio = SchroederAlgorithm('speech_dft_8kHz.wav', (valueOfPin1)*maxPinForSchroeder);
                
                %disp((valueOfPin1)*maxPinForSchroeder);
                
                norm = (schroederAudio - min(schroederAudio))/(max(schroederAudio)-min(schroederAudio));
                %sound(norm);
                audiowrite('schroederOutput.wav', norm, 44100);
                
                test = audioread('output2.wav');
                sound(test, 44100);
                break;
                end
            end
    end
    
elseif strcmp(firstUserInput,'rir')
    while true
    writeDigitalPin(a,'D9',0);
    writeDigitalPin(a,'D5',0);
    writeDigitalPin(a,'D3',0);
    prompt = 'Turn each potentiometer to establish dimensions of your room (it is measured in meters and the max is 10m) \nFirst potentiometer is length of the room \nSecond is the width of the room \nThird is height of the room \nType "done" to see the result \n';
    roomUserInput = input(prompt, 's');
    valueOfPin1= 5-readVoltage(a,'A0');
    valueOfPin2= 5-readVoltage(a,'A1');
    valueOfPin3= 5-readVoltage(a,'A2');
        if strcmp(roomUserInput,'done')
            writePWMDutyCycle(a, 'D9', valueOfPin1/5);
            writePWMDutyCycle(a, 'D5', valueOfPin2/5);
            writePWMDutyCycle(a, 'D3', valueOfPin3/5);
            disp("Dimensions of your room are:");
            disp("Length =" + valueOfPin1*2);
            disp("Width =" + valueOfPin2*2);
            disp("Height =" + valueOfPin3*2);
            sizeOfRoom = [valueOfPin1*2 valueOfPin2*2 valueOfPin3*2];
            prompt = 'Continue with these parameters? yes/no \n';
            sizeOfRoomYesorNo = input(prompt, 's');
            if strcmp(sizeOfRoomYesorNo,'no')
                
            elseif strcmp(sizeOfRoomYesorNo,'yes')
                while true
                writeDigitalPin(a,'D9',0);
                writeDigitalPin(a,'D5',0);
                writeDigitalPin(a,'D3',0);
                prompt = 'Turn each potentiometer to establish receiver position (it is measured in meters) \nFirst potentiometer is "x" position \nSecond is "y" position \nThird is "z" position \nType "done" to see the result \n';
                receiverUserInput = input(prompt, 's');
                valueOfPin1= 5-readVoltage(a,'A0');
                valueOfPin2= 5-readVoltage(a,'A1');
                valueOfPin3= 5-readVoltage(a,'A2');
                    if strcmp(receiverUserInput,'done')
                        if valueOfPin1*2>sizeOfRoom(1) || valueOfPin2*2>sizeOfRoom(2) || valueOfPin3*2>sizeOfRoom(3)
                            disp("Upsi dupsi, one of the variables is bigger than size of the room! The variables that you input are:");
                            disp("X =" + valueOfPin1*2);
                            disp("Y =" + valueOfPin2*2);
                            disp("Z =" + valueOfPin3*2);
                            disp("Try again!")                            
                            continue;
                        else
                            writePWMDutyCycle(a, 'D9', valueOfPin1/5);
                            writePWMDutyCycle(a, 'D5', valueOfPin2/5);
                            writePWMDutyCycle(a, 'D3', valueOfPin3/5);
                            disp("Receiver position:");
                            disp("X =" + valueOfPin1*2);
                            disp("Y =" + valueOfPin2*2);
                            disp("Z =" + valueOfPin3*2);
                            receiverPosition = [valueOfPin1*2 valueOfPin2*2 valueOfPin2*2];
                            prompt = 'Continue with these parameters? yes/no \n';
                            receiverYesorNo = input(prompt, 's');

                            if strcmp(receiverYesorNo,'no')

                            elseif strcmp(receiverYesorNo,'yes')
                                while true
                                writeDigitalPin(a,'D9',0);
                                writeDigitalPin(a,'D5',0);
                                writeDigitalPin(a,'D3',0);
                                prompt = 'Turn each potentiometer to establish source position (it is measured in meters) \nFirst potentiometer is "x" position \nSecond is "y" position \nThird is "z" position \nType "done" to see the result \n';
                                sourceUserInput = input(prompt, 's');
                                valueOfPin1= 5-readVoltage(a,'A0');
                                valueOfPin2= 5-readVoltage(a,'A1');
                                valueOfPin3= 5-readVoltage(a,'A2');
                                    if strcmp(sourceUserInput,'done')
                                        if valueOfPin1*2>sizeOfRoom(1) || valueOfPin2*2>sizeOfRoom(2) || valueOfPin3*2>sizeOfRoom(3)
                                        disp("Upsi dupsi, one of the variables is bigger than size of the room!Here are the variables that you input:");
                                        disp("X =" + valueOfPin1*2);
                                        disp("Y =" + valueOfPin2*2);
                                        disp("Z =" + valueOfPin3*2);
                                        disp("Try again!")
                                        continue;
                                        else
                                        writePWMDutyCycle(a, 'D9', valueOfPin1/5);
                                        writePWMDutyCycle(a, 'D5', valueOfPin2/5);
                                        writePWMDutyCycle(a, 'D3', valueOfPin3/5);
                                        disp("Source position is:");
                                        disp("X =" + valueOfPin1*2);
                                        disp("Y =" + valueOfPin2*2);
                                        disp("Z =" + valueOfPin3*2);
                                        sourcePosition = [valueOfPin1*2 valueOfPin2*2 valueOfPin2*2];
                                        prompt = 'Continue with these parameters? yes/no \n';
                                        sourceYesorNo = input(prompt, 's');

                                            if strcmp(sourceYesorNo,'no')

                                            elseif strcmp(sourceYesorNo,'yes')
                                                   while true
                                                   writeDigitalPin(a,'D9',0);
                                                   writeDigitalPin(a,'D5',0);
                                                   writeDigitalPin(a,'D3',0);
                                                   prompt = 'Turn first potentiometer to establish reverb time and type "done" \n';
                                                    reverbTimeUserInput = input(prompt, 's');
                                                    valueOfPin1= 5-readVoltage(a,'A0');
                                                    valueOfPin2= 5-readVoltage(a,'A1');
                                                    valueOfPin3= 5-readVoltage(a,'A2');
                                                    if strcmp(reverbTimeUserInput,'done')
                                                        writePWMDutyCycle(a, 'D9', valueOfPin1/5);
                                                        reverbTime = valueOfPin1/5;
                                                        disp("The reverb time is:");
                                                        disp(reverbTime);
                                                        prompt = 'Continue with these parameters? yes/no \n';
                                                        reverbTimeYesOrNo = input(prompt, 's');
                                                        
                                                            if strcmp(reverbTimeYesOrNo, 'yes')
                                                            disp("Size of the room: " + sizeOfRoom);
                                                            disp("Receiver position: " + receiverPosition);
                                                            disp("Source position: " + sourcePosition);
                                                            disp("Reverb Time: " + reverbTime);
                                                            rirAudio = RirFunction('speech_dft_8kHz.wav', sizeOfRoom, receiverPosition, sourcePosition, reverbTime);
                                                            sound(rirAudio, 16000);
                                                            audiowrite('rirOutput.wav', rirAudio, 16000);
                                                            elseif strcmp(reverbTimeYesOrNo, 'no')

                                                            end
                                                        if ~strcmp(sourceYesorNo,'no')
                                                        break;
                                                        end
                                                    end
                                                   end
 
                                            end
                                            if ~strcmp(sourceYesorNo,'no')
                                                break;
                                            end
                                        end 
                                    end
                                end
                            end
                        end
                    end
                    if ~strcmp(receiverYesorNo,'no')
                        break;
                    end
                end
            end
        end
        if ~strcmp(sizeOfRoomYesorNo,'no')
            break;
        end    
    end
end