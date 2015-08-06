x=1
while [ $x -le 150 ]
do
  
  echo "User $x"
  curl -X POST -u admin:admin -d key=project$x -d name=project$x http://localhost:9000/api/projects/create
  echo " "

  x=$(( $x + 1 ))
done
