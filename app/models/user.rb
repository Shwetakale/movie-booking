# frozen_string_literal: true

# This class will perform operations related to user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = { admin: 'admin', customer: 'customer' }.freeze

  after_validation :assign_role

  def admin?
    role.eql? ROLES[:admin]
  end

  def customer?
    role.eql? ROLES[:customer]
  end

  private

  def assign_role
    self.role = ROLES[:customer] if role.blank?
  end
end
