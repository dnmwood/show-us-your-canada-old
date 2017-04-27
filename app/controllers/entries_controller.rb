class EntriesController < ApplicationController

  before_action :ensure_logged_in, :except => [:index, :show]

  def index
    @entries = Entry.all
    if params[:search]
      @entries = Entry.search(params[:search]).order("created_at DESC")
    else
      @entries = Entry.all.order('created_at DESC')
    end

    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: @entries
      end
    end

  end

  def new
    @entry = Entry.new(:user_id => params[:user])
    @user = current_user
    @maximum_title_length = Entry.validators_on( :title ).first.options[:maximum]
    @maximum_story_length = Entry.validators_on( :story ).first.options[:maximum]
    @minimum_story_length = Entry.validators_on( :story ).first.options[:minimum]
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id
    @entry.name = current_user.name

    if @entry.save
      redirect_to user_url(current_user)
    else
      render "new"
    end

  end

  def show
    @entry = Entry.find(params[:id])
    @email = Email.new
    @user = User.new

    # if current_user
      @vote = @entry.votes.build
    # end
    @quiz = Quiz.new
    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: @entry
      end
    end

  end

  def edit
    @entry = Entry.find(params[:id])
    @user = current_user
    @maximum_title_length = Entry.validators_on( :title ).first.options[:maximum]
    @maximum_story_length = Entry.validators_on( :story ).first.options[:maximum]

    respond_to do |format|
      format.html
      format.js
      format.json do
        render json: @entry
      end
    end
  end

  def update
    @entry = Entry.find(params[:id])
    @user = current_user

    @entry.assign_attributes(entry_params)
      if @entry.avatar_changed?
        @entry.filter = nil
        @entry.filter_no_hashtag = nil
      end
      if @entry.save
        redirect_to user_path(current_user)
      else
        render 'edit'
      end



  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    @user = current_user
    redirect_to root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :story, :user_id, :avatar, :filter, :title, :filter_no_hashtag)
  end


end
