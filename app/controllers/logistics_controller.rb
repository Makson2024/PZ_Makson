class LogisticsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    
    def index
      @logistic = Logistic.all
    end
  
    def show
      @logistic = Logistic.find(params[:id])
    end
  
    def new
      @logistic = Logistic.new
    end
  
    def create
      @logistic = Logistic.new(logistic_params)
      @logistic.user = current_user
      
      if @logistic.save
        redirect_to @logistic, notice: 'Объявление успешно создано.'
      else
        render :new, status: 422
      end
    end
  
    def edit
      @logistic = Logistic.find(params[:id])
    end
  
    def update
      @logistic = Logistic.find(params[:id])
      
      if @logistic.update(logistic_params)
        redirect_to @logistic, notice: 'Объявление успешно загружено.'
      else
        render :edit
      end
    end
  
    def destroy
      @logistic = Logistic.find(params[:id])
      @logistic.destroy
      
      redirect_to logistics_url, notice: 'Объявление успешно удалено.'
    end
  
    private
  
    def logistic_params
      params.require(:logistic).permit(:title, :picture, :description, :price, :quantity)
    end
  end