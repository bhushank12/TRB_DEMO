require "reform"

module Call::Contract
  class Form < Reform::Form
    property :vmake
    property :vmodel
    property :vsubmodel
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
    end
  end
end