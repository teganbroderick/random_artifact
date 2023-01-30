import React, { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";
import Header from "../components/Header";
import ArtifactData from "../components/ArtifactData";
import Footer from "../components/Footer";


const RandomArtifact = () => {
  return (
    <>
      <Header />
      <ArtifactData />
      <Footer />
    </>
    )
};

export default RandomArtifact;