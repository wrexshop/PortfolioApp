module ConcernDefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Justin's Portfolio Website"
    @seo_keywords = "Justin Portfolio"
  end
end

