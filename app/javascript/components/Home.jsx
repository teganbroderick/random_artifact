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
    <div className="container">
      <div className="row">
        <div className="col">
          <h1>A Random Artifact</h1>
        </div>
      </div>
      <div className="row">
        <div className="col">
          <img 
            src={artifact.image_url_full}
            width={500}
          />
        </div>
        <div className="col">
          <table className="table">
            <tbody>
              <tr> 
                <th> Accession Number </th>
                <td> {artifact.accession_number} </td>
              </tr>
              <tr> 
                <th> Title </th>
                <td> {artifact.title} </td>
              </tr>
              <tr> 
                <th> Description </th>
                <td> {artifact.description}</td>
              </tr>    
               <tr> 
                  <th> Object Type </th>
                  <td> {artifact.object_type} </td>
              </tr>   
              <tr> 
                  <th> Artist/Maker </th>
                  <td> {artifact.artist_maker}  </td>
              </tr> 
              <tr> 
                <th> Date </th>
                <td> {artifact.date} </td>
              </tr>  
            </tbody>   
          </table>
        </div>
      </div>
      <div className="row">
        <div className="col">
          <p></p>
        </div>
      </div>
    </div>
  )
};

export default RandomArtifact;