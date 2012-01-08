class ItemsController <ApplicationController
  before_filter :authenticate

  def create
    @list = List.find(params[:item][:list_id])
    @new_item = @list.items.build(params[:item])
    if @new_item.save
      flash[:success] = "Item saved!"
      redirect_to list_path(@list)
    else
    redirect_to root_path
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to :back
  end
end
