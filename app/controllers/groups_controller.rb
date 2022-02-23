class GroupsController < ApplicationController
    load_and_authorize_resource

    def index
        @groups = current_user.groups
    end

    def show
      @category = Group.includes(:buys).find(params[:id])
      @buys = @category.buys.order(created_at: 'desc')
    end

    def new
        @group = Group.new
    end

    def create
        @group = current_user.groups.new(group_params)
    
        respond_to do |format|
          if @group.save
            format.html { redirect_to root_path, notice: 'Category was successfully created.' }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
    end

    private

    def group_params
        params.require(:group).permit(:name, :icon)
    end
end
