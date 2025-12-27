class OptionContractDetail < ApplicationRecord
  belongs_to :contract_detail
  belongs_to :option
end
