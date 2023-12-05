# Separate a provided list into equal parts by the divisor
Function Split-List {
    param (
        $inputList,
        [int]$divisor
    )
    # initialization
    $lists = @()
    $startIndex = 0
    $listArray = @()

    # Calculate the count of each list & remainder
    $listSize = [math]::floor($inputList.Count / $divisor)
    $remainder = $inputList.Count % $divisor

    # Iterate through each list
    for ($i = 0; $i -lt $divisor; $i++) {
        # Calculate the size of the current list
        $size = $listSize + [math]::min(1, $remainder)
    
        # Decrease the remainder by 1 if remainder
        $remainder = [math]::max(0, $remainder - 1)
    
        # Clear the current list array
        $listArray = @()

        # Add items to the current list array
        $listArray += $cmPresent[$startIndex..($startIndex + $size - 1)]
    
        # Add the current list array to lists
        $lists += ,$listArray
    
        # Update the start index for the next list
        $startIndex += $size
    }
    return $lists
} # end split-list function

# separate list
$lists = Split-List -inputList <ARRAY> -divisor <INT>
