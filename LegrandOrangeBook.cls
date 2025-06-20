%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Legrand Orange Book
% LaTeX Class
% Version 3.1 (February 18, 2022)
%
% Authors:
% Vel (vel@latextemplates.com)
% Mathias Legrand (legrand.mathias@gmail.com)
% 
% This class originates from:
% https://www.LaTeXTemplates.com
%
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LegrandOrangeBook}[2022/01/26 The Legrand Orange Book Class v3.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{book} % Load the base class

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES AND CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{graphicx} % Required for including pictures
\graphicspath{{Images/}} % Specifies the directory where pictures are stored

\usepackage{float} % Allows more precisely positioning floats e.g. \begin{figure}[H]

\usepackage[usenames, svgnames, table]{xcolor} % Required for defining and using custom colors

\usepackage{calc} % For simpler calculations - used for spacing the index letter headings correctly

\usepackage{changepage} % Required for temporarily indenting text blocks

\usepackage[toc]{appendix} % Required for the appendices chapters

\usepackage{etoolbox} % Required for conditional logic and easily changing commands

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=2.5cm, % Top margin
	bottom=2.5cm, % Bottom margin
	inner=2.5cm, % Inner margin (left on odd pages, right on even or left in oneside mode)
	outer=2.5cm, % Outer margin (right on odd pages, left on even or right in oneside mode)
	headsep=10pt, % Space from the top margin to the baseline of the header
	headheight=0.68cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	columnsep=.5cm, % Horizontal space between columns when in two column mode
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage{avant} % Use the Avantgarde font for headings

\usepackage{mathptmx} % Use the Adobe Times Roman as the default text font together with math symbols from the Symbol, Chancery and Computer Modern fonts

%\usepackage{lmodern}

\usepackage{microtype} % Improve typography

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Required for customizing headers and footers
\pagestyle{fancy} % Enable the custom headers and footers

\renewcommand{\headrulewidth}{0.5pt} % Top horizontal rule thickness

% \renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\chaptername\ \thechapter.~#1}{}} % 
\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries Capítulo\ \thechapter.~#1}{}} % Redefine the styling of the current chapter name in the header
\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection~#1}{}} % Redefine the styling of the current section name in the header

\fancyhf{} % Clear default headers and footers

%\fancyhead[LE, RO]{\sffamily\thepage} % Header for left even pages and right odd pages
\fancyhead[RO]{\sffamily\thepage}

%\fancyhead[LO, RE]{\includegraphics[width=1cm]{./Images/uff-blue.pdf}}
\fancyhead[LO]{\includegraphics[width=1cm]{./Images/uff-blue.pdf}}

%\fancyhead[CE]{\rightmark} % Header for left odd pages

\fancyhead[CO]{\leftmark} % Header for right even pages

\fancypagestyle{plain}{ % Style for when a plain pagestyle is specified
	\fancyhead{} % Clear headers
	\renewcommand{\headrulewidth}{0pt} % Remove header rule
}

\usepackage{emptypage} % This package removes headers and footers on empty pages between chapters

%----------------------------------------------------------------------------------------
%	SECTION STYLING
%----------------------------------------------------------------------------------------

\setcounter{secnumdepth}{3} % Number sections down to subsubsections, a value of 2 will number to subsections only and 1 to sections only

\usepackage[
	explicit, % Specify section names explicitly in \titleformat with #1
	newparttoc, % Required for writing the part toc entry number in a standard way (overriding default LaTeX behavior) so the titletoc package can style it
]{titlesec} % Required for modifying sections

%-------------------------------------------

% Command to create and output the parts pages
\newcommand{\outputpartpage}[2]{
        %\tikzset{external/export=false}
	\begin{tikzpicture}[remember picture, overlay]
		\node[anchor=center, rectangle, fill=cormodelo!20, inner sep=0pt, minimum height=\paperheight, minimum width=\paperwidth] at (current page.center) {}; % Background color
		\node[anchor=north west, inner sep=0pt, xshift=\Gm@lmargin, yshift=-\Gm@tmargin] at (current page.north west) {\fontsize{220pt}{220pt}\selectfont\sffamily\bfseries\textcolor{cormodelo!40}{#1}}; % Part number
		\node[anchor=north east, inner sep=0pt, xshift=-\Gm@rmargin, yshift=-\Gm@tmargin] at (current page.north east) {\fontsize{30pt}{30pt}\selectfont\sffamily\bfseries\textcolor{cormodelo}{\strut #2}}; % Part title
		\node[anchor=south east, inner sep=0pt, xshift=-\Gm@rmargin, yshift=\Gm@bmargin] at (current page.south east) { % Mini table of contents
			\parbox[t][][t]{8.5cm}{ % Width of box holding the mini ToC
				\printcontents[part]{l}{0}{\setcounter{tocdepth}{1}} % Display the mini table of contents showing chapters and sections, change tocdepth to 2 to also show subsections or 0 to only show chapters
			}
		};
	\end{tikzpicture}
}

\titleformat
	{\part} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\startcontents[part]\outputpartpage{\thepart}{#1}} % Format of the whole section
	{} % Format of the section label
	{0em} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

 \titleformat
	{name=\part, numberless} % Section type being modified
	[block]% Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{} % Format of the whole section
	{} % Format of the section label
	{0em} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

%-------------------------------------------

% Command to store the current chapter image to use for all future chapters, can be changed any time in the document and can be empty
\newcommand{\thechapterimage}{}
\newcommand{\chapterimage}[1]{\renewcommand{\thechapterimage}{#1}}

% Command to store the current whitespace above the chapter title box for all future chapters, can be changed at any time in the document
\newcommand{\thechapterspaceabove}{}
\newcommand{\chapterspaceabove}[1]{\renewcommand{\thechapterspaceabove}{#1}}

% Command to store the current whitespace below the chapter title box for all future chapters, can be changed at any time in the document
\newcommand{\thechapterspacebelow}{}
\newcommand{\chapterspacebelow}[1]{\renewcommand{\thechapterspacebelow}{#1}}

% Command to output the chapter title with optional background image
\newcommand{\outputchaptertitle}[2]{
        %\tikzset{external/export=false}
	\begin{tikzpicture}[remember picture, overlay, ]
		% If a chapter image has been specified
		\expandafter\ifstrequal\expandafter{\thechapterimage}{}{}{
			% Output the chapter image
			\node[
				anchor=north west, % Anchor point on the image
				inner sep=0pt, % Inner padding
			] at (current page.north west) {\includegraphics[width=\paperwidth]{\thechapterimage}};
		}
		% Box with the chapter title
		\draw[anchor=west] (current page.north west) node [
			anchor=north west, % Anchor point of the chapter box
			xshift=\Gm@lmargin, % Horizontal distance from the left side of the page
			yshift=-\thechapterspaceabove, % Vertical distance from the top of the page
			line width=2pt, % Border line thickness
			rounded corners=10pt, % Rounded corners amount
			draw=cormodelo, % Border line color
			fill=black!5, % Box background color
			fill opacity=0.6, % Background transparency
			text opacity=1, % Text transparency
			inner ysep=12.5pt, % Inner vertical padding
			inner xsep=20pt, % Inner horizontal padding
			align=flush left, % Text alignment inside box
			text width=1.2\linewidth, % Box width (wider than page to go off the right side)
			font=\huge\sffamily\bfseries, % Font styling for chapter title
		] {\parbox{0.85\linewidth}{\strut\raggedright\expandafter\ifstrequal\expandafter{#1}{}{}{#1. }#2\vspace{-3pt}}}; % Chapter title in a fixed width box for wrapping
	\end{tikzpicture}
}

% Numbered chapters
\titleformat
	{\chapter} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\outputchaptertitle{\thechapter}{#1}} % Format of the whole section
	{} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

% Unnumbered chapters
\titleformat
	{name=\chapter, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\outputchaptertitle{}{#1}} % Format of the whole section
	{} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\chapter}{0pt}{0pt}{\thechapterspacebelow} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\section} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\Large} % Format of the whole section
	{\llap{\textcolor{cormodelo}{\thesection}\hspace{.4em}}#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label
	
\titleformat
	{name=\section, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\Large} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\section}{0pt}{12pt}{6pt} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\subsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\large} % Format of the whole section
	{\llap{\textcolor{cormodelo}{\thesubsection}\hspace{.4em}}#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label
	
\titleformat
	{name=\subsection, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily\large} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\subsection}{0pt}{12pt}{4pt} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\subsubsection} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily} % Format of the whole section
	{\llap{{\thesubsubsection}\hspace{1em}}#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label
	
\titleformat
	{name=\subsubsection, numberless} % Section type being modified
	[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily} % Format of the whole section
	{#1} % Format of the section label
	{0cm} % Space between the title and label
	{} % Code before the label
	[] % Code after the label

\titlespacing*{\subsubsection}{0pt}{8pt}{4pt} % Spacing around section titles, the order is: left, before and after

%-------------------------------------------

\titleformat
	{\paragraph} % Section type being modified
	[runin] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries\sffamily} % Format of the whole section
	{} % Format of the section label
	{0cm} % Space between the title and label
	{#1} % Code before the label
	[] % Code after the label

\titlespacing*{\paragraph}{0pt}{0pt}{6pt} % Spacing around section titles, the order is: left, before and after

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

\usepackage{titletoc} % Required for manipulating the table of contents

\setcounter{tocdepth}{0} % Display down to subsections in the table of contents

\contentsmargin{0cm} % Removes the default right margin

%------------------------------------------------

% Styling of numbered parts in the table of contents
\newcommand{\tocentrypartnumbered}[1]{%
	\setlength\fboxsep{0pt}% Remove box padding
	\contentslabel[%
		% Part number box
		\colorbox{cormodelo!20}{% Background color
			\strut\parbox[c][.7cm]{1.1cm}{% Box size
				\color{cormodelo!70}\Large\sffamily\bfseries\centering\thecontentslabel% Part number
			}%
		}%
		\hspace{4pt}%
		% Part title box
		\colorbox{cormodelo!40}{% Background color
			\strut\parbox[c][.7cm]{\linewidth-1.25cm}{% Box size
				\centering\Large\sffamily #1% Part title
			}%
		}%
	]{1.25cm}
}

% Styling of unnumbered parts in the table of contents
\newcommand{\tocentrypartunnumbered}[1]{%
	\setlength\fboxsep{0pt}% Remove box padding
	\contentslabel[%
		% Part title box
		\colorbox{cormodelo!40}{% Background color
			\strut\parbox[c][.7cm]{\linewidth}{% Box size
				\centering\Large\sffamily #1% Part title
			}%
		}%
	]{1.25cm}
}

\titlecontents{part} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{20pt}\Large\sffamily\bfseries\hypersetup{linkcolor=black}} % Before code
	{\tocentrypartnumbered} % Formatting of numbered sections of this type
	{\tocentrypartunnumbered} % Formatting of numberless sections of this type
	{} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{chapter} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{12pt}\large\sffamily\bfseries\hypersetup{linkcolor=cormodelo}} % Before code
	{\color{cormodelo}\contentslabel[\Large\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{\color{cormodelo!60}\normalsize\;\titlerule*[6pt]{.}\;\color{cormodelo}\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{section} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{3pt}\sffamily\bfseries} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{subsection} % Section type being modified
	[1.25cm] % Left indentation
	{\addvspace{1pt}\sffamily\small} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code
	
%------------------------------------------------

\titlecontents{subsubsection} % Section type being modified
	[1.75cm] % Left indentation
	{\sffamily\small} % Before code
	{\contentslabel[\thecontentslabel]{1.75cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

% List of figures entries
\titlecontents{figure} % Section type being modified
	[0cm] % Left indentation
	{\addvspace{2pt}\sffamily\small} % Before code
	{\thecontentslabel\hspace*{1em}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

% List of tables entries
\titlecontents{table} % Section type being modified
	[0cm] % Left indentation
	{\addvspace{2pt}\sffamily\small} % Before code
	{\thecontentslabel\hspace*{1em}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~\titlerule*[6pt]{.}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number
	[] % After code

%------------------------------------------------

\titlecontents{lchapter} % Chapter headings on part pages
	[0cm] % Left indentation
	{\addvspace{12pt}\large\sffamily\bfseries\hypersetup{linkcolor=cormodelo}} % Before code
	{\color{cormodelo}\contentslabel[\Large\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{\color{cormodelo}} % Formatting of numberless sections of this type
	{~\color{cormodelo!60}\normalsize\titlerule*[6pt]{.}~\color{cormodelo}\thecontentspage} % Formatting of the filler to the right of the heading and the page number

%------------------------------------------------

\titlecontents{lsection} % Section headings on part pages
	[0cm] % Left indentation
	{\sffamily\small} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number

%------------------------------------------------

\titlecontents{lsubsection} % Subsection headings on part pages
	[0cm] % Left indentation
	{\sffamily\footnotesize} % Before code
	{\contentslabel[\thecontentslabel]{1.25cm}\hspace{0.5cm}} % Formatting of numbered sections of this type
	{} % Formatting of numberless sections of this type
	{~{\normalfont\titlerule*[6pt]{.}}~\thecontentspage} % Formatting of the filler to the right of the heading and the page number

%----------------------------------------------------------------------------------------
%	BIBLIOGRAPHY
%----------------------------------------------------------------------------------------

\usepackage[
	backend=biber, % Use the biber engine for compiling the bibliography
	bibstyle=numeric, % Main bibliography style
	citestyle=numeric, % In-text citation style
	sorting=nyt, % Sort references in the bibliography by name, then year, then title
	sortcites=true, % If multiple citekeys are passed to a citation command, sort them in the citation
	abbreviate=false, % Suppress abbreviations such as "Ed." for Editor
	backref=true, % List the page where references were cited in the bibliography
	defernumbers=true,
]{biblatex}

\defbibheading{bibempty}{} % Suppress default bibliography headings

%----------------------------------------------------------------------------------------
%	INDEX
%----------------------------------------------------------------------------------------

\usepackage{makeidx} % Required to make an index

\makeindex % Tells LaTeX to create the files required for indexing

% Modify the command to output the index to output the correctly styled Index name to the page headers
\patchcmd{\theindex}
	{\MakeUppercase\indexname} % Find
	{\sffamily\normalsize\bfseries\indexname} % Replace
	{}
	{}

%----------------------------------------------------------------------------------------
%	 TABLES
%----------------------------------------------------------------------------------------

\usepackage{array} % Required for manipulating table elements

\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}} % Define a new right-aligned paragraph column type
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}} % Define a new left-aligned (no justification) paragraph column type
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}} % Define a new centered paragraph column type

\usepackage{booktabs} % Required for high quality horizontal rules in tables

%----------------------------------------------------------------------------------------
%	 LISTS
%----------------------------------------------------------------------------------------

%\usepackage{enumitem} % Required for list customization

%\setlist{nolistsep, noitemsep} % Customize spacing inside and outside lists

%\renewcommand{\labelenumi}{\arabic{enumi}.} % Customize the first level numbered list characters
%\renewcommand{\labelenumii}{\alph{enumii}.} % Customize the second level numbered list characters
%\renewcommand{\labelenumiii}{\roman{enumiii}.} % Customize the third level numbered list characters

%------------------------------------------------

%\renewcommand{\labelitemi}{\raisebox{-2pt}{\Large \textbullet}} % Customize the first level bullet point character
%\renewcommand{\labelitemii}{--} % Customize the second level bullet point character
%\renewcommand{\labelitemiii}{$\circ$} % Customize the third level bullet point character

%----------------------------------------------------------------------------------------
%	LINKS
%----------------------------------------------------------------------------------------

\usepackage{hyperref}

\hypersetup{
	colorlinks=true, % Whether to color links (a thin box is output around links if this is false)
	%hidelinks, % Hide the default boxes around links
	urlcolor=cormodelo, % Color for \url and \href links
	linkcolor=black, % Color for \ref/\nameref links
	citecolor=cormodelo, % Color for reference citations like \cite{}
%	hyperindex=true, % Adds links from the page numbers in the index to the relevant page
	linktoc=all, % Link from section names and page numbers in the table of contents
}

%----------------------------------------------------------------------------------------
%	BOOKMARKS
%----------------------------------------------------------------------------------------

\usepackage{bookmark} % Required for customizing PDF bookmarks

\bookmarksetup{
	open, % Open all bookmark drawers automatically
	numbered, % Add section numbers to bookmarks
	addtohook={%
		\ifnum\bookmarkget{level}=-1 % Customize part bookmarks
			\bookmarksetup{color=cormodelo, bold}% Bold and colored
		\fi
		\ifnum\bookmarkget{level}=0 % Customize chapter bookmarks
			\bookmarksetup{bold}% Bold
		\fi
	}
}

%----------------------------------------------------------------------------------------
%	TITLE PAGE
%----------------------------------------------------------------------------------------

\renewcommand{\titlepage}[2]{
	\thispagestyle{empty} % Suppress headers and footers on the title page

	\begin{tikzpicture}[remember picture, overlay]
		\node [inner sep=0pt] at (current page.center) {#1}; % Background image
		\node [anchor=center, inner sep=1.25cm, rectangle, fill=cormodelo!00!white, fill opacity=0.6, text opacity=1, minimum height=0.2\paperheight, minimum width=\paperwidth, text width=0.8\paperwidth] at (current page.center) {#2}; % Title highlight box with title(s) and author(s)
	\end{tikzpicture}
	
	\newpage
}

%----------------------------------------------------------------------------------------
%	THEOREM STYLES
%----------------------------------------------------------------------------------------

\usepackage{amsmath, amsfonts, amssymb, amsthm} % For math equations, theorems, symbols, etc

\renewcommand{\qedsymbol}{$\blacksquare$} % Redefine the QED symbol to be a filled square vs. the default unfilled square

%------------------------------------------------

% Orange theorem number and optional black title with padding above and below
\newtheoremstyle{cormodelonum} % Theorem style name
	{6pt} % Space above
	{6pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries\color{cormodelo}\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	\thmnote{\the\thm@notefont\sffamily\bfseries\color{cormodelo}(#3)\hspace{0.25em}}} % Optional theorem note

%------------------------------------------------

% Orange theorem number and optional black title with no padding above and below
\newtheoremstyle{cormodelonumbox} % Theorem style name
	{0pt} % Space above
	{0pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries\color{cormodelo}\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	%\thmnote{\the\thm@notefont\sffamily\bfseries\color{cormodelo}---~#3.\hspace{0.25em}}} % Optional theorem note
    \thmnote{\the\thm@notefont\sffamily\bfseries\color{cormodelo}(\textbf{#3})\hspace{0.25em}}} % Changed: Optional theorem note now in bold and parentheses
%------------------------------------------------

% Black theorem number and optional black title no padding above and below
\newtheoremstyle{blacknumex} % Theorem style name
	{6pt} % Space above
	{6pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries{\raisebox{1.25pt}{\tiny\ensuremath{\blacksquare}}}~\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	\thmnote{\the\thm@notefont\sffamily\bfseries---~#3.\hspace{0.25em}}} % Optional theorem note

%------------------------------------------------

% Black theorem number and optional black title padding above and below
\newtheoremstyle{blacknumbox} % Theorem style name
	{0pt} % Space above
	{0pt} % Space below
	{\normalfont} % Body font
	{} % Indent amount
	{} % Theorem head font
	{} % Punctuation after theorem head
	{0.25em} % Space after theorem head
	{\small\sffamily\bfseries\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
	\thmnote{\the\thm@notefont\sffamily\bfseries---~#3.\hspace{0.25em}}} % Optional theorem note

%------------------------------------------------


% Set the theorem style for each type of theorem-like environment by placing it under the theorem style you would like to use for it

% Orange theorem number and optional black title with padding above and below
\theoremstyle{cormodelonum}

% Orange theorem number and optional black title with no padding above and below
%\theoremstyle{cormodelonumbox}
\newtheorem{theoremeT}{Teorema}[chapter] % Theorems, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{propT}{Proposição}[chapter] % Propositions, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{lemaT}{Lema}[chapter] % Propositions, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{problem}{Problema}[chapter] % Problems, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{exerciseT}{}[chapter] % Exercises, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{corollaryT}{Corolário}[chapter] % Corollaries, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
% Black theorem number and optional black title no padding above and below
\theoremstyle{blacknumex}
\newtheorem{exampleT}{Exemplo}[chapter] % Examples, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
\newtheorem{notation}{Notação}[chapter] % Notations, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
%\newtheorem*{notation*}{Notação}[chapter]
\newtheorem{vocabulary}{Vocabulary}[chapter] % Vocabularies, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)

% Black theorem number and optional black title with padding above and below
\theoremstyle{blacknumbox}
\newtheorem{definitionT}{Definição}[chapter] % Definitions, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)

%----------------------------------------------------------------------------------------
%	COLORED THEOREM BOXES
%----------------------------------------------------------------------------------------

\RequirePackage[framemethod=default]{mdframed} % Required for creating colored boxes used for theorems, definitions, exercises and corollaries

% Theorem box
\newmdenv[
	skipabove=10pt, % Whitespace above box
	skipbelow=10pt, % Whitespace below box
	backgroundcolor=black!5, % Background color
	linecolor=cormodelo, % Border color
	innerleftmargin=7pt, % Inside left margin width
	innerrightmargin=7pt, % Inside right margin width
	innertopmargin=0pt, % Inside top margin height
	innerbottommargin=7pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{tBox}

\newmdenv[
	skipabove=10pt, % Whitespace above box
	skipbelow=10pt, % Whitespace below box
	backgroundcolor=black!5, % Background color
	linecolor=cormodelo, % Border color
	innerleftmargin=10pt, % Inside left margin width
	innerrightmargin=10pt, % Inside right margin width
	innertopmargin=10pt, % Inside top margin height
	innerbottommargin=10pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{obsBox}

% Exercise box
\newmdenv[
	skipabove=0pt, % Whitespace above box
	skipbelow=0pt, % Whitespace below box
	rightline=false, % Right line visible
	leftline=false, % Left line visible
	topline=true, % Top line visible
	bottomline=false, % Bottom line visible
	linecolor=cormodelo, % Line color
	linewidth=2pt, % Line width
	backgroundcolor=cormodelo!0, % Background color
	innerleftmargin=5pt, % Inside left margin width
	innerrightmargin=5pt, % Inside right margin width
	innertopmargin=2pt, % Inside top margin height
	innerbottommargin=2pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{eBox}

% Definition box
\newmdenv[
	skipabove=7pt, % Whitespace above box
	skipbelow=7pt, % Whitespace below box
	rightline=false, % Right line visible
	leftline=true, % Left line visible
	topline=false, % Top line visible
	bottomline=false, % Bottom line visible
	linecolor=cormodelo, % Border color
	linewidth=4pt, % Border width
	innerleftmargin=5pt, % Inside left margin width
	innerrightmargin=5pt, % Inside right margin width
	innertopmargin=0pt, % Inside top margin height
	innerbottommargin=0pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{dBox}

% Corollary box
\newmdenv[
	skipabove=7pt, % Whitespace above box
	skipbelow=7pt, % Whitespace below box
	rightline=false, % Right line visible
	leftline=true, % Left line visible
	topline=false, % Top line visible
	bottomline=false, % Bottom line visible
	linecolor=gray, % Line color
	linewidth=4pt, % Line width
	backgroundcolor=black!5, % Background color
	innerleftmargin=5pt, % Inside left margin width
	innerrightmargin=5pt, % Inside right margin width
	innertopmargin=0pt, % Inside top margin height
	innerbottommargin=5pt, % Inside bottom margin height
	leftmargin=0cm, % Outside left margin width
	rightmargin=0cm % Outside right margin width
]{cBox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Exercises and Answers %%%%
%\usepackage[lastexercise]{exercise}
\usepackage[answerdelayed,lastexercise]{exercise}
\usepackage{chngcntr}
\counterwithin{Exercise}{chapter}
\counterwithin{Answer}{chapter}

\renewcommand{\ExerciseHeaderTitle}{({\it \ExerciseTitle})}
\renewcommand{\ExerciseName}{}
\renewcommand{\ExerciseHeader}{}

% change font for answers header
\renewcommand{\AnswerHeader}{\scriptsize\sffamily\bfseries\color{cormodelo}{\ExerciseHeaderNB.}\smallskip}
% change font for answers list header
%\renewcommand{\AnswerListHeader}{{\small\textbf{\AnswerListName\
%(\ExerciseListName\ \ExerciseHeaderNB)\ ---\ }}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{totcount}
\newtotcounter{totalExercicios}
\newtotcounter{totalExemplos}

% Creates an environment for each type of theorem and assigns it a theorem text style from the THEOREM STYLES block above and a colored box from above
\newenvironment{teo}{\begin{tBox}\begin{theoremeT}}{\end{theoremeT}\end{tBox}}

\newenvironment{prop}{\begin{tBox}\begin{propT}}{\end{propT}\end{tBox}}

\newenvironment{lema}{\begin{tBox}\begin{lemaT}}{\end{lemaT}\end{tBox}}

\newenvironment{exer}{\stepcounter{totalExercicios}\begin{Exercise}\end{Exercise}\begin{eBox}\begin{exerciseT}\small}{\vfill\end{exerciseT}\end{eBox}}

\newenvironment{defic}{\begin{dBox}\begin{definitionT}}{\end{definitionT}\end{dBox}}

\newenvironment{exem}{\stepcounter{totalExemplos}\begin{cBox}\begin{exampleT}}{\hfill{}\end{exampleT}\end{cBox}}	

\newenvironment{coro}{\begin{tBox}\begin{corollaryT}}{\end{corollaryT}\end{tBox}}

\newenvironment{resp}{\begin{Answer}\begin{scriptsize}}{\end{scriptsize}\end{Answer}
\vspace{-\dimexpr\parskip+1\baselineskip}\hfill {\color{cormodelo!70}\fbox{\tiny R}}}%\Adiciona sinal que tem resposta no exercícios

%\setlength{\AnswerSkipBefore}{0pt}
%\setlength{\AnswerSkipAfter}{0pt}

\newenvironment{secExercicios}
{\section{Exercícios}
\begin{multicols*}{2}
\begin{Answer}[number=Capítulo\ \thechapter]
\centering
\end{Answer}}
{\end{multicols*}}
%----------------------------------------------------------------------------------------
%	REMARK ENVIRONMENT
%----------------------------------------------------------------------------------------

\newenvironment{obs}{\begin{obsBox}\begin{adjustwidth}{10pt}{10pt}}{\end{adjustwidth}\end{obsBox}}


\newenvironment{videoT}{%
        \begin{cBox}
	\par\small % Reduce font size for remarks
	\vspace{4pt} % Vertical whitespace
	\begin{adjustwidth}{5pt}{5pt} % Left and right padding
		\hspace{-2.5pt}
  %\tikzset{every picture/.style={line width=0.75pt}} %set default line width to 0.75pt  
      \begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-0.6,xscale=0.6]
    %uncomment if require: \path (0,43); %set diagram left start at 0, and has height of 43
    
    %Rounded Rect [id:dp27102775168591675] 
    \draw  [fill={rgb, 255:red, 255; green, 70; blue, 70 }  , fill opacity=1 ][blur shadow={shadow xshift=0.75pt,shadow yshift=-0.75pt, shadow blur radius=0.75pt, shadow blur steps=4 ,shadow opacity=100}] (0,6) .. controls (0,2.69) and (2.69,0) .. (6,0) -- (34,0) .. controls (37.31,0) and (40,2.69) .. (40,6) -- (40,24) .. controls (40,27.31) and (37.31,30) .. (34,30) -- (6,30) .. controls (2.69,30) and (0,27.31) .. (0,24) -- cycle ;
    %Shape: Triangle [id:dp8628339000818188] 
    \draw  [color={rgb, 255:red, 125; green, 3; blue, 19 }  ,draw opacity=1 ][fill={rgb, 255:red, 255; green, 255; blue, 255 }  ,fill opacity=1 ] (30.21,15.2) -- (14.18,22.57) -- (14.18,7.82) -- cycle ;
    \end{tikzpicture}
	\advance\baselineskip -1pt% Reduce line spacing
        \hspace{3pt}
 }{%
	\end{adjustwidth}
        \end{cBox}
}

\usepackage{qrcode}

\newcommand{\video}[2]{
    \begin{obsBox} \hspace{7pt}
    \qrcode[hyperlink,height=1.5cm]{#1} \hspace{7pt}
    % Botão
    \begin{tikzpicture}[x=0.75pt,y=.75pt,yscale=-.5,xscale=.5]
    \draw  [fill={rgb, 255:red, 255; green, 70; blue, 70 }  , fill opacity=1 ][blur shadow={shadow xshift=0.75pt,shadow yshift=-0.75pt, shadow blur radius=0.75pt, shadow blur steps=4 ,shadow opacity=100}] (0,6) .. controls (0,2.69) and (2.69,0) .. (6,0) -- (34,0) .. controls (37.31,0) and (40,2.69) .. (40,6) -- (40,24) .. controls (40,27.31) and (37.31,30) .. (34,30) -- (6,30) .. controls (2.69,30) and (0,27.31) .. (0,24) -- cycle ;
    %Shape: Triangle [id:dp8628339000818188] 
    \draw  [color={rgb, 255:red, 125; green, 3; blue, 19 }  ,draw opacity=1 ][fill={rgb, 255:red, 255; green, 255; blue, 255 }  ,fill opacity=1 ] (30.21,15.2) -- (14.18,22.57) -- (14.18,7.82) -- cycle ;
    \end{tikzpicture}
    \hspace{4pt} {\sffamily\bfseries #2}
    \end{obsBox}
}

\usepackage{svg}

\newcommand{\geogebra}[2]{
    \begin{obsBox} \hspace{7pt}
    \qrcode[hyperlink,height=1.5cm]{#1} \hspace{7pt}
    % Botão
    {\sffamily\bfseries\includesvg{Images/Geogebra.svg} \hspace{4pt} #2}
    \end{obsBox}
}

\newcommand{\link}[2]{
    \begin{obsBox} \hspace{7pt}
    \qrcode[hyperlink,height=1.5cm]{#1} \hspace{7pt}
    % Botão
    {\sffamily\bfseries\hspace{4pt} #2}
    \end{obsBox}
}

%----------------------------------------------------------------------------------------
%	 LOAD PACKAGES THAT CLASH WITH OTHER PACKAGES
%----------------------------------------------------------------------------------------

\usepackage{tikz} % Required for drawing custom shapes and positioning elements absolutely on the page
