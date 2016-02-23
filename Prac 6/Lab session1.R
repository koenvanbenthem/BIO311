######################################################################
######### Practical 2: Data Exploration and Introduction to R ########
###### (C) Andrew R Marshall - Statistics & Quantitative Methods #####
######################################################################

### This practical uses the file Carbon.txt, which contains the carbon content of 18 plots of tropical forest trees, along with a number of predictor variables)
### IMPORTANT: For all practicals, answers to all exercises will be uploaded to the VLE on a powerpoint slideshow

# In this and all later Tinn-R files, instructions and explanations are written in green, preceded by a hash sign (#)
# Tinn-R is used to store and edit code so that you have a permanent record of what methods you have employed that can be easily altered if necessary
# It is good practice to make a new Tinn-R file for each set of analyses that you work on (e.g. for each practical or assignment) 

# All of the following text can be copied to R, but anything preceded by a hash sign (shown in green type) will be ignored
# Text that is not green will produce a response in R, and should be copied to R in the order shown here as indicated by the instructions
# Where there is a lot of text on one line in Tinn-R, you can scroll to the left using the scroll bar at the bottom of the screen. As in MS Offfice packages, to quickly jump to the start or end of a line just hit the "Home" or "End" key as appropriate (Try hitting "Home" now, then "End").

### IMPORTANT: If you miss steps in the Tinn-R file instructions for each practical, this could cause problems, so please go through every step ###
### IMPORTANT: Once you close R it will not save your work. So for every session using R it is a good idea to store your code and notes in a separate Tinn-R, so that when you come back to carry on your work you can simply copy and paste your code back into R to begin again where you left off. By including notes with your code it will also help you to remember why you did each step and what the code means.

# Most actions in R use "functions", that typically require one or more "arguments"
# If an argument is not entered into a function then R will use the default settings (see Help section below)

# 4.1. HELP

# Before beginning it is important to become familiar with the extensive sources of help for using R...

# Firstly, if a line of code produces an error, use the up and down cursors to scroll through the previous code to see if there are any obvious typing errors

# General help is available within R
# Now type the following to see how you can get help
# Instead of typing any code from Tinn-R you can highlight the text, copy [Ctrl-C] and then paste [Ctrl-V])
# If your computer has been set up correctly, you may even be able to highlight the text and click Ctrl-R to instantly transfer the code to R (TRY IT!)

?plot                 # To display help on the function plot(), including the default settings
help(plot)            # Does the same as ?plot

# The help window typically has the following sections: Description, Usage, Arguments, Details, See Also, and Examples
# Try copying and pasting each line of code from the Examples section to see what the function can do. The Examples are usually designed to show a good range of outputs for the function, using objects that come as a standard component of the R library.

# EXERCISE 2.1
# 2.1.1. According to R help, what does the plot() function do?
# 2.1.2. Where else does the R help file say you can get help on the arguments that can be used for plotting?
# 2.1.3. What argument would you use to add a subtitle to a plot?

# If the thing you are searching for is not necessarily a function, you can use the following code as an alternative means of looking for help:

??plot                # To display help mentioning the term "plot"
help.search("plot")   # Does the same as ??plot

# See also course texts and CRAN Manuals/Vignettes/R-help mailing list or as a last resort try Google, including "CRAN" as one of the search terms

# Now you are ready to look at some data...

# 2.2. IMPORTING DATA

# Data can be imported manually using the grouping function c():

data <- c(32,34,34,2,564,12,53,3)     # Creates an object that is a one-dimensional vector named data

# Then to view the object just created, simply type its name and press enter:

data                                  # Displays the contents of object data

# Objects can be created to store pretty much anything

Andy <- "geek"
Andy
andy                         # Note that R is case sensitive so this will produce error message "Error: object "andy" not found" 

# However entering data manually is usually impractical and time consuming, so instead we import tab-delimited text files (.txt) as created in Excel at the end of the previous practical (or comma-delimited text files [.csv], and some other formats)

