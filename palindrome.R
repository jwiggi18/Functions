#to check if a string is a palindrome

NPstring <- "GAATAC" #non-palindrome
Pstring <- "GAATTC" #palindrome

# splits a character vector into substrings, searches the query strand for each base (letter in the DNA 'alphabet') and inserts the complementary base in the same location on the newly created complementary strand
complementCreate <- function(str) {
  #strplit the query strand into substrings
  stringVector <- strsplit(str, "") [[1]]
  #create empty vector length of the query strand
  compStr <- rep(NA, length(stringVector))
#search the query strand for each possible letter in the DNA 'alphabet' and put the complementary letter in the corresponding location on the complementary strand
for (i in seq_along(stringVector)) {
  if (stringVector[i]=="G") {
    compStr[i] <- "C" 
  } else if(stringVector[i]=="C") {
      compStr[i] <- "G" 
  } else if(stringVector[i]=="A") {
      compStr[i] <- "T" 
  } else if(stringVector[i]=="T") {
      compStr[i] <- "A" 
  }
}
return(compStr)
}

PcompStr <- complementCreate(Pstring)
NPcompStr <-complementCreate(NPstring)

#for loop version to check if a string is a palindrome
palindromeCheck <- function(str) {
  #call the function complementCreate to produce a complementary strand
  compStr <- complementCreate(str)
  #reverse the complementary strand so that positions line up with the query strand
  compStrRev <- paste(rev(compStr))
  #split the query strand
  str_splt <- strsplit(str, "") [[1]]
  #iterate through the query strand if any position on the query strand does not exactly match the reversed complementary strand print false other and exit the function, otherwise print true
  for (i in seq_along(str_splt)) {
    if(str_splt[i] != compStrRev[i]) {
      print("FALSE")
      break
     } else {
      print("TRUE")
    }
  }
}

#option without for loop
  palindromeCheck2 <- function(s) {
    #call the function complementCreate to produce a complementary strand
    compStr <- complementCreate(s)
    #reverse the complementary strand so that positions line up with the query strand
    compStrRev <- paste(rev(compStr), collapse = "")
    #call identical function and return output
    identical(s, compStrRev)
}


palindromeCheck2(Pstring)
palindromeCheck2(NPstring)

#to test components of the function

#split the query strands
Pstring_splt <- strsplit(Pstring, "") [[1]]
NPstring_splt <- strsplit(NPstring, "") [[1]]

#create the complements
PcompStr <- complementCreate(Pstring)
NPcompStr <- complementCreate(NPstring)

#reverse the complements
PcompStrRev <- paste(rev(PcompStr))
NPcompStrRev <- paste(rev(NPcompStr), collapse = "")

PcompRev <- paste(rev(PcompStr), collapse = "")
NPcompRev <- paste(rev(NPcompStr), collapse = "")

for (i in seq_along(Pstring_splt)) {
  if(Pstring_splt[i] != PcompStrRev[i]) {
    print("FALSE")
    break
    } else {
    print("TRUE")
    }
  }

for (i in seq_along(NPstring_splt)) {
  if(NPstring_splt[i] != NPcompStrRev[i]) {
    print("FALSE")
    break
  } else {
    print("TRUE")
  }
}


identical(Pstring, PcompRev)



