# frozen_string_literal: true

class Category < ApplicationRecord
  # relation
  belongs_to :user
  # validation
  validates :title, presence: true, length: { maximum: 50 }

end
