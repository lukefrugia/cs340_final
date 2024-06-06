SETUP:

choco install php

go to php install (mine was C:\tools\php83)
find the line: ;extension=mysqli and remove the ";" - which will uncomment it

you can run it with this command:
php -S localhost:8000

example:
localhost:8000/login.php
