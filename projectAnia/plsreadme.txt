The program is a bit messy, and I am so sorry, but I thought i will clear it a bit after I make sure that everything works, so dont care too much about the commented lines

About room class:
we need this class so we can change audio using the rir.m function (the one from the internet)
I tried to explain the most important lines of the code inside the program but here i want to explain a bit more about figures
First of all, we use 'figure()' to seperate figures from each other, pretty helpful for us
In our AP course we use mostly 4 plots:
plot() which just plot signal, audio or filter, but it seems like it is not really helpful
freqz() which plot 2 figures, pretty nice and recommended by Mathew, we used them to check for example if comb and allpass filter works properly
spectogram() the one that i dont understand so much, but it seems like we need to use it (both Mathew and Jesper recommend it soooo)
impz() - impulse response but dont focus too much on it, we might need it later that's why i sometimes keep it ;) 

In room.m class, we should use freqz and spectogram, because it might help us to see if the filter works properly, also that is sth that we can visualize in the report and it was recommended:)
So basically what i wanted to achieve is to compare the plot of input and output audio so we can see that it works
and that is also what i sent to Mathew. I plot figures that contained frezq and spectogram of input and output audio
I just wanted his opinion if that seems okay to him and if he thinks that it works properly (because, well, the only person that can confirm it is AP teacher)
And it seems like he didnt understand it (???), so pls, push him a bit so he can say if we can use it because it looks like it works, and if not, then what we should do.
we need to put this in the report anyway, so it is better to MAKE HIM give feedback to us now than during the exam


Schroeder 
That is basically the same thing with Schroeder reverb. When we plot the filter it seems like it is mirrored
AND I JUST REALLY WANT HIS FEEDBACK THAT IT IS FINE AND IT IS HOW IT SHOULD BE
I couldnt find it anywhere in the internet, and we also need sth to confirm the fact that this reverb works. 
If he is not happy with the result, then what should we do to confirm this in the report beside that 'we can hear that it works'?

This class is just mix of comb filters (from 1-4) and allpass filter(5-6). The values for a, b and d are just the suggested values from the book

Sorry if some of this staff doesnt make sense, there are grammar mistakes or anything like this but it is almost midnight and i just want to sleep <3