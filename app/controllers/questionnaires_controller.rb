class QuestionnairesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @questionnaire = Questionnaire.new
    @current_user= current_user
    render :new
  end

  def create
    questionnaire_params = params.require(:questionnaire).permit(:question1, :question2, :question3, :question4, :question5, :user_id)
    @questionnaire = Questionnaire.create(questionnaire_params)
    @current_user= current_user
    @questionnaire.user_id = @current_user.id
    if @questionnaire.save
      redirect_to @questionnaire # <-- go to post
    else 
      render :new
    end
  end

  def destroy
  end
end
