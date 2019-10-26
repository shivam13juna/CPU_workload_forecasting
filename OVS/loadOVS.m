SPAN = 2;

addpath('features');

featuresR = load('shortIn_m_0.1_i_20.0.csv');
features = featuresR(SPAN:end,:);
featuresR = load('shortIn1_m_0.1_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('shortIn2_m_0.1_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
 
featuresR = load('longIn_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn1_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn2_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn3_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn4_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn5_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn6_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn7_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longIn8_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
 
featuresR = load('shortOut_m_0.1_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('shortOut1_m_0.1_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
 
% featuresR = load('longOut_m_0.025_i_20.0.csv');
%  features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longOut1_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
% featuresR = load('longOut2_m_0.025_i_20.0.csv');
%  features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longOut3_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longOut4_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longOut5_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)];
featuresR = load('longOut6_m_0.025_i_20.0.csv');
 features = [features ; featuresR(SPAN:end,:)]; 

  
rmpath('features');


addpath('cpu');


cpuA = load('shortIn0.txt');
cpu = cpuA(SPAN:end);
cpuA = load('shortIn1.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('shortIn2.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
 
cpuA = load('longIn0.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn1.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn2.txt');
cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn3.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn4.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn5.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn6.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn7.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('longIn8.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
 
cpuA = load('shortOut0.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
cpuA = load('shortOut1.txt');
 cpu = [cpu ; cpuA(SPAN:end)];
 
%  cpuA = load('longOut0.txt');
%   cpu = [cpu ; cpuA(SPAN:end)];
 cpuA = load('longOut1.txt');
  cpu = [cpu ; cpuA(SPAN:end)];
%  cpuA = load('longOut2.txt');
%   cpu = [cpu ; cpuA(SPAN:end)];
 cpuA = load('longOut3.txt');
  cpu = [cpu ; cpuA(SPAN:end)];
 cpuA = load('longOut4.txt');
  cpu = [cpu ; cpuA(SPAN:end)];
 cpuA = load('longOut5.txt');
  cpu = [cpu ; cpuA(SPAN:end)];
 cpuA = load('longOut6.txt');
  cpu = [cpu ; cpuA(SPAN:end)];
 
rmpath('cpu');

clear cpuA featuresR SPAN