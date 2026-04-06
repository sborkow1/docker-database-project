# Billiards Match Database System

## How to Run
Clone this git repository and run ```docker compose up -d```       
Run ```docker exec -it my_project_db mysql -u root -p``` and enter the root password    
Type ```USE DATABASE Billiards;``` to look at the database        

To remove the container, run ```docker compose down -v```