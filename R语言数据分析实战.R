help('plot')
?plot
getwd()#显示当前路径#
setwd()#设置当前路径#
ls()#查看内存空间#
rm('')#移除一个或多个工作对象
save.image("")#存储所有内存空间#
save(x,file='x.rda')#存一个变量#
load()#读取一个工作空间到当前会话中
#运行代码
source('x.R')#调用外部R脚本
#R版本的更新
install.packages("installr")
library(installr)
updateR()
#对象
c(0,1,1,2,3,9)
c("hello world","I am a R user")
c(1,2,3,4)+c(1,2)
c(1,2,3,4)>c(1,2,1,3)#逻辑判断
#赋值，等号和箭头<-皆可
x=c(2,1,4,5)
x[2:4]
x[-4]
x[x>2]
#数组
a=array(1:12,dim = c(3,4))#也可以用a<-array()
print (a)
a[2,1]
a[2, ]
a[ ,3]
#数据框
city<-c('beijing','shnaghai','chengdu','shanghai','beijing')
age<-c(23,43,51,32,60)
sex<-c('F','M','F','F','M')
people<-data.frame(city,age,sex)
print(people)
people$city#取子集，本质上是向量，横的
people['age']#取子集,本质上还是数据框，竖的
people[,2]#取子集，本质上是向量
people$age>30#得到一个逻辑向量
people[people$age>30,]
#列表，长度和类型都可以不一样
peoplelist<-list(age=age,city=city,sex=sex)
print(peoplelist)
peoplelist$df=people
#对象和类
class(people)
class(peoplelist)
class(city)
str(people)#strcture
#模型与公式
#线性回归
model<-lm(formula=dist~speed,data=cars)
class(cars)
print(cars)
attributes(model)
#数据对象
vector1<-seq(2,10,2)#起始结束步长
vector1<-1:10+2
vector2<-1:(10+2)
#小练习数值积分
n<-100
h<-pi/n
x<-seq(from=0,to=pi,length=n)
rect<-sin(x)*h
sum(rect)
?curve
curve(sin,from=0,to=2)
#向量的生成
group1<-rep(1:3,times=c(8,10,9))#8个1 10个2 9个3
group2<-factor(group1)#数值型变量改成因子型变量
class(group1)
#生成随机数
vec_random1<-runif(5)
vec_random2<-sample (c('A','B'),size=10,replace=TRUE)#有放回的抽样
vector1<-numeric(10)
#向量的计算
vector<-rnorm(10)#正态分布
vec_max<-max(vector)
vec_min<-min(vector)
vector_trimmed<-vector[vector<vec_max&vector>vec_min]#去掉极值
vec_mean<-sum(vector_trimmed)/length(vector_trimmed)#均值
#复合对象
vector<-1:12
my_matrix<-matrix(vector,nrow=3,ncol=4,byrow=F)#按行排还是按列排，此处是按列排的
dim(my_matrix)#3行4列
dim(vector)<-c(4,3)#改成4行3列
print(vector)
#矩阵
vector1<-vector2<-vector3<-rnorm(3)
my_matrix<-cbind(vector1,vector2,vector3)#按列绑在一起，cbind
ifelse(my_matrix>0,1,0)#大于0的位置标为1,否则标为0
#小练习幻方
my_mat=matrix(c(8,3,4,1,5,9,6,7,2),ncol=3)#按列排，3列
print(my_mat)
sum(my_mat[1,])              
rowSums(my_mat)
colSums(my_mat)
sum(diag(my_mat))
#矩阵的退化
my_mat[1,]
my_mat[1,,drop=F]#防止退化，所得一行还是一个矩阵
#求解线性方程组
A<-matrix(c(3,1,5,2),2,2)#两个方程，两个未知数,3x1+5x2,x1+2x2
b<-matrix(c(4,1),ncol=1)#等于4和1
x<-solve(A,b)
#数据框
city<-c('A','B','C','D')
temp=c(27,29,23,14)
data<-data.frame(city,temp)
class(city)#字符向量
class(data$city)#因子型，数据框自动把变量转换成因子型
data<-data.frame(city,temp,stringsAsFactors = F)#通过参数来控制是否转成因子型
summary(data)#统计描述
dim(data)
head(data)
str(data)#结构
#数据框排序
order(data$temp)#默认从小往大排，返回的是位置
data$temp
data[order(data$temp),]#注意区别，一个是提取向量，一个是排序后输出
data[order(data$temp,decreasing=T),][1:2,]#取出前两个
#列表
data_list=list(temp=temp,city=city)
print(data_list)
data_list$mat<-my_mat
data_list$data<-data_list
data_list[4]#取得是列表，是车厢
data_list[[4]]#一个方括号取得是列表，两个方括号取得是数据框
data_list$data#同两个方括号，取得是货物
#缺失值与空值
temp<-c(27,29,23,14,NA)
mean(temp)
mean(temp,na.rm=T)#将缺失值删除掉
is.na(temp)#通过输出逻辑值判断哪个是缺失的。
#缺失值：应该有数据而没有，起一个占位符的作用。
#空值的意义则是完全没有。空值是NULL.
temp<-c(27,29,23,14,NULL)
data_list$data<-NULL#将空值赋值给某个元素，起到删除这个元素的作用
#连接对象（一类可以反复调用的输入输出对象，常见的有文本连接、文件连接、网络连接压缩文件）
#公式
n<-1:50
xvar<-paste('x',n)
right<-paste(xvar,collapse='+')#x1+x2+x3+x4+....
left<-'y~'
my_formula<-paste(left,right)
my_formula<-as.formula(my_formula)
class(my_formula)
#表达式
ex<-expression(x<-seq(1,10,2))
print(x)
eval(ex)#不想立刻表达出来
tex<-c('z<-seq(1,10,2)','print(z)')
eval(parse(text=tex))#字符串本身没有运行功能，将字符串解析成表达式，再用eval运行
#环境#全局环境,叫作.GlobalEnv
remove(list=objects())#清空所有变量
x<-1:5
myenv<-new.env()
objects()
assign('x',6:10,envir=myenv)
x^2
evalq(x^2,envir=myenv)#在指定环境下对x乘方
objects(myenv)#查看定义的环境里面的对象
parent.env(myenv)
remove ('x','myenv')
#向量化操作
#判断一个数是否为偶数
func<-function(x)
{
  if(x%%2==0)
    (ret<-TRUE)
  else
    (ret<-FALSE)
  return(ret)
}
#只能判断数字，不能判断向量
vec<-round(runif(4)*100)
sapply(vec, func)#可以判断一个向量
#改装成一个可以接受向量的函数
funcv<-Vectorize(func)
funcv(vec)#封装sapply
#鸢尾花数据变异系数
sapply(iris[ ,1:4],function(x) sd(x)/mean(x))
#对列表运用sapply
mylist<-as.list(iris[ ,1:4])
sapply(mylist,mean)
mylist<-as.list(iris[ ,1:4])
lapply(mylist,mean)#sapply输出形式是简化后的向量，lapply输出的是列表
set.seed(1)
vec<-round(runif(12)*100)
mat<-matrix(vec,3,4)
apply(mat,1,sum)#1表示按行sum，2表示列
#分组计算tapply或aggregate
tapply(X=iris$Sepal.Length,INDEX = list(iris$Species),FUN=mean)#INDEX表示按种类分组
with(iris,aggregate(Sepal.Length,by=list(Species),mean))#两种方法都可以
#两个参数输入，mapply
vec1<-vec2<-1:9
para<-expand.grid(vec1,vec2)#将两个向量组合，81个组合
res<-mapply(FUN=prod,para[,1],para[.2])#乘法，para第一列和第二列相乘
outer(vec1,vec2,FUN='*')#输出一个矩阵乘法表
res<-replicate(100,mean(rnorm(1000)))#生成1000个服从正太分布的随机向量，计算其均值重复100遍
#函数和控制语句
myfunc<-function(r){
  area<-pi*r^2
  return(area)
}
print(myfunc(4))#求圆面积的函数，area是局部变量
#条件判断
num<-4
if(num%%2!=0){
  cat(num,'is odd')
}else{
  cat(num,'is even')
}
#ifelse的嵌套
num<-1:6
ifelse(num%%2==0,yes='even',no='odd')
num<-sample(20:70,replace=T)
res<-ifelse(num>50,'老年',ifelse(num<30,'青年','中年'))
#多重分支的条件判断
num<-10
Mode<-num%%3
cat('mode is',switch(Mode+1,0,1,2))#结果与位置,Mode+1表示位置，后面三个是余数值

