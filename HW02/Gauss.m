function y=Gauss(A, aprox)
    siz = size(A);
    row=1;
    while(row<siz(1))
        incre=1;
        while(row+incre<=3)
            coeff = A(row+incre,row)/A(row,row);
            coeff = aprox(coeff,2);
            A(row+incre,:)=A(row+incre,:)-A(row,:)*coeff;
            A(row+incre,row)=0;
            incre = incre+1;
        end
        row=row+1;
    end
    row=siz(1);
    while(row>1)
        decre=1;
        while(row-decre>=1)
            coeff = A(row-decre,row)/A(row,row);
            coeff = aprox(coeff,2);
            A(row-decre,row)=A(row-decre,row)-A(row,row)*coeff;
            A(row-decre,siz(2))=A(row-decre,siz(2))-A(row,siz(2))*coeff;
            A(row-decre,row)=0;
            decre = decre+1;
        end
        row=row-1;
    end
    result = [];
    row = 1;
    while(row<=3)
        result = [result,aprox(A(row,4)/A(row,row),2)];
        row = row+1;
    end
    y=result;
end