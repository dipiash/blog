class ErrorsController < ApplicationController

  def error_404
    @error_code = 404
    render status: 404, layout: 'error'
  end

  def error_500
    @error_code = 500
    render status: 500, layout: 'error'
  end

end
