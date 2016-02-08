<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.0/knockout-min.js'></script>
    <script type="text/javascript">
        ko.bindingHandlers.myBinding = {
            init: function (element, valueAccessor, allBindings, viewModel, bindingContext) {
                var newInput = $("<input>");
                var value = valueAccessor();
                newInput.val(value.value());
                newInput.change(function () {
                    var source = $(this);
                    value.value(source.val());
                });
                $(element).css("background-color", value.backColor());
                $(element).append(newInput);
            },
            update: function (element, valueAccessor, allBindings, viewModel, bindingContext) {
                var value = valueAccessor();
                $(element).find('input').val(value.value());
                $(element).css("background-color", value.backColor());
            },
        };
        $(document).ready(function () {
            var viewModel = {
                settings: {
                    backColor: ko.observable('blue'),
                    value: ko.observable('test')
                },
                onClick: function () {
                    this.settings.value('works');
                    this.settings.backColor('red');
                }
            };
            ko.applyBindings(viewModel);
        });
    </script>
</head>
<body>
    <div data-bind="myBinding: settings"></div>
    <input data-bind="value: settings.value" />
    <button type="button" data-bind="click: onClick">Click Me</button>
</body>
</html>
