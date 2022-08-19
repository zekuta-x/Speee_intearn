require "test_helper"

class CompanyInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get company_page" do
    get company_info_company_page_url
    assert_response :success
  end
end
