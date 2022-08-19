# frozen_string_literal: true

require 'test_helper'

# CompaneisControllerのrootingTest
class CompaniesControllerTest < ActionDispatch::IntegrationTest
  def show
    resources :companies, only: %i[show]
  end

  test 'should get companies page' do
    get companies_show_url
    assert_response :success
  # end
end
