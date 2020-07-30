CC			= gcc

EXEC 		= prog

OUT 		= main.out

SRC 		= $(wildcard *.c)

FLAGS		= -Wall -Wextra -Werror

OBJS		= $(SRCS:.c=.o)

all:		$(EXEC)

%.o : %.c
				$(CC) $(SRC) -o $(OUT)

$(EXEC) :       $(OBJS)
				$(CC) $(SRC) -o $(OUT)

outfile:     
				./main.out > result_c

clean:
				rm -f *.o

fclean:
				rm -f $(OUT)
cleanfile:
				rm -f error_c result_c

re:				
				fclean all
