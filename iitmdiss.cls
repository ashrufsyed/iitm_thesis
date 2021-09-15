%%%%%%%%%%%% A New and Improved LaTeX template for IITM thesis/synopsis - 2020 %%%%%%%%%%%%%%%%%
%
% This is a class for LaTeX2e that should format a report as per
% the IITM Thesis guidelines.  The page layout is set using the
% geometry package.  The double/singlespacing is setup using
% setspace.  Figure captions are set using the hang option of
% caption2.  natbib is used to do the citation using an
% author-year format. I've made an iitm.bst file that formats 
% the references as per the IITM guidelines.
%
% To use this class do the following:
%  \documentclass[options]{iitmdiss} 
%
% Options:
%
%   PhD, MS, MTech, DD or BTech -- generates the appropriate title page
%   and loads the report class.

%	Adding 'PrntForm' as additonal option to the class 
%	(like \documentclass[PhD,PrntForm]{iitmdiss} ) 
%	will generate the pdf that can be printable 
%	(with chapters always starting on the right side and page
%	numbers corrected appropriately)
%
%   synopsis -- Generates the title page for the synopsis.  This also
%   loads the article class instead of the report.
%  
% Example:
%
% \documentclass[PhD,synopsis]{iitmdiss}
% \documentclass[PhD,PrntForm]{iitmdiss}
% \documentclass[MS]{iitmdiss}
%
% IMPORTANT NOTICE:
% 
%   PLEASE DO NOT MESS WITH THE MARGINS AND GENERAL FORMATTING SETUP
%   IN THIS FILE UNLESS YOU ARE ABSOLUTELY SURE THAT THE FORMAT DOES NOT
%   MATCH WITH THE THESIS GUIDELINES.  FOR EXAMPLE, DO NOT CHANGE THE 
%   MARGINS AND SPACING JUST TO MAKE YOUR THESIS SMALLER OR LARGER!
% 
% Notes:
%
%   * I am using as much of the Thesis guidelines for the spacing
%     and margins as I can (Check the institute guidelines from academic website or thesis_format.pdf in this folder to see the rules of formating)
%   * I have used newdiss.cls by R.~K.~Hariram, U.~V.~Ravindra et al. 
%     as a reference and a source for some of the macros.
%   * This class will assume a4paper with 12pt fonts.
%   * I am no TeXpert so feel free to clean up the mess.
%
% Initial iitmdiss.cls contributed by: Prabhu Ramachandran <prabhu@ae.iitm.ac.in> March 2005.

% New Features authored by: 
%% 	Ashruf Syed
%% 	Doctoral Student 
%% 	Department of Aerospace Engineering
%% 	IIT Madras, Chennai 600036, India
%%	<ashrufsyed@smail.iitm.ac.in>  <ashrufsyed@gmail.com>
%% 	Copyright (C) 2019-2021 Ashruf Syed
% 
% New Features (Aug 2021)
% 	- standardized with the revised guidelines of July 2021
% 	- added copyright page as inside cover page (it makes use of titlePage.tex)
% 	- 'proformas' template has been added (thanks to Shashank for making the template)
% 	- spacing between chapter name and the start of the text has been reduced (Aug 2021 compliance)
% 
% 
% New Features (Feb 2021)
% 	- standardized the template in compliance with the new IITM format guidelines released in Feb 2021. Added relevant pages/licensing example wherever required
%	- formatting guidelines included in a separate folder along with other proformas required while submitting your synopsis or thesis for convenience
%	- option to include a visually appealing figure/image from your thesis on the title page of thesis
%	- options for 'Blue' or 'Yellow' tape to represent the draft and approved reports on the title page of respective documents as per the new guidelines. Deafult is 'Black' for the final PhD thesis, along with 'NoColor' option for no color band if required
%	- example code for usage of 'subcaption' package for placing multiple sub-figures
%	- added IEEE bib style (in commented form below the iitm bibstyle optionin the present file) required in some departments

