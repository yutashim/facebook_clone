class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if params[:back] || @picture.invalid?
      render :new
    else
      @picture.save
      redirect_to picture_path(@picture.id)
    end
  end

  def edit
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :sentence, :user_id)
  end
end
