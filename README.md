
[![Build Status](https://travis-ci.org/katoy/rails4-form-before-wizard.svg?branch=master)](https://travis-ci.org/katoy/rails4-form-before-wizard)
[![Dependency Status](https://gemnasium.com/katoy/rails4-form-before-wizard.png)](https://gemnasium.com/katoy/rails4-form-before-wizard)
[![Coverage Status](https://coveralls.io/repos/katoy/rails4-form-before-wizard/badge.png?branch=master)](https://coveralls.io/r/katoy/rails4-form-before-wizard?branch=master)

これは、rails4 アポリケーションでの Form 画面のサンプルです。  
別レポジトリーで、この form 画面を wizard 形式に変更をしていきます。  

#
# 実行

    $ bundle install
	$ RAILS_ENV=test bundle exec rake db:create db:migrate db:test:prepare
	$ RAILS_ENV=test bundle exec rake spec

[./screenshots/*.png](./screenshots/) として主なシーンのスクリーンショットが保存される。  
[./coverage/rcov/index.html](./coverage/rcov/index.html) にテストカバレッジレポートが保存される。  


## 主な作業履歴

    $ rails new rails4-wizard -T
    $ cd rails4-wizard
    $ bundle install
    $ rails generate scaffold User email:string password_digest:string name:string twitter_username:string github_username:string website:string date_of_birth:date bio:text
    $ rake db:migrate
	$ rails s
    　
    Gemfile に debug 用の gem を追加。
    　
    # 日本語化
    Gemfile に i18n-missing_translations を追加する。
	config/locales/ja,yaml, app.yml を追加する。
	app/vie/* 中の各種文字列を  t(:foo) のようにして i18n 対応する。
    　
    # パスワード
    Gemfile に bcyypt を追加する。
    app/models/user.rb に has_secure_password を追加する。
    view 中の password_digest を password, password_confirmation にする。
	app/contorollers/user_controller.rb の create, update, user_params を変更する。
    　
    # rspec
    $ rails generate rspec:install
    spec/spec_helpe.rb に coverage の設定を追加する。


//--- End of File ---
