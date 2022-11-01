# frozen_string_literal: true

class Category < ApplicationRecord
  # relation
  has_many :tasks
  belongs_to :user
  # validation
  validates :title, presence: true, length: { maximum: 50 }

end
