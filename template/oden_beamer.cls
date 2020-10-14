%% 2020 ODEN INSTITUTE BEAMER TEMPLATE
%
%% Common configuration options:
% aspectratio=169: set slide dimensions to 16cm x 9cm (wider than default 4:3).
% aspectratio=1610: set slide dimensions to 16cm x 10cm.
% dark: use a light-on-dark theme instead of the default dark-on-light.
% blue: use blues instead of oranges. Can be combined with dark.
%
%% All other options passed to the beamer class.
%
%% Example: \documentclass[11pt, aspectratio=169, dark]{oden_beamer}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oden_beamer}[2020/10/12 Oden Institute Beamer Template]

% Preliminary declarations ----------------------------------------------------

% Define colors from the Oden Institute Style Guide.
\RequirePackage{xcolor}
\definecolor{oden_blue}{RGB}{0, 169, 183}
\definecolor{oden_blue_dark}{RGB}{0, 112, 121}
\definecolor{burnt_orange}{RGB}{192, 81, 27}
\definecolor{accent_orange}{RGB}{236, 138, 63}
\definecolor{charcoal}{RGB}{51, 63, 72}
\definecolor{chalk}{RGB}{220, 220, 220}
\colorlet{themedark}{burnt_orange}
\colorlet{themelight}{accent_orange}

% Set footer dimensions for default 4:3 aspect ratio.
\newcommand{\Ltitlefooterboxwidth}{.5\paperwidth}
\newcommand{\Rtitlefooterboxwidth}{.4\paperwidth}

% LIGHT THEME (dark on light; default).
\colorlet{text}{charcoal}
\colorlet{highlight}{themedark}
\colorlet{pagebackground}{white}
\colorlet{boxbackground}{themelight!20}
\colorlet{unhighlight}{white}
\newcommand{\logofilename}{RGB_formal_Oden_ICES.png}

% Class options ---------------------------------------------------------------

% Color themes
% BLUE THEME: use blues instead of oranges.
\DeclareOption{blue}{
    \colorlet{themelight}{oden_blue}
    \colorlet{themedark}{oden_blue_dark}
    \colorlet{highlight}{themedark}
    \colorlet{boxbackground}{themelight!20}
}
% DARK THEME (light on dark; specify with \documentclass[dark]{oden_beamer}).
\DeclareOption{dark}{
    \colorlet{text}{chalk}
    \colorlet{highlight}{themelight}
    \colorlet{unhighlight}{chalk}
    \colorlet{pagebackground}{charcoal}
    \colorlet{boxbackground}{chalk}
    \renewcommand{\logofilename}{KO_formal_Oden_ICES.png}
}

% Detect 16:9 or 16:10 aspect ratio and adjust title footer accordingly.
\DeclareOption{aspectratio=169}{
    \renewcommand{\Ltitlefooterboxwidth}{.575\paperwidth}
    \renewcommand{\Rtitlefooterboxwidth}{.325\paperwidth}
    \PassOptionsToClass{\CurrentOption}{beamer}
}
\DeclareOption{aspectratio=1610}{
    \renewcommand{\Ltitlefooterboxwidth}{.575\paperwidth}
    \renewcommand{\Rtitlefooterboxwidth}{.325\paperwidth}
    \PassOptionsToClass{\CurrentOption}{beamer}
}

% Pass remaining arguments to beamer class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

% Beamer configuration --------------------------------------------------------

\LoadClass{beamer}
\usetheme{Boadilla}

% Template options.
\usefonttheme{professionalfonts}                % Serif math fonts
\setbeamertemplate{section in toc}              % Use numbers for section TOC
    {\inserttocsectionnumber.~\inserttocsection}
\setbeamertemplate{itemize items}{$\bullet$}    % Bullet points in itemize
\setbeamertemplate{enumerate items}[default]    % Bullet points in itemize
\setbeamertemplate{blocks}[default]             % Square theorem blocks
\setbeamertemplate{navigation symbols}{}        % No navigation symbols
\setbeamertemplate{section in toc shaded}       % 50% shading in T. of Contents
    [default][50]
\setbeamerfont{section in toc}{size=\large}     % Large font Table of Contents
\setbeamercovered{transparent=0}                % No transparent hidden text

% Assign selected colors to beamer elements.
\setbeamercolor{title}{fg=highlight}
\setbeamercolor{frametitle}{fg=highlight}
\setbeamercolor{structure}{fg=highlight}
\setbeamercolor{normal text}{bg=pagebackground,fg=text}
\setbeamercolor{block title}{bg=highlight,fg=unhighlight}
\setbeamercolor{block body}{bg=boxbackground,fg=charcoal}
\setbeamercolor{title in head/foot}{bg=themedark,fg=unhighlight}
\setbeamercolor{author in head/foot}{bg=themelight,fg=unhighlight}

% Configure the colored bars at the bottom of each slide.
\setbeamertemplate{footline}
{
    \leavevmode
    \ifnum \insertpagenumber=1          % Footer on title slide.
        \begin{beamercolorbox}[wd=\Ltitlefooterboxwidth,ht=3.5em,dp=1ex,left]{title in head/foot}
        \end{beamercolorbox}%
        \begin{beamercolorbox}[wd=.1\paperwidth,ht=3.5em,dp=1ex,left]{author in head/foot}
        \end{beamercolorbox}%
        \begin{beamercolorbox}[wd=\Rtitlefooterboxwidth,ht=3.5em,dp=1ex,right]{}
            \centering
            \includegraphics[height=3.4em]{\logofilename}
        \end{beamercolorbox}
    \else                               % Footer on regular slide.
        \begin{beamercolorbox}[wd=.9\paperwidth,ht=2.25ex,dp=1ex,left]{title in head/foot}
        \end{beamercolorbox}%
        \begin{beamercolorbox}[wd=.102\paperwidth,ht=2.25ex,dp=1ex,right]{author in head/foot}
            \centering
            \insertframenumber/\inserttotalframenumber
        \end{beamercolorbox}
    \fi
}
