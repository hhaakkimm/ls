NAME		= ft_ls

RM			= rm -rf
CC			= gcc
MKDIR		= mkdir -p
MAKE		= make
CFLAGS		= -Wall -Werror -Wextra
CFLAGS		+= -I src/inc -I src/libft/includes
OPFLAGS		+= -L src/libft/ -lft -O3 -funroll-loops

DLIBFT	:= src/libft
LIBFT	:= src/libft/libft.a

DSRC	= ./src/src
DOBJF	= ./src/obj
DINC	= ./src/inc

SRC		:= $(shell ls -1 $(DSRC) | grep .c$$)
OBJF	:= $(SRC:.c=.o)
OBJF	:= $(addprefix $(DOBJF)/, $(OBJF))


all: $(NAME)

$(LIBFT):
	@$(MAKE) -C $(DLIBFT)
	@echo "\033[32m Compiled libft.a\033[0m"

$(DOBJF)/%.o: $(DSRC)/%.c $(DINC)
	@$(MKDIR) $(DOBJF)
	@$(CC) -c $(CFLAGS) $< -o $@

$(NAME): $(LIBFT) $(OBJF)
	@echo "\033[32m Created src/obj && Compiled Object Files\033[0m"
	@$(CC) $(OPFLAGS) -o $@ $^
	@echo "\033[32m Compiled Executable\033[0m"

clean:
	@$(RM) $(OBJF)
	@$(MAKE) -C $(DLIBFT) clean
	@echo "\033[31m -- Object Files && src/obj Removed\t--\033[0m"

fclean: clean
	@$(RM) $(NAME)
	@$(RM) $(DOBJF)
	@$(MAKE) -C $(DLIBFT) fclean
	@echo "\033[31m -- libft.a Removed\t\t\t--\033[0m"
	@echo "\033[31m -- ft_ls Executable Removed\t\t--\033[0m"

re: fclean all
