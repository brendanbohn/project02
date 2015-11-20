class QuestionnairesController < ApplicationController

  include ApplicationHelper

  def index
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
    @current_user= current_user
  end

  def new
    @questionnaire = Questionnaire.new
    @current_user= current_user
    render :new
  end

  def create
    questionnaire_params = params.require(:questionnaire).permit(:question1, :question2, :question3, :question4, :question5, :user_id)
    @questionnaire = Questionnaire.create(questionnaire_params)
    current_user.questionnaire = @questionnaire
    compatCreate
    redirect_to user_path(current_user)

  end

  def destroy
  end

  private
  def compatCreate
    @users = User.all
    @users.each do |user|
      compatibility = Compatability.new
      compatibility.user_id = current_user.id
      compatibility.questionnaire_id = user.id
      compatibility.score = compat current_user, user
      if compatibility.save
        puts "compatibility for #{current_user.username} and #{user.username}: #{compatibility.score}"
      else
        #booo
      end
    end
    
  end
end
