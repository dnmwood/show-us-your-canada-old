class QuizMailer < ApplicationMailer

  default :from => "admin@shareyourcanada150.com"

  def quiz_confirmation(quiz)
     @quiz = quiz
     @entry = @quiz.entry
     mail(:to => "#{@quiz.email} <#{@quiz.email}>", :subject => "Vote Confirmation")
  end


end
