#include<stdio.h>
int main()
{
	int count,j,n,time,flag=0;
	int wait_time=0,turnaround_time=0,at[10],bt[10],rt[10];
	int endTime,i,smallest;
	int remain=0,sum_wait=0,sum_turnaround=0;
	printf("Enter no of Processes : ");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		printf("Enter arrival time for Process P%d : ",i+1);
		scanf("%d",&at[i]);
		printf("Enter burst time for Process P%d :",i+1);
		scanf("%d",&bt[i]);
		rt[i]=bt[i];
	}		
		remain=0;
		printf("\nProcess|Turnaround Time| Waiting Time\n");
		rt[9]=9999;
		for(time=0;remain!=n;time++)
		{
			smallest=9;
			for(i=0;i<n;i++)
				if(at[i]<=time && rt[i]<rt[smallest] && rt[i]>0)
					smallest=i;
			rt[smallest]--;
			if(rt[smallest]==0)
			{
				remain++;
				endTime=time+1;
				printf("\nP[%d]\t|\t%d\t|\t%d",smallest+1,endTime-at[smallest],endTime-bt[smallest]-at[smallest]); 
            //TAT = CT - AT and WT = TAT - BT = CT -AT -BT
				printf("\n");
				sum_wait+=endTime-bt[smallest]-at[smallest];
				sum_turnaround+=endTime-at[smallest];
			}
		}
		printf("\nAverage waiting time = %f\n",sum_wait*1.0/n);
		printf("Average Turnaround time = %f",sum_turnaround*1.0/n);
	
	return 0;
}