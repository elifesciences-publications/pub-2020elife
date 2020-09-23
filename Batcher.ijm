name=getArgument;
if (name=="")
{
    source_dir = getDirectory("Source Directory");
}
else
{
    source_dir=name;
}
setBatchMode(false);
source_list = getFileList(source_dir);
for (n=0; n<source_list.length; n++)
{
    fname=source_dir+source_list[n];
    if (endsWith(fname, ".tif")&!(endsWith(fname, "p.tif")))
    if (!File.exists(fname+"_backgroundp.tif"))
    {
        IJ.log(fname);
        
        open(fname);
        {
            runMacro("/home/smc/Fiji.app/macros/CYC_VasaClusterFinderv2.ijm", source_dir);
        }
        run("Close All");
    }
}
