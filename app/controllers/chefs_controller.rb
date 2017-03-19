class ChefsController < ApplicationController
  
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Wecome #{@chef.name} to my Recipes App"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end
  
  def show
    
  end
end

private

def chef_params
  params.require(:chef).permit(:name, :email, :password, :password_confirmation)
end