class UserNotifierMailer < ApplicationMailer
  default :from => 'admin@shareyourcanada150.com'

  def send_newsletter(emails)
    @email = emails
    mail( :to => ENV['email_address'] , :subject => 'News Letter SignUp')
  end

  def send_usernew(user)
    @user = user
    mail(:to => ENV['email_address'], :subject => "Account Created")
  end
end
