class VotesController < ApplicationController
  
  def new
    if params.has_key?(question.id)
      @vote = Vote.new
      @voteable = Question.find(params[:question_id])
    elsif params.has_key?(answer.id)
      @vote = Vote.new
      @voteable = Answer.find(params[:answer_id])
    end
  end

  def create
    # votable class, votable id, votable value
    p params
    p current_user
    answer = Answer.find(params[:answer_id])
    vote = answer.votes.new(params[:vote])
    vote.user_id = current_user.id
    # vote = current_user.votes.where(voteable_id: params[:answer_id]).first_or_initialize(up_voted: params[:up_voted])
                                                                                         # voteable_type: params[:voteable_type],
                                                                                         # voteable_id: params[:answer_id])
    
                            # up_voted: params[:up_voted])
    unless vote.id
      vote.save
      render json: 'Your vote has been saved!'.to_json # opportunity to send status back here too for controller testing
    else
      render json: 'You can only vote once, brah!'.to_json #opportunity to send status back here for controller testing
    end
  end

  # def update
  #   if params.has_key?(question.id)
  #     vote_count = Question.find(params[:question_id]).vote_count
  #     @vote = Question.find(params[:question_id]).update.vote_count
  #   elsif 
  #   end
  # end
end