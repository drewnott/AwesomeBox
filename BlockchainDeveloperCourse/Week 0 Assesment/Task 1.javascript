var Repeater = function(array)
{
    var i = 0;
    var string = "";
    //Moves through each element of array(subarrays)
    while( i < array.length)
      {
    //Adds the number in the zeroth position of the ith subarray
    //to the string as many times as the number in the first position of the same subarray dictates
       for(var j = 0; j < array[i][1]; j++)
       {
            string += array[i][0];
       }
       //Adds coma and space after each respective series of numbers is printed
       string += ", ";
       i++;
      }
      //Removes redundant coma at the of the array
      print(string.slice(0,string.length-2));
}
