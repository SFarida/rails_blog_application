require_relative 'rails_helper'
RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                           posts_counter: 0)
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
  Comment.create(post: first_post, author: first_user, text: 'Hi Tom! am first_user')
  Comment.create(post: first_post, author: first_user, text: 'Hi Tom! am first_user')
  Comment.create(post: first_post, author: first_user, text: 'Hi Tom! am first_user')
  Comment.create(post: first_post, author: first_user, text: 'Hi Tom! am first_user')
  Comment.create(post: first_post, author: first_user, text: 'Hi Tom! am first_user')
  Comment.create(post: first_post, author: first_user, text: 'Hi Tom! am first_user')
  subject do
    Post.new(title: 'Hello', text: 'This is my first post', comments_counter: 1, likes_counter: 1, author_id: 1)
  end
  before { subject.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'title should be Hello' do
    expect(subject.title).to eql 'Hello'
  end
  it 'title should be maximum 250 characters' do
    subject.title = 'Hello' * 300
    expect(subject).to_not be_valid
  end
  it 'comments counter should be present' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end
  it 'comments counter should be integer' do
    subject.comments_counter = 0.1
    expect(subject).to_not be_valid
  end
  it 'comments counter should be greater than or equal to 0' do
    subject.comments_counter = 0
    expect(subject).to be_valid
  end
  it 'comments counter should be greater than or equal to 0' do
    subject.comments_counter = -3
    expect(subject).to_not be_valid
  end
  # likes
  it 'likes counter should be present' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end
  it 'likes counter should be integer' do
    subject.likes_counter = 0.1
    expect(subject).to_not be_valid
  end
  it 'likes counter should be greater than or equal to 0' do
    subject.likes_counter = 0
    expect(subject).to be_valid
  end
  it 'likes counter should be greater than or equal to 0' do
    subject.likes_counter = -3
    expect(subject).to_not be_valid
  end
  it 'should return the 5 most recent comments for a given user' do
    expect(first_post.recent_comments.count).to eq(5)
  end
end
