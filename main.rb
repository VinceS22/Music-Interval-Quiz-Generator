require 'pry'
# I'm completely new to ruby, be gentle!
class QuizGenerator
  @@naturalNotes = ["A","B","C","D","E","F","G"]
  @@noteSuffixes = ["#", "b", ""]

  def self.GenerateQuiz (amountOfQuestionsParam=-1, answerSpaceLines=-1, includeIntervals=true, preventDuplicates=true)
    
    questionsHash = Hash[@@naturalNotes.product(@@noteSuffixes).map {|note| [note.join(""), []]}]
    # Removing the irrelevant notes
    questionsHash.delete("Cb")
    questionsHash.delete("B#")
    questionsHash.delete("E#")
    questionsHash.delete("Fb")

    amountOfQuestions = amountOfQuestionsParam
    while amountOfQuestions == -1
      puts "Please enter in the amount of questions that you desire:"
      amountOfQuestions = Integer(gets) rescue -1 
    end

    while answerSpaceLines == -1
      puts "Enter a number for the amount of lines you want for answer space, if you don't want any, select 0:"
      answerSpaceLines = Integer(gets) rescue -1 
    end

    (1..amountOfQuestions).each do |currentQuestionNumber|
      firstNote = GenerateRandomNote()
      
      # We don't want to mix flats and sharps, so we need to get the preferred suffix
      preferredSuffix = ""
      if @@noteSuffixes.include?(firstNote[-1,1])
        preferredSuffix = firstNote[-1,1]
      end

      secondNote = GenerateRandomNote(preferredSuffix)

      # We don't want duplicate questions, so retry.
      if preventDuplicates && questionsHash[firstNote].include?(secondNote)
        redo
      end

      questionsHash[firstNote].push(secondNote)

      PrintQuestion(currentQuestionNumber, firstNote, secondNote, answerSpaceLines)

    end

  end

  def self.GenerateRandomNote (preferredSuffix="")
    
    selectedNote = @@naturalNotes[rand(@@naturalNotes.length)]
    eligibleSuffixes = @@noteSuffixes

    if selectedNote == "B" || selectedNote == "E" || preferredSuffix == "b"
      eligibleSuffixes = ["b", ""]
    elsif selectedNote == "C" || selectedNote == "F" || preferredSuffix == "#"
      eligibleSuffixes = ["#", ""]
    end

    return selectedNote + eligibleSuffixes[rand(eligibleSuffixes.length)]
  end

  def self.PrintQuestion (currentQuestionNumber, note1, note2, answerSpaceLines)
    puts currentQuestionNumber.to_s + ") What interval is " + note1 + " up to " + note2 + "?"

    (1..answerSpaceLines).each do |x|
      puts ""
    end
  end
end

QuizGenerator.GenerateQuiz()