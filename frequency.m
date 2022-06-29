%% The function defines the frquencies of the wind speed [5, 7,9 and 11] for the particular wind farm scenario
function freq = frequency(wf)
    if wf ==1  % ~5GW layout
        load table21.mat
        load table32.mat
        load table42.mat
        f1 = cell2mat(Table21(42:45,5:8));
        f2 = cell2mat(Table32(42:45,5:8));
        f3 = cell2mat(Table42(42:45,5:8));
        freq = (f1+f2+f3)./3;
    elseif wf== 3 % 
% large wind farm covering most of the Indian Exclusive Economic Zone (EEZ) in the Palk Strait     
        load table21.mat
        load table22.mat
        load table32.mat
        load table33.mat
        load table42.mat
        load table43.mat
        load table52.mat
        f1 = cell2mat(Table21(42:45,5:8));
        f2 = cell2mat(Table22(42:45,5:8));
        f3 = cell2mat(Table32(42:45,5:8));
        f4 = cell2mat(Table33(42:45,5:8));
        f5 = cell2mat(Table42(42:45,5:8));
        f6 = cell2mat(Table43(42:45,5:8));
        f7 = cell2mat(Table52(42:45,5:8));
        freq = (f1+f2+f3+f4+f5+f6+f7)./7;
%% Three wind farms along the coast         
    elseif wf == 21
        load table21.mat
        load table22.mat
        f1 = cell2mat(Table21(42:45,5:8));
        f2 = cell2mat(Table22(42:45,5:8));
        freq = (f1+f2)./2;
    elseif wf == 22
        load table31.mat
        load table32.mat
        load table42.mat
        f1 = cell2mat(Table31(42:45,5:8));
        f2 = cell2mat(Table32(42:45,5:8));
        f3 = cell2mat(Table42(42:45,5:8));
        freq = (f1+f2+f3)./3;
    elseif wf == 23
        load table52.mat
        load table53.mat
        load table54.mat
        f1 = cell2mat(Table52(50:53,5:8));
        f2 = cell2mat(Table53(50:53,5:8));
        f3 = cell2mat(Table54(50:53,5:8));
        freq = (f1+f2+f3)./3;
    else
        disp('Entre valid wind farm(wf) scenario')
    end    
end


