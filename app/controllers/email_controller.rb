class EmailController < ApplicationController
  def create
    @email = Email.new(email_params)
    if @email.save
      UserNotifierMailer.send_newsletter(@email).deliver
      redirect_to root_url
      flash[:notice] = "Email succesfully sent!"
    else
      redirect_to root_url
      flash[:notice] = "Something wen't wrong"
    end
  end

  private
  def email_params
    params.require(:email).permit(:email, :opt_in)
  end
end
