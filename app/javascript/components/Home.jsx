import React, { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";

const RandomArtifact = () => {
  const navigate = useNavigate();
  const [artifact, setArtifact] = useState("");
  
  useEffect(() => {
    const url = `/api/v1/random_artifact/index`
    fetch(url)
      .then((response) => {
        if (response.ok) {
          console.log("got a response")
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then((response) => {
        console.log("setting response" + JSON.stringify(response))
        setArtifact(response)

      })
      .catch(() => navigate("/"));
    }, []);


  return (
    <div>
      <h1>A Random Artifact v2.0</h1>

      <p>Title: {artifact.title}</p>
      <p>Artist: {artifact.artist_maker}</p>
      <p>Accession: {artifact.accession_number}</p>
      <p>Description: {artifact.description}</p>
      <p>Type: {artifact.object_type}</p>
      <p>Date: {artifact.date}</p>
      <img src={artifact.image_url_full} />
    </div>
  )
};

export default RandomArtifact;