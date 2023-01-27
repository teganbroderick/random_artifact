class Api::V1::RandomArtifactController < ApplicationController
  def index
    artifact_metadata = RandomArtifactHelper::ArtifactFetcher.get_artifact
    
    if artifact_metadata
      render json: artifact_metadata
    else
      artifact_metadata json: artifact_metadata.errors
    end
  end
end
