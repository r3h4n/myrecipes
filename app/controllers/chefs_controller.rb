class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  
  def index
    @chefs = Chef.all
  end
  
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      session[:chef_id] = @chef.id
      flash[:success] = "Wecome #{@chef.name} to my Recipes App"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end
  
  def show
    set_chef
  end
  
  def edit
    set_chef
  end
  
  def update
    set_chef
    if @chef.update(chef_params)
      flash[:success] = "You account was updated successfully"
      redirect_to @chef
    else
      render 'edit'
    end
  end
  
  def destroy
    set_chef
    @chef.destroy
    flash[:danger] = "Chef and all associated recipes have been deleted"
    redirect_to chefs_path
  end
  
private

def chef_params
  params.require(:chef).permit(:name, :email, :password, :password_confirmation)
end

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def require_same_user
    if current_chef != @chef
      flash[:danger] = "You can only edit or delete your own account"
      redirect_to chefs_path
    end
  end


end
