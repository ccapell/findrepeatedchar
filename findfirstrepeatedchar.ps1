# Chris Capell
# March 8, 2021
# Usage

# .\findfirstrepeatedchar.ps1 
#   You will be promptged for an input

# .\findfirstrepeatedchar.ps1 <inputstring>
#   This will scan for the input string

# .\findfirstrepeatedchar.ps1 -foo <inputstring>
#   This will scan for the input string

# get input from command line.  Will prompt if not provided.  It will allow an empty string so we can have a gracefull exit
param (
    [Parameter(Position = 0, Mandatory = $true)][AllowEmptyString()] [string]$foo
)


Function get-repeatedchar {
    param ([string]$searchstring)
    $i=0 # Counter

    # Create a loop that will end once we have checked the second to last character to the last.
    while ($i -le ($searchstring.length-1)) {
        $char = $searchstring.substring($i,1) # get the character in position i
        $i++ # increase i

        # change to cmatch for case sensitive matching
        if ($searchstring.substring($i) -match $char) {
            return  $char
        } # end if
    } # end while
    
    # nothing found
    return $false

} # end function get-repeatedchar 
# ---------------------------------------------

# validate that we have input
if (!$foo) {
    "No input provided. Exiting"
    exit
}

"Input String is $foo"

# Run the function
$response = get-repeatedchar $foo

# and process the results
if ($response -ne $false) {"The first repeated character is $response"} 
else {"No repeated characters found in string"}