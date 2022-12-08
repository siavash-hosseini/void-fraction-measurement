# void-fraction-measurement
Two-phase flow is very important in many areas of science, engineering, and industry. Two-phase
flow comprising gas and liquid phases is a common occurrence in oil and gas related industries.
This project considers three flow regimes, including homogeneous, annular, and stratified regimes
ranging from 5–90% of void fractions simulated via the Mont Carlo N-Particle (MCNP) Code. In
the proposed model, two NaI detectors were used for recording the emitted photons of a cesium
137 source that pass through the pipe. Following that, fast Fourier transform (FFT), which aims to
transfer recorded signals to frequency domain, was adopted. By analyzing signals in the frequency
domain, it is possible to extract some hidden features that are not visible in the time domain anal-
ysis. Four distinctive features of registered signals, including average value, the amplitude of
dominant frequency, standard deviation (STD), and skewness were extracted. These features were
compared to each other to determine the best feature that can offer the best separation. Further-
more, artificial neural network (ANN) was utilized to increase the efficiency of two-phase flowme-
ters. Additionally, two multi-layer perceptron (MLP) neural networks were adopted for classifying
the considered regimes and estimating the volumetric percentages. Applying the proposed model,
the outlined flow regimes were accurately classified, resulting in volumetric percentages with a
low root mean square error (RMSE) of 1.1%.
