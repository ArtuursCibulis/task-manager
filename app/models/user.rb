class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assigner_id

  validates_uniqueness_of :email
  validates_presence_of :email
end
