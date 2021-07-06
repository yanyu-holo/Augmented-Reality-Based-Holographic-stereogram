from keras.layers import Input
from mask_rcnn import MASK_RCNN 
from PIL import Image
import os
mask_rcnn = MASK_RCNN()

while True:

    img = input('Input image filename:')
    try:
        image = Image.open(img)
    except:
        print('Open Error! Try again!')
        continue
    else:
        image = mask_rcnn.detect_image(image)
        image.save(os.path.join("G:\图5\\2.png"))
        image.show()
        image.save(os.path.join("G:\图5" + "/" + filename))

mask_rcnn.close_session()
