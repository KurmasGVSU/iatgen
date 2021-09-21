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

writeIATfull(IATname="sth_v3",
             posname="Good", 
             negname="Bad",
             Aname="'s' sound", 
             Bname="'th' sound",
             catType="words",
             poswords = c("Marvelous", "Superb", "Pleasure", "Beautiful", "Joyful", "Glorious", "Lovely", "Wonderful"),
             negwords = c("Tragic", "Horrible", "Agony", "Painful", "Terrible", "Awful", "Humiliate", "Nasty"),
             tgtType="images",
             Aimgs = sSounds,
             Bimgs = thSounds,
             
             #advanced options with recommended IAT settings
             n=c(16, 16, 32, 32, 16, 32, 32),   # number of trials per block
             qsf=TRUE,                          # outputs qualtrics file. If false, generates raw code
             note=TRUE,                         # include note reminding online particpnats of key assignments
             correct.error=TRUE,                # require particpnats to correct errors before proceeding
             pause=250,                         # pause between trials
             errorpause=300,                    # duration error message on screen; ignored if correct.error=TRUE
             tgtCol="black",                    # color for target labels + text stimuli
             catCol="green"                     # color for category labels + text stimuli
)