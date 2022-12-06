Function advent {

    $file_data = Get-Content "F:\Programmering\AdventOfCode\day3.txt";

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

    $sum = 0;

    for($i = 0; $i -lt $file_data.Length; $i++){
        $backpack = $file_data[$i];
        
        #Fetches the duplicate letter from each string
        $dupe = findDuplicateFromSections($backpack);

        #Sums the value of the letter, adds 26 to the value if it's uppercase since hashmaps aren't case-sensitive
        if("$dupe" -ceq "$dupe".ToUpper()){
            $sum = $sum + $ItemValues.item("$dupe") + 26;
        }
        else{
            $sum = $sum + $ItemValues.item("$dupe");
        }
    }

    Write-Output($sum);
}


#Function to find the duplicate character from the string
Function findDuplicateFromSections([String] $in){

    
    $s1 = $in.Substring(0,$in.Length/2);
    $s2 = $in.Substring($in.Length/2,$in.Length/2);

    $res = '';
    
    for($i = 0; $i -lt $s1.Length; $i++){
        for($j = 0; $j -lt $s2.Length; $j++){
            if($s1[$i] -ceq $s2[$j]){
                $res = $s1[$i];
                break;
            }
        }
    }

    return $res;
}


advent