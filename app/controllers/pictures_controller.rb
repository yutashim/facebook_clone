class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params.require(:picture).permit(:image, :sentence, :user_id))
    @picture.save
    redirect_to picture_path(@picture.id)
  end

  def edit
  end

  def index
    @picture = Picture.last
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
