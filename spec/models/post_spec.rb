# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Post , type: :model do

  let!(:post) { Post.create(caption: "The of Monte Cristo", images: nil) }
  let!(:post_one) { Post.create(caption: "The Count of Monte Cristo") }
  let!(:post_two) { Post.create(user_id: 1,caption: "Animal Farm",images: [fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image1/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image2/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image3/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image4/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image5/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image6/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image7/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image8/png'),fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image9/png')]) }
  p = Post.first

  describe 'default scope' do
    it 'orders by descending name' do
      expect(Post.all).eql? [post_two, post_one, post]
    end
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many_attached(:images)}
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
  end

  context 'validations' do
    it 'validates presence of images' do
      expect(ActiveStorage::Attached.blank?).eql? false
    end

    it 'validates presence of images and images are greater than 1' do
      expect(p.images.count>=1).to eql(true)
    end

    it 'images count is correct' do
      post_two.update(user_id: 1, images:[fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image10/png')])
      expect(post_two.errors[:images]).to eql(["can not exceed 10 per post."])
    end

    it { is_expected.to validate_length_of(:caption).is_at_least(0) }
    it { is_expected.to validate_length_of(:caption).is_at_most(60) }
  end

end

