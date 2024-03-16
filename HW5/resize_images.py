import os
import random
from PIL import Image

source_dir = 'test'

output_dir = 'train_data/images/train'
val_output_dir = 'train_data/images/val'

os.makedirs(output_dir, exist_ok = True)
os.makedirs(val_output_dir, exist_ok = True)

file_list = os.listdir(source_dir)

for idx, file_name in enumerate(file_list):
    if file_name.endswith('.png'):
        image_path = os.path.join(source_dir, file_name)
        image = Image.open(image_path)
        
        new_width = image.width // 3
        new_height = image.height // 3
        resized_image = image.resize((new_width, new_height))
        
        if random.random() < 0.1:
            output_path = os.path.join(val_output_dir, f'{idx}.png')
        else:
            output_path = os.path.join(output_dir, f'{idx}.png')
        
        resized_image.save(output_path)

