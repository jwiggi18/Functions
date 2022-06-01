#for loop structure
#for (item in list_of_items) {
# do_something(item)
#}

#calculate mass from volume
volumes <- c(1.6, 3, 8)
for (volume in volumes) {
  print(2.65 * volume^0.9)
}

#does the exact same thing as:
volume <- volumes[1]
print(2.65 * volume ^ 0.9)
volume <- volumes[2]
print(2.65 * volume ^ 0.9)
volume <- volumes[3]
print(2.65 * volume ^ 0.9)

#expand our look so that it first estimates the mass, then converts it from kilograms to pounds, and then prints out the value

for (volume in volumes){
  mass <- 2.65 * volume ^ 0.9
  mass_lb <- mass * 2.2
  print(mass_lb)
}

#to do the same with an index
volumes <- c(1.6, 3, 8)
for (i in 1:length(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  print(mass)
}

#create an empty vector the length of 'volumes' called 'masses'
masses <- vector(mode = "numeric", length = length(volumes))
masses

#loop through using an index to put the output into the empty vector at the ith position 
for (i in 1:length(volumes)){
  mass <- 2.65 * volumes[i] ^ 0.9
  masses[i] <- mass
}
masses

#looping over multiple vectors
b0 <- c(2.65, 1.28, 3.29)
b1 <- c(0.9, 1.1, 1.2)
volumes = c(1.6, 3, 8)
masses <- vector(mode="numeric", length=length(volumes))
for (i in seq_along(volumes)){
  mass <- b0[i] * volumes[i] ^ b1[i]
  masses[i] <- mass
}




#this works for first position
for (i in seq_along(stringVector)) {
    if ((stringVector[i]=="G")&(revString2[i]=="C")) {
      print("TRUE") } 
           else {
      print("FALSE")
  }  
}  

#trying to get it to work for all positions
for (i in seq_along(stringVector)) {
  if ((stringVector[i]=="G")&(revString2[i]=="C")) {
    if ((stringVector[i]=="C")&(revString2[i]=="G")) {
      #if ((stringVector[i]=="A")&(revString2[i]=="T")) {
       # if ((stringVector[i]=="T")&(revString2[i]=="A")) {
     print("TRUE") } 
  else {
    print("FALSE")
 #       }
 #     }
    }
  }  
} 
  

seq_along(stringVector)  
    
for (i in seq_along(stringVector)) {
  print(stringVector[i]);
        print(revString2[i])
  }
    
#works for the first position
report <- vector(mode = "character", length = length(stringVector))
for (i in seq_along(stringVector)) { 
  if (stringVector[i]=="G") {
   if (revString2[i]=="C") {
     report <- "TRUE"}
  }
}
   report

#make it work for the next position
   for (i in seq_along(stringVector)) { 
     if (stringVector[i]=="G") {
       if (revString2[i]=="C") {
         report <- "TRUE"}
     } else {
       if (stringVector[i]=="C") {
         if (revString2[i]=="G") {
           report <- "TRUE"}
      }
     }
   }
   report

### palndrome #####
   #string <- "GAATTC" #palindrome
   
   #strplit the query strand
   #stringVector <- strsplit(string, "") [[1]]
   
   #replicate the query strand then strsplit to break the string into a vector of characters. 
   #string2 <- strsplit(replicate(1,string), "") [[1]]
   
   #reverse the newly replicated and split string creating a complement to the query strand
   #revString2 <- rev(string2)
   
   
### non-palindrome ####
   string <- "GAATAC" #non-palindrome
   
   #strplit the query strand
   stringVector <- strsplit(string, "") [[1]]
   
   #replicate the query strand then strsplit to break the string into a vector of characters. 
   string2 <- strsplit(replicate(1,string), "") [[1]]
   
   #reverse the newly replicated and split string creating a complement to the query strand
   revString2 <- rev(string2)
   
   
#what if we just look for mismatches?
   report <- vector(mode = "character", length = length(stringVector))
   for (i in seq_along(stringVector)) { 
     if (stringVector[i]=="G")  {
       if ((revString2[i]=="A") | (revString2[i]=="T") | (revString2[i]=="G")) {
       }
     }
       if ((stringVector[i]=="C")  {
         if ((revString2[i]=="A") | (revString2[i]=="T") | (revString2[i]=="C")) {
           report <- "FALSE"
         }
       }
         if (stringVector[i]=="A") {
           if ((revString2[i]=="G") | (revString2[i]=="C") | (stringVector[i]=="A")) {
           }
         }
           if (stringVector[i]=="T") {
             if ((revString2[i]=="G") | (revString2[i]=="C") | (stringVector[i]=="T")) {
             }
           }
          else {
         report <- "TRUE"
          }
   }

   report

   for (i in seq_along(stringVector)) { 
     while (stringVector[i]=="A") {
       if ((revString2[i]=="G") | (revString2[i]=="C") | (stringVector[i]=="A")) {
       }
     }
     print("FALSE")
   }
   
report <- vector(mode = "character", length = length(stringVector))
   for (i in seq_along(stringVector)) { 
     while (stringVector[i]=="G")  {
       if ((revString2[i]=="A") | (revString2[i]=="T") | (revString2[i]=="G")) {
       }
       print("FALSE")
     }
     while ((stringVector[i]=="C")  {
       if ((revString2[i]=="A") | (revString2[i]=="T") | (revString2[i]=="C")) {
       }
       print("FALSE")
     }
     while(stringVector[i]=="A") {
       if ((revString2[i]=="G") | (revString2[i]=="C") | (stringVector[i]=="A")) {
       }
       print("FALSE")
     }
     while(stringVector[i]=="T") {
       if ((revString2[i]=="G") | (revString2[i]=="C") | (stringVector[i]=="T")) {
       }
       print("FALSE")
     }
     else {
       print("TRUE")
     }
   }




if (condition) {
  break
}

for (i in seq_along(stringVector)) { 
  for (j in seq_along(revString2)) {
  if ((stringVector[i]=="G") & ((revString2[j]=="A") | (revString2[j]=="T") | (revString2[j]=="G"))) {
    print("FALSE")
    break
  }
       if ((stringVector[j]=="C") & ((revString2[j]=="A") | (revString2[j]=="T") | (revString2[j]=="C"))) {
        print("FALSE")
        break
       }
            if ((stringVector[j]=="A") & ((revString2[j]=="G") | (revString2[j]=="C") | (revString2[j]=="A"))) {
           print("FALSE")
           break
         }
              if ((stringVector[j]=="T") & ((revString2[j]=="G") | (revString2[j]=="C") | (revString2[j]=="T"))) {
             print("FALSE")
             break
           } else {
             print("TRUE")
          } 
  }
}
  
for (i in seq_along(stringVector)) { 
  for (j in seq_along(revString2)) {
    if ((stringVector[i]=="G") & ((revString2[j]=="A") | (revString2[j]=="T") | (revString2[j]=="G"))) {
      print("FALSE")
    }
  }
}

revString2(L)
revString2(3)      

revString2[L]    

stringVector[1]  

for (i in seq_along(stringVector)){
  print(stringVector[[i]])
}
  
stringVector[2] 

#counter so that the loop runs N/2 times?
counter <- 0
while(counter <= Half) {
  counter <- counter +1
  m <- rexp(1)+2
  if (m < Half) {break}
}

#revString L-1 everytime

if stringVector(1) == "G"
check if revString(L) == "C")
  
if stringVector(1) == "C"
check if revString(L) == "G")

if stringVector(1) == "A"
check if revString(L) == "T")

