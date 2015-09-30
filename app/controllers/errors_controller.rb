class ErrorsController < ApplicationController

  def error_404
    render status: 404, layout: 'error'
  end

  def error_422
    render status: 422, layout: 'error'
  end

  def error_500
    render status: 500, layout: 'error'
  end

end
