%==============================================================================
% texufpel - classe de documento com padr�es do Curso de Ci�ncia da Computa��o 
%           UFPEL derivado do iiufrgs
%        
% Copyright (C) 2008 Maur�cio Lima Pilla (pilla@ufpel.edu.br) 
% Copyright (C) 2001-2005 UFRGS TeX Users Group
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
% UFRGS TeX Users Group
% Institute of Informatics --- UFRGS
% Porto Alegre, Brazil
% http://www.inf.ufrgs.br/utug
% Discussion list: utug-l@inf.ufrgs.br
%
%==============================================================================

%==============================================================================
% Identifica��o
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texufpel}[2008/10/01 -- Formatacao de documentos para o CIC -- UFPEL]

%==============================================================================
% Declara��o de op��es
%==============================================================================
\newcommand{\iiu@novodoc}[1]{\DeclareOption{#1}{\AtEndOfClass{\input{#1.def}}}}
\iiu@novodoc{rp}
%\iiu@novodoc{prop-tese}
%\iiu@novodoc{plano-doutorado}
%\iiu@novodoc{dipl}
%\iiu@novodoc{ti}
%\iiu@novodoc{pep}
%\iiu@novodoc{diss}
%\iiu@novodoc{tese}
\iiu@novodoc{tc}
%\iiu@novodoc{espec}
%\iiu@novodoc{formais}
\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%==============================================================================
% Heran�a da classe `report' e inclus�o de pacotes e arquivos necess�rios
%==============================================================================
\LoadClass[12pt,a4paper,twoside]{report}
\RequirePackage[english,brazilian]{babel}
\input{brazilian.babel}
\input{english.babel}
\if@english
        \selectlanguage{english}
        \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{ufpeldefs}
\RequirePackage{natbib}
\RequirePackage{chngcntr}
%==============================================================================
% O uso de fonte Arial, 12 pt, � mandat�rio
%==============================================================================
\renewcommand*\familydefault{\sfdefault}
 \renewcommand{\rmdefault}{phv}\renewcommand{\sfdefault}{phv}

%==============================================================================
% Margens do texto
%==============================================================================
\newlength{\ii@topmargin}\setlength{\ii@topmargin}{30mm}
\newlength{\ii@pagenummargin}\setlength{\ii@pagenummargin}{20mm}
\newlength{\ii@bottommargin}\setlength{\ii@bottommargin}{20mm}
\newlength{\ii@sidemargin}\setlength{\ii@sidemargin}{30mm}
\setlength{\marginparwidth}{25mm}

% ajuste das medidas verticais
\setlength{\topmargin}{\ii@pagenummargin}
        \addtolength{\topmargin}{-1em} % isto � +- a altura do n�m. da p�gina
        \addtolength{\topmargin}{-1in}
\setlength{\headheight}{1em}
\setlength{\headsep}{\ii@topmargin}
        \addtolength{\headsep}{-\ii@pagenummargin}
\setlength{\textheight}{\paperheight}
        \addtolength{\textheight}{-\ii@topmargin}
        \addtolength{\textheight}{-\ii@bottommargin}
\setlength{\footskip}{\ii@bottommargin}

% ajuste das medidas horizontais
\setlength{\oddsidemargin}{\ii@sidemargin}
        \addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\textwidth}{\paperwidth}
        \addtolength{\textwidth}{-2\ii@sidemargin}
\setlength{\marginparsep}{\ii@sidemargin}
        \addtolength{\marginparsep}{-\marginparwidth}
        \setlength{\marginparsep}{.5\marginparsep}

%==============================================================================
% Numera��o das p�ginas
%==============================================================================
\def\ps@iiufrgs{
        \let\@oddfoot\@empty
        \let\@evenfoot\@empty
%        \def\@evenhead{{\small\thepage}}
        \def\@oddhead{\hspace*{\fill}{\small\thepage}}
	\def\@evenhead{\hspace*{\fill}{\small\thepage}}
}
\pagestyle{empty}
\let\ps@plain\ps@empty

%==============================================================================
% Defini��o de autor(es), orientador e co-orientador
%==============================================================================
\newcounter{ii@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{ii@authorcount}{1}
        \expandafter\gdef\csname @author\alph{ii@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{ii@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{ii@authorcount}\endcsname{#2 #1}
}
\DeclareRobustCommand{\advisor}[3][]{
        \gdef\@advisorlast{#2}
        \gdef\@advisorfirst{#3}
        \gdef\@advisor{#1~#3 #2}
}
\DeclareRobustCommand{\coadvisor}[3][]{
        \gdef\@coadvisorlast{#2}
        \gdef\@coadvisorfirst{#3}
        \gdef\@coadvisor{#1~#3 #2}
}

%==============================================================================
% Defini��o do Departamento relacionado ao documento
% deve ser definido como `ina' ou `int'
%==============================================================================
\newcommand{\dept}[1]{\gdef\@dept{#1}}

%==============================================================================
% Defini��o das palavras-chave (m�x. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}
\newcommand{\@cipkw}{%
        \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
        \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
        \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
        \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
        \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
        \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
        \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
        \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
        \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
        \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}
\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\expandafter\MakeUppercase\keywa}%
        \@ifundefined{keywb}{}{, \keywb}%
        \@ifundefined{keywc}{}{, \keywc}%
        \@ifundefined{keywd}{}{, \keywd}%
        \@ifundefined{keywe}{}{, \keywe}%
        \@ifundefined{keywf}{}{, \keywf}%
        \@ifundefined{keywg}{}{, \keywg}%
        \@ifundefined{keywh}{}{, \keywh}%
        \@ifundefined{keywi}{}{, \keywi}%
        \@ifundefined{keywj}{}{, \keywj}%
}

%==============================================================================
% Redefini��o da data (para ter m�s e ano separados)
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}
}
\date{\monthname}{\number\year}
%==============================================================================
% Defini��o da banca (m�ximo 10)
%==============================================================================
\newcounter{excounter}
\newcommand{\examiner}[1]{
        \addtocounter{excounter}{1}
        \expandafter\gdef\csname examiner\alph{excounter}\endcsname{#1}
}
\newcommand{\linespace}{~\\~\\~\\~\\~\\\hline}
\newcommand{\@allexaminers}{%
        \@ifundefined{examinera}{}{~\\\linespace\examinera}%
        \@ifundefined{examinerb}{}{\linespace\examinerb}%
        \@ifundefined{examinerc}{}{\linespace\examinerc}%
	\@ifundefined{examinerd}{}{\linespace\examinerd}%
	\@ifundefined{examinere}{}{\linespace\examinere}%
	\@ifundefined{examinerf}{}{\linespace\examinerf}%
        \@ifundefined{examinerg}{}{\linespace\examinerg}%
	\@ifundefined{examinerh}{}{\linespace\examinerh}%
	\@ifundefined{examineri}{}{\linespace\examineri}%
        \@ifundefined{examinerj}{}{\linespace\examinerj}%

}


%==============================================================================
% Defini��o padr�o da folha de rosto.
% Os dados espec�ficos do tipo de trabalho (disserta��o, tesediss, etc.) s�o
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def inclu�dos com a classe.
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{95mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{112mm}
\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}
\location{Pelotas}{RS}
\renewcommand{\maketitle}{%
        \begin{titlepage}
                \thetitlepage
        \end{titlepage}%
        \clearpage
        \setcounter{page}{2}%
        \@ifundefined{@cipspecificinfo}{}{}%\@makecippage} %deixe o CIP para a biblioteca
}
\newcommand{\thetitlepage}{%
        \noindent\@topbox\\
        \vfill
        \@ifundefined{titlepagespecificinfo}{}{
		\lefthyphenmin=64 
                \hspace*{\fill}\makebox[.5\textwidth][l]{%
			\parbox[b]{8.5cm}{\titlepagespecificinfo}%
                }
                \vfill
        }
        \@ifundefined{@advisor}{}{
                \hspace*{\fill}\parbox[b]{.5\textwidth}{%
                        {\titlepageadvisorinfo}
                }\hspace*{\fill}
                \vfill
        }
        \centerline{\@city, \@publyear}
}
\def\@topbox{%
        \parbox[t]{\textwidth}{%
                \centering%
                \vbox to \titlepagewinvoffset{%
                       \@winbox
                }
        }
}
\def\@winbox{%
%       \fbox{
        \parbox[b]{\titlepagewinwidth}{%
        \centering\vbox to \titlepagewinheight{%
        %        \vspace*{\fill}
                \MakeUppercase{\@authora}\\
                \@ifundefined{@authorb}{}{\MakeUppercase{\@authorb}\\}%
                \@ifundefined{@authorc}{}{\MakeUppercase{\@authorc}\\}%
                \@ifundefined{@authord}{}{\MakeUppercase{\@authord}\\}%
                \vspace{\stretch{4}}
                {\large\textbf{\@title}\par}
                \vfill
        }}%
%       }%
}
\newcommand{\course}[1]{\gdef\@course{#1}}
\course{\ppgc}
\newcommand{\titlepagetopinfo}{%
        %\MakeUppercase{\ufpel}\\
        %\MakeUppercase{\ifm}\\
        %\@ifundefined{@dept}{}{\MakeUppercase{\csname dept\@dept\endcsname}\\}%
        %\MakeUppercase{\@course}\\
}
\newcommand{\titlepageadvisorinfo}{%
        \@ifundefined{@advisor}{}{\advisorname: \@advisor}
        \@ifundefined{@coadvisor}{}{\\[6ex]\coadvisorname: \@coadvisor}
}

\newcommand{\makeexaminers}{%
\mbox{}
\vfill
\noindent\textbf{Banca examinadora:}\\
\begin{tabular}{l}
\@allexaminers
\end{tabular}

\vspace{10mm}

}

%==============================================================================
% Cataloga��o na fonte (CIP) e nominata
%==============================================================================
\newcommand{\@makecippage}{%
        \clearpage%
        \begin{center}
                \textbf{\cipcaption}\\[2ex]
                \iiu@cipwindow
        \end{center}
        \vfill
        \nominata
}
% defini��o do quadro
\def\iiu@cipwindow{%
        \framebox[120mm]{%
        \begin{minipage}{110mm}%
                \vspace*{0.2ex}
                \setlength{\parindent}{1.5em}%
                \setlength{\parskip}{1.3ex}%
                \noindent\@authoralast, \@authorafirst\par
                \@title\ / \@authora.\ -- \@city: \course, \@publyear.\par
                \pageref{LastPage}~f.: il.\par
                \@cipspecificinfo\ -- \ufpel. \@course, \@city, BR--\@state, \@publyear. \advisorname: \@advisorfirst\ \@advisorlast\@ifundefined{@coadvisor}{}{; \coadvisorname: \@coadvisorfirst\ \@coadvisorlast}.\par
                \@cipkw I.~\@advisorlast, \@advisorfirst. \@ifundefined{@coadvisorfirst}{II.~T\'{\i}tulo.}{II.~\@coadvisorlast, \@coadvisorfirst. III.~T\'{\i}tulo.}\\
                \vspace{0.2ex}
        \end{minipage}%
        }%
}
\newcommand{\nominata}{
        \MakeUppercase{\ufpel}\\
}

%==============================================================================
% Ajuste do sum�rio (nada indentado) 
%==============================================================================
\newlength{\ii@chapnumindent}\setlength{\ii@chapnumindent}{1.8em}
\renewcommand*{\l@chapter}[2]{
        \addpenalty{-\@highpenalty}
        \vskip -1ex \@plus\p@
        \setlength\@tempdima{1.5em}
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode\bfseries\sffamily
        \advance\leftskip\@tempdima
        \hskip -\leftskip
%      esta � a definicao original da classe report:
%      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \@dottedtocline{0}{0em}{\ii@chapnumindent}{\uppercase{#1}}{#2}
%        \@dottedtocline{0}{0em}{\ii@chapnumindent}{\MakeUppercase{#1}}{#2}
        \penalty\@highpenalty
        \endgroup
}
\renewcommand*{\l@section}[2]
              {\@dottedtocline{1}{0em}{2.8em}{\textbf{#1}}{\hss #2}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{0em}{3.7em}}
\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        \@starttoc{toc}\@aftertoctrue%
}

%==============================================================================
% Defini��o das listas de abreviaturas e siglas e de s�mbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
        \chapter*{\listabbrvname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}
\newenvironment{listofsymbols}[1]{
        \chapter*{\listsymbolname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}

%==============================================================================
% Resumo (abstract) e Abstract (englishabstract)
%==============================================================================
\renewenvironment{abstract}{%
        \chapter*{\abstractname}
\noindent{\uppercase{\@authoralast}, \@authorafirst. \textbf{\@title}. {\@publyear}. \pageref{LastPage}~f. \@cipspecificinfo. {\ufpel}, {\@city}.}\\~\\
}{%
        \par\vfill
        \noindent\textbf{\keywordsname:} \@abstractkw.
}
\newenvironment{englishabstract}[2]{%
        \if@openright\cleardoublepage\else\clearpage\fi%
        \gdef\@englishkeywords{#2}%
	\gdef\@englishtitle{{#1}}%
        \iflanguage{english}{
                \begin{otherlanguage}{english}
        }{
                \begin{otherlanguage}{brazilian}
        }
                \chapter*{\abstractname}
\noindent{\uppercase{\@authoralast}, \@authorafirst. \textbf{\@englishtitle}. {\@publyear}. \pageref{LastPage}~f. \@cipspecificinfo. {\ufpel}, {\@city}.}\\~\\
}{
        \par\vfill
        \noindent\textbf{\keywordsname:} \@englishkeywords.
        \end{otherlanguage}
}

%==============================================================================
% Formata��o dos cap�tulos.
% Os comandos \@chapter e \@schapter s�o redefinidos para que a
% numera��o de p�ginas seja correta (deve aparecer somente a partir do
% primeiro cap�tulo do texto, mas n�o nas p�ginas iniciais de
% cap�tulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formata��o dos t�tulos propriamente ditos.
%==============================================================================
\newcommand{\ii@chapterfont}{\@setfontsize\Large{16}{20}}
\def\@chapapp{}
\def\@chapter[#1]#2{%
        \refstepcounter{chapter}%
        \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}%
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
        \pagestyle{iiufrgs}\let\ps@plain\ps@iiufrgs%
        \@makechapterhead{#2}\@afterheading
}
\def\@makechapterhead#1{%
        \vspace*{90pt}
        \reset@font\noindent{\ii@chapterfont\sffamily\textbf{\@chapapp\thechapter\hspace{1em}\MakeUppercase{#1}}\par}
        \addvspace{42pt}
		\thispagestyle{empty}
}
\def\@schapter#1{%
        \if@aftertoc\addcontentsline{toc}{chapter}{#1}\fi%
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
        \@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{%
        \vspace*{90pt}
        \reset@font\centerline{\ii@chapterfont\sffamily\textbf{\MakeUppercase{#1}}}
        \addvspace{42pt}
}
\renewcommand{\appendix}[1][\appendixname]{%
        \setcounter{chapter}{0}%
        \renewcommand{\thechapter}{\Alph{chapter}}%
        \setcounter{tocdepth}{0}%
        \@captionlistingfalse%
        \gdef\@chapapp{\MakeUppercase{#1}\space}%
        \addtocontents{toc}{%
          \settowidth{\ii@chapnumindent}{{\sffamily\textbf{\@chapapp}}}
          \addtolength{\ii@chapnumindent}{1.8em}
        }%
}
\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formata��o das se��es
%==============================================================================
\setcounter{secnumdepth}{4}
\renewcommand{\section}{%
        \@startsection{section}{1}{0pt}{18pt}{9pt}{\reset@font\large\bfseries}
}
\renewcommand{\subsection}{%
        \@startsection{subsection}{2}{0pt}{12pt}{6pt}{\reset@font\bfseries}
}
\renewcommand{\subsubsection}{%
        \@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\reset@font\itshape}
}
\renewcommand{\paragraph}{%
        \@startsection{paragraph}{4}{0pt}{12pt}{6pt}{\reset@font}
}
\renewcommand{\subparagraph}{%
        \@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}
%==============================================================================
% Formata��o das legendas
%==============================================================================
\renewcommand{\thefigure}{\@arabic\c@figure}
\renewcommand{\thetable}{\@arabic\c@table}

\counterwithout{figure}{chapter}
\counterwithout{equation}{chapter}
\counterwithout{table}{chapter}
%==============================================================================
% Redefini��o do conte�do das listas de figuras e tabelas
%==============================================================================
\newif\if@captionlisting\@captionlistingtrue
\long\def\@caption#1[#2]#3{%
  \par
  \if@captionlisting%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnum@#1\endcsname}{\ignorespaces #2}}%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup%
}
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}
\let\l@table\l@figure

%==============================================================================
% Redefini��o do formato de cita��es longas
%==============================================================================
\renewenvironment{quote}{%
        \small%
        \begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
}{%
        \end{list}
}

%==============================================================================
% Ajuste do formato das cita��es e refer�ncias
%==============================================================================
\setlength{\bibhang}{0pt}
\let\cite\citep

\newcommand{\cip}{}
\newenvironment{dedicatoria}{%
        \clearpage%
        \mbox{}\vfill\begin{flushright}
}{
        \end{flushright}
}
\newenvironment{agradecimentos}{\chapter*{Agradecimentos}}{}



