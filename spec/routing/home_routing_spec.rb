require 'rails_helper'

RSpec.describe HomeController, :type => :routing do

  it { expect(:get => "/index").to route_to(:controller => "home", :action => "index") }
  it { expect(:get => "/about").to route_to(:controller => "home", :action => "about") }

end
