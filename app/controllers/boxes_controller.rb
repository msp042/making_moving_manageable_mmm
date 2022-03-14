class BoxesController < ApplicationController
  before_action :set_box, only: %i[show edit update destroy]

  def index
    @q = Box.ransack(params[:q])
    @boxes = @q.result(distinct: true).includes(:items, :category,
                                                :user).page(params[:page]).per(10)
  end

  def show
    @item = Item.new
  end

  def new
    @box = Box.new
  end

  def edit; end

  def create
    @box = Box.new(box_params)

    if @box.save
      message = "Box was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @box, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @box.update(box_params)
      redirect_to @box, notice: "Box was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @box.destroy
    message = "Box was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to boxes_url, notice: message
    end
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box).permit(:user_id, :category_id)
  end
end
