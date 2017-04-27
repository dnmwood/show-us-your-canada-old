class AdminController < ApplicationController

  def new
    @admin = Admin.new
    @maximum_title_length = Entry.validators_on( :title ).first.options[:maximum]
    @maximum_story_length = Entry.validators_on( :story ).first.options[:maximum]
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.name = @admin.title
    if @admin.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def destroy
    @entries = Entry.all
  end

  def destroy_post
    @entry = Entry.find(params[:id])
    @entry.destroy
    @entries = Entry.all
    respond_to do |format|
      format.js
      format.json { render json: {:success => true, html: (render_to_string('_table.html.erb', objects: [@entries], layout: false))} }
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:name, :story, :image, :filter, :title)
  end
end
