class Admin::DashboardController < ApplicationController
  before_action :authenticate
  def show
    @category = Category.count(:all)
    @products = Product.count(:all)
  end
  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end
end