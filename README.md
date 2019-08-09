# Heathen	
A "choose your own path" story-telling game written in Lua	

 ## About	
My program is a choose-your-own path game. This game was written in Lua using the	
SublimeText3 development environment and the Corona SDK simulator. The objective of	
my game is to escape a cave by choosing between two outcome changing options that	
pop up throughout the game. There are eleven possible routes, but there are only two	
endings; the first ending is ending in death and the second ending is surviving and escaping. The video demonstrates the main functionalities of the games, such as the hp display, the option buttons, and how the	
dialogue is played. It also briefs on the main points of the storyline and plays through one possible route	
that ends in death and half of another route that was supposed to end with exiting the cave, but the demo	
was cut short due to time limitations. The storyline of this version of my game has been modified to be less violent.

 ## Challenges	
I encountered a number of difficulties while writing my program. One was implementing the	
scene change function. In the beginning I was planning on writing all the code in just one .lua file,	
but I wanted a way to start the game from a homescreen. Initially I thought of covering the game with	
a homescreen layer and making the layer disappear once the start button was clicked, but because I	
wanted to include an instructions and credits button on the homescreen as well, I couldn’t do	
that, so I had use help from the internet (Peach Pellen) which inspired me with the idea of file	
transitioning. So, when a button on the homescreen is clicked, instead of a homescreen layer
just disappearing, the program moves to a different file and reads the code on that	
file instead.	
A second problem I encountered was created by the large amount of dialogue. Because	
there are more than 100 unique lines of dialogue, I needed a way to organize them or make them more clean	
and easy to work with. Originally, I had all of the dialogue collected in a single file, but because it was	
too long and slightly hard to organize, it was difficult to work with. I fixed this problem by separating the dialogue into	
different files, which meant each scene had its own separate file that the program would	
transition and read fromwhen necessary. This created another problem because a function created in one file	
cannot be called in another, so I had to keep creating different dialogue play functions for	
each file/scene. To fix this problem I created a “universal” function that could be used in	
each file and the only thing that needed to be changed in that function was the name of the	
dialogue list that I wanted to be played.