fruits<-c('apple','orange','grape','grape','other')
price<-function(fruit){
  switch(fruit,
         apple=10,
         orange=12,
         grape=16,
         banana=8,
         0
         )
}
sapply(fruits,price)#向量化
#循环for,while,for知道循环多少次，while知道循环条件，还有repeat和next
x<-0
i<-1
repeat{
  if (i%%2==0){x<-i+1}
      
i<i+1
if(i>100)break
}
#跳过循环中next后面的代码，重新开始一次循环
x<-0
i<-1
repeat{
  i<i+1
  if(i>100)break
  if(i%%2==0)next
  x<-x+i
}
#判断一个质数
system.time({
  x<-logical()
  for(i in 1:1e5){
    y<-findprime(1)
    x<-c(x,y)
  }
})
system.time({
  x<-logical(1e5)
  for(i in 1:1e5){
    y<-findprime(1)
    x[i]<-y
  }
})
system.time({
  x<-sapply(1:1e5,findprime)
})#这是最快的，避免使用循环，多使用向量化计方法
#用函数计算斐波那契数列
fibonaci<-function(n){
  i<-2
  x<-1:2
  while(x[i]<n){
    x[i+1]<-x[i-1]+x[i]
    i<-i+1
  }
  x<-x[-i]
  return(x)
}

