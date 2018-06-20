require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

describe 'user tries to visit admin panel' do
  let!(:user) { create(:user) }

  it 'and redirects to root_path' do
    visit new_user_session_path
    login(user.email, user.password, 'Войти')
    visit admin_root_path
    expect(page).to have_content 'Вход в данный раздел сайта запрещен.'
    expect(current_path).to eq root_path
  end
end

describe 'not authorized user tries to visit admin panel' do

  it 'and redirects to root_path' do
    visit admin_root_path
    expect(page).to have_content 'Вход в данный раздел сайта запрещен.'
    expect(current_path).to eq root_path
  end
end

describe 'admin tries to visit admin panel' do
  let!(:admin) { create(:admin) }

  it 'and gets access' do
    visit new_user_session_path
    login(admin.email, admin.password, 'Войти')
    visit admin_root_path
    expect(current_path).to eq admin_root_path
  end
end
