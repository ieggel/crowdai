class Vote::Cell < Cell::Concept
  include Devise::Controllers::Helpers
  Devise::Controllers::Helpers.define_helpers(Devise::Mapping.new(:participant, {}))
  include ActionView::Helpers::JavaScriptHelper

  def show
    render
  end

  def votable
    model
  end

  def vote_link
    if participant_voted?
      disabled_vote_link
    else
      upvote_link
    end
  end

  def refresh
    Rails.logger.debug "refreshing: #{votable.id}"
    #{}%{ console.log("#{j(show)}")}
    %{ $("#vote-link").replaceWith("#{j(show)}"); }
  end

  def participant_voted?
    return false if current_participant.nil?
    vote = votable.votes.where(participant_id: current_participant.id).first
    return true if vote.present?
    return false
  end

  def display_vote_count
    return nil if votable.vote_count == 0
    " #{votable.vote_count}".html_safe
  end

  def upvote_link
    link_to "<i class='fa fa-heart' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            eval(create_vote_path),
            id: 'vote-link',
            class: 'btn btn-secondary',
            method: :post,
            remote: true
  end

  def create_vote_path
    classname = votable.class.to_s
    "#{classname.downcase}_votes_path(#{votable.id})"
  end

  def disabled_vote_link
    link_to "<i class='fa fa-heart active' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            '#',
            id: 'vote-link',
            class: 'btn btn-secondary'
  end

end
