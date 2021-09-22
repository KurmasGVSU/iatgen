library(purrr)
devtools::install("/Users/kurmasz/Documents/LocalResearch/IAT/MyFork/iatgen")
library(iatgen)
# devtools::load_all(iatgen)

baseURL <- "https://www.cis.gvsu.edu/~kurmasz/IATsounds/"

sounds <- c("cele", "cipo", "zapa", "zulo") 

sSounds <- map(sounds, ~ paste(baseURL, .x, "_s.wav", sep=""))
thSounds <- map(sounds, ~ paste(baseURL, .x, "_z.wav", sep=""))

print("sSounds:  ")
print(sSounds)
print("thSounds:  ")
print(thSounds)

writeIATfull(IATname="sth_v4",
             posname="'s' sound", 
             negname="'th' sound",
             Aname="Good", 
             Bname="Bad",
             catType="images",
             posimgs = sSounds,
             negimgs = thSounds,
             tgtType="words",
             Awords = c("Marvelous", "Superb", "Pleasure", "Beautiful", "Joyful", "Glorious", "Lovely", "Wonderful"),
             Bwords = c("Tragic", "Horrible", "Agony", "Painful", "Terrible", "Awful", "Humiliate", "Nasty"),
             
             #advanced options with recommended IAT settings
             n=c(16, 16, 32, 16, 32, 4, 4),   # number of trials per block
             qsf=TRUE,                          # outputs qualtrics file. If false, generates raw code
             note=TRUE,                         # include note reminding online particpnats of key assignments
             correct.error=TRUE,                # require particpnats to correct errors before proceeding
             pause=250,                         # pause between trials
             errorpause=300,                    # duration error message on screen; ignored if correct.error=TRUE
             tgtCol="black",                    # color for target labels + text stimuli
             catCol="green"                     # color for category labels + text stimuli
)