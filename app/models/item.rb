class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_price
  belongs_to :prefectures
  belongs_to :delivery_time

  validates :image, :name, :explanation, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_price_id
    validates :prefectures_id
    validates :delivery_time_id
  end
end
