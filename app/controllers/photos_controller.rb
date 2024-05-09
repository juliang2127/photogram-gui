class PhotosController < ApplicationController

  def index
    @all_photos = Photo.all
    render ({ :template => "photo_templates/index"})
  end

  def show
    post_id = params.fetch("photo_id")
    @photo_details = Photo.where( :id => post_id).at(0)
    render ({ :template => "photo_templates/show"})
  end

  def create
    @new_photo_info = Photo.new
    @new_photo_info.image = params.fetch("input_image")
    @new_photo_info.caption = params.fetch("input_caption")
    @new_photo_info.owner_id = params.fetch("input_owner_id")
    @new_photo_info.save

    redirect_to("/photos/#{@new_photo_info.id}")
  end

  def update
    the_id = params.fetch("path_id")
    @updated_post = Photo.where( :id => the_id).at(0)
    @updated_post.image = params.fetch("input_image")
    @updated_post.caption = params.fetch("input_caption")
    @updated_post.save
    redirect_to("/photos/#{@updated_post.id}")
  end

  def destroy
    the_id = params.fetch("path_id")
    @post = Photo.where({ :id => the_id }).at(0)

    @post.destroy
    redirect_to("/photos")
  end
  
  def add_comment
    @new_comment = Comment.new
    @new_comment.photo_id = params.fetch("input_photo_id")
    @new_comment.author_id = params.fetch("input_author_id")
    @new_comment.body = params.fetch("input_comment")
    @new_comment.save
    redirect_to("/photos/#{@new_comment.photo_id}")
  end
end
