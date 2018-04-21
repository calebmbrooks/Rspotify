#'Get a Track
#'
#'
#'Get Spotify catalog information for a single track or a set of tracks (max 100) identified by their unique Spotify IDs.
#'@param id The Spotify ID for the track.
#'@return 'Get Spotify audio features analysis for a single track identified by its unique Spotify ID.
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

getTrack<-function(id, token){
  if(is.vector(id)){
    id <- paste(id, collapse=',')
  }
  req<-httr::content(httr::GET(paste0("https://api.spotify.com/v1/audio-features/",id),
                               httr::config(token = token)))
  return(data.frame(
    id=req$id,
    acousticness=req$acousticness,
    danceability=req$danceability,
    duration_ms=req$duration_ms,
    energy=req$energy,
    instrumentalness=req$instrumentalness,
    key=req$key,
    liveness=req$liveness,
    loudness=req$loudness,
    speechiness=req$speechiness,
    tempo=req$tempo,
    valece=req$valence))
}

