class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:userhome]
  before_action :authenticate_admin!, only: [:adminhome]

  def adminhome
  end

  def userhome
  end

end
