class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render ({ :template => "user_templates/index"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where(:username => url_username)
    @the_user = matching_usernames.at(0)
    render ({ :template => "user_templates/show"})
  end

  def create
    @new_user = User.new
    @new_user.username = params.fetch("input_username")
    @new_user.save

    redirect_to("/users/#{@new_user.username}")
  end

  def update
    the_new_user_url = params.fetch("path_id")
    matching_user = User.where({:username => the_new_user_url})
    @the_user = matching_user.at(0)
    @the_user.username = params.fetch("input_username")
    
    @the_user.save
    redirect_to("/users/#{@the_user.username}")
  end
end
