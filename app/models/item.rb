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
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :delivery_price_id, numericality: { other_than: 1 } 
  validates :prefectures_id, numericality: { other_than: 1 } 
  validates :delivery_time_id, numericality: { other_than: 1 } 
end
