class VoteMailer < ActionMailer::Base
    default :from => "admin@shareyourcanada150.com"

  def vote_confirmation(vote)
     @vote = vote
     @entry = @vote.entry
     mail(:to => "#{@vote.email} <#{@vote.email}>", :subject => "Vote Confirmation")
  end

  def vote_confirmed(vote)
    @vote = vote
    mail(:to => ENV['email_address'], :subject => "Vote Confirmed")
  end

end
