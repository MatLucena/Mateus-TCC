function AB = projSobreComplementoOrto2(A, B)
    projetor=(eye(size(B,2))-B*pinv(B'*B)*B');
    AB=A*projetor;
end
