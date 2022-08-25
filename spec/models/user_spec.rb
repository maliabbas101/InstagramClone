# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User , type: :model do
  context 'Associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:active_friendships).dependent(:destroy) }
    it { is_expected.to have_many(:passive_friendships).dependent(:destroy) }
    it { is_expected.to have_many(:recieved_requests).dependent(:destroy) }
    it { is_expected.to have_many(:sent_requests).dependent(:destroy) }
    it { is_expected.to have_one_attached(:avatar) }

  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:user_type) }
  end

  context 'Follow check' do
    let(:user) {build :user }
    it 'Follow method' do
      expect(user.following?(user)).to eq(false)
    end
  end
end
