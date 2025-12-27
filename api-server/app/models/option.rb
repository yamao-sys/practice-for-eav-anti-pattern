class Option < ApplicationRecord
  has_many :option_contract_details, dependent: :destroy
end
