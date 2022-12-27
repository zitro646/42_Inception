# COLORS #
GREEN = @echo "\033[0;32m"
BLUE = @echo "\033[0;34m" 
PURPLE = @echo "\033[0;35m"
CYAN = @echo "\033[0;36m"
RESET = "\033[1;0m"

# VARIABLES #
LIST = ""
# PATHs #
DIR = /file1
# SOURCES #
SRC = /

# RULES #
all:
	$(CYAN) Creating IMAGES $(RESET)
	sudo docker build -t imagen_1:file1 ./file1
	$(CYAN) IMAGES Created $(RESET)
##RULES
$(MAKE): make

list:
	$(CYAN) IMAGE LIST $(RESET)
	sudo docker image ls
	LIST = $(docker images -q)

clean:
#$(PURPLE) CLEANING DOCKERS $(RESET)
#$(docker images -q)
	docker rmi -f $(docker images -q)
#$(docker images -q)

fclean: clean

re: fclean all

PHONY.: all clean fclean re list