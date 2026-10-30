using CommunityToolkit.Mvvm.ComponentModel;

namespace Typit.Core.ViewModels;

/// <summary>
/// State of the main window shell. Starting point for the MVVM structure; content follows in Phase 4.
/// </summary>
public partial class ShellViewModel : ObservableObject
{
    public const string AppName = "Typit";

    [ObservableProperty]
    public partial string Title { get; set; } = AppName;
}
