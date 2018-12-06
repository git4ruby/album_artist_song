module Api
  module V1
    class ArtistsController < ::Api::V1::ApplicationController
      before_action :set_artist, only: [:show, :edit, :update, :destroy, :song, :songs, :album, :albums]

      # GET /artists
      # GET /artists.json
      def index
        @artists = Artist.all
        respond_to_format(@artists)
      end

      # GET /artists/1
      # GET /artists/1.json
      def show
        respond_to_format(@artist)
      end

      # GET /artists/new
      def new
        @artist = Artist.new
      end

      # GET /artists/1/edit
      def edit
      end

      def songs
        @artist_songs = @artist.songs
        respond_to_format(@artist_songs)
      end
        
      # /api/v1/artists/mohit/songs/<song_id>
      # def song
      #   @artist_songs = @artist.songs
      #   @song = @artist_songs.find(params[:song_id])
      # end

      # /api/v1/artists/mohit
      def artist
      end

      # /api/v1/artists/mohit/albums
      def albums
        @artist_albums = @artist.albums
        respond_to_format(@artist_albums)
      end

      # /api/v1/artists/mohit/albums/<album_id>
      # def album
      #   @artist_albums = @artist.albums
      #   @album = @artist_albums.find(params[:album_id])
      # end

      # POST /artists
      # POST /artists.json
      def create
        @artist = Artist.new(artist_params)

        respond_to do |format|
          if @artist.save
            format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
            format.json { render :show, status: :created, location: @artist }
          else
            format.html { render :new }
            format.json { render json: @artist.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /artists/1
      # PATCH/PUT /artists/1.json
      def update
        respond_to do |format|
          if @artist.update(artist_params)
            format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
            format.json { render :show, status: :ok, location: @artist }
          else
            format.html { render :edit }
            format.json { render json: @artist.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /artists/1
      # DELETE /artists/1.json
      def destroy
        @artist.destroy
        respond_to do |format|
          format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_artist
          @artist = Artist.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def artist_params
          params.require(:artist).permit(:artist__name)
        end
    end
  end
end
