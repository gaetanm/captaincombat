class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :update, :destroy]
  before_action :fetch_stuff, except: [:show, :destroy]

  def index
    @fighters = Fighter.all
  end

  def show
  end

  def new
    @fighter = Fighter.new
  end

  def edit
  end

  def create
    @fighter = Fighter.new(fighter_params)

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to @fighter, notice: 'Fighter was successfully created.' }
        format.json { render :show, status: :created, location: @fighter }
      else
        format.html { render :new }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to @fighter, notice: 'Fighter was successfully updated.' }
        format.json { render :show, status: :ok, location: @fighter }
      else
        format.html { render :edit }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: 'Fighter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_fighter
    @fighter = Fighter.includes(:lost_fights, :won_fights).find(params[:id])
  end

  def fetch_stuff
    @weapons = Weapon.all
    @shields = Shield.all
  end

  def fighter_params
    params.require(:fighter).permit(:name, :attack, :defense, :weapon_id, :shield_id)
  end
end
