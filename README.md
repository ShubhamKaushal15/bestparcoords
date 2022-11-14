# edav-bestparcoords-cc
sk5118 day2127

## EDAV Community Contribution Project: R-package to find best order of features when creating a parallel coordinates plot.

### Implementation details:
Find the highest correlated features, then greedily find the next highest correlated feature with one of the initial features, repeat until there are no features left.

We have found that this does a good job of creating a preliminary ordering that can then be adjusted by need.

Followed this guide to make this function an R package: https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html
