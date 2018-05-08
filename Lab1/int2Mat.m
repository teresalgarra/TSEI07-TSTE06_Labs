function V=intMat(t,m,w1T,w2T)

M=length(m);
if t==1
for m=1:M
	for n=1:M
		if m==1 & n==1
			V(m,n)=w2T-w1T;
		elseif m==n
			V(m,n)=(w2T-w1T)/2+sin(2*w2T*(m-1))/4/(m-1)-sin(2*w1T*(m-1))/4/(m-1);
		else
			V(m,n)=sin(w2T*(m-n))/2/(m-n)+sin(w2T*(m+n-2))/2/(m+n-2);
			V(m,n)=V(m,n)-sin(w1T*(m-n))/2/(m-n)-sin(w1T*(m+n-2))/2/(m+n-2);
		end
	end
end

elseif t==2
for m=1:M
	for n=1:M
		if m==n
			V(m,n)=(w2T-w1T)/2+sin(2*w2T*(m-1/2))/4/(m-1/2)-sin(2*w1T*(m-1/2))/4/(m-1/2);
		else
			V(m,n)=sin(w2T*(m-n))/2/(m-n)+sin(w2T*(m+n-1))/2/(m+n-1);
			V(m,n)=V(m,n)-sin(w1T*(m-n))/2/(m-n)-sin(w1T*(m+n-1))/2/(m+n-1);
		end
	end
end

elseif t==3
for m=1:M
	for n=1:M
		if m==n
			V(m,n)=(w2T-w1T)/2-sin(2*w2T*m)/4/m+sin(2*w1T*m)/4/m;
		else
			V(m,n)=sin(w2T*(m-n))/2/(m-n)-sin(w2T*(m+n))/2/(m+n);
			V(m,n)=V(m,n)-sin(w1T*(m-n))/2/(m-n)+sin(w1T*(m+n))/2/(m+n);
		end
	end
end

elseif t==4
for m=1:M
	for n=1:M
		if m==n
			V(m,n)=(w2T-w1T)/2-sin(2*w2T*(m-1/2))/4/(m-1/2)+sin(2*w1T*(m-1/2))/4/(m-1/2);
		else
			V(m,n)=sin(w2T*(m-n))/2/(m-n)-sin(w2T*(m+n-1))/2/(m+n-1);
			V(m,n)=V(m,n)-sin(w1T*(m-n))/2/(m-n)+sin(w1T*(m+n-1))/2/(m+n-1);
		end
	end
end
end



