all: theoremGenerator

theoremGenerator: cjson/cJSON.o M.tab.o flex.o func.o main.o
	gcc cjson/cJSON.o M.tab.o flex.o func.o main.o -o theoremGenerator -g

cjson/cJSON.o: cjson/cJSON.c
	gcc cjson/cJSON.c -c -o cjson/cJSON.o -g

M.tab.o: M.tab.c flex.h
	gcc M.tab.c -c -g

flex.o: flex.c
	gcc flex.c -c -g

func.o: func.c
	gcc func.c -c -g

main.o: main.c
	gcc main.c -c -g

M.tab.h M.tab.c: M.y
	bison -d M.y

flex.c flex.h: M.l
	flex M.l

clean:
	rm flex.c flex.h M.tab.h M.tab.c main.o func.o flex.o M.tab.o cjson/cJSON.o theoremGenerator