# In order to import data it helps to know the current location or "working directory"
# The working directory is where R will store any outputs that you tell R to save 
# We can tell this location using the function getwd() - this is an example of a function that needs no arguments

getwd()                               # Will display the current working directory e.g. "C:/Documents and Settings/Andy/My Documents"

# You can adjust the working directory using the following setwd() function, replacing the bit in the quotation marks with a file path relating to an area on your PC where you would like to store your R files:
### IMPORTANT: Setting the working directory is easy on your home computer as you can use a simple filepath like the one shown
### IMPORTANT: On the university classroom PCs the file path to your own drive IS NOT THIS SIMPLE, and rather than spending time working what the correct file path is, you might prefer to simply stick with the default working directory, and just copy and paste anything you have saved somewhere more convenient

### NO NEED TO TRY THIS CODE WHILE USING THE UNIVERSITY CLASSROOM PCs ### (see important note above)
setwd("C:/Documents and Settings/Andy/My Documents/Stats Practical 2") # This code sets a new working directory in the pre-existing folder "Stats Practical 2" in the file path shown

### IT IS NOT IMPORTANT THAT R FILES ARE NOT SAVED IN A CONVENIENT LOCATION
### YOUR TINN-R FILE CONTAINING ALL OF YOUR CODE AND NOTES IS THE IMPORTANT THING!!

# Note that spaces are ignored in R unless they are in quotes " ", which denote text (e.g. Crawley (2005) p26: y.even < -y[-1] could be better typed y.even <- y[-1])

# Now you can import the practical data using function read.table()

carbon.dat <- read.table(data = "c:\\Documents and Settings\Andy\My Documents\Stats Practical", header=TRUE, row.names = 1)

# Object "carbon.dat" is the name we have chosen for our dataframe (we could have called it anything: "trees", "Andy_data", "csdvadfbxffd", BUT only use simple characters with no spaces, i.e. not "Andy's data" - NOTE: it is a good idea to keep these names short to save lots of typing)
# The arrow sign "<-" means "do the stuff on the right and put it into the object on the left" 
# Arguments "header" and "row.names" indicate that the columns and rows have labels

# However you will probably prefer this alternative as you don't have to type the whole file path

carbon.dat <- read.table(file.choose(), header=TRUE, row.names = 1)   # Function file.choose() brings up a window so you can choose the file - see the lecture slides for a fully annotated description of this code

# The next step is to define the type of data
# If data are integers, decimal numbers or unordered factors labelled using text they do not need to be defined, however if they are ordered factors then they do
# IMPORTANT NOTE: if row and/or column names were specified when importing data above (row.names=1, header=TRUE) then for all subsequent code, column 1 [,1] or row 1 [1,] refer to the first data column/row, not the header column/row
# ordered=TRUE defines the data in the column as an ordered factor - in this case the data are 0/1, so because it is ordered, 1 means large and 0 means small, rather than just being categories such as colour
# Another example of an ordered factor would be something categorised as low, medium and high

carbon.dat[, 5] <- factor(carbon.dat[, 5], ordered=TRUE)              # i.e. the 5th column of data (in this case refering to variable "elephants", i.e. the presence/absence of elephants in carbon plots)
# The factor() function on the right of the arrow (<-) uses the argument ordered=TRUE (rather than ordered=FALSE for unordered factors such as colour) to say "take column 5 of carbon.dat, and define it as an ordered factor"
# The bit on the left of the arrow says "put the result of the function factor() into column 5 of carbon.dat"
# So in fact this takes the undefined data in column 5 and overwrites it with the same data defined as an ordered factor

# You can now repeat the process for all of the other ordered factors in the carbon.dat dataframe:

