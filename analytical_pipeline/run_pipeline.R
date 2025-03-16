library(stringr)

setwd("/Users/admin/Desktop/BAARD_Scripts/")
df <- read.csv("opt_medication_1.csv")

df$bup_flag <- apply(df, 1, function(row) {
  if (any(str_detect(tolower(row), "bupropion"))) {
    return("1")
  } else {
    return(NA)
  }
})

df$ari_flag <- apply(df, 1, function(row) {
  if (any(str_detect(tolower(row), "aripiprazole"))) {
    return("1")
  } else {
    return(NA)
  }
})

df$adh_flag <- apply(df, 1, function(row) {
  # Convert to lowercase for case-insensitive matching and remove NA values
  if (any(str_detect(tolower(row), "not taking it at all"), na.rm = TRUE)) {
    return("1")
  } else {
    return(NA)
  }
})

df$both_flagged <- ifelse(!is.na(df$bup_flag) & !is.na(df$ari_flag), "1", NA)
both_flagged_rows <- df[!is.na(df$both_flagged), ]

df$neither_flagged <- ifelse(is.na(df$bup_flag) & is.na(df$ari_flag), "1", NA)
neither_flagged_rows <- df[!is.na(df$neither_flagged), ]

df_arip_only <- df[!is.na(df$ari_flag) & is.na(df$bup_flag), ]
df_bup_only <- df[!is.na(df$bup_flag) & is.na(df$ari_flag), ]
