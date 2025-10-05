% file run_tinh.m
while true
    a = input('nhap n: ');
    if a == 0
        disp('ket thuc chuong trinh');
        break;
    else
        tinh(a);
    end
end

function s = tinh(n)
    if n < 0
        disp('Chuong trinh khong thuc hien voi n < 0');
        s = []; return
    end
    s = sum(1:n);
    disp(['Tong cua ' num2str(n) ' so tu nhien lien tiep la: s = ' num2str(s)]);
end
