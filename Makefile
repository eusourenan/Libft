# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rleite-s <rleite-s@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/31 23:31:33 by rleite-s          #+#    #+#              #
#    Updated: 2022/06/17 22:10:29 by rleite-s         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a

CFILES	=	ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c 		\
			ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c 	\
			ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c 	\
			ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c 	\
			ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c 	\
			ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c \
			ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c \
			ft_toupper.c

LIB 	= 	libft.h

Ofiles	=	$(CFILES:.c=.o)

BonusC	=	ft_lstnew_bonus.c ft_lstadd_front_bonus.c \
			ft_lstsize_bonus.c ft_lstlast_bonus.c \
			ft_lstadd_back_bonus.c ft_lstdelone_bonus.c \
			ft_lstclear_bonus.c ft_lstiter_bonus.c \
			ft_lstmap_bonus.c

BonusO	=	$(BonusC:.c=.o)

FLAGS	= 	-Wall -Werror -Wextra

RM		= 	rm -f

.c.o:
		cc $(FLAGS) -c $< -o $(<:.c=.o)

all: $(NAME)

$(NAME): $(Ofiles) $(LIB)
		ar -rcs $@ $^

clean:
		$(RM) $(Ofiles) $(BonusO)

fclean: clean
		$(RM) $(NAME)

re: fclean all

bonus: $(BonusO)
		ar -rcs $(NAME) $<

exec:
		gcc $(FLAGS) main.c $(NAME) -lbsd && ./a.out | cat -e > resp

.PHONY: all clean fclean re exec bonus