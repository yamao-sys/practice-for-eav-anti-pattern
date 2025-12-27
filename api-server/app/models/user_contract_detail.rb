class UserContractDetail < ApplicationRecord
  belongs_to :contract_detail
  belongs_to :user
end
