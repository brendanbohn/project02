class CompatabilitiesController < ApplicationController


  def create
    @compatabilities = Compatabilities.new
    @current_user= current_user
    @users = User.all
    @questionnaires = Questionnaire.all
  end

  def destroy
    
  end


  def show
    current_user
    @users = User.all
    @questionnaires = Questionnaire.all
    @compatabilities = Compatability.all
  end

end
