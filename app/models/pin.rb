class Pin < ActiveRecord::Base
  acts_as_votable

  validates :caption, presence: true
  validates :image, :attachment_presence => true
  has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing_:style.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  belongs_to :user
  
  has_many :comments, :as => :commentable
 
  enum status: { archived: 0, active: 1 } 

  paginates_per 20

end
