%%%%%%%%%%%% A LaTeX template for IITM thesis/synopsis - 2019 %%%%%%%%%%%%%%%%%

This is a LaTeX2e system with a iitmdiss.cls file and various templates 
(thesis.tex, synopsis.tex and chapter.tex)
that should format a report as per the IITM Thesis/Synopsis guidelines.  
The page layout is set using the geometry package.  
The double/singlespacing is setup using setspace.
Figure captions are set using the hang option of caption2.  
natbib is used to do the citation using an author-year format.
I've made an iitm.bst file that formats the references as per the IITM guidelines.

To use this class do the following:
 \documentclass[options]{iitmdiss} 

Options:

  PhD, MS, MTech, DD, MBA, MSc or BTech -- generates the appropriate title page
  and loads the report class.

       Adding 'PrntForm' as additonal option to the class 
       (like \documentclass[PhD,PrntForm]{iitmdiss} ) 
       will generate the pdf that can be printable 
       (with chapters always starting on the right side and page
       numbers corrected appropriately)

  Adding 'synopsis' as option -- Generates the title page for the synopsis.  This also
  loads the article class instead of the report.
 
Example:

\documentclass[PhD,synopsis]{iitmdiss}
\documentclass[PhD,PrntForm]{iitmdiss}
\documentclass[MS]{iitmdiss}

IMPORTANT NOTICE:

  PLEASE DO NOT MESS WITH THE MARGINS AND GENERAL FORMATTING SETUP
  IN THIS FILE UNLESS YOU ARE ABSOLUTELY SURE THAT THE FORMAT DOES NOT
  MATCH WITH THE THESIS GUIDELINES.  FOR EXAMPLE, DO NOT CHANGE THE 
  MARGINS AND SPACING JUST TO MAKE YOUR THESIS SMALLER OR LARGER!

Notes:

  * I am using as much of the Thesis guidelines for the spacing
    and margins as I can (Check the institute guidelines from academic website or thesis_format.pdf in this folder to see the rules of formating)
  * I have used newdiss.cls by R.~K.~Hariram, U.~V.~Ravindra et al. 
    as a reference and a source for some of the macros.
  * This class will assume a4paper with 12pt fonts.
  * I am no TeXpert so feel free to clean up the mess.

Initial iitmdiss.cls contributed by: Prabhu Ramachandran <prabhu@ae.iitm.ac.in> March 2005.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
New Features contributed by: 
 	Ashruf Syed
 	Doctoral Student 
 	Department of Aerospace Engineering
 	IIT Madras, Chennai 600036, India
	<ashrufsyed@smail.iitm.ac.in>  <ashrufsyed@gmail.com>
 	Copyright (C) 2019 Ashruf Syed


New Features :
- removed obsolete options (t1enc, compat2, hypertex) and to work with Tex 2019
- added Dual Degree option for project report 
       	(can be edited to use it for any course based degree like M.Sc., M.A., M.B.A)
- added the option 'PrntForm' to produce thesis with the necessary blank pages for printing
- added clean.sh bash file (works with Linux systems which uses bash) to clean the latex files for a fresh compilation
- separation of main tex file from its chapter/sections (using \include{file} option) along with proper grouping and labeling of files for easier sorting and debugging
       	(A01_title, B01_abstract, C01_chap1, D01_app1 and E01_lop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
- added sample pages for quotations, dedication, glossary, abbreviations and notation
- cleaned up few parts where page numbers aren't required (quotes/dedication pages)
- added 'tabular' method for glossary/notation/abbreviations to avoid text overflow in long phrases that results from the usage of 'tabbing'
- corrected and added sample content to certificate; useful for co-guides and sponsored candidates
- corrected and added the necessary headings for 'List of Publications' chapter at the end
- added the sample CV and Committee pages at the end
- added opensource licensing to the file for unambiguity in free usage and distribution


%%%%%%%%%%%%%%%%%%     Licensing    %%%%%%%%%%%%%%%%%%%%%%%%%%%
 This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0) License. 
 To view a copy of this license, visit: https://creativecommons.org/licenses/by-nc/4.0/


Ashruf Syed <ashrufsyed@gmail.com>


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Read me file from the original contributor of this template

A LaTeX class (iitmdiss.cls) along with a simple template thesis
(thesis.tex) and synopsis (synopsis.tex) are provided here.  These can
be used to easily write a thesis (or synopsis) suitable for submission
at IIT-Madras.  The class provides options to format PhD, MS,
M.Tech. and B.Tech. thesis.  It also allows one to write a synopsis
using the same class file.  Also provided is a BIBTeX style file
(iitm.bst) that formats all bibliography entries as per the IITM
format.  A simple sample bibliography file (refs.bib) is also
provided.

For convenience, I've also included Stephan I. B"ottcher's lineno
package that allows one to add line numbers to each line of a LaTeX
document.


Compile the sample thesis like so: 

% latex thesis.tex
% bibtex thesis
% latex thesis.tex
% latex thesis.tex
% pdflatex thesis.tex

Please read thesis.dvi for more details.


Prabhu Ramachandran <prabhu@ae.iitm.ac.in>
