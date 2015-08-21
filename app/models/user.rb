class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  has_many :pins

  validates :username, presence: true

  has_many :comments_received, :as => :commentable, :class_name => "Comment"
  has_many :comments_made, :class_name => "Comment", :foreign_key => :commenter_id

end
