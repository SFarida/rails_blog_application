require 'rails_helper'

RSpec.describe 'posts/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                        posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 5,
                              likes_counter: 0)
    5.times do |i|
      Comment.create(text: "This is comment ##{i}", user_id: @user.id, post_id: @first_post.id)
    end
    visit user_posts_path(@user.id, @first_post)
  end

  it 'displays post body' do
    expect(page).to have_content('This is my first post')
  end

  it 'displays post title' do
    expect(page).to have_content('Hello')
  end

  it 'displays first comment' do
    expect(page).to have_content('This is comment #1')
  end

  it 'displays number of comments' do
    expect(page).to have_content('Comments: 10')
  end

  it 'displays number of likes' do
    expect(page).to have_content('Likes: 0')
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'displays a section for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'displays user photo' do
    expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'Redirects to the post show page when you click on a post' do
    visit user_posts_path(user_id: @user.id)
    expect(page).to have_link(@first_post.title, href: user_post_path(user_id: @user.id, id: @first_post.id))
    click_link @first_post.title
    expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @first_post.id))
  end
end
