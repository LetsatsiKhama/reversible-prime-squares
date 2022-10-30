
#include <stdio.h>
/*the programme loops for prime squares
then reverse them 
then loops for another batch of prime numbers 
if the number prime numbers on the 2nd batch is equal to the reveraesd square 
it prints that prime square 
*/
void reverse_sqr()
{
	float point;
	int i,j,remander,integer,count=1,b=0;
     
	for(i=3;i>0;++i)
	{
		for(j=2;j<=i/2;++j)
		{
			if(i%j==0)
			{
				b=1;
				break;
			}
		}
	
		if(b==0)
		{
			
			long prime1=i*i,reversed=0;

			while(prime1!= 0)
			{
				remander = prime1 %10;
				reversed = (reversed*10)+ remander;
				prime1/=10;					
			}
			if(i*i != reversed)
			{
				count++;
				int p,q,counter=1,c=0;
     
				for(p=1;p>0;++p)
				{
					for(q=2;q<=p/2;++q)
					{
						if(p%q==0)
						{
							c=1;
							break;
						}
					}
					int prime2=p*p;
				
					if(c==0)
					{
						counter++;
						if(p*p==reversed)
						{
							printf("%d\n",i*i);
					    }
						
					}
					c=0;
					if(counter==1000)
					break;
			    }	
			}
		}
		b=0;
		if(count==1000)
		break;
	}
	
}
int main()
{
	reverse_sqr();
	return 0;
}