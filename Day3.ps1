

Function advent {

    #Gets all the data in a nice array
    $file_data = Get-Content "F:\Programmering\AdventOfCode\day3.txt";


    ################## Day 2a ##################
    $sum = 0;

    for($i = 0; $i -lt $file_data.Length; $i++){

        #Fetches the duplicate letter from each string
        $dupe = findDuplicateLetters $($file_data[$i].Substring(0,$file_data[$i].Length/2)) $($file_data[$i].Substring($file_data[$i].Length/2,$file_data[$i].Length/2));

        #Sums the value of the letter, adds 26 to the value if it's uppercase since hashmaps aren't case-sensitive
        $sum = $sum + $(getLetterValues $dupe)
    }



    ################## Day 2b ##################
    
    $sum2 = 0;

    #Gets the letter of every third string and puts into a single string
    $day3bString = "";
    for($i = 0; $i -lt $file_data.length; $i = $i + 3){
        
        $day3bString = $day3bString + $(searchUntillLast $file_data[$i..$($i+2)])
    }

    
    for($i = 0; $i -lt $day3bString.length; $i++){

        $dupe = $day3bString[$i];

        $sum2 = $sum2 + $(getLetterValues $dupe)
    }


    #Writes the output
    Write-Host("Result for Day 3a: $sum");
    Write-Host("Result for Day 3b: $sum2");
}



#Function to find the duplicate character from the strings
function findDuplicateLetters([String]$in1, [String]$in2){

    $res = '';

    for($i = 0; $i -lt $in1.length; $i++){
        for($j = 0; $j -lt $in2.length; $j++){

            #Using else-ifs instead of a series of ifs because Powershell is weird and breaking the step of the loop is hard lol
            if($in1[$i] -cne $in2[$j]){
                #break;
            }
            elseif($res -clike "*$($in1[$i])*"){
                #break;
            }
            else{
                $res = $res + $in1[$i];
            }
        }
    }
    return $res;
}

#Looks through a list of strings to find the one letter they have in common
function searchUntillLast($stringList){

    $stringList[1] = findDuplicateLetters $stringList[0] $stringList[1];

    if($stringList[1].length -gt 1){
        $stringList[1] = searchUntillLast $stringList[1..$($stringList.length - 1)]
    }

    return $stringList[1];
}

#Gets the value of a given letter
function getLetterValues([String] $in){

    $ItemValues = @{
        'a' = 1;
        'b' = 2;
        'c' = 3;
        'd' = 4;
        'e' = 5;
        'f' = 6;
        'g' = 7;
        'h' = 8;
        'i' = 9;
        'j' = 10;
        'k' = 11;
        'l' = 12;
        'm' = 13;
        'n' = 14;
        'o' = 15;
        'p' = 16;
        'q' = 17;
        'r' = 18;
        's' = 19;
        't' = 20;
        'u' = 21;
        'v' = 22;
        'w' = 23;
        'x' = 24;
        'y' = 25;
        'z' = 26;
    }

    $res = 0;

    if("$in" -ceq "$in".ToUpper()){
        $res = $ItemValues.item("$in") + 26;
    }
    else{
        $res = $ItemValues.item("$in");
    }

    return $res;
}

advent
