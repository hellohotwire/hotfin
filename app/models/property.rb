class Property < ApplicationRecord
  belongs_to :location

  has_many :wishlists
  has_many :users, through: :wishlists

  has_many_attached :thumbnails

  enum home_type: { single_family: 0, multi_family: 1, land: 2 }
  enum status: { for_sale: 0, pending: 1, sold: 2}

  # Add scopes for filtering
  scope :by_price, -> (min, max) { where(price: min..max) }
  scope :newest, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }

  def previous
    Property.where("id < ?", id).order(id: :desc).first
  end

  def next
    Property.where("id > ?", id).order(id: :asc).first
  end
end
