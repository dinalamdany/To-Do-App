class ListsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy

  def create
    @list = current_user.lists.build(params[:list])
    if @list.save
      flash[:success] = "List created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @list.destroy
    redirect_back_or root_path
  end

  def show
    @list = current_user.lists.find_by_id(params[:id])
    @items = @list.items
    @title = @list.name
  end

  private

  def authorized_user
    @list = current_user.lists.find_by_id(params[:id])
    redirect_to root_path if @list.nil?
  end
end
