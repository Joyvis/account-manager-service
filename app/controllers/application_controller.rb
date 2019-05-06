class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  def render_success(result, options: {})
    render json: serialize_json(result, options), status: :ok
  end

  def render_error(result)
    render json: { errors: result.errors.messages },
           status: :unprocessable_entity
  end

  private

  def serialize_json(result, options = {})
    klass = result_type(result)
    klass.new(result, options).serialized_json
  rescue NameError
    { data: [] }.to_json
  end

  def result_type(result)
    result = result.first if result.respond_to?(:map)
    "#{result.class.name}Serializer".constantize
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
