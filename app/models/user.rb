class User < ActiveRecord::Base
  # authenticates_with_sorcery!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  authenticates_with_sorcery!

  has_many :pins

  validates :username, presence: true
  validates :email, uniqueness: true

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  has_many :comments_received, :as => :commentable, :class_name => "Comment"
  has_many :comments_made, :class_name => "Comment", :foreign_key => :commenter_id

end
