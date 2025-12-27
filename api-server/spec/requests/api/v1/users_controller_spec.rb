# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :request do
  describe "POST #sign_in" do
    let!(:user) { create(:user, email: "test@example.com", password: "password") }

    let(:email) { "test@example.com" }
    let(:password) { "password" }

    let(:params) { { email:, password: } }

    subject { post sign_in_api_v1_users_url, params: }

    it "returns 200" do
      aggregate_failures do
        expect(subject).to eq(200)

        res_body = JSON.parse(response.body).deep_symbolize_keys
        expect(res_body[:token]).to be_present
        expect(res_body[:error]).to eq("")
      end
    end

    context "when the email is invalid" do
      let(:email) { "invalid@example.com" }
      let(:password) { "password" }

      it "returns 400" do
        aggregate_failures do
          expect(subject).to eq(400)

          res_body = JSON.parse(response.body).deep_symbolize_keys
          expect(res_body[:token]).to be_blank
          expect(res_body[:error]).to eq("メールアドレスまたはパスワードに該当するユーザが見つかりません。")
        end
      end
    end

    context "when the password is invalid" do
      let(:email) { "test@example.com" }
      let(:password) { "invalid" }

      it "returns 400" do
        aggregate_failures do
          expect(subject).to eq(400)

          res_body = JSON.parse(response.body).deep_symbolize_keys
          expect(res_body[:token]).to be_blank
          expect(res_body[:error]).to eq("メールアドレスまたはパスワードに該当するユーザが見つかりません。")
        end
      end
    end
  end
end
