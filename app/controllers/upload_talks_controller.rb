class UploadTalksController < ApplicationController

  def index
    flash[:notice] = nil
  end

  def upload

    if params[:file]
      file_data = params[:file].path

      input = ProcessInputFile.new

      talks_array = Array.new

      File.open(file_data, "r").each_line do |line|
        talks_array.push input.process_line(line)
      end

      @tracks = build_tracks(talks_array)

      respond_to do |format|
        flash[:notice] = t(:conference_created)
        format.html
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, :alert => t(:file_req)  }
      end
    end

  end

  private
  def build_tracks(talks_array)

    builder = SessionBuilder.new
    count = 0
    tracks_array = Array.new

    tracks = builder.determine_number_of_tracks(talks_array)

    tracks.times do
      count += 1
      track = Track.new
      track.number = count

      sessions = builder.build_track_sessions(talks_array)

      track.session = sessions

      tracks_array << track
    end

    return tracks_array

  end

end
