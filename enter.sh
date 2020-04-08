#!/bin/bash
echo "===================================================="
echo "| Entering gitlab runner container. Please type exit/logout to exit from the shell"
echo "| You are inside a container now!!!"
docker exec -it gitlab-runner bash
echo "| Successfully exited from the container"
echo "===================================================="
