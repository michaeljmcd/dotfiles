if did_filetype() 
  finish
endif

if (getline(1) =~ 'IDENTIFICATION DIVISION.' 
\   || getline(1) =~ 'CBL OPTIMIZE'
\   || getline(1) =~ 'ID DIVISION.')
  setfiletype cobol
endif
