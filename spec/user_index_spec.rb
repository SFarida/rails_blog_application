require 'rails_helper'

RSpec.describe 'users/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                        posts_counter: 0)
    @user1 = User.create(name: 'Anne', photo: 'https://i.pravatar.cc/300', bio: 'Future Chemist', posts_counter: 3)
    visit '/'
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user1.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Number of posts: 3')
  end

  it 'displays user profile photo' do
    expect(page).to have_css("img[src*='https://i.pravatar.cc/300']")
    expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'Redirects to the user show page when you click on a user' do
    visit user_path(@user.id)
    expect(page).to have_current_path(user_path(@user.id))
  end
end
