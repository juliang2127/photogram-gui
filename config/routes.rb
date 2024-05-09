Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  #users
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" } )
  post("/add_user", { :controller => "users", :action => "create" }) 
  post("/update_user/:path_id", { :controller => "users", :action => "update" }) 

  # photos
  #get("/users", {})
end
