
import scipy as sp
from scipy.fft import fft2,ifft2,fft,ifft,rfft2,rfftn
matriz = sp.array([
    [30, 32, 3, 3, 3, 32, 35, 35],                 
    [30, 31, 30, 35, 35, 32, 00, 00],
    [30, 35, 35, 35, 35, 32, 00, 00],
    [35, 30, 32, 31, 30, 32, 00, 00],
    [00, 33, 34, 34, 34, 34, 33, 00],
    [32, 31, 32, 33, 34, 34, 35, 35],
    [32, 32, 3, 3, 3, 3, 3, 3],
    [35, 35, 35, 35, 35, 34, 34, 34]])
                 
#print(np.fft.fft(matriz[1,:]))
matriz1 =fft2(matriz)
#print(fft2(matriz))
print((matriz1))

    [5, 7, 0, 0, 0, 7, 10, 10],                 
    [5, 6, 5, 10, 10, 7, 0, 0],
    [5, 10, 10, 10, 10, 7, -25, 0],
    [10, 5, 7, 6, 5, 7, 0, 0],
    [0, 8, 9, 9, 9, 9, 8, 0],
    [7, 6, 7, 8, 9, 9, 10, 10],
    [7, 7, 0, 0, 0, 0, 0, 0],
    [10, 10, 10, 10, 10, 9, 9, 9]]


