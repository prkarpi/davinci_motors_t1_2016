require 'rails_helper'

feature 'Creating A Car' do
  scenario 'can create a new car' do
    car = FactoryGirl.create(:car)
    visit '/'
    #make = FactoryGirl.create(:make)
    # click_link 'New Car'
    #save_and_open_page
    expect(page).to have_content("#{car.make}")

    expect(page).to have_content(click_link 'New Car')
    # fill_in 'model', with: car.model
    # fill_in 'year', with: car.year
    # fill_in 'price', with: car.price
    # click_button 'Create Car'
    # expect(page).to have_content("#{car.year} #{car.make} #{car.model} #{car.price}created")
  end

  scenario 'can create a second new ' do
    car2 = FactoryGirl.create(:car)
    visit '/'
    expect(page).to have_content("#{car2.make}")
  end

  scenario 'can show a price' do
    car = FactoryGirl.create(:car)
    visit '/'
    expect(page).to have_content("#{car.price}")
  end

  scenario 'can show a price' do
    car2 = FactoryGirl.create(:car)
    visit '/'
    expect(page).to have_content("#{car2.price}")
  end

  # scenario 'can create a Chevy car' do
  #   visit '/'
  #   click_link 'New Car'
  #   fill_in 'Make', with: 'Chevy'
  #   fill_in 'Model', with: 'Camaro'
  #   fill_in 'Year', with: '1971'
  #   fill_in 'Price', with: '2700'
  #   click_button 'Create Car'
  #   expect(page).to have_content("1971 Chevy Camaro created")
  # end
end

feature 'Editing a Car' do
  scenario 'can edit a car' do
    car = FactoryGirl.create(:car)
    visit edit_car_path(car)
    fill_in 'Make', with: 'Chevy'

    #save_and_open_page
    click_button 'Update Car'
    expect(page).to have_content("Chevy")
    # car = @car
    # visit edit_car_path(:car)
    # fill_in 'Make', with: car.model
    # click_link 'Edit a Car'
  end
end

# feature 'Listing Cars' do
#   scenario 'lists cars available' do
#     car = @car
#
#     fill_in 'Make', with: car.model
#
#   end
# end

# feature 'User edits the existing product' do
#   car = FactoryGirl.create(:car)
#
# end
