require 'rails_helper'
require 'spec_helper'
require 'devise'

RSpec.describe "CommentsControllers", type: :request do
  post = Post.find(1)
  user = post.user
  comment_used = post.comments.first

  before(:each) do
    sign_in user
  end

  describe "Comments/create" do
    it 'Comments create action when comment saved successfully' do
      post post_comments_path(post.id), params:{comment: {body: Faker::Lorem.sentence, user_id: user.id}}
      follow_redirect!
      expect(response.body).to include('Comment was successfully added.')
    end
  end

  describe "Comments/create" do
    let(:comment1) { Comment.new(body:"sss", user_id: user.id) }
    it 'Comments create action when comment dont save' do
      post post_comments_path(post.id), params:{comment: {body:"sss", user_id: user.id}}
      expect(flash[:notice]).to eq("Comment was not created successfuly.")
      expect(response).to have_http_status(422)
    end
  end

  describe "Comments/update" do
    it 'Comments update action when comment updated successfuly' do
      patch post_comment_path(post.id,comment_used.id), params:{comment: {body: Faker::Lorem.sentence, user_id: user.id}}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "Comments/update" do
    it 'Comments update action when comment is not updated successfully' do
      sign_in user
      patch "/posts/#{post.id}/comments/#{comment_used.id}", params: { comment: { body: '', user_id: user.id } }
      expect(flash[:notice]).to eq("Comment was not updated successfully.")
      expect(response).to have_http_status(422)
    end
  end

  describe "Comments/Destroy" do
    it 'Comments update action when comment is destroyed successfully' do
      delete post_comment_path(post.id,comment_used.id), params:{comment: {user_id: user.id}}
      expect(response).to have_http_status(:redirect)
    end
  end
  it 'should not delete a comment' do
    allow(Comment).to receive(:find).and_return(comment_used)
    allow(comment_used).to receive(:destroy).and_return(false)
    delete "/posts/#{post.id}/comments/#{comment_used.id}"
    follow_redirect!
    expect(response.body).to include('Something went wrong')
  end
end

