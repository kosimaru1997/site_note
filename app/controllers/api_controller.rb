class ApiController < ApplicationController

  def preview
    @note = view_context.markdown(params[:body])
  end

end
