#!/bash/bin

echo : "Enter a number: "
read Number 


if [ $((Number % 2)) -eq 0 ] 
then
  echo "Number is $Number and it is even"
  else 
  echo "Number is $Number and it is odd"
fi