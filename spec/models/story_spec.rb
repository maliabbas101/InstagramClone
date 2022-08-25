# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Story , type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
  end
  it { should callback(:set_timer).after(:save) }
end

