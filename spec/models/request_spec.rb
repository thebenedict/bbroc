# == Schema Information
#
# Table name: requests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  body        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  notified_at :datetime
#  status      :integer
#

require 'rails_helper'

RSpec.describe Request, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
