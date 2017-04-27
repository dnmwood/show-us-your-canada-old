class QuizController < ApplicationController

  before_action :load_entry

  def create
    if @entry.quizzes.where(quiz_ip: request.remote_ip).empty?
      @quiz = @entry.quizzes.build(quiz_params)
      if @quiz.save
        QuizMailer.quiz_confirmation(@quiz).deliver
        redirect_to entries_path
      else
        render "entries/show"
      end
    end
  end

  def confirm_email
    quiz = Quiz.find_by_confirm_token(params[:id])
    if quiz
      quiz.email_activate
      flash[:success] = "Thank you for taking the quiz!"
      redirect_to root_url
    else
      flash[:error] = "Sorry. There was an error"
      redirect_to root_url
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    @entries = Entry.all
    redirect_to entries_path
  end

  private
  def quiz_params
    params.require(:quiz).permit(:email, :entry_id, :voter_ip)
  end

  def load_entry
    @entry = Entry.find(params[:entry_id])
  end

end
