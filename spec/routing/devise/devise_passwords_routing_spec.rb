require 'rails_helper'

RSpec.describe Devise::PasswordsController, :type => :routing do

  it { expect(:get => "/users/password/new").to route_to(:controller => "devise/passwords", :action => "new") }
  it { expect(:post => "/users/password").to route_to(:controller => "devise/passwords", :action => "create") }
  it { expect(:get => "/users/password/edit").to route_to(:controller => "devise/passwords", :action => "edit") }
  it { expect(:patch => "/users/password").to route_to(:controller => "devise/passwords", :action => "update") }

end
