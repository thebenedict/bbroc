class Match < ActiveRecord::Base
  belongs_to :request
  belongs_to :post
end
