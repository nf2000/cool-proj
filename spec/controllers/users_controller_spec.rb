require 'rails_helper'

RSpec.describe UsersController , type: :controller do
    describe 'POST create' do
        it 'assigns user' do 
            post :create, params: {user: {firstname: "Nimra", surname: "Fatima", email: "Nimra@email.com", password: "password", password_confirmation: "password"}}
            expect(assigns[:user].email).to eq("Nimra@email.com")
        end
       context 'user successfully saves' do
            it 'creates a user in db' do 
                post :create, params: {user: {firstname: "Nimra", surname: "Fatima", email: "Nimra@email.com", password: "password", password_confirmation: "password"}}
                first_user = User.last
                puts User.all.count
                expect(first_user.firstname).to eq("Nimra")
                expect(first_user.surname).to eq("Fatima")
                expect(first_user.email).to eq("Nimra@email.com")

                expect do
                    post :create, params: {user: {firstname: "Nimra", surname: "Fatima", email: "fatima@email.com", password: "password", password_confirmation: "password"}}
                end.to change(User, :count).by(1) 
            end

            it 'sets a flash message' do
                post :create, params: {user: {firstname: "Nimra", surname: "Fatima", email: "Nimra@email.com", password: "password", password_confirmation: "password"}}
                expect(flash[:success]).to eq("User created Nimra")
            end

            it 'redirects to root path' do 
                post :create, params: {user: {firstname: "Nimra", surname: "Fatima", email: "Nimra@email.com", password: "password", password_confirmation: "password"}}
                expect(response).to redirect_to root_path
            end 

            it 'creates a session' do 
                post :create, params: {user: {firstname: "Nimra", surname: "Fatima", email: "Nimra@email.com", password: "password", password_confirmation: "password"}}
                expect(session[:user_id]).to eq(User.last.id)
            end
       end
       context 'user does not save' do 
            it 'creates a flash message' do 
            
            end

            it 'renders new' do 
                post :create, params: {user: {surname: "Fatima", email: "Nimra@email.com", password: "password", password_confirmation: "password"}}
                expect(response).to render_template :new
            end

            it 'session not created' do 
            
            end

       end
    end
end