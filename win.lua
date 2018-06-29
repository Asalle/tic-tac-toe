win = {}

function win.enter(winner)
	STATE = STATE_WIN
	winner_name = (winner == 2) and 'crosses' or 'rounds'
	print(winner_name, 'won, you bastard!')
end