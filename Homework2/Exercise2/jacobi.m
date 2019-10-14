function [x,iter]=jacobi(A,b,x0,tol,maxit)
%computes the solution of Ax=b
% with the Jacobi method
%x0=starting guess
% tol: precision tolerance
% maxit: maximum number of iterations
%iter: number of iterations needed until convergence
r=norm(b-A*x0); %initial residual
k=0;
condition=1;
n=length(b);
x=zeros(n,1);
while condition
    for i=1:n
        s=A(i,1:i-1)*x0(1:i-1)+A(i,i+1:n)*x0(i+1:n);
       % s = 0;        
        %for j = 1:i-1
       %     s = s + A(i,j)* x0(j);
       % end    
       % for j = i+1:n
      %      s = s + A(i,j) * x0(j);
      %  end
        x(i)=(b(i)-s)/A(i,i);
    end
    condition = k<maxit & norm(b-A*x)>tol*r & norm(x-x0)>tol;
    x0=x;
    k=k+1;
end
  iter=k;
        