# Billiards Match Database System

## How to Run
Clone this git repository and run ```yaml 
docker compose up -d```       
Run ```yaml 
docker exec -it my_project_db mysql -u root -p``` and enter the root password    
Type ```sql 
USE DATABASE Billiards;``` to look at the database        

To remove the container, run ```yaml 
docker compose down -v```