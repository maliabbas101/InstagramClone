# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Comment , type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(5) }
  end
end
