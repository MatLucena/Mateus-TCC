function B= pseudoInverse(A)
    B=inv(A'*A)*A';
end