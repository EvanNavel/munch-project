# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def find_parent_record
    klass = [Post, Fork].find { |c| params["#{c.name.underscore}_id"].present? }
    klass&.find_by(id: params["#{klass.name.underscore}_id"])
  end

  def redirect_unless_owner(record)
    return if record.user == current_user

    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
