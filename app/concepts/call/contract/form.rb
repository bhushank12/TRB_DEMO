require "reform"

module Call::Contract
  class Form < Reform::Form
    property :make
    property :model
    property :submodel
    property :category
    property :subcategory
    property :registration_date
    property :policy_expiry

    validates :make,:model,:submodel, presence: true
  end
end