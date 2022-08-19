class AssessmentRequestController < ApplicationController
    def request_assessment
        # @assessment_request = User.new
        # @assessment_request = user{}
        # @assessment_request = user.find_by(id: params[:user])

        response = request.new(@assessment_request)
        if @assessment_request.valid?
            if response['cod'] == 200
                flash[:notice] = "査定依頼が正常に完了しました"
            else
                flash[:notice] = "査定依頼が正常に完了しませんでした"
            end 

        end
    end

    def request()
        # @query = {
        #     branch_id: assessment_request.
        #     property_city: assessment_request.property_city,
        #     property_address: assessment_request.property_address,
        #     property_address: assessment_request.property_address,
        #     property_type: assessment_request.property_type,
        #     property_exclusive_area: assessment_request.property_exclusive_area,
        #     property_land_area: assessment_request.property_land_area,
        #     property_building_area_float: assessment_request.property_building_area_float,
        #     property_building_area_unit: assessment_request.property_building_area_unit,
        #     property_floor_area: assessment_request.property_floor_area,
        #     url_param: assessment_request.url_param,
        #     property_room_plan: assessment_request.property_room_plan,
        #     property_constructed_year: assessment_request.property_constructed_year,
        #     user_email: assessment_request.user_email,
        #     user_name: assessment_request.user_name,
        #     user_name_kana: assessment_request.user_name_kana,
        #     user_tel:assessment_request.user_tel
        # }

        query = {
            'branch_id' => "1",
            'property_city' => "aa",
            'property_address' =>  "aa",
            'property_address' => "aa",
            'property_type' => "aa",
            'property_exclusive_area' => "aa",
            'property_land_area' => "aa",
            'property_building_area_float' => "aa",
            'property_building_area_unit' => "aa",
            'property_floor_area' => "aa",
            'url_param' => "aa",
            'property_room_plan' => "aa",
            'property_constructed_year' => "aa",
            'user_email' => "aa",
            'user_name' => "aa",
            'user_name_kana' => "aa",
            'user_tel' =>"aa",
            'company' =>"aa"
        }
        

        client = HTTPClient.new
        request = client.get(ENV['API_URI'],query)
        render JSON: JSON.parse(request.body)
    end
end
