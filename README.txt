

----------   Collection   ----------

Die MNIST collection enthaelt 70000 hand-written digits, jeweils auf einem 28x28
pixel Bildchen: http://yann.lecun.com/exdb/mnist/

Die ersten 60000 sind training samples und die letzten 10000 testing samples.


---------- Data ---------- 

Ich lese die boundary (region silhouette) heraus und generiere Signaturen. Die
Laengen variieren von ca. 60 bis 131 pixels. Max dimensionality also 131. Rest
aufgefuellt mit Nullen fuer Koordinaten, und mit Not-a-Number fuer Signaturen.

Gespeichert in 2 Formaten:
  - Matlab mit extension .mat, und post-fix 'Mb/mb' im Dateinamen
  - binary, mit post-fix 'Bn/bn' im Dateinamen (zu gross fuer Github)


----------  Files  ----------

  - LabMb (LabBn): labels [70000 1] E [0..9]

  - ROWmb (ROWbn): [70000 131] row-coordinates (indices) E [2..30], 0=no point
  - COLmb (COLbn): [70000 131] col-coordinates (indices) E [2..30], 0=no point

  - FetBarMb (FetBarBn): [70000 131] E [0,2*pi]
	      signature of directional angle of the bar feature at each boundary pixel 
  - FetRsgMb (FetBarBn): [70000 131] E [0,1]
	     radial signature, normalized by maximum radius of image (16) 


----------  Scripts  ----------

  - dgnTest.m: testing script that asserts proper loading and shows how extract the
	       two folds


----------   Feature Extraction   ----------

I extend the 28x28 pixel image to 32x32 pixels in order to calculate the bar
signature without worrying about border issues. Coordinates are therefore E [2..30],
0 being no coordinate.

Then I threshold the image and we obtain a black-white image in which I extract the
longest boundary. A few digits have two or more boundaries, due to noise or when
person did not write segments in a connected way, ie. number "4" shape consists of a
'L' shape and a vertical line, like so "L|". Thus some cases are underrepresented
with the current format.

We could go for smoothing the boundary, but lets see how it looks on the raw output.


