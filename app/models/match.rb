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

class Match < ActiveRecord::Base
  belongs_to :request
  belongs_to :post

  after_save :save_request

  private
    def save_request
      self.request.save
    end
end
