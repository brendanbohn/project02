module ApplicationHelper

  def compat userA, userB
    # take current user, compaire questionnaire results to all other users 
    #score how many points
    #do not run against self
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

  def score_star score
    puts case score
    when 1
      return image_tag "star.png"
    when 2
      return (image_tag "star.png")+(image_tag "star.png")
    when 3
      return (image_tag "star.png")+(image_tag "star.png")+(image_tag "star.png")
    when 4
      return (image_tag "star.png")+(image_tag "star.png")+(image_tag "star.png")+(image_tag "star.png")
    when 5
      return (image_tag "star.png")+(image_tag "star.png")+(image_tag "star.png")+(image_tag "star.png")+(image_tag "star.png")
    else
      return "there is no combatability"
    end
  end


end
