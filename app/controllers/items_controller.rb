class ItemsController < ApplicationController
  def index
    @items = Item.ordered
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to items_path, notice: "Item was successfully created." }
        format.turbo_stream
      end
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      respond_to do |format|
        format.html { redirect_to items_path, notice: "Item was successfully updated." }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path, notice: "Item was successfully deleted." }
      format.turbo_stream
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :frequency)
  end
end
