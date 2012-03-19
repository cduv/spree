require File.expand_path('../../base_controller_decorator', __FILE__)
Spree::Admin::BaseController.class_eval do
  before_filter :authorize_admin

  def authorize_admin
    p current_ability

    begin
      model = model_class
    rescue
      model = Object
    end
    authorize! :admin, model
    authorize! params[:action].to_sym, model
  end

  protected
    def model_class
      "Spree::#{controller_name.classify}".constantize
    end
end
