# I'm completely new to ruby and this is my first little learning experience. Be gentle!
NaturalNotes = ["A","B","C","D","E","F","G"]
NoteSuffix = ["#", "b", ""]
def GenerateQuiz (amountOfQuestionsParam=-1, includeIntervals=true)
	amountOfQuestions = amountOfQuestionsParam
	if amountOfQuestions == -1
		while !amountOfQuestions.is_a? Numeric || amountOfQuestions == -1
			puts "Please enter in the amount of questions that you desire"
			amountOfQuestions = gets.chomp 
		end
	end
	
	currentQuestionNumber = 1
	until amountOfQuestionsLeft > amountOfQuestions

	end

end

def GenerateRandomNote
	return NaturalNotes[rand(NaturalNotes.length)] + NoteSuffix[rand(NoteSuffix.length)] # TODO: Find a good way to weed out the unnecessary notes (E# / Fb / B# / Cb)
end