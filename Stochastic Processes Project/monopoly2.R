##prob of landing on caught and chance
##transition matrix
n=40
m <- matrix(0,n,n+60)

for(i in 1:12){if(i<8){diag(m[,(i+2):(i+2+n)])=i/36}else{diag(m[,(i+1):(i+1+n)])=(13-i)/36} }
a=m[,1:40]
b=m[,41:80]

m=a+b
m
##chance1
m[16,] = m[31,]/4 +m[9,]/4 +m[1,]/4 +m[16,]/4


##chance2
m[27,] = m[31,]/4 +m[38,]/4 +m[1,]/4 +m[27,]/4


##caught(24,19)
m[24,] = m[31,]
m[19,] = m[31,]


##extra jail turns

j <- matrix(0,42,42)
j[1:40,1:40] = j[1:40,1:40] + m
j[41,] = j[31,]/3
j[42,] = j[31,]
j[31,] = j[31,]/3
j[31,41] = 2/3
j[41,42] = 2/3
j

##steady state matrix

ini <- matrix(0,1,42)
ini[1,1] = 1
ini
p = ini
for(i in 1:10000)
{p = p%*%j}
p
k=c(1:42)
barplot(p[1,k],Width =1, names.arg = k)

