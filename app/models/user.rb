class User < ActiveRecord::Base
  # authenticates_with_sorcery!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  authenticates_with_sorcery!

  validates :username, :email, presence: true
  validates :email, uniqueness: true

  # FROM SORCERY
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes["crypted_password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["crypted_password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["crypted_password"] }
  
  # My Validations
  # validates :password, on: :create, presence: true, confirmation: true, length: { minimum: 6 }#, if: ->{ new_record? }
  # validates :password, on: :update, allow_blank: true, confirmation: true,  length: { minimum: 6 }#, if: ->{ changes["password"] }

  # From StackOverflow
  # validates :password, presence: true, length: { minimum: 6 }, if: :new_user?
  # validates :password, presence: true, length: { minimum: 6 }, unless: :skip_password

  has_many :pins

  has_many :comments_received, :as => :commentable, :class_name => "Comment"
  has_many :comments_made, :class_name => "Comment", :foreign_key => :commenter_id

  enum status: { archived: 0, active: 1 } 

  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#", :profile_navbar => "30x30#" }, :default_url => "missing_:style.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
