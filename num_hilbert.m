

function XA=num_hilbert(w,W,R)
tol=1e-6;

N=13;
%Numerical Hilbert Transformation of (5.7)
% Inputs:
%       w: Given single angular frequency to evaluate numerical Hilbert
% transform.
%       W: Break Frequencies
%       R: Break points of the real part
% Output:
% XA: Value of the imaginary part at a given single angular
% frequency w.
% ------------------------------------------------------------------------ N=length(W);
%
for k=2:N
    DW(k)=W(k)-W(k-1);
    DR(k)=R(k)-R(k-1);
    M(k-1)=DR(k)/DW(k);
end
for k=1:N
        
        if abs(w-W(k))<tol
            F(k)=(w+W(k))*log(abs(w+W(k)));
        else
            F(k)=(w+W(k))*log(abs(w+W(k)))+(w-W(k))*log(abs(w-W(k)));
        end
            
end
for k=2:N
        DF=(1/pi)*(F(k)-F(k-1));
        B(k)=(1/pi)*(F(k)-F(k-1))/DW(k);
        X(k)=B(k)*DR(k);
end
XA=0;
for k=2:N
    XA=XA+X(k);
end

plot(XA,W)