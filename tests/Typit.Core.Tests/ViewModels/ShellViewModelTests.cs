using Typit.Core.ViewModels;

namespace Typit.Core.Tests.ViewModels;

public class ShellViewModelTests
{
    [Fact]
    public void TitleDefaultsToAppName()
    {
        var viewModel = new ShellViewModel();

        Assert.Equal("Typit", viewModel.Title);
    }

    [Fact]
    public void TitleRaisesPropertyChangedWhenSet()
    {
        var viewModel = new ShellViewModel();
        var raised = new List<string?>();
        viewModel.PropertyChanged += (_, e) => raised.Add(e.PropertyName);

        viewModel.Title = "Typit – Test";

        Assert.Equal([nameof(ShellViewModel.Title)], raised);
    }
}
