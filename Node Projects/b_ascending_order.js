// b. Write a script to return an array with ascending order value.

var Items = [7, 4, 8, 10, 1, 2, 2, 3, 4];

// sorting in ascending orer using bubble sort algorithm
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
console.log(sort_integers(Items));
