x=1
while [ $x -le 1000 ]
do
  
  echo "User $x"
  random_name=$(curl http://randomword.setgetgo.com/get.php | tr -d '[[:space:]]') 
  curl -u admin:admin -X POST "http://localhost:9000/api/users/create?login=$random_name$x&name=$random_name&password=test&password_confirmation=test"
  echo " "

  x=$(( $x + 1 ))
done
