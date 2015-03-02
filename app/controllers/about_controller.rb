class AboutController < ApplicationController
  def show
		@admins = User.with_role(:admin).order('name ASC')
    @mods = User.with_role(:moderator).order('name ASC')
    @team = User.with_role(:developer).order('name ASC')
  end
end
