class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @new_list = List.new
      @lists = current_user.lists
    end
  end
end
