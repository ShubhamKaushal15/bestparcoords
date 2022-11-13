#' Create best parallel coords
#'
#' Returns the order to put columns in for a starting point for the best parallel coordinates.
#' Also creates a preliminary plot with the returned order.
#' The columns should be scaled according to user discretion and should not be categorical.
#'
#' @param df A dataframe with non-categorical columns
#' @return The column names in the best order
#' @export
bestparcoord <- function(df) {
  # Find correlations of variables
  mat <- cor(df)

  # Find 2 columns with highest correlation
  best <- 0
  best_i <- NA
  best_j <- NA
  for(i in 1:nrow(mat)) {
    for(j in i:ncol(mat)) {
      corr = abs(mat[i, j])
      if(corr > best && corr < 1) {
        best <- corr
        best_i <- i
        best_j <- j
      }
    }
  }

  # Find the ordering of columns to maximize
  # Start with the columns with the highest correlation
  cols <- c(best_i, best_j)
  idx <- best_j

  while(length(cols) < ncol(mat)) {
    best <- 0
    best_idx <- NA
    for(j in 1:ncol(mat)) {
      corr <- abs(mat[idx, j])
      # If we haven't used this column before and it's the best correlation
      # we've seen
      if(idx != j && !is.element(j, cols) && corr > best) {
        best <- corr
        best_idx <- j
      }
    }
    # Use the best correlation found next
    cols <- append(cols, best_idx)

    # Check the column we just added for the next one to use
    idx <- best_idx
  }
  print(GGally::ggparcoord(df, columns=cols, splineFactor=10, alphaLines=0.5))
  return(colnames(df)[cols])
}