carbon.dat[, 6] <- factor(carbon.dat[, 6], ordered=TRUE)               
carbon.dat[, 7] <- factor(carbon.dat[, 7], ordered=TRUE)
carbon.dat[, 8] <- factor(carbon.dat[, 8], ordered=TRUE)
carbon.dat[, 9] <- factor(carbon.dat[, 9], ordered=TRUE)
carbon.dat[, 10] <- factor(carbon.dat[, 10], ordered=TRUE)

# An alternative to defining factors each time you load in new data is to use the notation factor(variablename) each time you use a variable that is a factor (replaceing "variablename" with the name of the variable)

# 2.3. VIEWING/SUMMARISING DATA

# The next step is to check that the data look okay
# The first simple check could be to see if the object has been created:

ls()                                           # Simply lists all active objects (another function that needs no arguments)

# However this does not show us whether the data have been importaed and defined correctly
# We have already seen that typing the name of an object displays it's contents
# From this we see that one of the variables is also called carbon, hence using "carbon.dat" rather than "carbon" to name the dataset to avoid confusion

carbon.dat

# However for large datasets this is impractical
# An alternative is to just display the first row of header names

names(carbon.dat)

# We can also view these headings together with the first few rows of data (in this case the header plus three rows)
# The square brackets are known as a "subscript" (i.e. locations within a vector matrix or dataframe)

carbon.dat[1:3,]

# Here are some alternative subscripts - the row numbers always come first, then columns

carbon.dat[,1:3]                               # First 3 columns of all rows
carbon.dat[7]                                  # 7th element
carbon.dat[3:8,]                               # Middle 6 rows of all columns
carbon.dat[3,2]                                # Third cell down in column 2

# All of these selections can also be made on variables within the dataframe

carbon.dat$elevation                       # Displays all the data in variable elevation in dataframe carbon.dat
carbon.dat$elevation[7]                    # Displays element 7 of variable elevation in dataframe carbon.dat

### IMPORTANT: Alternatively each variable can be accessed directly by first attaching the dataframe

attach(carbon.dat)
elevation              # Note that you can now access each variable directly, rather than using the dollar signs ($) above

# YOU WILL NEED TO USE THE ATTACH FUNCTION WHENEVER YOU WANT TO WORK DIRECTLY WITH THE VARIABLES, BUT BEWARE that if you do this twice for the same data set there will be two sets of variables floating around. This is especially problematic when you have edited the data, or where two separate datasets contain the same variable name.
# SEE BELOW: To avoid problems when using the attach() function it is better to close R before importing a new dataset, or at least "detach" the previously attached data set before reimporting, using detach() - SEE "DELETING AND DETACHING OBJECTS" BELOW

# And some more complicated subscripts...

carbon.dat[logging==1,]                        # Rows where tree-logging is present (NOTE: double equals sign == is used for defining something as "equal to", whereas != is used for defining something as "not equal to")
carbon.dat[elevation<1000 & rocks>0,]          # Rows where elevation is less than 1000 and where rocks are present
carbon.dat[order(carbon.dat[,1]),1:6]          # Columns 1-6 sorted by column 1 in ascending order
carbon.dat[rev(order(carbon.dat[,4])),c(4,6)]  # Columns 4 and 6 sorted by column 4 in descending order

# EXERCISE 2.3
# From the object carbon.dat, try to define and display the following selections:
# 2.3.1. The first four rows of data
# 2.3.2. The first six columns of data
# 2.3.3. All data in the variable slope
# 2.3.4. All data in the variable carbon for locations where there were no elephants
carbon.dat$carbon[elephants==0]

# Another way of getting an overview of the data is to use the str() command
# This is particularly useful for checking that factors have been defined properly

str(carbon.dat)

# Even more information about the data can be displayed using summary()
# This displays the minimum, maximum, quartiles, median and mean of each integer or decimal variable
# For factors it simply counts number of samples for each value

summary(carbon.dat)

# Selection of an appropriate summary statistic is the basis of parametric versus non-parametric methods in statistics - more next practical session

