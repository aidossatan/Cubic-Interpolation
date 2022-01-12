f=@(x) x + 1/x;
 
x1 = 0.5; 
x2 = 5;

N = 100;
err = 0.0001;
iteration = 0;

for i=1:N
  f1 = f(x1);
  f2 = f(x2);
  y = matlabFunction(diff(sym(f)));
  f1_prime = y(x1);
  f2_prime = y(x2);  

  a = f2_prime + f1_prime - 2*(f2 - f1);
  b = 3*(f2 - f1) - f2_prime - 2*f1_prime;
  
  if b>0
      temp = (f1_prime)/(-b - sqrt(b^2 - 3*a*f1_prime)); %b>0
  else
      temp = (-b + sqrt(b^2 - 3*a*f1_prime))/(3*a);  %b<0
  end

  x_new = x1 + (x2 - x1)*temp;
  f_xnew = f(x_new);
  
  disp(['X1: ' num2str(x1) ', f(X1): ' num2str(f1) ',|  X2: ' num2str(x2) ', f(X2): ' num2str(f2) ',|  X new: ' num2str(x_new) ', f(X new): ' num2str(f_xnew) ])
  
  if f1 > f2
      x1 = x_new;
      x2 = x2;
  else
      x1 = x1;
      x2 = x_new;
  end
  
  iteration = iteration +1; 
  
  Err = abs(x2-x1);
  if Err < err
      break
  end
end 

disp(['Optimal X: ' num2str(x_new) ', Optimal value: ' num2str(f_xnew) ', Number of iteration: ' num2str(iteration)])
