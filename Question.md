### Q&A
# 1 accuracy 
(pridict == actual)/pool

# 2 matric options
## matric addition
## matric subtraction
## matric scala mutiply
## matric multiplay
## matric transpose
## matric inverse

### octave 中,entry 操作需要加 .
## 如 1./Matric
##    Matric.^2

# octave 0-index or 1-index
## octave is 1-indexed

# octave index and vector
## matric to vector
```
a = [1 2;3 4;5 6]
b = a(:)
c = a(1:end)

# plot in octave label legend mark
```
# suppose data like this
34.62365962451697,78.0246928153624,0
30.28671076822607,43.89499752400101,0
35.84740876993872,72.90219802708364,0
60.18259938620976,86.30855209546826,1
79.0327360507101,75.3443764369103,1
45.08327747668339,56.3163717815305,0
61.10666453684766,96.51142588489624,1
75.02474556738889,46.55401354116538,1
76.09878670226257,87.42056971926803,1
84.43281996120035,43.53339331072109,1
95.86155507093572,38.22527805795094,0

while column 1 is x-coord column 2 is y-coord ,column 3 is possibility result ,which can only be 1 or 0
# positive index
posindices = find(y==1)

# negtive index
neindices = find(y==0)

# plot the positive data with + while neg data with o
plot(x(posindices,1),x(posindices,2),"r+")
hold on

plot(x(negindice,1),x(negindices,2),"ro")

hold off;
```
