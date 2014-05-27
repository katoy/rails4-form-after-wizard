# coding: utf-8

require 'spec_helper'

describe 'トップページ' do
  specify '一覧の表示' do
    visit '/'
    expect(page).to have_selector('h1', text: 'ユーザー一覧')
  end

  specify 'ユーザーストーリー' do
    visit '/'
    click_link 'ユーザー登録'
    expect(page).to have_selector('h1', text: 'ユーザー登録')
    page.save_screenshot("#{capture_name('root.png')}")

    fill_in :user_email,                 with: 'foo@example.com'
    fill_in :user_password,              with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    fill_in :user_twitter_username,      with: 'foo'
    fill_in :user_github_username,       with: 'foo_github'
    fill_in :user_website,               with: 'http://foo.com'
    select '2011',                       from: 'user_date_of_birth_1i'
    select '5月',                        from: 'user_date_of_birth_2i'
    select '20',                         from: 'user_date_of_birth_3i'
    fill_in :user_bio,                   with: 'BIO'
    page.save_screenshot("#{capture_name('before_create.png')}")
    click_button '登録する'
    expect(page).to have_selector('p', 'User was successfully created.')
    page.save_screenshot("#{capture_name('after_create.png')}")

    click_link '編集'
    expect(page).to have_selector('h1', 'ユーザー編集')
    fill_in :user_password,              with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    page.save_screenshot("#{capture_name('before_edit.png')}")
    click_button '更新する'
    expect(page).to have_selector('p', 'User was successfully created.')
    page.save_screenshot("#{capture_name('after_edit.png')}")

    click_link '戻る'
    page.save_screenshot("#{capture_name('after_show.png')}")

    find(:xpath, "(//a[text()='削除'])[1]").click
    # page.save_screenshot("#{capture_name('before_delete.png')}")

    # alert の OKボタンをクリック
    page.driver.browser.switch_to.alert.accept
    page.save_screenshot("#{capture_name('after_delete.png')}")
  end

  specify 'ユーザー登録' do
    visit '/users/new'

    click_button '登録する'
    page.save_screenshot("#{capture_name('no_password.png')}")
    expect(page).to have_selector('li', 'Passwordを入力してください。')

    fill_in :user_password,              with: 'password'
    fill_in :user_password_confirmation, with: 'xxx'
    click_button '登録する'
    page.save_screenshot("#{capture_name('not_math_password_confirmation.png')}")
    expect(page).to have_selector('li', 'Password confirmationとPasswordの入力が一致しません。')
  end

  specify 'ユーザー表示' do
  end

  specify 'ユーザー編集' do
  end

  specify 'ユーザー削除' do
  end

end
