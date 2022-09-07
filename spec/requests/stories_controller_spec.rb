require 'rails_helper'
require 'spec_helper'
require 'devise'

RSpec.describe "StoriesControllers", type: :request do
  story = Story.first
  user = story.user


  before do
      sign_in user
  end

  describe "Stories/Index" do
    it 'Stories create action when story saved successfully' do
      get user_stories_path(user.id), params:{story: { user_id: user.id}}
      expect(response).to have_http_status(200)
    end
  end

  describe "Stories/show" do
    it 'Stories create action when story saved successfully' do
      get user_story_path(user.id,story.id), params:{story: { user_id: user.id, id: story.id}}
      expect(response).to have_http_status(200)
    end
  end

  describe "Stories/new" do
    it 'Stories create action when story saved successfully' do
      get new_user_story_path(user.id), params:{story: { user_id: user.id}}
      expect(response).to have_http_status(200)
    end
  end

  describe "Stories/new" do
    it 'Stories create action when user is not auth successfully' do
      sign_out user
      get new_user_story_path(user.id), params:{story: { user_id: user.id}}
      follow_redirect!
      expect(flash[:notice]).to eq("You are not authorized to perform this action.")
    end
  end

  describe "Stories#create" do
    it 'Story create action when story is not saved' do
      post user_stories_path(user.id), params:{story: {user_id: user.id}}
      expect(flash[:notice]).to eq("Story was not successfully created.")
      expect(response).to have_http_status(422)
    end
 end

  describe "Stories#create" do
    it 'Story create action when story saves' do
      post user_stories_path(user.id), params:{story: {user_id: user.id,images: [fixture_file_upload(Rails.root.join('spec', 'fixtures', 'homepage.png'), 'image/png')]}}
      follow_redirect!
      expect(response.body).to include('Story was successfully created.')
    end
 end
  describe "Stories#destroy" do
    it 'Story destroy action when story is deleted' do
      delete user_story_path(user.id, story.id), params:{story: {user_id: user.id, id: story.id}}
      expect(response).to have_http_status(:redirect)
    end
  end
    it 'should not delete a story' do
      allow(Story).to receive(:find).and_return(story)
      allow(story).to receive(:destroy).and_return(false)
      delete "/users/#{user.id}/stories/#{story.id}"
      follow_redirect!
      expect(response.body).to include('Something went wrong')
    end
end