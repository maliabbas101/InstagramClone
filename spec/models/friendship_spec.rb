# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Friendship , type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:follower) }
    it { is_expected.to belong_to(:followed) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:follower_id) }
    it { is_expected.to validate_presence_of(:followed_id) }
  end
end
