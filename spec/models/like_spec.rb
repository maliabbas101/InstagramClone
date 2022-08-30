# frozen_string_literal: true
require 'rails_helper'
RSpec.describe Like , type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end

  context 'validations' do
    let(:user) {build :user }
      it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:post_id).with_message('can like post once.') }
  end

end
