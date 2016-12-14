x=1
while [ $x -le 100 ]
do
  
  echo "Group #$x"
  random_name=$(curl http://www.setgetgo.com/randomword/get.php | tr -d '[[:space:]]') 
  curl -u admin:admin -X POST "http://localhost:9000/api/usergroups/create?name=$random_name&description=Group-$x"
  echo " "

  x=$(( $x + 1 ))
done
