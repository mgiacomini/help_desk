class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets
  has_many :posts

  belongs_to :department

  def you
  	"#{name} (#{email})"
  end

  def admin?
    role == 'admin'
  end
end
