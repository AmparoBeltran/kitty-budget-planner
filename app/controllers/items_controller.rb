class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.ordered
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      respond_to do |format|
        format.html {redirect_to items_path, notice: "Item was successfully created."}
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_path, notice: "Item was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :frequency)
  end
end