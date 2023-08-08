require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'POST /api/v1/users' do
    it 'creates a user' do

      user_params = {
                      "name": "Odell",
                      "email": "goodboy@ruffruff.com",
                      "password": "treats4lyf",
                      "password_confirmation": "treats4lyf"
                    }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      created_user = User.last
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(json[:data][:type]).to eq('user')
      expect(json[:data][:id]).to eq(created_user.id.to_s)
      expect(json[:data][:attributes][:email]).to eq(created_user.email)
      expect(json[:data][:attributes][:api_key]).to eq(created_user.api_key)
    end

    it 'sends an error if passwords do not match' do
      user_params = {
                      "name": "Odell",
                      "email": "goodboy@ruffruff.com",
                      "password": "treats4lyf",
                      "password_confirmation": "treatslyf"
                    }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Validation failed: Password confirmation doesn't match Password")
    end

    it 'send an error if email is already taken' do
      User.create!(name:"Odell", email: 'goodboy@ruffruff.com', password: 'password', password_confirmation: 'password')

      user_params = {
                      "name": "Odell",
                      "email": "goodboy@ruffruff.com",
                      "password": "treats4lyf",
                      "password_confirmation": "treats4lyf"
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Validation failed: Email has already been taken")
    end

    it 'send an error if a field is missing' do
      user_params = {
                      "name": "Odell",
                      "password": "password",
                      "password_confirmation": "password"
                    }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Validation failed: Email can't be blank")
    end
  end
end