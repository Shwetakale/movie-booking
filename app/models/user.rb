# frozen_string_literal: true

# This class will perform operations related to user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = { admin: 'admin', customer: 'customer' }.freeze
  DEFAULT_ROLE = ROLES[:customer]

  validates :role, inclusion: ROLES.values

  before_validation :assign_default_role

  ROLES.values.each do |role_var|
    define_method "#{role_var}?" do
      role.eql? role_var
    end
  end

  private

  def assign_default_role
    self.role = DEFAULT_ROLE if role.blank?
  end
end
