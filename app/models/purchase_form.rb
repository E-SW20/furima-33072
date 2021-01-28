class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code,:prefectures_id,:municipality,:address,:building_name,:phone_number,:user_id,:item_id,:token,:purchase_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :prefectures_id, numericality: { other_than: 0}
    validates :token
  end


  def save

    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality,
                   address: address, building_name: building_name, phone_number: phone_number ,purchase_id: purchase.id)
  end
end


