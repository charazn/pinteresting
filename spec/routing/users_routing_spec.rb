require "rails_helper"

RSpec.describe UsersController, type: :routing do

  it { expect(:get => "/users/new").to route_to(:controller => "users", :action => "new") }
  it { expect(:get => "/users/1").to route_to(:controller => "users", :action => "show", :id => "1") }
  it { expect(:post => "/users").to route_to(:controller => "users", :action => "create") }
  it { expect(:get => "/users/1/edit").to route_to(:controller => "users", :action => "edit", :id => "1") }
  it { expect(:patch => "/users/1").to route_to(:controller => "users", :action => "update", :id => "1") }
  it { expect(:delete => "/users/1").to route_to(:controller => "users", :action => "destroy", :id => "1") }

end