### DELETING AND DETACHING OBJECTS ###

# If you make an error in the creation of an object, you can use the following:
### DO NOT DO THESE NOW - JUST NOTE THAT THEY EXIST!! ###
rm(x,y,z)                                              # To remove variables x, y and z (always remove variables when you have finished with them)
detach(carbon.dat)                                     # To detach the previously attached object carbon.dat (always detach after finished using - advanced users avoid using attach as it can cause complications due to duplication of variable names e.g. when running models - alternative is to use with() - see Crawley [2008] The R Book))
rm(list=ls())                                          # To get rid of all variables and dataframes (be absolutely sure!)

# It is also a good idea to tidy up at the end of session using these same commands (or if you are moving on to a new analysis on a different dataset)

# 2.4. SAVING WORK

# Before closing R, you can also tell R to save anything that you want to keep. This may include:
# Code: You should already have all of your code in an annotated Tinn-R file so you shouldn't need to save this
# Outputs (e.g. summary statistics or test results): The simplest method is to just highlight anything you want with the cursor -> copy (ctrl C) -> paste (ctrl V) into a Tinn-R file (annotating carefully using # signs) or Word document
# Graphs: Right click on the graph and select Save As metafile.. to save as .emf file

### IT IS NOT IMPORTANT THAT YOUR R SESSION IS SAVED
### YOUR TINN-R FILE CONTAINING ALL OF YOUR CODE AND NOTES IS THE IMPORTANT THING!!
### IMPORTANT: For these reasons many R users typically don't use any more than the above methods of saving work (except for graphics - see below), but you should also be aware of the following alternatives:

# To display all command lines entered during a session:

history(Inf)                                          # Displays everything typed into R during a session
# This is a nice simple way to see all of your code, that can be copied and pasted into a Tinn-R file for reference

# A few different ways of saving all the text typed into, or produced by R:

savehistory("today.txt")                              # Saves everything typed into R during a session as a text file called today.txt, in the working directory (ALTERNATIVELY use the file.choose() notation from above to select a location and name through Windows explorer, but remember to give the name a .txt extension to save it as a text file)
# Alternatively if you know the file path to your desired location you can type that in between the quotation marks instead (as for setwd() above)
save(list=ls(), file="filename.Rdata")                # To save whole session as a binary file in the working directory (note that this use ls() from above) - replace the "filename" bit with a name of your choice
load("filename.Rdata")                                # To begin the session again at the point left when last saved (or just double-clicking on the file in Windows Explorer) - replace the "filename" bit with a name of your choice
# Alternatively just double-click on the file created in Windows Explorer
write.table(objectname, file="filename.txt", sep="\t", col.names = NA) # To save objects created in R to a tab-delimited text file - replace the "objectname" bit with the name of the object you wish to save, and replace the "filename" bit with a name of your choice

### IMPORTANT: When you shut down R you will be prompted to save the session ("Save workspace image"), however you should have saved anything you need by this point, so select No (if you select Yes, this will do the same as the save command above, but will save the session in the working directory, and will automatically run the next time you open R)
### If you accidently save workspace and keep getting message "[Previously saved workspace restored]" just delete the .RData file from the working directory or type unlink(".RData")

### IMPORTANT: THE METHOD FOR SAVING ANY GRAPHICAL OUTPUTS IS PERHAPS MORE USEFUL TO KNOW AS YOU MAY NEED THEM FOR PRESENTING YOUR DATA:
# 1) Click on the graphics window to check that it is active
# 2) Right click on the graphics window
# 3) Select Save and metafile (and navigate to the location where you would like to save the graphic)
# 4) To then insert in an MS Word document, open MS Word and select Insert > Picture (and then navigate to the place you saved the metafile)
# (alternative method for getting a graphic into a MS Word document: instead of selecting save, you could have selected "copy as a metafile", and then open the word document and paste it in as an "Enhanced metafile" (using Home > Paste > Paste Special)

