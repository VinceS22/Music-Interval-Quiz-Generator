class QuizGenerator
  def self.generate_quiz (amount_of_q=-1, answer_space_lines=-1, prevent_duplicates=true)
    natural_notes = %w(A B C D E F G)
    note_suffixes = ['#', 'b', '']
    questions_hash = Hash[natural_notes.product(note_suffixes).map {|note| [note.join(''), []]}]
    # Removing the irrelevant notes
    questions_hash.delete('Cb')
    questions_hash.delete('B#')
    questions_hash.delete('E#')
    questions_hash.delete('Fb')
    # Creating file / Replacing the one existing.
    File.open('Quiz.txt','w')
    amount_of_questions = amount_of_q

    while amount_of_questions == -1
      puts 'Please enter in the amount of questions that you desire:'
      amount_of_questions = Integer(gets) rescue -1
    end

    while answer_space_lines == -1
      puts "Enter a number for the amount of lines you want for answer space, if you don't want any, select 0:"
      answer_space_lines = Integer(gets) rescue -1
    end

    (1..amount_of_questions).each do |currentQuestionNumber|
      first_note = generate_random_note

      # We don't want to mix flats and sharps, so we need to get the preferred suffix
      preferred_suffix = ''
      if note_suffixes.include?(first_note[-1,1])
        preferred_suffix = first_note[-1,1]
      end

      second_note = generate_random_note(preferred_suffix)

      # We don't want duplicate questions, so retry.
      if prevent_duplicates
        if questions_hash[first_note].include?(second_note)
          redo
        else
          questions_hash[first_note].push(second_note)
        end
      end

      print_question(currentQuestionNumber, first_note, second_note, answer_space_lines)
    end

  end

  def self.generate_random_note (preferred_suffix='')

    natural_notes = %w(A B C D E F G)
    note_suffixes = ['#', 'b', '']
    selected_note = natural_notes[rand(natural_notes.length)]
    eligible_suffixes = note_suffixes

    if selected_note == 'B' || selected_note == 'E' || preferred_suffix == 'b'
      eligible_suffixes = ['b', '']
    elsif selected_note == 'C' || selected_note == 'F' || preferred_suffix == '#'
      eligible_suffixes = ['#', '']
    end

    selected_note + eligible_suffixes[rand(eligible_suffixes.length)]
  end

  def self.print_question (current_question_num, note1, note2, answer_space_lines)
    File.open('Quiz.txt','a') do |file|
      file.puts(current_question_num.to_s + ') What interval is ' + note1 + ' up to ' + note2 + '?')
      (1..answer_space_lines).each do
        file.puts ''
      end
    end
  end
end

QuizGenerator.generate_quiz(30, 3, true)