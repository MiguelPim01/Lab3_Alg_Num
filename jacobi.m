function [x, Iter, Info] = jacobi (n, A, b, Toler, IterMax)
  for i=1:n
    x(i) = b(i)/A(i,i);
  endfor
  Iter = 0;
  printf("Iter \t", Iter);
  for i=1:n
    printf("x%d \t", i);
  endfor
  printf("NormaRel \n");
  printf("%d \t", Iter);
  for i=1:n
    printf("%f \t", x(i));
  endfor
  printf("\n");
  do
    Iter = Iter + 1;
    for i=1:n
      Soma = 0;
      for j=1:n
        if i != j
          Soma = Soma + A(i,j) * x(j);
        endif
      endfor
      v(i) = (b(i) - Soma)/A(i,i);
    endfor
    NormaNum = 0;
    NormaDen = 0;
    for i=1:n
      t = abs(v(i)-x(i));
      if t > NormaNum
        NormaNum = t;
      endif
      if abs(v(i)) > NormaDen
        NormaDen = abs(v(i));
      endif
      x(i) = v(i);
    endfor
    NormaRel = NormaNum/NormaDen;
    
    printf("%d \t", Iter);
    for i=1:n
      printf("%f \t", x(i));
    endfor
    printf("%f \n", NormaRel);
    
  until NormaRel <= Toler || Iter >= IterMax
  if NormaRel <= Toler
    Info = 0;
  else
    Info = 1;
  endif
endfunction