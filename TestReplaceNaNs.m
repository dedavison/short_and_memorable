classdef TestReplaceNaNs < matlab.unittest.TestCase
    properties
        random_ds = mkgctstruct([4,7,2,9,1; NaN,6,1,2,3; 9,2,4,3,1; 9,9,6,0,1; ...
            7,4,2,4,1; 1,8,NaN,6,3; 8,3,4,7,11; 7,3,3,5,1; 7,1,5,2,3; 6,3,4,5,4], ....
            'rid', {'r1';'r2';'r3';'r4';'r5';'r6';'r7';'r8';'r9';'r10'}, ...
            'cid', {'c1';'c2';'c3';'c4';'c5'});
    end
    
    methods(Test)
        function testReplaceNaNsMean(testcase)
        	DS = testcase.random_ds;
            FUNCTION = 'mean';
            
            clean_ds = replaceNaNs(ds,FUNCTION);
            testcase.assertEqual(size(clean_ds), size(DS), 'size of matrix should not change'));
            testcase.assertEqual(sum(isnan(clean_ds)), 0, 'Dude NaNs tho');
        end
        
        function testReplaceNaNsMedian(testcase)
        	DS = testcase.random_ds;
            FUNCTION = 'median';
            
            testcase.assertEqual(size(clean_ds), size(DS), 'size of matrix should not change'));
            testcase.assertEqual(sum(isnan(clean_ds)), 0, 'Dude NaNs tho');
        end
    end
end
            
