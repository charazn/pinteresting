require "rails_helper"

RSpec.describe CommentsController, type: :routing do

  it { expect(:get => "/pins/1/comments/new").to route_to(:controller => "comments", :action => "new", :pin_id => "1") }
  it { expect(:post => "/pins/1/comments").to route_to(:controller => "comments", :action => "create", :pin_id => "1") }
  it { expect(:get => "/pins/1/comments/1/edit").to route_to(:controller => "comments", :action => "edit", :pin_id => "1", :id => "1") }
  it { expect(:patch => "/pins/1/comments/1").to route_to(:controller => "comments", :action => "update", :pin_id => "1", :id => "1") }

end