x<-10
tempfunc<-function(n){
  x<-1
  return(x+n)
}
tempfunc(2)#这里是局部赋值，x<<-1这样是全局赋值
#函数深入
#计算样本与整体标准差
SdFunc<-function(x,type='sample'){
  n<-length(x)
  m<-mean(x)
  if(type=='sample'){
    sd<-sqrt(sum((x-m)^2)/(n-1))
  }
  if(type=='population'){
    sd<-sqrt(sum((x-m)^2)/(n))
  }
  return(sd)
}
SdFunc(1:10)
SdFunc(1:10,type='population')#总体和样本标准差的区别

SdFunc<-function(x,type='sample',...){
  stopifnot(is.numeric(x),
            length(x)>0,
            type%in%c('sample','population'))
  x<-x[!is.na(x)]
  n<-length(x)
  m<-mean(x,...)
  if (type='sample'){
    sd<-sqrt(sum((x-m)^2)/(n-1))
  }
  if(type='population'){
    sd<-sqrt(sum((x-m)^2)/(n))
  }
  return(sd)
}
y<-c(1:10,50)
SdFunc(y,type='sample',trim=0.1)

#函数递归，算阶乘函数
Fac1<-function(n){
  if(n==0)return(1)
  return(n*Fac1(n-1))
}
Fac1(10)
#匿名函数，就是没有名字的函数，常在向量化计算中遇到。
set.seed(1)
m<-matrix(rnorm(100),10,10)
apply(m,1,function(x) max(x)-min(x))
#二元运算符
Prod<-1:4*4:1#(1*4,2*3,3*2,4*1)
Prod<-'*'(1:4,4:1)#当成一个函数,'*'是函数名，后面是参数
a<-c('apple','banana','orange')
b<-c('grape','banana','orange')
'%it%'<-function(x,y){
  intersect(x,y)
}
a%it%b#自定义的二元运算符，用'%%'作区分，intersect求交集
#函数式编程，函数和其它对象一样，可以有名字，没名字，作为函数的输入输出
FuncList<-list(base=function(x) mean(x),
               med=function(x) median(x),
               manual=function(x){
                 n<-length(x)
                 x<-sort(x)[c(-1,-n)]
                 mean(x)
               })
set.seed(1)
x<-sample(100,10)
FuncList$base(x)

for(f in FuncList){
  print(f(x))
}

sapply(FuncList, function(f) f(x))#注意三种方法的区别

##数据获取
#控制台的输出
set.seed(1)
out<-data.frame(x1=runif(3)*10,x2=c('a','b','c'))
out<-format(out,digits = 3)#控制格式
print(out)
cat(paste(out$x2,out$x1,sep='='),sep='\n')#将两个变量粘合起来
#控制台的输入
x<-readline()
x<-scan()#输入多个数值
#本地文本输出
output<-file('output.txt')#建立一个连接
cat(1:100,sep='\t',file=output)
close(output)
#本地文本输入
output<-file('output.txt')
input<-scan(file=output)
close(output)#scan只能读数值，字符用writeLines,readLines
output<-file('output.txt')
writeLines(as.character(1:12),con=output)
input<-readLines(output)
#小练习：读取已经安装的扩展包的DESCRIPRTION文件
path<- .libPaths()[1]#本机安装R的路径
doc.names<-dir(path)#找出名字
doc.path<-sapply(doc.names,function(names)
  paste(path,names,'DESCRIPTION',sep='/'))#将讲文件名和路径做一个拼接
doc<-sapply(doc.path,function(doc) readLines(doc))#读每一个路径下的文件
#数据表的读写
write.table(iris,file='iris.csv',sep=',')
data<-read.table(file='iris.csv',sep=',')
data<-read.table(file=file.choose(),sep=',')#自动弹出选框
#数据库的读写1、用SQL来提取需要的数据，存为文本再由R读出；2、将R与外部数据连接
#直接在R中操作数据库    连接的方式有两种：1、ODBC方式，需要安装RODBC包并安装RODBC驱动
#2、DBI方式，根据已经安装的数据库类型来安装相应的驱动

