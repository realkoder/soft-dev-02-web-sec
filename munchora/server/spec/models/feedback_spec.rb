require 'rails_helper'

RSpec.describe Feedback, type: :model do
  subject(:feedback) { described_class.new(valid_attributes) }

  let(:valid_attributes) do
    {
      name: "Jane Doe",
      email: "jane@example.com",
      category: "bug",
      message: "There is a problem on the homepage."
    }
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(feedback).to be_valid
    end

    context "name" do
      it "is invalid without a name" do
        feedback.name = ""
        expect(feedback).not_to be_valid
        expect(feedback.errors[:name]).to include("can't be blank")
      end

      it "is invalid if name is too short" do
        feedback.name = ""
        expect(feedback).not_to be_valid
      end

      it "is invalid if name is too long" do
        feedback.name = "A" * 61
        expect(feedback).not_to be_valid
      end
    end

    context "email" do
      it "is invalid without an email when provider is blank" do
        feedback.email = ""
        expect(feedback).not_to be_valid
        expect(feedback.errors[:email]).to include("can't be blank")
      end

      it "is invalid if email is too short" do
        feedback.email = "a@b"
        expect(feedback).not_to be_valid
      end

      it "is invalid if email is too long" do
        feedback.email = "#{"a" * 91}@example.com"
        expect(feedback).not_to be_valid
      end

      it "is invalid if email format is wrong" do
        feedback.email = "invalid-email"
        expect(feedback).not_to be_valid
      end
    end

    context "category" do
      it "is invalid when blank" do
        feedback.category = nil
        expect(feedback).to be_invalid
      end

      it "is invalid if too long" do
        feedback.category = "a" * 41
        expect(feedback).to be_invalid
      end
    end

    context "message" do
      it "is valid when blank" do
        feedback.message = nil
        expect(feedback).to be_invalid
      end

      it "is invalid if too long" do
        feedback.message = "a" * 2001
        expect(feedback).not_to be_valid
      end
    end
  end
end
