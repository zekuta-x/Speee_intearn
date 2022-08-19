# frozen_string_literal: true

require 'test_helper'

# CompanyInfoControllerのrootingTest
class CompanyInfoControllerTest < ActionDispatch::IntegrationTest
  test 'should get companies page' do
    get companies_url
    assert_response :success
  end
end
