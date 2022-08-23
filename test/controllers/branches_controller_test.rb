# frozen_string_literal: true

require 'test_helper'

class BranchesControllerTest < ActionDispatch::IntegrationTest
  test 'should get branches page' do
    get branch_url(1)
    assert_response :success
  end
end
