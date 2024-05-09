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

    #redirect_to("/photos/#{#photos.username}")
  end
end
