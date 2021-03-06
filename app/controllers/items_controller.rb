class ItemsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    # @items = Item.all

    if params[:search_by_name] && params[:search_by_name] != ""
      @items = @items.where("name ILIKE ?", "%#{params[:search_by_name]}%")
    end
 
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    # @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    # @item = Item.new(item_params)
    # @item = current_user.items.build(item_params)
    respond_to do |format|
    # @item.user_id = current_user.id
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      # @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :in_stock, :price, :description, :picture)
    end
end


# private 

#   def check_user
    # use the params to find out who the resource belongs to
    # check if the current user matches the owner of the resource
    # if match, allow them to do whatever they want...
    # if not, redirect them somewhere else or flash error message
    # set up before_action hook for necessary actions
# end
