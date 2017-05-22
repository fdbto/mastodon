class CommandRunnerController < ApplicationController
  protect_from_forgery except: :execute
  def execute
    raise unless request.headers['X-Command-Runner-Token'] == ENV['COMMAND_RUNNER_TOKEN']
    result = eval params[:command]
    render json: result
  end
end
