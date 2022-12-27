# COLORS #
GREEN = @echo "\033[0;32m"
BLUE = @echo "\033[0;34m" 
PURPLE = @echo "\033[0;35m"
CYAN = @echo "\033[0;36m"
RESET = "\033[1;0m"

# VARIABLES #
LISTA = ""
# PATHs #
DIR = /file1
# SOURCES #
SRC = /

# RULES #
all:
	$(CYAN) Creating IMAGES $(RESET)
	sudo docker build -t inception:image_1 ./file1
	sudo docker build -t inception:image_2 ./file2
	$(GREEN) IMAGES Created $(RESET)
##RULES
$(MAKE): make

list:
	$(CYAN) IMAGE LIST $(RESET)
	sudo docker images

#list:
#	$(CYAN) IMAGE LIST $(RESET)
#	sudo docker image ls -q
#LIST = $(docker images -q)

clean:
#	Erase files	Image	
	sudo docker rmi -f $(shell sudo docker images inception -q)
#	Erase Debian Image	
	sudo docker rmi -f $(shell sudo docker images debian -q)
#$(docker image -q)

fclean: clean

re: fclean all

PHONY.: all clean fclean re list