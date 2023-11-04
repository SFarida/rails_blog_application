require_relative 'rails_helper'
RSpec.describe Like, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                           posts_counter: 0)
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)
  subject { Like.new(post: first_post, author: first_user) }
  before { subject.save }
  it 'likes counter should be 1' do
    expect(first_post.likes_counter).to eq 1
  end
  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
  it 'should have a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
