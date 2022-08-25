require 'rails_helper'
require 'spec_helper'
require 'devise'

RSpec.describe "CommentsControllers", type: :request do
  post = Post.first
  user = post.user
  comment = post.comments.first

  describe "Comments/create" do
    it 'Comments create action when comment saved successfully' do
      sign_in user
      post post_comments_path(post.id), params:{comment: {body: Faker::Lorem.sentence, user_id: user.id}}
      follow_redirect!
      expect(response.body).to include('Comment was successfully added.')
    end
  end

  describe "Comments/create" do
    it 'Comments create action when comment dont save' do
      sign_in user
      post post_comments_path(post.id), params:{comment: {body:'sss', user_id: user.id}}
      expect(response).to have_http_status(422)
    end
  end

  describe "Comments/update" do
    it 'Comments update action when comment updated successfully' do
      sign_in user
      patch post_comment_path(post.id,comment.id), params:{comment: {body: Faker::Lorem.sentence, user_id: user.id}}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "Comments/update" do
    it 'Comments update action when comment is not updated successfully' do
      sign_in user
      patch "/posts/#{post.id}/comments/#{comment.id}", params: { comment: { body: '', user_id: user.id } }
      expect(response).to have_http_status(422)
    end
  end

  describe "Comments/Destroy" do
    it 'Comments update action when comment is destroyed successfully' do
      sign_in user
      delete post_comment_path(post.id,comment.id), params:{comment: {user_id: user.id}}
      expect(response).to have_http_status(:redirect)
    end
  end
  it 'should not delete a comment' do
    sign_in user
    allow(Comment).to receive(:find).and_return(comment)
    allow(comment).to receive(:destroy).and_return(false)
    delete "/posts/#{post.id}/comments/#{comment.id}"
    follow_redirect!
    expect(response.body).to include('Something went wrong')
  end
end

