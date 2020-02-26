class DogsController < ApplicationController
  def index 
    @dogs = Dog.all 
  end

  def show 
    @dog = current_dog
  end

  def new
    @dog = Dog.new 
  end

  def create
    @dog = Dog.create(dog_params(:name,:breed,:age))
    redirect_to dog_path(@dog)
  end

  def edit 
    @dog = current_dog
  end

  def update 
    @dog = current_dog 
    @dog.update(dog_params(:name,:breed,:age))
    redirect dog_path(@dog)
  end

  def destroy 
    @dog = current_dog
    @dog.destroy
    redirect_to dogs_path
  end

  private 
  def current_dog
    Dog.find(params[:id])
  end

  def dog_params(*args)
    params.require(:dog).permit(*args)
  end



end
