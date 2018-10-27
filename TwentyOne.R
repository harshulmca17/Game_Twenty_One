									#MCA 103 Assignment 2
									#submitted by-
											#Name-MOHIT ARORA
											#Roll no-22
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

INIT<-function()    #initializing matrix
{
	ranks<-c(1:13)		
	combine_ranks_spade<-cbind(ranks,'spade')   
	combine_ranks_clover<-cbind(ranks,'club')
	combine_ranks_diamond<-cbind(ranks,'diamond')
	combine_ranks_heart<-cbind(ranks,'heart')
	PlayingCard<<-rbind(combine_ranks_spade,combine_ranks_clover,combine_ranks_diamond,combine_ranks_heart)

}
#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

SHUFFLE<-function()	#shuffling deck of 52 cards
	{
		for(i in 1:51)
		{
			j<-sample((i+1):52,1)
			
			temp1<-PlayingCard[i,1]		#swapping values of i and j
			temp2<-PlayingCard[i,2]
			
			PlayingCard[i,1]<<-PlayingCard[j,1]
			PlayingCard[i,2]<<-PlayingCard[j,2]
			PlayingCard[j,1]<<-temp1
			PlayingCard[j,2]<<-temp2


		}
	
	}
#////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DEAL<-function()							#returns the current card of the deck
{
	current_card<-cbind(PlayingCard[index,1],PlayingCard[index,2])
	index<<-index+1							#incrementing index 
	return (current_card)
}

#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
CUM_FREQUENCY<-function()
{
	
	freq<<-matrix(0,nrow=11)
	cum_freq<<-matrix(0,nrow=10)		#creating matrix and initializing it with 0
	for(i in index:52)
	{
		rank<-as.numeric(PlayingCard[i,1])
		if(rank==11|rank==12|rank==13)
		{							
			freq[10]<<-freq[10]+1
		}
		else
		{
			freq[rank]<<-freq[rank]+1
		}
		
	}
	cum_freq[1]<<-freq[1]
	for(i in 2:10)
	{
		cum_freq[i]<<-freq[i]+cum_freq[i-1]		#calculating cumulative frequency of each possible score
	}
	
}

#/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

DRAW<-function(total_score)			
{
	

		current_card<-DEAL()		#drawing a card and incrementing the index
		rank<-as.numeric(current_card[1,1])		#converting string representation of rank into integer representation
		suit<-current_card[1,2]
		if(rank==1)
		{
			cat('ACE of',suit,'\t')
			
		}
		else if(rank==11)
		{
			cat('Jack of',suit,'\t')
			
		}
		else if(rank==12)
		{
			cat('King of',suit,'\t')
			
		}
		else if(rank==13)
		{
			cat('Queen of',suit,'\t')
			
		}
		else
		{
			cat(rank,'of',suit,'\t')
			
		}
		
		#updating the score according to the rank of the card
		if(rank==1)
		{
			temp<-total_score+11
			if(temp>21)
			{
				total_score<-total_score+1
			}
			else
			{
				total_score<-temp
			}
			cat(total_score)
		}
		
		else if(rank==11|rank==12|rank==13)
		{
			total_score<-total_score+10
			cat(total_score)
		}
		else
		{
			total_score<-total_score+rank
			cat(total_score)
		}
	
		return (total_score)		#returning the updated score
}

#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
TwentyOne<-function()
{
	INIT()		#calling function INIT
	repeat
	{	
		index<<-1
		SHUFFLE()	#shuffling the deck of 52 cards
		score<-0	#initializing score with value 0
		cat('LETS PLAY 21!\n')
		cat('SHUFFLING CARDS\n')
		cat('\n')
		cat('YOUR TURN\n')
		score<-DRAW(score)	#drawing a card from the shuffled deck and returning the score
		repeat
		{
			cat('\n')
			total_score_user<-DRAW(score)		#drawing another card from the shuffled deck and increasing the score

			cat('\n')
			if(total_score_user<21)
			{
				CUM_FREQUENCY()
				remaining<-21-total_score_user
				total_outcomes<-52-index+1
				cat('\nProbaility of getting total score closure to 21: ')
				if(remaining>=11)
				{
					fav_outcomes<-cum_freq[10]			#calculating proability of reaching the score nearer to 21
				}
				else
				{
					fav_outcomes<-cum_freq[remaining]
				}    
				cat(round(fav_outcomes/total_outcomes,6))			#displaying the probaility
				cat('\n')
				continue<-readline('HIT or STAY?')
				if(continue=='STAY')
				{
						break
				}
			}
			else
			{
				break
			}
			score<-total_score_user
			
			
		}
		if(total_score_user>21)
		{
			cat("YOUR SCORE\t",total_score_user)
			cat("\nYOU LOSE!\n\n")
		}
		else
		{
			cat("COMPUTER TURN\n")
			score<-0				#initializing computer's with value 0
			
			repeat
			{
				total_score_system<-DRAW(score)		#drawing a card from the shuffled deck and returning the score
				cat('\n')
				if(total_score_system>=17)
				{
						break
				}
				score<-total_score_system
			}
			
			cat('\nYOUR SCORE\t',total_score_user,'\n')
			cat('COMPUTER SCORE\t',total_score_system,'\n')	

			if(total_score_system>=total_score_user & total_score_system<=21)
			{
				cat('YOU LOSE!\n')
			}
			else
			{
				cat('YOU WIN!\n')
			}

		}
			again<-readline('PLAY AGAIN?(Y/N)')
			if(again=='N')
			{
				break
			}
   		
	}	
}
TwentyOne()
