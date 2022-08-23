# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Post , type: :model do
  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    #it { is_expected.to have_many_attached(:images)}
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end
  context 'validations' do
    #it {is_expected.to validate_presence_of(:images)}
  end
end
