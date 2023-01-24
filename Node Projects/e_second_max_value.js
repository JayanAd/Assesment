 // e. Write a script to find the second max value of the array.
 
 
 /* we can sort the array in ascending order so that second last element 
     will be the second maximum value in that array.   
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
     
     function secondMaximumValue(items)
     {
       
        var arr = sort_integers(items);
        return arr[items.length - 2]; // second last element of sorted array in     ascending order is second maximum value
     
     }
     
     console.log(secondMaximumValue(Items));