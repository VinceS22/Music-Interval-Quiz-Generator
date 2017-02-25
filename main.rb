# I'm completely new to ruby and this is my first little learning experience. Be gentle!
class QuizGenerator
	@@naturalNotes = ["A","B","C","D","E","F","G"]
	@@noteSuffixes = ["#", "b", ""]

	def self.GenerateQuiz (amountOfQuestionsParam=-1, includeIntervals=true)

		amountOfQuestions = amountOfQuestionsParam
		if amountOfQuestions == -1
			puts "HEYA"
			puts amountOfQuestions.is_a? Numeric
			puts amountOfQuestions
			while !amountOfQuestions.is_a? Numeric || amountOfQuestions == -1
				puts "Please enter in the amount of questions that you desire"
				amountOfQuestions = gets.chomp 
			end
		end
		
		currentQuestionNumber = 1
		until currentQuestionNumber > amountOfQuestions
			firstNote = GenerateRandomNote
			puts currentQuestionNumber.to_s + ") What interval is " + firstNote + " up to " 
			if @@noteSuffixes.include?(firstNote[-1,1])
				puts GenerateRandomNote(firstNote[-1,1]) + "?"
			end
		end

	end

	def self.GenerateRandomNote (preferredSuffix="")
		
		selectedNote = @@naturalNotes[rand(@@naturalNotes.length)]
		eligibleSuffixes = @@noteSuffixes
		if selectedNote == "B" || selectedNote == "E" || preferredSuffix == "b"
			eligibleSuffixes = eligibleSuffixes - ["#"]
		elsif selectedNote == "C" || selectedNote == "F" || preferredSuffix == "#"
			eligibleSuffixes = eligibleSuffixes - ["b"]
		end
		return selectedNote + " " + noteSuffixes[rand(noteSuffixes.length)]
	end
end

QuizGenerator.GenerateQuiz()