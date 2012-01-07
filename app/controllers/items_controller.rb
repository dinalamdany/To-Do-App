class ItemsController <ApplicationController
  before_filter :authenticate

  def create
    @list = current_user.lists.find_by_id(57)
    @new_item = @list.items.build(params[:item])
    if @new_item.save
      flash[:success] = "Item saved!"
    end
    redirect_to root_path
  end

  def destroy
  end
end
