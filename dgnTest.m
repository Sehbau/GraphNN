%
% Testing script to verify that we've saved and loaded properly
%
% PREVIOUS  dgnFetBar, dgnFetRsg
%
clear;

fipa = 'C:\IMGdat\MNIST\GNN\';
lfnLab  = [fipa 'LabMb'];     load(lfnLab); DispLoad(lfnLab);
lfnROW  = [fipa 'ROWmb'];     load(lfnROW); DispLoad(lfnROW);
lfnCOL  = [fipa 'COLmb'];     load(lfnCOL); DispLoad(lfnCOL);
lfnBAR  = [fipa 'FetBarMb'];  load(lfnBAR); DispLoad(lfnBAR);
lfnRSG  = [fipa 'FetRsgMb'];  load(lfnRSG); DispLoad(lfnRSG);

%% ensure labels are correct
nDig = 70000;
assert(length(Lab)==nDig);
assert(Lab(1)==5);          % erster label muss 5 sein
assert(Lab(nDig)==6);       % letzter = 6

%% ensure data are correct (selection);
assert(size(ROW,1)==nDig);
assert(size(RSG,1)==nDig);
assert(size(ROW,2)==size(RSG,2));
assert( max(ROW(:)) < 32 ); 
assert( max(RSG(:)) < 1  ); % properly normalized?
assert( max(BAR(:)) < 2*pi+0.01 ); % smaller than 2*pi (full circle)

%% ---- 2 folds only 
IxLern  = 1:60000;          % learning (training) set
IxTest  = 60001:nDig;       % testing (sample) set
LabLern = Lab(IxLern,:);    % labels learning
LabTest = Lab(IxTest,:);    %    "   testing
ROWlern = ROW(IxLern,:);    % row-coordinates learning
ROWtest = ROW(IxTest,:);    %  "      "       testing

%% ---- Some Plotting
%ix = 1;  % Ziffer 5
ix = 2;  % Ziffer 0

figure(5); clf;
subplot(2,2,1);

plot( COL(ix,:), ROW(ix,:) );
axis ij;
title( num2str(Lab(ix)) );

subplot(4,1,3);
plot( BAR(ix,:) ); hold on;
ylabel('bar [0..2*pi]');
set(gca,'ylim',[0 6.3]);

subplot(4,1,4);
plot( RSG(ix,:) );
ylabel('radius [0..1]');
