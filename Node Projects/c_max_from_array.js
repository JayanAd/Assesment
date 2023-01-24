  // c. Write a script to return max value from the array.
  
  /* we can sort the array in ascending order so that last element 
     will be the maximum value in that array.   
    */

var Items = [7, 4, 8, 10, 1, 2, 2, 3, 4];

// bubble sort
function sort_integers(items) {
    var temp = 0;
    var n = items.length;
    for (var i = 0; i < n - 1; i++) {

        for (var j = 0; j < n - i - 1; j++) {
            if (items[j] > items[j + 1]) {
                temp = items[j];
                items[j] = items[j + 1];
                items[j + 1] = temp;
              
            }
        }
    }
    return items;
}

function maximumValue(items)
{
  
   var arr = sort_integers(items);
   return arr[items.length - 1]; // last element of sorted array in ascending order is maximum

}

console.log(maximumValue(Items));