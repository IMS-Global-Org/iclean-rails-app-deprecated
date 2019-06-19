# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#  nickname               :string
#  image                  :string
#  email                  :string
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  role                   :integer
#


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

  # Associations
  has_many :addresses, as: :addressable
  has_one :demographic, dependent: :destroy
  has_many :answers, dependent: :destroy
end
