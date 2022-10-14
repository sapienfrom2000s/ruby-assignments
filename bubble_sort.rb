
def bubble_sort(array)
    required_iteration = array.length - 1
    ((array.length)-1).times do
        index = 0
        required_iteration.times do
            if(array[index]>array[index+1])
                array[index+1], array[index] = array[index], array[index+1]
            end
            index +=1
        end
        required_iteration -= 1
    end
    puts array
end

bubble_sort([9,2,34,21,3,4,2,21,2])