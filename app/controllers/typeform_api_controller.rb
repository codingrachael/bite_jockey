class TypeformApiController < ApplicationController

CreateFormRequest.execute(Form.new, token: 'tfp_5WFQWSGHDTAgF7D3NHwtKgyNXiwiXkLUCPYSGD83KPEy_A4zqf7DHWRu')


  class CreateFormRequest < FormRequest
    def initialize(form, token: APIConfig.token)
      request(
        method: :post,
        url: "#{APIConfig.api_request_url}/forms",
        headers: {
          'Authorization' => "Bearer #{token}"
        },
        payload: form.payload
      )
    end

end
