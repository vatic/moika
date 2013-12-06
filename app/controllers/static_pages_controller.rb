class StaticPagesController < ApplicationController
  before_action :set_static_page, only: [:show, :edit, :update, :destroy]

  def show
    respond_to do |format|
      format.html {}
      format.pptx {
          send_file("#{Rails.root}/app/presentations/moika-77.pptx",
                                  filename: "moika-77.pptx",
                                  type: "application/vnd.openxmlformats-officedocument.presentationml.presentation")
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_static_page
      @static_page = StaticPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def static_page_params
      params.require(:static_page).permit(:title, :header, :content, :permalink)
    end
end
