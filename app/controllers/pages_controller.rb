class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def create_app
    heroku = PlatformAPI.connect_oauth(ENV['HEROKU_OAUTH_TOKEN'])
    result = heroku.app.create({})

    redirect_to root_path, notice: result['web_url']
  end
end
