#include <stdio.h>
#include <ctype.h>
void printToken(char *type, char *value)
{
    printf("%s: %s\n", type, value);
}
void getNextToken(char **input)
{
    char token[100];
    int i = 0;
    while (isspace(**input))
        (*input)++;
    if (isalpha(**input))
    {
        while (isalpha(**input) || isdigit(**input))
            token[i++] = *(*input)++;
        printToken("IDENTIFIER", token);
    }
    else if (isdigit(**input))
    {
        while (isdigit(**input))
            token[i++] = *(*input)++;
        printToken("NUMBER", token);
    }
    else if (**input != '\0')
    {
        token[i++] = *(*input)++;
        printToken("OPERATOR/UNKNOWN", token);
    }
    token[i] = '\0';
}
int main()
{
    char input[] = "int a = 5 + 3;", *ptr = input;
    while (*ptr != '\0')
        getNextToken(&ptr);
    return 0;
}