# 2.5. CHECKING FOR ERRORS

# The first stage of data exploration is to check for errors
# The simplest way to check for obvious typos is to plot the data
# Two variables in the carbon.txt data have obvious typos, as revealed by the following plots:

plot(carbon)                # Produces a scatterplot of carbon versus position in the column (axis labelled index)
plot(logging)               # Produces a bar chart of the presence/absence of tree-logging versus position in column

# From these we can see clear outliers that have arisen due to typographical error and can identify and replace them as follows:
### IMPORTANT: This bit can be fiddly as it is important to get the detaching, correcting and attaching in the right order - otherwise R will not adjust the settings for the plot axes correctly as the uncorrected data range will be remembered
### IMPORTANT: It is always better to correct your original datafile, rather than just correcting this temporary onject created in R

detach(carbon.dat)          # We begin by detaching the original carbon.dat so that the uncorrected data are no-longer accessible directly

which(carbon.dat$carbon>1000)          # This asks the element of the vector that has a carbon value > 1000 (the answer is element 12)
# Recall the dollar-sign ($) notation from above, indicating that the biot on the right (carbon) is a variable within the dataframe on the left (carbon.dat)
# We can no longer access variable carbon directly because we have just deteached the dataframe carbon.dat
carbon.dat$carbon[12]                  # This displays element 12 and we see it is very high (2351.325), suggesting that the decimal place is out (235.1325)
carbon.dat$carbon[12] <- 235.1325      # This replaces element 12 with the correct value

which(carbon.dat$logging>1)            # This asks the element of the vector that has a logging value > 1 (the answer is element 14)
carbon.dat$logging[14]                 # This displays element 14 and we see it is 11, suggesting that this should be 1 (as can only be 0 or 1)
carbon.dat$logging[14] <- 1            # This replaces element 14 with the correct value

attach(carbon.dat)                     # Then we reattach the edited carbon.dat

# We can now check that the data have been altered correctly

carbon                      # To check that the number 2351.325 has been correctly replaced with 235.1325
plot(carbon)                
logging                     # To check that the number 11 has been correctly replaced with 1
plot(logging)               

# This process only corrects the data in the R objects, so it is good practice to correct the original text file and reimport the data at this point (also note that it messes up the scale of each variable [still includes the 11 label], so reimporting the data is also a good idea for this reason)
# A corrected version of Carbon.txt can be found in the same folder (Carbon_corrected.txt)
# The remainder of the data exploration will use Carbon_corrected.txt, so before we import this new dataset remember to remove and detach all objects used untill now as described in the last exercise (just copy the following code - beware this removes everything!):

rm(list=ls())

# Now import the Carbon_corrected.txt data and view the data as in the first exercise as follows (just copy all 10 rows in one go, but be sure that you understand what this is doing):

carbon.dat <- read.table(file.choose(), header=TRUE, row.names = 1)         # To import data  
carbon.dat[, 5] <- factor(carbon.dat[, 5], ordered=TRUE)        # To define 0/1 factors 
carbon.dat[, 6] <- factor(carbon.dat[, 6], ordered=TRUE)
carbon.dat[, 7] <- factor(carbon.dat[, 7], ordered=TRUE)
carbon.dat[, 8] <- factor(carbon.dat[, 8], ordered=TRUE)
carbon.dat[, 9] <- factor(carbon.dat[, 9], ordered=TRUE)
carbon.dat[, 10] <- factor(carbon.dat[, 10], ordered=TRUE)
carbon.dat[1:5,]                # To view the first five rows to check imported okay
str(carbon.dat)                 # To view summary of each column to check factors defined okay
attach(carbon.dat)              # To allow direct access to variables rather than just the overall dataframe carbon.dat

# 2.6. CHECKING FOR OUTLIERS / UNEVEN SAMPLING