if stringVector(1) == "T"
check if revString(L) == "A")



for (i in seq_along(stringVector)) {
  compStr <- NULL
  compStr <- length(stringVector) 
  if (stringVector[i]=="G") {
    comp[i] <- "C" {
      if (stringVector[i]=="C") {
        comp[i] <- "G" {
          if (stringVector[i]=="A") {
            comp[i] <- "T" {
              if (stringVector[i]=="T") {
                comp[i] <- "T" {
                  return(comp)
      
                }
              }
            }
          }
        }
      }
    }
  }
  }

complementCreate <- function(str) {
  #strplit the query strand
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

NPstring <- "GAATAC" #non-palindrome
Pstring <- "GAATTC" #palindrome

#declare a variable with half the lenght of the string
#declare a for loop using half the lenght of the string as a reference
#check if each letter is the same as its mirror equivalent - or, a character on the other side (measured with index -1)
#I think this can only work if I create the reversed string based on what is supposed to pair nto reversing the srtring

PcompStr <- complementCreate(Pstring)
NPcompStr <-complementCreate(Pstring)

palendromeCheck <- function(str, compStr) {
  L <- length(str)
  Half <- L/2
  compStrRev <- paste(rev(compStr))
  for (i in seq_along(str)) {
    if(str[i] != compStrRev[i]) {
      return("FALSE")
    } else {
      return("TRUE")
    }
  }
}


paste(rev(PcompStr))

Pstring_splt <- strsplit(Pstring, "") [[1]]
NPstring_splt <- strsplit(Pstring, "") [[1]]
L <- length(Pstring)
palendromeCheck(Pstring_splt, PcompStr)
palendromeCheck(NPstring_splt, NPcompStr)



