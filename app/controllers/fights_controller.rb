class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :destroy]
  before_action :fetch_fighters, only: [:new, :create]

  def index
    @fights = Fight.all
  end

  def show
  end

  def new
    @fight = Fight.new
  end

  def create
    fighter_one = Fighter.includes(:weapon, :shield).find(params[:fighter_one])
    fighter_two = Fighter.includes(:weapon, :shield).find(params[:fighter_two])

    @fight = FightService.call(fighter_one, fighter_two)

    if @fight.save
      redirect_to @fight
    else
      render :new
    end
  end

  def destroy
    @fight.destroy
    respond_to do |format|
      format.html { redirect_to fights_url, notice: "Fight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_fight
    @fight = Fight.includes(:turns, :winner, :loser).find(params[:id])
  end

  def fetch_fighters
    @fighters = Fighter.all
  end
end