library(MASS)                                 # Here we are calling a package called MASS that is needed for the histogram function
hist(carbon)                                  # Plots a histogram
truehist(carbon, nbins = "FD", col = "white") # Plots a histogram with area 1 (to best represent the normal distribution probability density function)
# Due to the nature of this function it needs more arguments than hist() to get the same appearance (e.g. colour white, and FD plotting method - see help file help(truehist))
plot(density(carbon))                         # Plots a kernel density plot (an estimate of the probability density function)
rug(carbon)                                   # Places marks along the x axis for each datapoint (to help interpretation of the kernel plot)
boxplot(carbon)                               # Box plot showing median, quartiles, whiskers (default setting is 5th and 95th percentile I think [?]) and outliers (points outside the whiskers)

# From all of these it seems that the variable carbon has reasonable spread (i.e. symmetrical without serious skew or outliers)

hist(slope)
truehist(slope, nbins = "FD", col = "white")
plot(density(slope))
rug(slope)
boxplot(slope)

# From these we see that the variable slope is negatively skewed (i.e. the data have a left-hand tail)

# 2.7. CHECKING FOR NORMALITY

# Q-Q plots are a simple method for determining whether data are from a normal distribution
# We first test this for the variable carbon

qqnorm(carbon)                                # This plots the expected quantiles for a normal distribution versus the actual quantiles
qqline(carbon)                                # This plots a line through the first and third quantiles indicating the ideal spread of points

# The points lie nicely along the Q-Q line, suggesting that the carbon data are normally distributed
# We now repeat the proces for the variable slope (i.e. the steepness of the mountain slope where each tree plot was positioned)

qqnorm(slope)
qqline(slope)

# The lower data values deviate markedly from the Q-Q line, suggesting that the data are not normally distributed
# If this is not conclusive then try statistical tests (Pracs 4 and 7)

# All of the above can also in fact be carried out and plotted in one screen by copying the following code (replacing all instances of "slope" with whichever variable you are interested in)
# In the next practical we will be exploring what some of these extra arguments mean so don't worry about the exact nature of the code - just copy and paste it all for now (but also see the help files for each function to start understanding each function used)

require(MASS)                                 # require() performs the same action as library()
oldpar <- par(mfrow = c(2,2), oma = c(0,0,2,0) + 0.1, no.readonly = TRUE)            # This splits the R graphics screen into 4 quarters
truehist(slope, nbins = "FD", col = "white", main = "Histogram", xlab = "Slope (degrees)", ylab = "Frequency", prob = FALSE) # Here prob = FALSE tells R to plot frequencies rather than probabilities
box()
plot(density(slope), xlab = "Slope (degrees)", main = "Kernel Density")
rug(slope)
qqnorm(slope)
qqline(slope)
boxplot(slope, ylab = "Slope (degrees)", main = "Boxplot")
mtext("Data Exploration Plots for Variable Slope", font = 2, outer = TRUE)    # This puts a heading over the four plots

# 2.8. Now try to import, view and summarise the rockpool data that we created in the last practical (Rockpool_15.txt is provided in the Prac 2 folder on the VLE), using the methods under 2.1-2.4
# (Again, it will help your understanding of R to create and edit all of your code here for future reference, rather than typing straight into R)

# Now try to answer the following questions:

# 2.8.1. Which of the rockpool variables need defining as factors?
# 2.8.2. What type of data does R use to define village names?
# 2.8.3. What are the mean, median & quartiles of species richness (i.e. number of species) in the polluted/unpolluted pools?
# 2.8.4. What does this suggest about the impact of the oil spill on gastropod biodiversity?
# 2.8.5. Any evidence of uneven sampling, outliers or skew?
# 2.8.6. Are any variables related to richness?  (TIP: use the plot command, incorporating two variables instead of one: plot(predictor,response))
# 2.8.7. Ribble village has been accused of not pulling its weight - is there evidence of reduced species richness for Ribble?

