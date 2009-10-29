#import the system module
import sys

#import the regular expression module
import re

#function to print the errors
def printError(lineNum, colNum, c):
    print "*    " + " " * colNum + "^Error(" + str(colNum) + ")"


#regular expression that matches all valid characters for our source
r = re.compile("=|\\s|[a-zA-Z]|[0-9]|\\.|{|}|[|]|\\(|\\)|\\+|-|\\*|&|_|,|;")

maxErrorsPerLine = 10
maxErrors = 100
errorsInLine = 0
totalErrors = 0

#error out if the user hasn't provided a file name
if len(sys.argv) != 2:
    print "Please provide a filename"

fileName = sys.argv[1]
#open the file
file = open(fileName)
#read the text into an array
lines = file.readlines()
file.close()
#iterate through the text
lineNum = 0
for line in lines:
    lineNum = lineNum + 1
    errorsInLine = 0
    #print the line                    strip the trailing newline
    print str(lineNum) + "    " + line.rstrip()
    #iterate through the characters in the line
    columnNum = 0
    for c in line:
        columnNum = columnNum + 1
        #test if the current character is a valid one
        if r.match(c) == None:
            printError(lineNum, columnNum, c)
            
            

