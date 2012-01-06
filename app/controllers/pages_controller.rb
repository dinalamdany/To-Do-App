class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @new_list = List.new
      @lists = current_user.lists
      @feed_items = current_user.feed
    end
  end
end
