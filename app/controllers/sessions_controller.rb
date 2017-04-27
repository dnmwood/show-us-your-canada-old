class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    # If we can not find user via email (created through faecbook)
    if user == nil
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      if current_user.entry == nil
        redirect_to new_entry_url, notice: "Logged in"
      else
        redirect_to entry_url(current_user.entry.id), notice: "Logged in"
      end
    # If the user exists AND the password entered is correct.
    elsif  user && user.authenticate(params[:password])
    # Save the user id inside the browser cookie. This is how we keep the user
    # logged in when they navigate around our website.
      session[:user_id] = user.id
      if current_user.entry == nil
        redirect_to new_entry_url, notice: "Logged in"
      else
        redirect_to entry_url(current_user.entry.id), notice: "Logged in"
      end
    else flash.now[:alert] = "Invalid email or password"
    # If user's login doesn't work, send them back to the login form.
      render "new"
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

end
