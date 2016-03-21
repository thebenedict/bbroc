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

RSpec.describe RequestsController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
