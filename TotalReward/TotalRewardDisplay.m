function TotalRewardDisplay(varargin)
% TotalRewardDisplay('init') - initializes a window that displays total reward
% TotalRewardDisplay('add', Amount) - updates the total reward display with
% a new reward, adding to the total amount.
global BpodSystem
global Amount

Op = varargin{1};
if nargin > 1
    AmountToAdd = varargin{2};
end
Op = lower(Op);
switch Op
    case 'init'
        BpodSystem.PluginObjects.TotalRewardDelivered = 0; % initial amount 0
        BpodSystem.PluginObjects.ManualReward = 0; % initial amount 0
        BpodSystem.PluginObjects.Licks =0; % initial amount 0
        BpodSystem.ProtocolFigures.TotalRewardDisplay = figure('Position', [900 300 500 500],'name','Total Reward','numbertitle','off', 'MenuBar', 'none', 'Resize', 'on', 'Color', [.6 .6 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay = struct;
        BpodSystem.GUIHandles.TotalRewardDisplay.Label2 = uicontrol('Style', 'text', 'String', 'Rewarded Licks', 'units', 'normalized', 'Position', [.1 .8 .4 .1], 'FontWeight', 'bold', 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]); % Licks label
        BpodSystem.GUIHandles.TotalRewardDisplay.Amount2 = uicontrol('Style', 'text', 'String', ['0 ' char(181) 'l'], 'units', 'normalized', 'Position', [.5 .8 .4 .1], 'FontSize', 20, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]); 
        BpodSystem.GUIHandles.TotalRewardDisplay.Label = uicontrol('Style', 'text', 'String', 'Total Reward', 'units', 'normalized', 'Position', [.1 .4 .4 .1], 'FontWeight', 'bold', 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Amount = uicontrol('Style', 'text', 'String', ['0 ' char(181) 'l'], 'units', 'normalized', 'Position', [.5 .4 .4 .1], 'FontSize', 20, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Button = uicontrol('Style', 'pushbutton', 'String', 'Deliver Water', 'units', 'normalized', 'Position', [.05 .2 .4 .1], 'FontSize', 15, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1], 'Callback', @button);         
        BpodSystem.GUIHandles.TotalRewardDisplay.Label3 = uicontrol('Style', 'text', 'String', 'Manual Reward', 'units', 'normalized', 'Position', [.1 .6 .4 .1], 'FontWeight', 'bold', 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Amount3 = uicontrol('Style', 'text', 'String', ['0 ' char(181) 'l'], 'units', 'normalized', 'Position', [.5 .6 .4 .1], 'FontSize', 20, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Button2 = uicontrol('Style', 'pushbutton', 'String', 'Move Licktube', 'units', 'normalized', 'Position', [.5 .2 .4 .1], 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1], 'Callback', @licktube);         
        BpodSystem.GUIHandles.TotalRewardDisplay.Calibrate = uicontrol('Style', 'text', 'String', [char(181) 'l per reward = 3.5'], 'units', 'normalized', 'Position', [.2 .075 .55 .05], 'FontSize', 15, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]); 
        BpodSystem.GUIHandles.TotalRewardDisplay.Calibrate2 = uicontrol('Style', 'text', 'String', 'Make sure to calibrate!', 'units', 'normalized', 'Position', [.2 .025 .55 .05], 'FontSize', 15, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]); 
    case 'init2'
        BpodSystem.PluginObjects.TotalRewardDelivered = 0;
        BpodSystem.PluginObjects.ManualReward = 0;
        BpodSystem.PluginObjects.Presses =0;
        BpodSystem.ProtocolFigures.TotalRewardDisplay = figure('Position', [900 300 500 500],'name','Total Reward','numbertitle','off', 'MenuBar', 'none', 'Resize', 'on', 'Color', [.6 .6 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay = struct;
        BpodSystem.GUIHandles.TotalRewardDisplay.Label2 = uicontrol('Style', 'text', 'String', 'Rewarded Presses', 'units', 'normalized', 'Position', [.1 .8 .4 .1], 'FontWeight', 'bold', 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Amount2 = uicontrol('Style', 'text', 'String', ['0 ' char(181) 'l'], 'units', 'normalized', 'Position', [.5 .8 .4 .1], 'FontSize', 20, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Label = uicontrol('Style', 'text', 'String', 'Total Reward', 'units', 'normalized', 'Position', [.1 .4 .4 .1], 'FontWeight', 'bold', 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Amount = uicontrol('Style', 'text', 'String', ['0 ' char(181) 'l'], 'units', 'normalized', 'Position', [.5 .4 .4 .1], 'FontSize', 20, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Button = uicontrol('Style', 'pushbutton', 'String', 'Deliver Water', 'units', 'normalized', 'Position', [.05 .2 .4 .1], 'FontSize', 15, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1], 'Callback',@button);         
        BpodSystem.GUIHandles.TotalRewardDisplay.Label3 = uicontrol('Style', 'text', 'String', 'Manual Reward', 'units', 'normalized', 'Position', [.1 .6 .4 .1], 'FontWeight', 'bold', 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Amount3 = uicontrol('Style', 'text', 'String', ['0 ' char(181) 'l'], 'units', 'normalized', 'Position', [.5 .6 .4 .1], 'FontSize', 20, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]);
        BpodSystem.GUIHandles.TotalRewardDisplay.Button2 = uicontrol('Style', 'pushbutton', 'String', 'Move Licktube', 'units', 'normalized', 'Position', [.5 .2 .4 .1], 'FontSize', 16, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1], 'Callback', @licktube);         
        BpodSystem.GUIHandles.TotalRewardDisplay.Calibrate = uicontrol('Style', 'text', 'String', [char(181) 'l per reward = ' num2str(Amount)], 'units', 'normalized', 'Position', [.2 .075 .55 .05], 'FontSize', 15, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]); 
        BpodSystem.GUIHandles.TotalRewardDisplay.Calibrate2 = uicontrol('Style', 'text', 'String', 'Make sure to calibrate!', 'units', 'normalized', 'Position', [.2 .025 .55 .05], 'FontSize', 15, 'FontName', 'Arial', 'BackgroundColor', [.7 .7 1]); 
    case 'add'
        BpodSystem.PluginObjects.TotalRewardDelivered = BpodSystem.PluginObjects.TotalRewardDelivered + Amount;
        if BpodSystem.PluginObjects.TotalRewardDelivered > 1000
            DisplayAmount = BpodSystem.PluginObjects.TotalRewardDelivered/1000;
            DisplayUnits = ' L';
        else
            DisplayAmount = BpodSystem.PluginObjects.TotalRewardDelivered;
            DisplayUnits = [' ' char(181) 'l'];
        end
        set(BpodSystem.GUIHandles.TotalRewardDisplay.Amount, 'String', [num2str(DisplayAmount) DisplayUnits]);
    case 'licks' % update number of licks
        BpodSystem.PluginObjects.Licks = BpodSystem.PluginObjects.Licks + Amount;
        set(BpodSystem.GUIHandles.TotalRewardDisplay.Amount2, 'String', [num2str(BpodSystem.PluginObjects.Licks) [' ' char(181) 'l']]);
    case 'presses' % update number of presses
        BpodSystem.PluginObjects.Presses = BpodSystem.PluginObjects.Presses +Amount;
        set(BpodSystem.GUIHandles.TotalRewardDisplay.Amount2, 'String', [num2str(BpodSystem.PluginObjects.Presses) [' ' char(181) 'l']]);
end
end
function button(~, ~)
global BpodSystem
global Amount
SendBpodSoftCode(1); % open valve
% add manual reward
BpodSystem.PluginObjects.ManualReward = BpodSystem.PluginObjects.ManualReward+Amount;
if BpodSystem.PluginObjects.ManualReward > 1000
    DisplayAmount3 = BpodSystem.PluginObjects.ManualReward/1000;
    DisplayUnits = ' L';
else
    DisplayAmount3 = BpodSystem.PluginObjects.ManualReward;
    DisplayUnits = [' ' char(181) 'l'];
end
set(BpodSystem.GUIHandles.TotalRewardDisplay.Amount3, 'String', [num2str(DisplayAmount3) DisplayUnits]);
% add to total reward
BpodSystem.PluginObjects.TotalRewardDelivered = BpodSystem.PluginObjects.TotalRewardDelivered + Amount;
if BpodSystem.PluginObjects.TotalRewardDelivered > 1000
    DisplayAmount = BpodSystem.PluginObjects.TotalRewardDelivered/1000;
    DisplayUnits = ' L';
else
    DisplayAmount = BpodSystem.PluginObjects.TotalRewardDelivered;
    DisplayUnits = [' ' char(181) 'l'];
end
set(BpodSystem.GUIHandles.TotalRewardDisplay.Amount, 'String', [num2str(DisplayAmount) DisplayUnits]);
end
function licktube(~,~)
ManualOverride('OV',2);
end