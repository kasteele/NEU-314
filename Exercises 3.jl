--
using PyPlot
image = imread("el-capitan.png")
--

print(image[2,2,2])
#using PyPlot
#imshow("el-capitan.png")
imshow(convert(typeof(image), image))

typeof(image)

--
function image_read_and_extract_colors(filename)
    image = imread(filename)
    imshow(convert(typeof(image), image))


    RChannel = image[:,:,1]
    GChannel = image[:,:,2]
    BChannel = image[:,:,3]


    #println("BUG BUG BUG")

    return RChannel, GChannel, BChannel

end
--
#image_colors = collect(image_read_and_extract_colors("el-capitan.png"))
#image_colors = image_read_and_extract_colors("el-capitan.png")




image = imread("el-capitan.png")
    #imshow(convert(typeof(image), image))

#= part e
Set image2[:,:,1] to be the G channel,
image2[:,:,2] to be the B channel,
and image2[:,:,3] to be the R channel
from the original image. =#

image2 = copy(image)

R,G,B = image_read_and_extract_colors("el-capitan.png")


#R = image[:,:,1]
#G = image[:,:,2]
#B = image[:,:,3]

image2[:,:,1] = G
image2[:, :, 2] = B
image2[:, :, 3] = R


clf()

# show the images side by side
subplot(1,2,1)
imshow(convert(typeof(image), image))

subplot(1,2,2)
imshow(convert(typeof(image2), image2))

#figure(figsize=[x,y]), title("your text goes here"), and axis("off")

#= part 1) B

A “circular” rotation of elements in a matrix
moves the contents of the matrix such that
elements that “fall off” one edge
“circle back” to the opposite edge.
Write a function that, for given an image,
circularly moves only one channel, the red
channel (remember, this is the first one)
up some number of pixels, p, such that the
top p rows now become the bottom p rows.
Your function should take two arguments -- 1)
your image and 2) the number of pixels you want
to shift it by -- and return the shifted image.
Display both the original image channel and the
result of circularly moving the red channel
up by 180 pixels.  =#

# red channel!!!


matrix = [1 2 3; 4 5 6; 7 8 9]

println(size(matrix))


#function circular_rotation(filename, shift_num)

image4 = matrix
println(image4)
    #image = imread(filename)
copy2 = copy(image4)
println(copy2)

    #for i =1:shift_num
        #copy2[]
#    end


    #for i = 1:shift_num + size(image)

copy2[1, :] = image4[2, :]
copy2[2,:] = image4[3,:]
copy2[end, :] = image4[1, :]
    #end

#    image = copy2
    #println(copy2)
    #return copy2
#end
#--
println(copy2)

--
function circular_rotation(filename, shift_num)

    image = imread(filename)
    dimensions = size(image)
    dimX = dimensions[1]

    while shift_num > dimX
        shift_num = shift_num - dimX
    end


    copy2 = copy(image)

    for i = 1:shift_num
        copy2[end - shift_num + i, :, 1] = image[i, :, 1]
        #copy2[i, :, 1] =
    end

    for i = 1:(dimX - shift_num)
       copy2[i,:,1]= image[i + shift_num, :,1]

    end

    return copy2
end
--




clf()


shifted = circular_rotation("el-capitan.png", 700)

imshow(convert(typeof(shifted), shifted))
