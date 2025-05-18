# function to create the matrixes of outcome, standard deviation and arm size
# rows = studies, columns = treatments
reshape_to_matrix <- function(df, value_col, nt) {
  tidyr::pivot_wider(df, id_cols = study, names_from = treatment, 
              values_from = {{ value_col }}) %>%
    select(as.character(1:nt)) %>%
    as.matrix()
}

prepare_data <- function(data){
	studies <- sort(unique(long_df$study)) # unique study labels, not necessary but good to have
	ns <- length(studies) # Number of studies

	trt <- sort(unique(long_df$treatment)) # unique treatment labels, not necessary but good to have
	nt <- length(trt) # number of treatments, not necessary but good to have
	ref <- 4 # choose the reference treatment

	na <- as.numeric(table(long_df$study)) # number of arms for each study

	y  <- reshape_to_matrix(long_df, y, nt) # outcome
	sd <- reshape_to_matrix(long_df, sd, nt) # standard deviation
	n  <- reshape_to_matrix(long_df, n, nt) # number of patients 

	# create the matrix of the treatments in each arm
	# rows = studies, columns = arm
	t <- matrix(NA_integer_, nrow = ns, ncol = max(na))
	for(i in 1:ns){
	  t[i, 1:na[i]] <- long_df[long_df$study == trial[i], "treatment"]
	}

	return(list(y = y, # outcome
                n = n,  # number of patients per arm
                sd = sd,  # standard deviation
                t = t,  # treatments for each study
                ns = ns, # number of studies
                na = na,  # number of arms
                ref = ref, # reference treatment
                x = x, # covariates
                studies = studies, # study labels
                trt = trt, # treatment labels
                nt = nt # number of treatments
                 )

	)
}