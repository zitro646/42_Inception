# COLORS #
GREEN = @echo "\033[0;32m"
BLUE = @echo "\033[0;34m" 
PURPLE = @echo "\033[0;35m"
CYAN = @echo "\033[0;36m"
RESET = "\033[1;0m"

# VARIABLES #

# PATHs #

# SOURCES #
SRC = main.cpp  #mutantstack.cpp 

# RULES #
all:
	$(CYAN) Creating IMAGES $(RESET)
	$(CYAN) IMAGES Created $(RESET)
##RULES
$(MAKE): make

list:
	$(CYAN) IMAGE LIST $(RESET)
#sudo docker image ls

clean:
	$(PURPLE) CLEANING OBJECTS $(RESET)
	
	
fclean: clean
	$(PURPLE) CLEANING DIRECTORY AND EXEC $(RESET)
	

re: fclean all

PHONY.: all clean fclean re list