require 'rails_helper'

RSpec.feature "CreateWidgets", type: :feature do
  context 'success' do
    let!(:api_widget) do
      {
        'id' => 'widget uid',
        'name' => 'Awesome cool',
        'description' => 'Any desc',
        'kind' => 'visible'
      }
    end

    # TODO: factory girl integration
    let!(:user) do
      User.create!(
        email: "#{SecureRandom.uuid}@example.com",
        password: SecureRandom.uuid,
        first_name: 'a',
        last_name: 'b',
        token: { 'access_token' => 'bb' }
      )
    end

    specify 'create widget' do
      allow_any_instance_of(Api::WidgetsAgent).to receive(:create).and_return({ 'id' => 'widget uid'})
      allow_any_instance_of(Api::WidgetsAgent).to receive(:index).and_return('widgets' => [api_widget])
      login_as(user, :scope => :user)
      visit new_widget_path
      expect(page).to have_content 'Create Widget'
      fill_in 'Name', with: "Awesome cool #{SecureRandom.uuid}"
      fill_in 'Description', with: 'Any desc'
      click_on 'Create'

      expect(page).to have_content 'Widget has been successfully created'
    end
  end

end
