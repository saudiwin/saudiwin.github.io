calc_points <- function(dims=NULL,rectangle_scores=NULL,labels=NULL) {
  
  # Four possible quadrants, so four possible ways to calculate points
  out_all <- apply(dims,2,function(x) {
    m <- -1/(x[2]/x[1])
    b <- x[2] - m*x[1]
    x_int <- -b/m
    out_x <- seq(from=rectangle_scores['max_x'],to=rectangle_scores['min_x'],
                     length.out=1000) 
    points <- out_x*m + b
    in_range_y <- (points<rectangle_scores['max_y']) & (points>rectangle_scores['min_y'])
    if(!all(in_range_y)) {
      if(sum(in_range_y)==0) {
        out_x <- seq(from=rectangle_scores['max_x']+5,to=rectangle_scores['min_x']-5,
                     length.out=1000) 
        points <- out_x*m + b
        in_range_y <- (points<rectangle_scores['max_y']) & (points>rectangle_scores['min_y'])
      }
      out_x <- out_x[in_range_y]
      out_x <- seq(from=min(out_x),to=max(out_x),
                   length.out=1000) 
      points <- out_x*m + b
    }
    return(list(xpoints=out_x,ypoints=points))
  })
  names(out_all) <- labels
  out_all <- lapply(out_all,as_data_frame)
  out_all <- bind_rows(out_all)
  out_all$categories <- rep(labels,each=1000)
  return(out_all)
}