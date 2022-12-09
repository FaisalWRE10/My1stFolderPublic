classdef WindSpeedCalcApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        ResultPanel                   matlab.ui.container.Panel
        WindSpeedkmhrEditField        matlab.ui.control.NumericEditField
        WindSpeedkmhrEditFieldLabel   matlab.ui.control.Label
        RotationminRPMEditField       matlab.ui.control.NumericEditField
        RotationminRPMEditFieldLabel  matlab.ui.control.Label
        InputDataPanel                matlab.ui.container.Panel
        TimesecEditField              matlab.ui.control.NumericEditField
        TimesecEditFieldLabel         matlab.ui.control.Label
        NoofRotationsEditField        matlab.ui.control.NumericEditField
        NoofRotationsEditFieldLabel   matlab.ui.control.Label
        CalculateWindSpeedButton      matlab.ui.control.Button
        WindSpeedCalculatorLabel      matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: CalculateWindSpeedButton
        function CalculateWindSpeedButtonPushed(app, event)
            Rotation=app.NoofRotationsEditField.Value;
            Time=app.TimesecEditField.Value;

            RPM=60*Rotation/Time;

            WindSpeed=0.0033* RPM^2+0.7932* RPM+1.643;
 
            app.RotationminRPMEditField.Value=RPM;
            app.WindSpeedkmhrEditField.Value=WindSpeed;


        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 288 344];
            app.UIFigure.Name = 'MATLAB App';

            % Create WindSpeedCalculatorLabel
            app.WindSpeedCalculatorLabel = uilabel(app.UIFigure);
            app.WindSpeedCalculatorLabel.HorizontalAlignment = 'center';
            app.WindSpeedCalculatorLabel.FontName = 'Times New Roman';
            app.WindSpeedCalculatorLabel.FontSize = 18;
            app.WindSpeedCalculatorLabel.Position = [30 302 230 32];
            app.WindSpeedCalculatorLabel.Text = 'Wind Speed Calculator';

            % Create CalculateWindSpeedButton
            app.CalculateWindSpeedButton = uibutton(app.UIFigure, 'push');
            app.CalculateWindSpeedButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateWindSpeedButtonPushed, true);
            app.CalculateWindSpeedButton.BackgroundColor = [0.8 0.8 0.8];
            app.CalculateWindSpeedButton.Position = [77 147 137 23];
            app.CalculateWindSpeedButton.Text = 'Calculate Wind Speed ';

            % Create InputDataPanel
            app.InputDataPanel = uipanel(app.UIFigure);
            app.InputDataPanel.TitlePosition = 'centertop';
            app.InputDataPanel.Title = 'Input Data';
            app.InputDataPanel.FontName = 'Times New Roman';
            app.InputDataPanel.Position = [31 187 229 95];

            % Create NoofRotationsEditFieldLabel
            app.NoofRotationsEditFieldLabel = uilabel(app.InputDataPanel);
            app.NoofRotationsEditFieldLabel.HorizontalAlignment = 'right';
            app.NoofRotationsEditFieldLabel.Position = [19 44 91 22];
            app.NoofRotationsEditFieldLabel.Text = 'No. of Rotations';

            % Create NoofRotationsEditField
            app.NoofRotationsEditField = uieditfield(app.InputDataPanel, 'numeric');
            app.NoofRotationsEditField.Position = [125 44 87 22];

            % Create TimesecEditFieldLabel
            app.TimesecEditFieldLabel = uilabel(app.InputDataPanel);
            app.TimesecEditFieldLabel.HorizontalAlignment = 'right';
            app.TimesecEditFieldLabel.Position = [20 11 65 22];
            app.TimesecEditFieldLabel.Text = 'Time (sec.)';

            % Create TimesecEditField
            app.TimesecEditField = uieditfield(app.InputDataPanel, 'numeric');
            app.TimesecEditField.Position = [126 11 87 22];

            % Create ResultPanel
            app.ResultPanel = uipanel(app.UIFigure);
            app.ResultPanel.TitlePosition = 'centertop';
            app.ResultPanel.Title = 'Result';
            app.ResultPanel.Position = [31 25 229 105];

            % Create RotationminRPMEditFieldLabel
            app.RotationminRPMEditFieldLabel = uilabel(app.ResultPanel);
            app.RotationminRPMEditFieldLabel.HorizontalAlignment = 'right';
            app.RotationminRPMEditFieldLabel.Position = [12 50 122 22];
            app.RotationminRPMEditFieldLabel.Text = 'Rotation / min. (RPM)';

            % Create RotationminRPMEditField
            app.RotationminRPMEditField = uieditfield(app.ResultPanel, 'numeric');
            app.RotationminRPMEditField.Position = [141 50 76 22];

            % Create WindSpeedkmhrEditFieldLabel
            app.WindSpeedkmhrEditFieldLabel = uilabel(app.ResultPanel);
            app.WindSpeedkmhrEditFieldLabel.HorizontalAlignment = 'right';
            app.WindSpeedkmhrEditFieldLabel.Position = [12 17 112 22];
            app.WindSpeedkmhrEditFieldLabel.Text = 'Wind Speed (km/hr)';

            % Create WindSpeedkmhrEditField
            app.WindSpeedkmhrEditField = uieditfield(app.ResultPanel, 'numeric');
            app.WindSpeedkmhrEditField.Position = [141 17 76 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = WindSpeedCalcApp

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end