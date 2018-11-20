
#!/bin/bash
function changeName(){
	file=$1
if [ "${file##*.}"x = "wxss"x ]
	then
	mv "$file" "${file%.wxss}.css"
fi

if [ "${file##*.}"x = "wxml"x ]
	then
  sed -i '' 's/wx:if/s-if/g' "$file"
  sed -i '' 's/wx:else/s-else/g' "$file"
  sed -i '' "s/wx:for/s-for/g" "$file"
  mv "$file" "${file%.wxml}.swan"

fi


if [ "${file##*.}"x = "js"x ]
  then
  sed -i '' 's/wx./swan./g' "$file"
  sed -i '' 's/this.route/''/g' "$file"
fi

}
function travFolder(){ 
  flist=`ls $1`
  cd $1
  for f in $flist
  do
    if test -d $f
    then
      #echo "dir:$f"
      travFolder $f
    else
      #echo "file:$f"
      changeName $f


    fi
  done
  cd ../ 
}
dir=./
travFolder $dir
# sed -i '' 's/wx:if/s-if/g' `grep wx:if -rl ./pages`
# sed -i '' 's/wx:else/s-else/g' `grep wx:else -rl ./pages`
# sed -i '' "s/wx:for/s-for/g" `grep "wx:for" -rl ./pages`
# sed -i '' 's/wx./swan./g' `grep wx. -rl ./pages`
# sed -i '' 's/this.route/''/g' `grep this.route -rl ./pages`



