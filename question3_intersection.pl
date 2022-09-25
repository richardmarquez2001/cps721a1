% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Richard Marquez
%%%%% NAME: Benjamin Nguyen
%%%%% NAME: Ethan Hou
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC: clockwise
% Add the atomic propositions for clockwise (part a) in this section
clockwise(east, north). clockwise(south, east). clockwise(west, south). clockwise(north, west). 

%%%%% ATOMIC: counterclockwise
% Add the atomic propositions for counterclockwise (part a) in this section
counterclockwise(north, east). counterclockwise(east, south). counterclockwise(south, west). counterclockwise(west, north). 

%%%%% ATOMIC: reverseDirection
% Add the atomic propositions for reverseDirection (part a) in this section
reverseDirection(north, south). reverseDirection(east, west). reverseDirection(south, north). reverseDirection(west, east).

%%%%% ATOMIC: facing
% Add the atomic propositions for facing (part b) in this section
facing(toyota, south). facing(nissan, north). facing(chevrolet, east).

%%%%% ATOMIC: lightColour
% Add the atomic propositions for lightColour (part b) in this section
lightColour(north, green). lightColour(south, green). lightColour(east, red). lightColour(west, red).

%%%%% RULE: canGo
% Add the rules for canGo in this section

% Given the direction we want to go, we have to find our relative direction
% THEN, match that direction with ar ule

% A car can go straight through an intersection or turn right on a green light.
canGo(Car, Direction) :- facing(Car, Direction), lightColour(Direction, green).
canGo(Car, Direction) :- facing(Car, OriginalDirection), clockwise(Direction, OriginalDirection), lightColour(OriginalDirection, green).

% A car can turn left on a green light if there is no car that is coming in the opposite direction.
canGo(Car, Direction):- 
    facing(Car, OriginalDirection), counterclockwise(Direction, OriginalDirection), lightColour(OriginalDirection, green),
    reverseDirection(OppositeDirection, OriginalDirection), not facing(OppositeCar, OppositeDirection).

% A car can turn right on a yellow light.
canGo(Car, Direction) :- facing(Car, OriginalDirection), clockwise(Direction, OriginalDirection), lightColour(OriginalDirection, yellow).

% A car can turn left on a yellow light. Note, that we are assuming traffic coming in the opposite direction has stopped when the light is yellow.
canGo(Car, Direction):- 
    facing(Car, OriginalDirection), counterclockwise(Direction, OriginalDirection), lightColour(OriginalDirection, yellow),
    reverseDirection(OppositeDirection, OriginalDirection).

% A car can turn right on a red light, if there is no car coming in on the left that can travel straight
canGo(Car, Direction) :- 
    facing(Car, OriginalDirection), clockwise(Direction, OriginalDirection),
    lightColour(OriginalDirection, red), not canGo(OtherCar, Direction). 

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
