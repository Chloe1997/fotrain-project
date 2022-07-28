 Program q3
 real*8 dis,totdis
 
 totdis=0
 f1=0
 open(11,file='random_Q3.txt')
 do i=1,200,1
	read(11,*)num,dis  
	totdis=totdis+dis
	
	if(num .le.190) then
	f1=f1+70
	else if(num .le.412) then
	f1=f1+85
	else if(num .gt.412) then
	f1=f1+110
	endif
 enddo	
imoney=(59.5+10.2*totdis)*0.75
write(*,*)imoney,f1

if(imoney>f1) then
write(*,*)"Ubereat讚"
else
write(*,*)"foopanda"
endif

end