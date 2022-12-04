
function advent{

    #Variables for the program
    $file_data = Get-Content "C:\Eget\Mem\AdventOfCode\Calories.txt";   #Array of the values from source file
    $final_data = @();                                                  #Array for the summarized calories
    $res = 0;                                                           #Final result
    $top_total = 3;                                                     #The number of top-elfs you want to summarize calories for


    #Variable to hold the sums
    $number = 0;

    #Loops through the list of values and puts the sum of each group into its own item in the $final_data array
    for($i = 0; $i -lt $file_data.Length; $i++){
        
        #Write-Output("$($i): $($file_data[$i])")

        if($file_data[$i] -ne ""){
            $number += $file_data[$i];
        }
        else{
            $final_data += $number;
            $number = 0;
        }
    }
    
    #Sorts the list by size
    $final_data = $final_data | sort-object -Descending;


    #Sets the final result to be the sum of the top spots in the list, based on the value of $top_total
    for($i = 0; $i -lt $top_total; $i++){
        $res += $final_data[$i];
    }


    #Final printout
    Write-Output($res)
}


advent
