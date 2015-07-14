require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'responds with a collection of its users' do
    role = Role.new(title: "user")

    expect(role).to respond_to(:users)
  end
end
