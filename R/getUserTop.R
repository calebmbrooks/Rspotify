#'Get a user's top artists or tracks
#'
#'
#'
#'@param artists Whether the information requested is artists or tracks, either TRUE (artists) or FALSE (tracks)
#'@return Get the current user's top artists or tracks
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

getUserTop<-function(artists=T,token){
  req <- httr::GET(paste0("https://api.spotify.com/v1/me/top/",artists), httr::config(token = token))
  json1<-httr::content(req)
  json1 <- jsonlite::fromJSON(json1)
  if(artists){
    dados=data.frame(id=json1$id,
                     name=json1$name,
                     popularity=json1$popularity,
                     followers=json1$followers$total,
                     genres=paste(json1$genres,collapse =";"))
  }
  else{
    dados=data.frame(id=json1$id,
                     name=json1$name,
                     explicit=json1$explicit,
                     popularity=json1$popularity,
                     artists = paste(lapply(json1$artists, function(x) x$name), collapse = ";"),
                     artists_IDs=paste(lapply(json1$artists, function(x) x$id), collapse = ";"),
                     album=json1$album$name,
                     albumID=json1$album$id)

  }
  return(dados)
}


