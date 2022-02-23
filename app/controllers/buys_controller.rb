class BuysController < ApplicationController
  load_and_authorize_resource

  def new
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(buy_params)
    @buy.author = current_user

    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy.groups.first, notice: 'Transaction added successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:name, :amount, :group_ids)
  end
end
