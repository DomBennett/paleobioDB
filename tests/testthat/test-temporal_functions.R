# test for the temporal functions


data<-  pbdb_occurrences (limit="100", vocab="pbdb",
                          base_name="Canidae",  interval="Quaternary", 
                          show=c("phylo", "ident"))

context("pbdb_temporal_resolution")
test_that("pbdb_temporal_resolution output is a dataframe, and the names are characters", {
 
  response<- pbdb_temporal_resolution (data, do.plot=F)
  expect_true(is.list (response))
  expect_is (names (response)[1], "character")
  expect_true (length (response)==2)
})

context("pbdb_time_spam")
test_that("pbdb_time_spam output is a dataframe, and the names are characters", {

  response<-  pbdb_time_spam (data, rank="species", do.plot=F)
  expect_true(is.data.frame (response))
  expect_is (names (response)[1], "character")
  expect_true (dim (response)[1]>=1)
})


context("pbdb_richness")
test_that("pbdb_richness output is a dataframe, and the names are characters", {
  response<-  pbdb_richness (data, 
                             rank="family", 
                             resolution=1, 
                             temporal_extent=c(0,3), do.plot=F)
  expect_true(is.data.frame (response))
  expect_is (names (response)[1], "character")
  expect_true (dim (response)[1]>=1)
})

context("pbdb_evo_ext")
test_that("pbdb_evo output is a dataframe, and the names are characters", {
  response<-  pbdb_evo (data, 
                             rank="family", 
                             , do.plot=F)
  expect_true(is.data.frame (response))
  expect_is (names (response)[1], "character")
  expect_true (dim (response)[1]>=1)
})
