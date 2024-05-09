Rails.application.routes.draw do

  #users
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" } )

  # photos
  #get("/users", {})
end
