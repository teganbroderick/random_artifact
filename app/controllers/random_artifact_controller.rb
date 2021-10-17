require 'uri'
require 'net/http'

class RandomArtifactController < ApplicationController
  def index
    @header = "Random Artifact"
    @artifact_response = request_artifact
    @artifact_metadata = parse_artifact_response(@artifact_response)
  end


  private
  
  def request_artifact
    random_number = rand(100000..999999)

    uri = URI('https://api.vam.ac.uk/v2/museumobject/O' + random_number.to_s)
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess) && image_exists?(response)
      return JSON.parse(response.body)
    else
      request_artifact
    end
  end

  def image_exists?(response)
    !JSON.parse(response.body)["meta"]["images"].nil?
  end

  def parse_artifact_response(artifact_response)
    metadata = {}
    
    meta = @artifact_response["meta"]
    record = @artifact_response["record"]

    metadata["image_url_full"] = meta["images"]["_iiif_image"] + "full/max/0/default.jpg"
    metadata["accession_number"] = record["accessionNumber"]
    metadata["title"] = title(record)
    metadata["artist_maker"] = artist_maker(record)
    metadata["description"] = record["physicalDescription"]
    metadata["object_type"] = record["objectType"]
    metadata["date"] = date(record)

    metadata
  end 

  def title(record)
    record["titles"].empty? ? "" : record["titles"][0]["title"]
  end

  def artist_maker(record)
    record["artistMakerPerson"].empty? ? "" : record["artistMakerPerson"][0]["name"]["text"]
  end

  def date(record)
    record["productionDates"].empty? ? "" : record["productionDates"][0]["date"]["text"]
  end
end
