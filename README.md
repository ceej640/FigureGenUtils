# FigureGenUtils
 Utilities for easy figure generation in MATLAB

 ## Table of Contents

- Requirements
- Installation
- Datasets
- Usage
- References
- License

## Requirements

FigureGenUtils is designed to work with MATLAB. CJfigtree.m requires export_fig (https://github.com/altmany/export_fig, not included here) which additionally requires installation of Ghostscript if exporting .EPS files.

## Installation

Add the FigureGenUtils folder to your MATLAB path. Ensure the folder containing export_fig is also included in the MATLAB path.

## Usage

### FormatFig.m

This function formats a figure to have a larger than default font size, grid on, and either a black or white background. 

Call this function using the syntax: FormatFig(hFig,Fblack,Fwhite) where

hFig = handle to figure
Fblack = Binary flag for a figure with black background and white text (Set to 0 or 1)
Fwhite = Binary flag for a figure with white background and black text (Set to 0 or 1)

Do not call with both Fblack and Fwhite set to the same value.

### CJfigtree.m

This function will resize, reformat and export a figure in optionally PNG, .fig, and EPS vector formats based on application and will optionally seek to retain figure aspect ratio when resizing.

Call this function using the syntax: CJfigtree(hFig,dirname,savename,saveblack,savewhite,savepng,savefig,saveeps,saveprint,savepaper,saveposter,savescreen,maintainaspect,figwidth,figunits)
Note that unlike FormatFig this function will export both black background and white background figures if desired.

hFig = handle to figure
dirname = save directory
savename = file name without extension
saveblack = save with black background, white text
savewhite = save with white background, black text. 
savepng = output figure as PNG, set to 0 or 1.
savefig= output figure as FIG, set to 0 or 1.
saveeps = output figure as EPS, set to 0 or 1.
saveprint = output figure for print. Sets colorspace to CMYK. Set to 0 or 1.
savepaper = output figure for paper. Adjusts size. Set to 0 or 1.
saveposter = output figure for poster. Adjusts size to larger than paper. Set to 0 or 1.
savescreen = output figure for screen. Sets colorspace to RGB. Set to 0 or 1.
maintainaspect = Attempts to maintain figure aspect ratio when resizing figure.
figwidth = Intended figure width.
figunits = Units for intended figure width.

## References


## License