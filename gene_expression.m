function [gene] = gene_expression(num_time,num_org,bug_attr,bug,ammonia,dip)
NH4_critical = 1e9; % fmol N/l;
PO4_critical = 5e7; % fmol P/l
for j = 1:num_time
    for i = 1:num_org
        if bug(i).amt == 0;
            gene(j,i,1) = 2;
        % "2" represents non-existence of "amt";
        elseif ammonia(j) > (bug_attr(i,25))
            gene(j,i,1) = 0;
        % "0" respresents existence of "amt", but not turned on;
        else
            gene(j,i,1) = 1;
        % "1" respresents existence of "amt", and turned on;
        end
        if bug(i).nr == 0;
            gene(j,i,2) = 2;
        % "2" represents non-existence of "nr";
        elseif ammonia(j) > (bug_attr(i,25))
            gene(j,i,2) = 0;
        % "0" respresents existence of "nr", but not turned on;
        else
            gene(j,i,2) = 1;
        % "1" respresents existence of "nr", and turned on;
        end
        if bug(i).nif == 0;
            gene(j,i,3) = 2;
        % "2" represents non-existence of "nif";
        elseif ammonia(j) > (bug_attr(i,25))
            gene(j,i,3) = 0;
        % "0" respresents existence of "nif", but not turned on;
        else
            gene(j,i,3) = 1;
        % "1" respresents existence of "nif", and turned on;
        end
        if bug(i).pst == 0;
            gene(j,i,4) = 2;
        % "2" represents non-existence of "pst";
        elseif dip(j) > (bug_attr(i,26))
            gene(j,i,4) = 0;
        % "0" respresents existence of "pst", but not turned on;
        else
            gene(j,i,4) = 1;
        % "1" respresents existence of "pst", and turned on;
        end
        if bug(i).pho == 0;
            gene(j,i,5) = 2;
        % "2" represents non-existence of "pho";
        elseif dip(j) > (bug_attr(i,26))
            gene(j,i,5) = 0;
        % "0" respresents existence of "pho", but not turned on;
        else
            gene(j,i,5) = 1;
        % "1" respresents existence of "pho", and turned on;
        end
        if bug(i).phn == 0;
            gene(j,i,6) = 2;
        % "2" represents non-existence of "phn";
        elseif dip(j) > (bug_attr(i,26))
            gene(j,i,6) = 0;
        % "0" respresents existence of "phn", but not turned on;
        else
            gene(j,i,6) = 1;
        % "1" respresents existence of "phn", and turned on;
        end
    end
end