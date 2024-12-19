https://www.rapidee.com/en/download

https://stackoverflow.com/questions/34491244/environment-variable-is-too-large-on-windows-10

There are a few ways to clean up your path variable. The easiest is to use Rapid Environment Editor. This free utility will,

Remove the duplicate paths (right click → Cleanup Paths)
Remove non-existent folders (shown in red which you need to manually delete)
Replace long paths with short paths (right click → long to short path).
I do the above steps in order and use the third step only for the longest paths until the Path variable size is under control again.

If you want to go more advanced, here's a little C# tool that you can modify to whatever other logic you want to implement.