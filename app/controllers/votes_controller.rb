class VotesController < ApplicationController

  before_action :load_entry


  def create
    # @vote.user = current_user
    #
    # if @vote.save
    #   redirect_to entries_path, notice: 'Vote received!'
    # else
    #   render 'entries/show'
    # end

    # @entry = Entry.find(params[:id])

    @quiz = Quiz.new
   if @entry.votes.where(voter_ip: request.remote_ip).empty?
        @vote = @entry.votes.build(vote_params)
        # @vote.entry_id = @entry.id
      if @vote.save
        VoteMailer.vote_confirmation(@vote).deliver
        redirect_to entries_path
      else
        render "entries/show"
      end
   end



    #
    # respond_to do |format|
    #   format.html
    # end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    @entries = Entry.all
    redirect_to entries_path
  end


  def confirm_email
    vote = Vote.find_by_confirm_token(params[:id])
    if vote
      vote.email_activate
      flash[:success] = "Thank You for voting!"
      VoteMailer.vote_confirmed(vote).deliver
      redirect_to root_url
    else
      flash[:error] = "Sorry. There was an error"
      redirect_to root_url
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:email, :entry_id, :voter_ip)
  end

  def load_entry
    @entry = Entry.find(params[:entry_id])
  end
end
