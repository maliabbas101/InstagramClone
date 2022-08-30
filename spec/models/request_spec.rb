# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Request , type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:requester) }
    it { is_expected.to belong_to(:reciever) }
  end
end
