// d. Write a script to return the sum of the array values.

var Items = [7, 4, 8, 10, 1, 2, 2, 3, 4];

function sumArray(items)
{
    var sum = 0;
   for(i=0;i<items.length;i++)
   {
    sum = sum + items[i];
   }
    return sum;
}

console.log(sumArray(Items));