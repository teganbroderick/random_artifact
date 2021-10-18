class RandomArtifactController < ApplicationController
  def index
    @artifact_metadata = RandomArtifactHelper::ArtifactFetcher.get_artifact
  end
end
