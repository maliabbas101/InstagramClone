# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User , type: :model do
  let(:user) {build :user }
  context 'Associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:active_friendships).dependent(:destroy) }
    it { is_expected.to have_many(:following).through(:active_friendships) }
    it { is_expected.to have_many(:passive_friendships).dependent(:destroy) }
    it { is_expected.to have_many(:followers).through(:passive_friendships) }
    it { is_expected.to have_many(:recieved_requests).dependent(:destroy) }
    it { is_expected.to have_many(:sent_requests).dependent(:destroy) }
    it { is_expected.to have_many(:stories).dependent(:destroy) }
    it { is_expected.to have_one_attached(:avatar) }

  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:user_type) }
    it { is_expected.to validate_length_of(:email).is_at_least(5) }
    it { is_expected.to validate_length_of(:email).is_at_most(25) }
    it { is_expected.to validate_length_of(:full_name).is_at_least(5) }
    it { is_expected.to validate_length_of(:full_name).is_at_most(25) }
    it { is_expected.to validate_length_of(:username).is_at_least(5) }
    it { is_expected.to validate_length_of(:username).is_at_most(25) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { should_not allow_value("Inv4lid_123455").for(:full_name) }
    it { should allow_value("Ali Abbas").for(:full_name) }
  end

  context 'Enum' do
    it do
      should define_enum_for(:user_type).
        with_values('private': 1, 'public': 2).
        with_prefix(:is)
    end
  end

  context 'Scope' do
    it 'returns the users with matching full_name'do
      expect(User.name_search(user.full_name).pluck(:full_name).eql? user.full_name)
    end
  end

  context 'following?' do
    it 'Follow method' do
      expect(user.following?(user)).to eq(false)
    end
  end

end
