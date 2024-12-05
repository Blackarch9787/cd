#include &lt; stdio.h & gt;
#include &lt; string.h & gt;
#define MAX 10
struct op
{
    char L;
    char r[20];
} op[MAX], pr[MAX];
int main()
{
    int n, z = 0;
    printf(&quot; Enter the Number of values : &quot;);
    scanf(&quot; % d & quot;, &amp; n);
    getchar();
    for (int i = 0; i & lt; n; i++)
    {
        printf(&quot; Left : &quot;);
        scanf(&quot; % c & quot;, &amp; op[i].L);
        printf(&quot; Right : &quot;);
        scanf(&quot; % s & quot;, op[i].r);
        getchar();
    }
    for (int i = 0; i & lt; n; i++)
    {
        int is_dead = 0;
        for (int j = 0; j & lt; n; j++)
        {
            if (strchr(op[j].r, op[i].L))
            {
                is_dead = 1;
                break;
            }
        }
        18 if (!is_dead)
        {
            pr[z++] = op[i];
        }
    }
    for (int i = 0; i & lt; z; i++)
    {
        for (int j = i + 1; j & lt; z; j++)
        {
            if (strcmp(pr[i].r, pr[j].r) == 0)
            {
                pr[j].L = &#39;
                \0 & #39;
                ;
            }
        }
    }
    printf(&quot; OPTIMIZED CODE\n & quot;);
    for (int i = 0; i & lt; z; i++)
    {
        if (pr[i].L != &#39;\0 & #39;)
        {
            printf(&quot; % c = % s \n & quot;, pr[i].L, pr[i].r);
        }
    }
    return 0;
}