class AboutController < ApplicationController
  def show
    @admins = User.with_role :admin
    @mods = User.with_role :moderator
    @team = User.with_role :developer
  end
end