% New Features (2020)
% 	- removed obsolete options (compat2, hypertex) and to work with Tex 2019
%	- added Dual Degree option for project report 
%		(can be edited to use it for any course based degree like M.Sc., M.A., M.B.A)
%	- added the option 'PrntForm' to produce thesis with the necessary blank pages for printing
%	- added clean.sh bash file (works with Linux systems which uses bash) to clean the latex files for a fresh compilation
%	- separation of main tex file from its chapter/sections (using \include{file} option) along with proper grouping and labeling of files for easier sorting and debugging
%		(A01_title, B01_abstract, C01_chap1, D01_app1 and E01_lop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	- added sample pages for quotations, dedication, glossary, abbreviations and notation
%	- cleaned up few parts where page numbers aren't required (quotes/dedication pages)
%	- added 'tabular' method for glossary/notation/abbreviations to avoid text overflow in long phrases that results from the usage of 'tabbing'
%	- corrected and added sample content to certificate; useful for co-guides and sponsored candidates
%	- corrected and added the necessary headings for 'List of Publications' chapter at the end
%	- added the sample CV and Committee pages at the end
%
% 	- added opensource licensing to the file for unambiguity in free usage and distribution
% 	- moved packages, commands, preamble and postamble of the thesis to 0_settings folder for simpler look
%   	- fixed various bugs in iitm.bst and added doi/arxiv link support for references


%%%%%%%%%%%%%%%%%%%%     Licensing	  %%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0) License. 
%% To view a copy of this license, visit: https://creativecommons.org/licenses/by-nc/4.0/

%% So like any other piece of freely distributable code, this template and other files within this folder are provided "as is." There is no guarantee of any kind from the author
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{iitmdiss}[2019/12/20 Class for IIT-Madras Dissertations]

\newif\if@PhD
\newif\if@MS
\newif\if@MTech
\newif\if@DD
\newif\if@MA
\newif\if@MBA
\newif\if@MSc
\newif\if@BTech
\newif\if@Synopsis
\newif\if@PrntForm
\newif\if@NoColor
\newif\if@BlueTape
\newif\if@YellowTape


\DeclareOption{PhD}{\@PhDtrue}
\DeclareOption{MS}{\@MStrue}
\DeclareOption{MTech}{\@MTechtrue}
\DeclareOption{DD}{\@DDtrue}
\DeclareOption{MA}{\@MAtrue}
\DeclareOption{MBA}{\@MBAtrue}
\DeclareOption{MSc}{\@MSctrue}
\DeclareOption{BTech}{\@BTechtrue}
\DeclareOption{synopsis}{\@Synopsistrue}
\DeclareOption{PrntForm}{\@PrntFormtrue}
\DeclareOption{NoColor}{\@NoColortrue}
\DeclareOption{BlueTape}{\@BlueTapetrue}
\DeclareOption{YellowTape}{\@YellowTapetrue}

\ProcessOptions\relax

%% Definition of Programmes for global usage
%\if@PhD	\gdef\Progme{PhD} \fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Load the correct class.
\if@Synopsis
    \LoadClass[12pt,a4paper]{article}
\else
	\if@PrntForm
		\LoadClass[12pt,a4paper,twoside,openright]{report}
	\else
    	\LoadClass[12pt,a4paper]{report}
    \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geometry and page layout
\RequirePackage[a4paper,left=1.25in,right=1.25in,top=1in,bottom=0.67in,
nohead,includefoot,footskip=0.67in]{geometry}[2019/09/20]
%\RequirePackage[compat2,a4paper,left=1.5in,right=1in,top=1in,bottom=0.667in,
%                nohead]{geometry}[2002/07/08] %% compat2 is obsolete
\parskip 8pt %8pt 
\setlength{\parindent}{0pt} %To start any paragraph with no indentation - Comment this line if you want indentation on each paragraph
%\setlength{\footskip}{10pt}  % Added for page number adjustment without compat2

\renewcommand{\@pnumwidth}{2.5em}
%\renewcommand{\@tocrmarg}{2.5em}

