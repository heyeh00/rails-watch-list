class ListsController < ApplicationController
  before_action :set_list, only: %i[destroy edit update show]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @list = List.update(list_params)
    if @list
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :image)
  end
end
