class Property < ApplicationRecord
  belongs_to :location
  has_many_attached :thumbnails

  enum home_type: { single_family: 0, multi_family: 1, land: 2 }

  # Add scopes for filtering
  scope :by_price, -> (min, max) { where(price: min..max) }
  scope :newest, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
end
