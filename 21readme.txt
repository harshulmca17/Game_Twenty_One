Name-MOHIT ARORA
ROLL NO-22
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

							GAME OF TWENTY ONE

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ASSUMPTIONS
1.ace is considered to have rank 1
2.face cards -jack,king,queen are considered to have rank 10,11,12 respectively.

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

VARIABLES

PlayingCard		matrix of order 52*2 whrere each  row has two entries i.e rank and suit.

index			integer value which points to the top card in the deck.

temp			variable which stores the temporary score.

temp1			temporary variable which is used during swapping in SHUFFLE function.

temp2			another temporary variable which is used during swapping in SHUFFLE function.

current_card		it stores the information(i.e rank and suit) about the current card drawn from the shuffled deck.

rank			it stores the rank part of current drawn card(i.e current_card).

suit			it stores the suit part of current drawn card(i.e current_card).

total_score		it stores the total score of the user or computer uptil the current drawn card.

total_score_system		it stores the total score of computer.

total_score_user		it stores the total score of user.

continue			it stores the status of the user i.e whether user wants to draw more cards(i.e HIT) or does not want to draw( i.e to STAY)

again			it stores whether user wants to play more or not( i.e Y or N)

remaining			it stores the remaining score needed by the user to win the game.

favourable_outcomes	it stores the favourable number of cases to reach to the total of 21 from the current score.

total_outcomes		it stores the number of total cases available(which is equal to total remaining cards)

FUNCTIONS
INIT()-			this function initializes matrix PlayingCard (i.e of order 52 *2)  with all the cards where each row has two entries i.e rank and suit.

SHUFFLE()		this function shuffles all the 52 cards where each row (starting from index 1 to index 51) is swapped with another row.
			for i <-- 0 to 50
				pick a random integer j between i and 51
				swap card i with card j
			end for

DEAl()			this function returns the top card and sets the top card index to the next card.

.DRAW()			this function draws a card from the shuffled deck, displays rank and suit of the drawn card and further displays the updated score.

CUM_FREQUENCY()		this function calculates cumulative frequency of all the possible scores.for example- if the user's current score is 16 then this means user requires 5 more score to win, which can further be achieved by drawing cards  in next trial in following ways:
			1. card with rank 5
			2. card with rank 4, then with rank 1
			3.card with rank 3 then (2 or 1 then again 1)
			and there are many such cases.....
			Basically,cumulative frequency is calculated to display probability.

TwentyOne()		this function acts as a main method that creates the deck of cards and then allows the user to play the Game of 21.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

INUILT FUNCTIONS
round(x,y)			where x is the floating point number,y is the number of digits after decimal point.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Concept of probability
for example-
if the user gets total of 15 in first two chances,then the remaining score  21-15=6 is required to win the game,user can win the game by drawing card of rank 6,or by drawing any card from rank 1 to 5 which will further lead the user to reach nearer to the score 21 in next trial.
so to calculate probability we will calculate favourable outcomes and total outcomes.

favourable outcomes-number of cards having rank greater equal to 1  to cards having rank less than equal to 6  
total outcomes-total number of cards remaining in the deck
probability=favourable outcomes/total outcomes