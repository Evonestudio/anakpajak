class Question < ActiveRecord::Base
  has_many    :answers
  belongs_to  :user
  has_many    :question_tags
  has_many    :tags, through: :question_tags
  paginates_per 12
  acts_as_votable

  def vote_up user
    vote_by voter: user, vote: 'like'
  end

  def vote_down user
    vote_by voter: user, vote: 'bad'
  end

  def total_vote
    get_upvotes.size - get_downvotes.size
  end

  include PublicActivity::Model
  tracked
end
