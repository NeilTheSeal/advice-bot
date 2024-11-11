class OpenaiService
  def initialize(message)
    @url = "https://api.openai.com"
    @message = message
  end

  def generate_advice # rubocop:disable Metrics/MethodLength
    conn = Faraday.new(url: @url)

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{Rails.application.credentials.openai[:api_key_new]}"
    }

    body = {
      model: "gpt-3.5-turbo",
      messages: [{
        role: "user",
        content: @message
      }],
      temperature: 0.7
    }.to_json

    response = conn.post("/v1/chat/completions", body, headers)

    body = JSON.parse(response.body)

    body.dig("choices", 0, "message", "content")
  end
end
