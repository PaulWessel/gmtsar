#!/bin/csh -f 
#       $Id$
#  D. Sandwell 1/12/07
#
alias rm 'rm -f'
unset noclobber
if ( -f ~/.quiet ) then
    set V = ""
else
	set V = "-V"
endif

#
#
#  project a grd file from range/azimuth coordinates into lon/lat coordinates
#  this version only works with GMT V4.0 and higher
#
#  Input:
#  trans.dat    - file generated by llt_grid2rat  (r a topo lon lat)
#  phase_ra.grd - a GRD file of phase or anything
#
#  Output:
#  phase_ll.grd - a GRD file of phase in longitude/latitude coordinates
#
# check for number of arguments
#
 if ($#argv < 3) then
  echo " "
  echo "Usage: proj_ra2ll.csh trans.dat phase.grd phase_ll.grd" 
  echo "        trans.dat    - file generated by llt_grid2rat  (r a topo lon lat)"
  echo "        phase_ra.grd - a GRD file of phase or anything" 
  echo "        phase_ll.grd - output file in lon/lat-coordinates" 
  echo " "
  exit 1
 endif 
 echo "proj_ra2ll.csh"
#
#  extract the phase in the r a positions
#
gmt grd2xyz $2 -s -bo3f > rap
#
#   make grids of longitude and latitude versus range and azimuth unless they already exist
#
if (! -f raln.grd || ! -f ralt.grd ) then
  gmt gmtconvert $1 -o0,1,3 -bi5d -bo3f > raln
  gmt gmtconvert $1 -o0,1,4 -bi5d -bo3f > ralt
#
gmt surface raln `gmt gmtinfo rap -I16/32 -bi3f` -bi3f -I16/32 -T.50 -Graln.grd $V
gmt surface ralt `gmt gmtinfo rap -I16/32 -bi3f` -bi3f -I16/32 -T.50 -Gralt.grd $V
endif
#
gmt grdtrack rap -nl -Graln.grd -bi3f -bo4f > rapln
gmt grdtrack rapln -nl -Gralt.grd -bi4f -bo5f > raplnlt
#
# get the lon, lat, phase columns and grid
#
gmt gmtconvert raplnlt -bi5f -bo3f -o3,4,2 > llp
#
# use higher resolution for data with higher range resolution and PRF
#
set filt = `ls gauss_*`
if ( $filt != "" ) then
    set pix_m = `ls gauss_* | awk -F_ '{print $2/4}'` # Use 1/4 the filter width
    echo "Sampling in geocoordinates with $pix_m meter pixels ..."
else
    set pix_m = 60
    echo "Sampling in geocoordinates with deault ($pix_m meter) pixel size ..."
endif

set incs = `m2s.csh $pix_m llp`			  # Get fine and crude grid interval for lookup grids
#
set R =  `gmt gmtinfo llp -I$incs[2] -bi3f `
gmt blockmedian llp $R -bi3f -bo3f -I$incs[1] -r -V > llpb
gmt xyz2grd llpb $R -I$incs[1]  -r -fg -G$3 -bi3f
#
# clean
#
rm rap* llp llpb raln ralt
