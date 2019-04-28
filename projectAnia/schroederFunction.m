function [schroeder1] = schroederFunction(userInput)

sys = 0;
d = [1553; 1613; 1493; 1153; 223; 443];
a = [0.85 ; 0.85; 0.75; 0.75; 0.7; 0.7];
b = [0.3 ; 0.25; 0.25; 0.2];

for i=1:length(d)
    if i<=4
        num = b(i)*userInput;
        den = [1 ; zeros(int16(d(i)*userInput),1); int16(-a(i)*userInput)]';
        sys = sys + tf(num, den);
    else 
        num = [int16(-a(i)*userInput); zeros(int16(d(i)*userInput),1);1]';
        den = [1 ; zeros(int16(d(i)*userInput),1); int16(-a(i)*userInput)]';
        sys = sys*tf(num, den);
    end
end

schroeder1 = tfdata(sys, 'v');
end

