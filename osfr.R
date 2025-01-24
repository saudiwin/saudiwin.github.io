# load preprints from OSF

library(osfr)
library(jsonlite)
library(tidyverse)

osf_auth(token="jeUngza8raEJEC9RTIqXYv4G1ZrW6YO8AVTxAxPwSTqpnNf6oTYZTbl62KvRILo4Vmqykz")

my_info <- osf_retrieve_user("xd74f")
my_stuff <- osf_ls_preprints(my_info,n_max=Inf)

andrew_info <- osf_retrieve_user("vkqdx")
andrew_preprints <- osf_ls_preprints(andrew_info,n_max=Inf)

# filter for preprints

my_preprints <- filter(my_stuff, sapply(meta, function(item) {

  item$attributes$preprint
  
}),
! grepl(x=name,pattern="Supplemental materials for paper"))

# can't get just preprints

