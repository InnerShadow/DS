from PIL import Image
import os

input_dir = 'my_images'


output_dir = 'images'
if not os.path.exists(output_dir):
    os.makedirs(output_dir)


for filename in os.listdir(input_dir):
    if filename.endswith('.jpg'):
        with Image.open(os.path.join(input_dir, filename)) as img:
            resized_img = img.resize((640, 640))
            resized_img.save(os.path.join(output_dir, filename))

