# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  request_id :integer
#  post_id    :integer
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Match, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
