class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @list = List.new
      @feed_items = current_user.feed
    end
  end
end
