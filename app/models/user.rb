class User < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments

  def self.order_by_first_name
    order(:first_name)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
