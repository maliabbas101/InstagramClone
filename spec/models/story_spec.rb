# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Story , type: :model do
  let(:user_first) { User.create(id: 5, email: "example@gmail.com", full_name: "Ali Abbas", username:"aynlee_919", user_type: 2 ) }
  let(:story_first) { Story.create(id: 1,user_id: user_first.id, images:[fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image/png')]) }


  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many_attached(:images) }
  end

  context 'Validations' do
    it 'validates presence of images' do
      expect(ActiveStorage::Attached.blank?).eql? false
    end
  end

  context 'Callbacks' do
    it { should callback(:set_timer).after(:save) }
  end

  context 'Scope' do

    it 'returns the specific user stories'do
      expect(Story.specific_user(user_first).pluck(:user_id)[0].eql? user_first.id)
    end
  end
end

