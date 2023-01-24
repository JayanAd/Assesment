var Items = [7, 4, 8, 10, 1, 2, 2, 3, 4];

function uniqueArray(items)
{
    var arr =[];
    for(var i = 0; i<items.length;i++)
    {
        c=0;
        for(var j =0; j< items.length;j++)
        {
            if(i != j)
            {
                if(items[i] == items[j])
                {
                    c++;
                }
            }
        }
        if (c == 0)
        {
            arr.push(items[i]);
        }
    }

    return arr;
}

console.log(uniqueArray(Items));