class UsersController < ApplicationController

  before_filter :authorize, :only => [:show, :update, :destroy, :edit]

  def index
    @users = User.all
  end

  def home
    @user = User.new
    @email = Email.new
    @admin = Admin.all
    @entries = Entry.all
  end

  def about
    @email = Email.new
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to new_entry_url
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: @user
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    # TODO: clean this entire section up
    @user = current_user
    @entry = Entry.new(user_params["entry"])
    if @entry.location == "Another Spot in the Great Canadian Wilderness" || @entry.location == "Please Select Where Your Memory is From"
      @entry.location = nil
    end
    @entry.user_id = current_user.id
    if @user.update_attributes(only_user_params)
      @entry.name = current_user.name
      UserNotifierMailer.send_usernew(@user).deliver
      if @entry.save
        redirect_to user_url(current_user)
      else
        redirect_to new_entry_url
      end
    else
      redirect_to new_entry_url
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :postal_code, entry: [:avatar, :title, :story, :location])
  end

  def only_user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :postal_code, :country, :state, :city, :street, :terms_conditions)
  end

end
