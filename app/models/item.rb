class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :sendday
  belongs_to :area

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explain
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :area_id
    validates :send_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :area_id
    validates :send_day_id
  end
end