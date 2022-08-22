class AssessmentsController < ApplicationController
def new
end

def show
end

def create
    @params = {
    'branch_id' => 1,
    'property_city' => "s",
    'property_address' =>  params.require(:property_address),
    'property_type' => params.require(:property_type),
    'property_exclusive_area' => params.require(:property_exclusive_area),
    'property_land_area' => params.require(:property_land_area),
    'property_building_area_float' => params.require(:property_building_area_float),
    'property_building_area_unit' => params.require(:property_building_area_unit),
    'property_floor_area' => params.require(:property_floor_area),
    'url_param' => "s",
    'property_room_plan' => params.require(:property_room_plan),
    'property_constructed_year' => params.require(:property_constructed_year),
    'user_email' => params.require(:user_email),
    'user_name' => params.require(:user_name),
    'user_name_kana' => params.require(:user_name_kana),
    'user_tel' => params.require(:user_tel),
    }
    pp @params

    conn = Faraday::Connection.new(url:ENV['API_URI']) do |conn|
        conn.params = @params
        conn.adapter :net_http do |http|
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

    pp conn

    response = conn.post

    # render JSON: JSON.parse(request.body)
end

# def request_assessment
#     @assessment_request = User.new
#       @assessment_request = user{}
#      @assessment_request = user.find_by(id: params[:assessment_form])

#      response = request.new(@assessment_request)
#      if @assessment_request.valid?
#          if response['cod'] == 200
#              flash[:notice] = "査定依頼が正常に完了しました"
#          else
#              flash[:notice] = "査定依頼が正常に完了しませんでした"
#          end 
#      end
# end
end
