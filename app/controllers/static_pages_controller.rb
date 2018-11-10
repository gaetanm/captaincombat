class StaticPagesController < ApplicationController
  def index
    @fight = Fight.last
  end
end
