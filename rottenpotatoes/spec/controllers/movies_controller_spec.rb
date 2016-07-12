require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "MoviesController" do
    
    context "Similar Movies" do
      before :each do
        Movie.create(title: 'Star Wars', rating: 'PG', director: 'George Lucas', release_date: Date.new(1977,5,25))
        Movie.create(title: 'Blade Runner', rating: 'PG', director: 'Ridley Scott', release_date: Date.new(1982,6,25))
        Movie.create(title: 'THX-1138', rating: 'R', director: 'George Lucas', release_date: Date.new(1971,3,11))

        @movies = Movie.all
      end

      it "Should be render a template for similar movies" do
        movie = @movies.take

        get :similar, movie_id: movie.id

        expect(response).to render_template(:similar)
      end

    end
      
  end

end