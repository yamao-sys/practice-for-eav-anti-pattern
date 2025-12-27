class Api::V1::BaseController < ApplicationController
  include ErrorFormattable
  include Authenticatable
end
