class ContractDetail < ApplicationRecord
  has_one :text_contract_detail, dependent: :destroy
  has_one :url_contract_detail, dependent: :destroy
  has_one :number_contract_detail, dependent: :destroy
  has_one :datetime_contract_detail, dependent: :destroy
  has_one :option_contract_detail, dependent: :destroy
  has_one :user_contract_detail, dependent: :destroy
  has_one :multiline_text_contract_detail, dependent: :destroy
end
