require 'rails_helper'

RSpec.describe Devise::PasswordsController, :type => :routing do

  it { expect(:get => "/users/cancel").to route_to(:controller => "devise/registrations", :action => "cancel") }
  it { expect(:post => "/users").to route_to(:controller => "devise/registrations", :action => "create") }
  it { expect(:get => "/users/sign_up").to route_to(:controller => "devise/registrations", :action => "new") }
  it { expect(:get => "/users/edit").to route_to(:controller => "devise/registrations", :action => "edit") }
  it { expect(:patch => "/users").to route_to(:controller => "devise/registrations", :action => "update") }
  it { expect(:delete => "/users").to route_to(:controller => "devise/registrations", :action => "destroy") }

end