%% For adding the color bands on the title page
\RequirePackage{eso-pic}
\definecolor{nocolor}{RGB}{255,255,255}
\definecolor{blutape}{RGB}{0,176,240}
\definecolor{ylwtape}{RGB}{255,255,0}
\definecolor{msfnl}{RGB}{0,176,240}
\definecolor{phdfnl}{RGB}{0,0,0}
\definecolor{other}{RGB}{230,230,250} % Sample color band for course degrees

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Using setspace to do the single/double spacing.  Setspace also
%% makes all tables and figures have single spacing automatically.
\RequirePackage{setspace} 

%% Tag utility to re-use only certain parts of the latex code from a given file
%% Used for duplicating titlePage code for generating copyright page
\RequirePackage{catchfilebetweentags} 

\RequirePackage{atbeginend} % used to redefine the list environs
\setstretch{1.5}
%\doublespacing  % For double spacing
%\setstretch{2} % Alternate double-spacing

\BeforeBegin{itemize}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{itemize}{\end{singlespace}}

\BeforeBegin{enumerate}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{enumerate}{\end{singlespace}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The figure captioning is done correctly via the hang option.
%%\RequirePackage[hang]{caption2}  -> TeX generates error
\RequirePackage[hang]{caption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
% 
% natbib allows easy switching of citation style and using it along
% with the iitm.bst makes things perfect.
\RequirePackage[authoryear,round]{natbib} 
%\RequirePackage[numbers,square]{natbib}  % For IEEE like format with numbered citation
\bibliographystyle{iitm}

\newcommand{\bibstyle@iitm}{\bibpunct{(}{)}{;}{a}{,}{,}%
     \gdef\NAT@biblabel##1{##1. }}
%
\setlength{\bibhang}{0pt}
\citestyle{iitm}
%\citestyle{unsrt_newen}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other useful macros.  Many of these are modifications from newdiss.cls

% \department{department name} -- user macro to declare name of department.
\def\department#1{\gdef\@department{#1}}

%\RequirePackage[dvips]{graphicx}

%% Title page (main)
\input{titlePage.tex}
\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\newpage}

%% Title page (copyright)
\newcommand{\maketitlepagecprt}{{
	% \input{titlePageCprt}
	%% -------------------------------------------
	%% Using tag utility to re-use part of the code from titlePage.tex
	\ExecuteMetaData[titlePage.tex]{tag} 
	%%%%   Copyright and year at the bottom		%%%%%%%%%%%%
	\vfill
	\raggedbottom
	\noindent
	%\vskip 2ex
	\hskip 4ex 
	\copyright \hskip 0.3ex 
	\the\year{} Indian Institute of Technology Madras
}}

\if@Synopsis
%   \renewcommand\refname{REFERENCES}
\else
   % QUOTATIONS (Optional)
   %
   \def\quotations{\chapter*{\centerline{QUOTATIONS}}
   	 \thispagestyle{empty}
   %\addcontentsline{toc}{chapter}{QUOTATIONS}
   }

   % DEDICATION (Optional)
   %
   \def\dedication{\chapter*{\centerline{DEDICATION}}
   	 \thispagestyle{empty}
   %\addcontentsline{toc}{chapter}{DEDICATION}
   }

   % CERTIFICATE
   %
   %   - this produces a certificate page as per IITM Regulations
   %     comment the following lines out to get it working.
   %
   \if@PhD
   \def\certificate{\chapter*{\centerline{ \underline{THESIS CERTIFICATE} }}%% A preliminary chapter
     %\vspace*{36pt}
     %\centerline{\Large \bf THESIS CERTIFICATE}
     \vskip 10pt
     \thispagestyle{empty}
     %\typeout{Certificate}
     %\setcounter{page}{-1}
   }
   \else
   \if@MS
	\def\certificate{\chapter*{\centerline{ \underline{THESIS CERTIFICATE} }}%% A preliminary chapter
	\vskip 10pt
	\thispagestyle{empty}
	}
   \else
   \def\certificate{\chapter*{\centerline{ \underline{CERTIFICATE} }}%% A preliminary chapter
	\vskip 10pt
	\thispagestyle{empty}
	}
	\fi
	\fi
	

	%%%  LIST OF PAPERS
	\def\listofpapers{
	%\normalbaselines
	\chapter*{\centerline{LIST OF PUBLICATIONS}}
	%\markboth{LIST OF PUBLICATIONS}{LIST OF PUBLICATIONS}
	%\addcontentsline{toc}{chapter}{LIST OF PUBLICATIONS}
	\vskip 10pt
	\thispagestyle{empty}
	}


   % ACKNOWLEDGEMENTS
   %
   \def\acknowledgements{\chapter*{\centerline{ACKNOWLEDGEMENTS}}
     \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
     \setcounter{page}{1}  %Start page numbering from acknowledgements
   }

   % ABSTRACT
   %   - this produces pages suitable for an IITM Abstract
   \def\abstract{\chapter*{\centerline{ABSTRACT}}
   \addcontentsline{toc}{chapter}{ABSTRACT}
   }

   % GLOSSARY
   %
   \def\glossary{\chapter*{\centerline{GLOSSARY}}
   \addcontentsline{toc}{chapter}{GLOSSARY}
   }

   % ABBREVIATIONS
   %
   \def\abbreviations{\chapter*{\centerline{ABBREVIATIONS}}
   \addcontentsline{toc}{chapter}{ABBREVIATIONS}
   }

   % NOTATION
	%
	\def\notation{\chapter*{\centerline{NOTATION}}
	\addcontentsline{toc}{chapter}{NOTATION}
	}

   % Use the nomencl package for the NOTATION section.
\RequirePackage{anyfontsize} %% To adjust chapter headings to 15pt size
   % Makes the chapter heading for main chapters/appendices
   \def\@makechapterhead#1{%
     {\parindent \z@ \raggedright \normalfont
       \ifnum \c@secnumdepth >\m@ne
       \begin{center}
         \fontsize{15pt}{18}\selectfont \bfseries \@chapapp\space \thechapter
         % \Large \bfseries \@chapapp\space \thechapter %% old size
       \end{center}
       \par\nobreak
       \vspace*{-0.7cm} % \vskip 20\p@  %% Sp
       \fi
       \interlinepenalty\@M
       \fontsize{15pt}{18}\selectfont \bf
       % \Large \bf %% old size
       \begin{center}
         #1\par\nobreak      
       \end{center}
       \vskip 20\p@ %20\p@ % triple spacing between the chapter title and the first line of the chapter
       \thispagestyle{empty}
     }}

   % Makes the chapter heading for \chapter* (other than main chapters and appendices)
   \def\@makeschapterhead#1{%
     % \vspace*{25\p@} %\vspace*{25\p@}%
     {\parindent \z@ \raggedright
       \normalfont
       \interlinepenalty\@M
       \fontsize{15pt}{18}\selectfont \bfseries #1\par\nobreak
       % \Large \bfseries #1\par\nobreak %% old size
       \vskip 30\p@ %20\p@
       %\vspace*{-0.7cm}
     }}

   
   % CV
   \def\CV{\chapter*{\centerline{CURRICULUM VITAE}}}

   % Comittee
   \if@PhD
       \def\committee{\chapter*{\centerline{DOCTORAL COMMITTEE}}}
   \else
       \if@MS
          \def\committee{\chapter*{\centerline{GENERAL TEST COMMITTEE}}}
        \fi
   \fi


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Renewed commands to set the titles of various pages correctly.
   \renewcommand\contentsname{\centering TABLE OF CONTENTS}
   \renewcommand\listfigurename{\centering LIST OF FIGURES}
   \renewcommand\listtablename{\centering LIST OF TABLES}
   \renewcommand{\chaptername}{CHAPTER}
   \renewcommand\bibname{\centering REFERENCES}

   \renewcommand\appendixname{APPENDIX}
   \renewcommand{\fnum@figure}{Fig. \thefigure}
\fi


