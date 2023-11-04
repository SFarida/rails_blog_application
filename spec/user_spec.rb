require_relative 'rails_helper'
RSpec.describe User, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                           posts_counter: 0)
  Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: first_user, title: 'Hellooo', text: 'This is my third post')
  Post.create(author: first_user, title: 'Hellooooo', text: 'This is my fifth post')
  Post.create(author: first_user, title: 'Hellooooooo', text: 'This is my seventh post')
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer', posts_counter: 1) }
  before { subject.save }
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'name should be Tom' do
    expect(subject.name).to eql 'Tom'
  end
  it 'posts counter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end
  it 'posts counter should be integer' do
    subject.posts_counter = 0.1
    expect(subject).to_not be_valid
  end
  it 'posts counter should be greater than or equal to 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end
  it 'posts counter should be greater than or equal to 0' do
    subject.posts_counter = -3
    expect(subject).to_not be_valid
  end
end
