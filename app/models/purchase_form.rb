class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code,:prefectures_id,:municipality,:address,:building_name,:phone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :purchase
    validates :user_id
    validates :item_id
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }


  def save
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name,phone_number: phone_number,user_id: user.id)
    Purchase.create(user_id: user_id, item_id: item.id)
  end
end


