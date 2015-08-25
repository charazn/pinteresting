require "rails_helper"

RSpec.describe PinsController, type: :routing do

  it { expect(:get => "/pins").to route_to(:controller => "pins", :action => "index") }
  it { expect(:get => "/pins/1").to route_to(:controller => "pins", :action => "show", :id => "1") }
  it { expect(:get => "/pins/new").to route_to(:controller => "pins", :action => "new") }
  it { expect(:post => "/pins").to route_to(:controller => "pins", :action => "create") }
  it { expect(:get => "/pins/1/edit").to route_to(:controller => "pins", :action => "edit", :id => "1") }
  it { expect(:patch => "/pins/1").to route_to(:controller => "pins", :action => "update", :id => "1") }
  it { expect(:put => "/pins/1/delete").to route_to(:controller => "pins", :action => "archive", :id => "1") }

end
