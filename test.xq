
//1
let $category := (categories/category)


for $ctgry in $category
return <category>
<main>{$ctgry/title}
<child>
{
 for $child in $category
 where $child/parent=$ctgry/title
 return $child/title
}
</child>
</main>
</category>


//2

let $res := (title/)

for $sphere in $res
for $child in $sphere
where $child/title=$sphere/title
return $sphere/title

//3 Длина массива
let $category := (categories/category)


let $length := (
 for $child in $category
 where not ($child/parent)
 return <main>{$child/title}</main>
)

let $count := count($length)


//3.1 выборка

let $category := (categories/category)


for $ctgry in $category
return <category>
<main>{$ctgry/title}
<child>
{
 for $child in $category
 where $child/parent=$ctgry/title
 return $child/title
}
</child>
</main>
</category>