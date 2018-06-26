function AB = projOrto2(A, B)
    projetor=(B*pinv(B'*B)*B');
    AB=A*projetor;
end
