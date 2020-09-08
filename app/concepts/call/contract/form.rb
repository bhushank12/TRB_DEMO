require "reform"

module Call::Contract
  class Form < Reform::Form
    property :vmake
    property :vmodel
    property :vsubmodel
    property :vehicle_type
    property :vcategory
    property :vsubcategory
    property :registration_date
    property :policy_expiry
    property :user_id, prepopulator: ->(ctx) { self.user_id = ctx[:user_id] }
    property :customer do
      property :title
      property :first_name
      property :last_name
      property :gender
      property :birth_date

      validates :title, presence: true
      validates :first_name, presence: true
      validates :last_name, presence: true
      validates :gender, presence: true
    end
    validates :vmake, presence: true
    validates :vmodel, presence: true
    validates :vsubmodel, presence: true
    validates :vehicle_type, presence: true
  end
end