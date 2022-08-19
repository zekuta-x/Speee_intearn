# frozen_string_literal: true

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test 'should get companies page' do
    get company_url(1)
    assert_response :success
  end
end
