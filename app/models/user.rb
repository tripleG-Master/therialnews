class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  before_create :set_default_role

  
  has_many :posts, dependent: :destroy  
  has_many :comments, dependent: :destroy
  belongs_to :role, optional: true

  validates :email, presence: true
  validates :password, presence: true
  validates :role_id, presence: true

  private

  def set_default_role
    self.role ||= Role.find_by(role: 'subscriber').id if self.role.nil?
  end  


end
