function dn = asc2bn(txt)
dec=double(txt) %Text to ASCII (decimal)
p2=2.^(0:-1:-7) % 2^0,2^-1,.......,2^-7
B=mod(floor(p2'*dec),2) %Decimal to binary conversion
 %Columns of B are bits of chars
dn=reshape(B,1,numel(B));%Bytes to serial conbversion
end