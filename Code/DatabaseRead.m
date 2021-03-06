function T = DatabaseRead()
%%DATABASEREAD Reads the txt file with tab separated values that contain
%%all the class information.
% By: Murilo Silva
% Created: 3/10/2016
% Purpose is to return table T variable which contains all the
% classes and their sections.

% This code will use the ClassSection class to read from database txt file.

% Use matlabs built in function to read txt file and store in variable T.
% All columns will be stored as strings
T = readtable('CoinData.txt','delimiter','tab','format','%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s');

%% Format Data Table
% This will remove all the blanks from the AcademicGroup and the AcademicOrganization columns. This is by
% copying the value from the last row without a blank value.
B1 = table2array(T(:,{'AcademicGroup'}));
B2 = table2array(T(:,{'AcademicOrganization'}));
for k = 2:length(B1)
   if(strcmp(B1{k},{''}))
      B1{k}=B1{k-1}; 
   end
   if(strcmp(B2{k},{''}))
      B2{k}=B2{k-1}; 
   end
end

T(:,{'AcademicGroup'}) = B1;
T(:,{'AcademicOrganization'}) = B2;

% This code will remove all spaces from the following columns. This is done
% through regex to improve speed.
A = {'Subject','CatalogNumber','Section','ClassNumber','EnrollmentCapacity','TotalEnrolled','SeatsAvailable','EnrollmentStatus','Component','Mon','Tue','Wed','Thu','Fri','Sat','Sun','Location','WaitlistCap','WaitlistTotal'};
S = table2array(T(:,A));
R = regexprep(S,'[^\w'']','');
T(:,A) = R;

% save('coinTable.mat','T')
end