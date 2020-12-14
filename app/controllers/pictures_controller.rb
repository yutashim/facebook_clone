class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
  #   @blog = current_user.blogs.build(blog_params)
  #   if @blog.save
  #     redirect_to blog_path(@blog.id)
  #   else
  #     render 'new'
  #   end
  # end
  #
    @picture = current_user.pictures.build(picture_params)
    if params[:back] || @picture.invalid?
      render :new
    else
      @picture.save
      redirect_to picture_path(@picture.id)
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id)
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path

  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :sentence, :user_id)
  end
end
