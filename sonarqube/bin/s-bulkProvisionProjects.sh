x=1
while [ $x -le 150 ]
do
  
  echo "User $x"
  random_name=$(curl http://randomword.setgetgo.com/get.php | tr -d '[[:space:]]')
  curl -u admin:admin -X POST "http://localhost:9000/api/projects/create?key=$random_name$x&name=$random_name"
  echo " "

  x=$(( $x + 1 ))
done
