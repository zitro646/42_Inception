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


all: images
	$(CYAN) RUNNING IMAGES $(RESET)
	sudo docker run $(shell sudo docker images inception:mysql -q)
#	sudo docker run $(shell sudo docker images inception:image_2 -q)
	$(GREEN) DOCKERFILE EXECUTED $(RESET)

$(MAKE): make
	
images:
	$(CYAN) Creating IMAGES $(RESET)
	sudo docker build -t inception:mysql ./DDBB
#	sudo docker build -t inception:image_2 ./file2
	$(GREEN) IMAGES Created $(RESET)

ilist:
	$(CYAN) IMAGE LIST $(RESET)
	sudo docker images -a

clist:
	$(CYAN) CONTAINER LIST $(RESET)
	sudo docker container ls -a

clean:
	sudo docker rmi -f $(shell sudo docker images -q)
#	Erase files	Image	
#	sudo docker rmi -f $(shell sudo docker images inception -q)
#	Erase Debian Image	
#	sudo docker rmi -f $(shell sudo docker images debian -q)


fclean: clean

re: fclean all

PHONY.: all clean fclean re ilist clist image