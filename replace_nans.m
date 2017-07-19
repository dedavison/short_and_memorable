function ds_cleaned = replaceNaNs(ds, function)
%% pass in ds1_sliced.mat or ds2_sliced.mat
%% first find the NaN indexes
ds_cleaned=ds;
for ii = 1:size(ds_cleaned,2)
    nan_indexes = isnan(ds_cleaned(:, ii));
    switch lower(function)
    %% cases represent most likely user inputs for replacement_value function 
    	case 'median'
    		replacement_value=nanmedian(ds_cleaned);
        	ds_cleaned(nan_indexes,ii)=replacement_value(ii);
        	
        case 'mean'
    		 replacement_value=nanmean(ds_cleaned);
           	ds_cleaned(nan_indexes,ii)=replacement_value(ii);
            
    	otherwise
		%% anything not listed use an apply function 
            try
          		 replacement_value=arrayfun(function, ds_cleaned(:, ii));
                 ds_cleaned(nan_indexes,ii)=replacement_value(ii);
            catch
                warning('sorry your function cannot be applied with arrayfun; the NaNs remain.');;
            end
end
