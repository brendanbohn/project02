module ApplicationHelper

  def compat userA, userB
    # take current user, compaire questionnaire results to all other users 
    #score how many points
    if (userA != userB)
      score =0
      if userA.questionnaire.question1 == userB.questionnaire.question1
        score+=1
      end
      if userA.questionnaire.question2 == userB.questionnaire.question2
        score+=1
      end
      if userA.questionnaire.question3 == userB.questionnaire.question3
        score+=1
      end
      if userA.questionnaire.question4 == userB.questionnaire.question4
        score+=1
      end
      if userA.questionnaire.question5 == userB.questionnaire.question5
        score+=1
      end
    
    return score
    end
  end


end
