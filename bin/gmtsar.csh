#!/bin/csh -f
#       $Id$
#   summary of shell scripts
#
echo ' '
echo 'align.csh		        - align a pair of SAR images'
echo 'align_batch.csh		- align a stack of SAR images'
echo 'baseline_table.csh	- make baseline vs time table'
echo 'cleanup.csh		- cleanup the directories'
echo 'dem2topo_ra.csh		- transform a dem into range and azimuth coordinates'
echo 'filter.csh		- filter the interferogram and make amp, phase and corr'
echo 'fitoffset.csh		- solve for the affine parameters'
echo 'geocode.csh		- convert range/azimuth to lon/lat'
echo 'grd2kml.csh		- make a kml file for google earth'
echo 'intf.csh                  - make the interferogram from a single pair of SLCs'
echo 'intf_batch.csh		- make interferograms for a set of aligned SLCs'
echo 'landmask.csh              - make a landmask'
echo 'make_a_offset.csh         - make azimuth offsets'
echo 'make_dem.csh		- construct a dem from tiles'
echo 'pre_proc.csh		- preprocess the raw SAR data for a pair of images'
echo 'pre_proc_batch.csh	- preprocess raw SAR data for a stack of images with common parameters '
echo 'pre_proc_init.csh	        - preprocess raw SAR data for a stack of images with default parameters '
echo 'p2p_ALOS.csh              - process an interferogram from end-to-end for ALOS'
echo 'p2p_ALOS_SLC.csh          - process an interferogram from end-to-end for ALOS 1 0r 2 starting at SLC'
echo 'p2p_CSK.csh               - process an interferogram from end-to-end for CSK'
echo 'p2p_CSK_SLC.csh               - process an interferogram from end-to-end for CSK_SLC'
echo 'p2p_ENVI.csh              - process an interferogram from end-to-end for ENVI'
echo 'p2p_ERS.csh               - process an interferogram from end-to-end for ERS'
echo 'p2p_ERS.csh               - process an interferogram from end-to-end for ERS'
echo 'p2p_RS2_SLC.csh               - process an interferogram from end-to-end for RS2_SLC'
echo 'p2p_S1A_SLC.csh               - process an interferogram from end-to-end for S1A_SLC'
echo 'p2p_TSX_SLC.csh               - process an interferogram from end-to-end for TSX_SLC'
echo 'proj_ll2ra.csh		- project a grd file from lon/lat to range/azimuth'
echo 'proj_ll2ra_ascii.csh	- project points from lon/lat to range/azimuth'
echo 'proj_model.csh            - project a crust motion model into radar looking directions'
echo 'proj_ra2ll.csh		- project a grd file from range/azimuth to lon/lat'
echo 'proj_ra2ll_ascii.csh	- project points from range/azimuth to lon/lat'
echo 'sarp.csh		        - focus a single SAR image'
echo 'slc2amp.csh               - make and amplitude image from and SLC'
echo 'snaphu.csh		- unwrap phase using snaphu'
echo 'stack_corr.bash           - stack the correlation to compute mean correlation'
echo 'stack_phase.bash          - stack the phase to compute mean LOS velocity'
echo 'update_PRM		- replace a value in a PRF-file'
echo ' '
