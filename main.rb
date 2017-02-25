# I'm completely new to ruby, be gentle!
class QuizGenerator
	@@naturalNotes = ["A","B","C","D","E","F","G"]
	@@noteSuffixes = ["#", "b", ""]

	def self.GenerateQuiz (amountOfQuestionsParam=-1, includeIntervals=true)

		amountOfQuestions = amountOfQuestionsParam
		if amountOfQuestions == -1
			while amountOfQuestions == -1
				puts "Please enter in the amount of questions that you desire"
				amountOfQuestions = Integer(gets) rescue -1 
			end
		end
		
		(1..amountOfQuestions).each do |currentQuestionNumber|
			firstNote = GenerateRandomNote()
			print currentQuestionNumber.to_s + ") What interval is " + firstNote + " up to " 
			preferredSuffix = ""
			if @@noteSuffixes.include?(firstNote[-1,1])
				preferredSuffix = firstNote[-1,1]
			end

			puts GenerateRandomNote(preferredSuffix) + "?"
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
		return selectedNote + @@noteSuffixes[rand(@@noteSuffixes.length)]
	end
end

QuizGenerator.GenerateQuiz()