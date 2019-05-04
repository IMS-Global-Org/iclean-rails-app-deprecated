# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # List of user roles to be used for granting access to different aspects
  # of the rails ecosyste through the `AccessGranted` system
  enum role: {
    super: 0,
    admin: 5,
    employer: 10,
    employee: 15,
    member: 20,
    guest: 25,
    visitor: 30
  }, _prefix: :is

  # Set the User's default role before saving a new record (aka. registered user)
  before_create do
    self.role = User.roles[:visitor]
  end
end
