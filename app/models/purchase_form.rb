class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code,:prefectures_id,:municipality,:address,:building_name,:phone_number,:user_id,:item_id,:token,:purchase_id

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
  end
  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }


  def save

    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality,
                   address: address, building_name: building_name, phone_number: phone_number ,purchase_id: purchase.id)
  end
end


