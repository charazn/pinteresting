require "rails_helper"

RSpec.describe UserSessionsController, type: :routing do

  it { expect(:get => "/login").to route_to(:controller => "user_sessions", :action => "new") }
  it { expect(:post => "/user_sessions").to route_to(:controller => "user_sessions", :action => "create") }
  it { expect(:post => "/logout").to route_to(:controller => "user_sessions", :action => "destroy") }

end