#读取SPSS和SAS数据文件
statadata<-read.dta("C:/temp/statafile.dta")
spssdata<-read.spss("C:/temp/spssfile.sav")
sasdata<-read.xport("C:/temp/sasfile.xpt")
#Web数据抓取
XML包

#数据整理，数据汇总计算
#取子集：1、方括号加索引2、subset
data_sub<-subset(iris,Species=='setosa',3:5)
data_sub<-with(iris,iris[Species=='setosa',3:5])
#编码转换
iris_tr<-transform(iris,v1=log(Sepal.Length))
#变量离散化
q25<-quantile(iris_tr$v1,0.25)
q50<-quantile(iris_tr$v1,0.50)
q75<-quantile(iris_tr$v1,0.75)
groupvec<-c(min(iris_tr$v1),q25,q50,q75,max(iris_tr$v1))
labels<-c('A','B','C','D')
iris_tr$v2<-with(iris_tr,cut(v1,breaks = groupvec,labels = labels,include.lowest = TRUE))
#数据类型转化
vec<-rep(c(0,1),c(4,6))
vec_fac<-factor(vec,labels = c('male','femal'))
levels(vec_fac)
#因子合并
vec<-rep(c(0,1,3),c(4,6,2))
vec_fac<-factor(vec)
levels(vec_fac)<-c('male','femal','male')
#因子重设
vec<-rep(c('b','a'),c(4,6))
vec_fac<-factor(vec)
levels(vec_fac)
relevel(vec_fac,ref='b')#b为参考
#数据重塑长型数据和宽型数据，即堆叠数据和非堆叠数据
data_w<-iris[,1:4]
data_l<-stack(data_w)
data_w<-unstack(data_l)
#数据的重塑计算
library(reshape2)
dcast(data = subdata,#分析对象
      formula=Species~.,#数据分组的方式
      value.var = 'Petal.Width',#要计算的数值对象
      fun=mean)#计算用函数名
iris_long<-melt(data = iris,#要融合的对象
                id='Species')#哪些变量不参与融合中
#数据的拆分合并
datax<-data.frame(id=c(1,2,3),gender=c(23,34,41))
datay<-data.frame(id=c(3,1,2),name=c('tom','john','ken'))
merge(datax,datay,by='id')#不能使用cbind合并，使用merge函数，按照id来合并两组数据
#数据按变量拆分，常规的用subset函数，非常规的按照某个分类变量进行
iris_splited<-split(iris,f=iris$Species)
class(iris_splited)
#数据按变量合并
unsplit(iris_splited,f=iris$Species)
#小练习
ratio_fun<-function(x){
  sum(x$tip)/sum(x$total_bill)
}
pieces<-split(tips,tips$sex)#拆分数据
result<-lapply(pieces,ratio_fun)#计算
do.call('rbind',result)#结果合并
#强大的plyr包
library(plyr)
ratio_fun<-function(x){
  sum(x$tip)/sum(x$total_bill)
}
ddply(.data = tips,#拆分计算的对象
      .variables = 'sex',#按照什么变量来拆分
      .fun=ratio_fun)#计算的函数
ddply(tips,.(sex),ratio_fun)
ddply(tips,sex~smoker,ratio_fun)#按照抽烟的男性，女性，不抽烟的男性，女性来分
#dd:输入和输出都是dataframe,还有aaply,adply
data<-as.matrix(iris[,-5])
result4<-adply(.data=data,
               .margins = 2,#1(rows)or2(columns)
               .fun=function(x){
                 max<-max(x)
                 min<-min(x)
                 median<-median(x)
                 sd<-round(sd(x),2)
                 return(c(max,min,median,sd))
               })
#字符串处理。获取长度nchar();字符串分割strsplit();字符串拼接paste();字符串截取substr();
#字符串替代gsub();字符串匹配grep()
fruit<-'apple orange grape banana'
nchar(fruit)
strsplit(fruit,split = '')
fruitvec<-unlist(strsplit(fruit,split=''))
paste(fruitvec,collapse = ',')
substr(fruit,1,5)#截取第一个到第五个位置
gsub('apple','strawberry',fruit)#搜索apple再用strawberry替换
grep('grape',fruitvec)#搜索，有的话返回位置
#时间相关的数据
date1<-'1989-05-04'
date1<-as.Date(data1)
class(date1)
date1<-'05/04/1989'
date1<-as.Date(date1,format='%m/%d/%Y')#指定格式
Sys.Date()-structure(0,class='Date')#计算从1970.1.1到现在的天数
#创建一个日期向量,date1开始，累加四天.日期的格式转换参见strptime
dates<-seq(date1,length=4,by='day')
format(dates,'%w')
weekdays(dates)



#数据可视化

plot(cars$dist~cars$speed)
hist(cars$dist)
























































