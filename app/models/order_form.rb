  class OrderForm
  include ActiveModel::Model
    attr_accessor :history_id, :user_id, :item_id, :postcode, :area_id, :municipaldistrict, :district, :building, :phone, :token
  
    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :token
      validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
      validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
      validates :municipaldistrict
      validates :district
      validates :phone, length: {minimum: 10, maximum: 11}, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  
    end
  
    def save
      history = History.create(user_id: user_id, item_id: item_id)
      Destination.create(history_id: history.id, postcode: postcode, area_id: area_id, municipaldistrict: municipaldistrict, district: district, building: building, phone: phone)
    end
  
  end
