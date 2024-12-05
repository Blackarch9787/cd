#include <stdio.h>
#include <string.h>
void main()
{
    char icode[10][30], str[20], opr[10];
    int i = 0;
    printf("\nEnter intermediate code (terminated by 'exit'):\n");
    while (scanf("%s", icode[i]), strcmp(icode[i], "exit") != 0)
        i++;
    printf("\nTarget code generation\n************************");
    for (i = 0; i < 10 && strcmp(icode[i], "exit") != 0; i++)
    {
        strcpy(str, icode[i]);
        switch (str[1])
        {
        case '+':
            strcpy(opr, "ADD");
            break;
        case '-':
            strcpy(opr, "SUB");
            break;
        case '*':
            strcpy(opr, "MUL");
            break;
        case '/':
            strcpy(opr, "DIV");
            break;
        default:
            strcpy(opr, "UNKNOWN");
            break;
        }
        printf("\n\tMov %c, R%d", str[0], i);
        printf("\n\t%s %c, R%d", opr, str[2], i);
        printf("\n\tMov R%d, %c", i, str[0]);
    }
}