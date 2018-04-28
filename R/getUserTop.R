#'Get a user's top artists or tracks
#'
#'
#'
#'@param artists Whether the information requested is artists or tracks, either TRUE (artists) or FALSE (tracks)
#'@return Get the current user's top artists or tracks
#'@param token An OAuth token created with \code{spotifyOAuth}.
#'@export

getUserTop<-function(artists=T,limit = 20,token){
  if(artists)
    type <- "artists"
  else
    type <- "tracks"
  req <- httr::GET(paste0("https://api.spotify.com/v1/me/top/", type, "/?limit=", limit), httr::config(token = token))
  json1<-httr::content(req)
  #json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))$items
  json2 <- json1
  if(artists){
    dados=data.frame(id=json2$id,
                     name=json2$name,
                     popularity=json2$popularity,
                     followers=json2$followers$total,
                     genres=paste(json2$genres,collapse =";"))
  }
  else{
    dados=data.frame(id=json2$id,
                     name=json2$name,
                     explicit=json2$explicit,
                     popularity=json2$popularity,
                     artists = paste(lapply(json2$artists, function(x) x$name), collapse = ";"),
                     artists_IDs=paste(lapply(json2$artists, function(x) x$id), collapse = ";"),
                     album=json2$album$name,
                     albumID=json2$album$id)

  }
  return(dados)
}


