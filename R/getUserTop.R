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
req <- httr::GET(paste0("https://api.spotify.com/v1/me/top/", type, "?limit=", as.character(limit)), httr::config(token = token))
json1<-httr::content(req)
json2<-jsonlite::fromJSON(jsonlite::toJSON(json1))$items
if(artists){
  dados=data.frame(id=unlist(json2$id),
                    name=unlist(json2$name),
                    popularity=unlist(json2$popularity),
                    followers=unlist(json2$followers),
                    genres=unlist(lapply(json2$genres, paste, collapse = ";")))
}else{
  artist_dfs <- lapply(json2$artists, data.frame)
  dados=data.frame(id=unlist(json2$id),
                   name=unlist(json2$name),
                   explicit=unlist(json2$explicit),
                   popularity=unlist(json2$popularity),
                   artists=unlist(lapply(lapply(artist_dfs, function(x) x$name), collapse = ";", paste)),
                   artists_IDs=unlist(lapply(lapply(artist_dfs, function(x) x$id), collapse = ";", paste)),
                   album=unlist(json2$album$name),
                   albumID=unlist(json2$album$id))
}

return(dados)

}






