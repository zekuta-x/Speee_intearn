# frozen_string_literal: true

require 'test_helper'

class BranchesControllerTest < ActionDispatch::IntegrationTest
  test 'should get branches page' do
    get branch_url(branches(:one).id)
    assert_response :success
  end
end
