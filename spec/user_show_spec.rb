require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
  before(:each) do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                        posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 5,
                              likes_counter: 0)
    5.times do |i|
      Comment.create(text: "This is comment ##{i}", user_id: @user.id, post_id: @first_post.id)
    end
    visit user_post_path(@user.id, @first_post)
  end

  it 'displays the post title' do
    expect(page).to have_content('Hello')
  end

  it 'displays the post body' do
    expect(page).to have_content('This is my first post')
  end

  it 'displays the post author' do
    expect(page).to have_content('by Lilly')
  end

  it 'displays the number of comments' do
    expect(page).to have_content('Comments: 10')
  end

  it 'displays the number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays the username of each comment' do
    expect(page).to have_content(@user.name)
  end

  it 'displays the body of each comment' do
    expect(page).to have_content('This is comment #0')
    expect(page).to have_content('This is comment #1')
    expect(page).to have_content('This is comment #2')
  end
end
