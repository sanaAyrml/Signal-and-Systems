function A = myfft(x)
    A = zeros(length(x),1);
    for k = 1:length(A)
        for n = 1:length(A)
            A(k)=A(k)+(1/length(A)).*x(n).*exp((-1j).*2.*pi.*(n-1).*(k-1)./length(A));
        end
    end
end
