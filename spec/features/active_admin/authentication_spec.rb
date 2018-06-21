require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

describe 'admin tries to visit admin panel' do
  let!(:admin) { create(:admin) }

  it 'and gets access' do
    visit root_path
    login('admin@fortest.com', '12345678', 'Войти')
    visit admin_root_path
    expect(current_path).to eq admin_root_path
  end
end

describe 'user tries to visit admin panel' do
  let!(:user) { create(:user) }

  it 'and redirects to root_path' do
    visit root_path
    login('test@test.com', '12345', 'Войти')
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
