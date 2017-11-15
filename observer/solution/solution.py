from PIL import Image
input_pic = Image.open("input.png") #Can be many different formats.
flag_pic = Image.open("flag4.png")

input_pic_width, input_pic_height = input_pic.size
flag_pic_width, flag_pic_height   = flag_pic.size

input_pixels = input_pic.load()
flag_pixels  = flag_pic.load()
for i in range(flag_pic_width):
    for j in range(flag_pic_height):
        input_pixels[3*i+60, 3*j+100] = flag_pixels[i, j]


print input_pic.size
input_pic.save("out9.png")
