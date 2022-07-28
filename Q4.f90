Program main 
character*8 id
integer i,x,count
real*8 num,total,mean,sigma,sum,t,f,area
open(11,file="random_Q3.txt",status='unknown')
open(33,file="result.txt",status='unknown')
open(44,file="area.txt",status="unknown")

!calculate the mean and sigma
total = 0.
do 5 i=1,200,1
    read(11,*)id,num
    total = total + num 
5 continue
    close(11)
    mean = total/200.


!calculate the sigma
sum =0.
open(11,file="random_Q3.txt",status='unknown')

do 6 i=1,200,1
    read(11,*)id,num
    sum = sum+ (num - mean)**2 
6 continue
    close(11)

    sigma = sqrt((sum / 200))

! the normal distribution function
open(11,file="random_Q3.txt",status='unknown')

pie =acos(-1.0) 
area = 0
count = 0
do 12 x = -700,700,1
	!f= b*exp(-((x-mean)**2)/(2*(sigma**2)))
    t = 0.1*x
    f = (1./(sigma*SQRT(2.*pie)))* EXP((-(t-mean)**2.)/(2.*(sigma**2.)))
	write(33,*) t,f
    area = area + f*0.1
    write(44, *) t,area
    if (area .gt.0.95 .and. count .eq. 0) then
        write(*,*)"km:",t,"Probability :",area
        count = count + 1
    endif  

12 continue

end Program