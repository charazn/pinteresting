class Pin < ActiveRecord::Base

  validates :description, presence: true
  validates :image, :attachment_presence => true
  
  belongs_to :user

  has_attached_file :image, :styles => { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing_:style.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  paginates_per 12

end
