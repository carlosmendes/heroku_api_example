class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def create_app
    heroku = PlatformAPI.connect_oauth(ENV['HEROKU_OAUTH_TOKEN'])
    # result = heroku.app.create({stack: 'heroku-18'})
    # # id slug from app in the same heroku account
    # slug_result = heroku.release.create(result['id'],
    #                                     {slug: '9b0fc9e1-9220-417c-ae00-0555e0c87d95'})

    # db_result = heroku.addon.create(result['id'],
    #                                 {plan: 'heroku-postgresql:hobby-dev'})

    # dyno_result = heroku.dyno.create(result['id'],
    #                                     {command: 'rails g scaffold Company name'})
    # p dyno_result

    # migrate_result = heroku.dyno.create(result['id'],
    #                                     {command: 'rails db:migrate'})

    # p migrate_result

    result = heroku.appsetups.create({source_blob: {url: "https://github.com/carlosmendes/heroku_api_example/tarball/master/"}})

    redirect_to root_path, notice: result['app']['name']
  end
end
