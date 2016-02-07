%Author: Farmehr Farhour f.farhour@gmail.com
clear
fileName = input('Please enter the name of a jpg file to read in (e.g. logo.jpg):','s');
logoData = imread(fileName, 'JPG');
output = input('Enter output filename: ','s');
% figure(1)
% image(logoData)
% axis equal

[row, col, colour] = size(logoData);
for i=1:row
	for j=1:col
		r = logoData(i,j,1);
		g = logoData(i,j,2);
		b = logoData(i,j,3);
		if (10<r)&(r<=64) || (10<g)&(g<=64) || (10<b)&(b<=64)
			logo(i,j) = 'I';
        elseif (r<=10) || (g<=10) || (b<=10)
            logo(i,j) = '#';
		elseif (64<r)&(r<=90) || (64<g)&(g<=90) || (64<b)&(b<=90)
			logo(i,j) = 'i';
		elseif (90<r)&(r<=128) || (90<g)&(g<=128) || (90<b)&(b<=128)
			logo(i,j) = ';';
		elseif (128<r)&(r<=192) || (128<g)&(g<=192) || (128<b)&(b<=192)
			logo(i,j) = '.';
        elseif (192<r) || (192<g) || (192<b)
			logo(i,j) = ' ';
        
		%elseif PixelIsBlue(r,g,b)==0
			%logo(i,j,1) = logoData(i,j,1)
			%logo(i,j,2) = logoData(i,j,2)
			%logo(i,j,3) = logoData(i,j,3)
		end
	end
end
%disp(logo)
[rows, cols] = size(logo);

% I = uint8(logo);
% imwrite(I,'output.jpg','jpg');



fid = fopen([output '.txt'],'w');
for i=1:rows
	for j=1:cols
		fprintf(fid,logo(i,j));
        fprintf(fid,' ');
	end
	fprintf(fid,'\n');
end
fclose(fid);



% fid = fopen('output2.html','w');
% fprintf(fid,'<html><head></head><body style="font-family:lucida;" ><p>');
% for i=1:rows
% 	for j=1:cols
% 		fprintf(fid,logo(i,j));
% 	end
% 	fprintf(fid,'</p><p>');
% end
% fprintf(fid,'</body></html>');
% fclose(fid);
%figure(2)
%image(J)
%axis image