% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getFeatures.R
\name{getFeatures}
\alias{getFeatures}
\title{Get audio feature information for up to 100 tracks identified by their unique Spotify IDs.}
\usage{
getFeatures(spotify_ID, token)
}
\arguments{
\item{spotify_ID}{The Spotify ID for the track, or a vector of track IDs}

\item{token}{An OAuth token created with \code{spotifyOAuth}.}
}
\description{
function to get audio feature information for a single track identified by its unique Spotify ID.
}
