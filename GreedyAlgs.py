import math

def egyptianfraction(nr, dr):
    """
    A function that accepts nr as a numerator,
    dr as a denominator
    """

    print("The Egyptian fraction " +
            "representation of {0}/{1} is".
            format(nr, dr), end="\n")
    
    # empty list to store denominator
    er = []

    # while loop runs until numerator is zero (ie the fraction is zero)

    while nr != 0:

        # take ceiling 
        x = math.ceil(dr / nr)

        # storing val in list er
        er.append(x)

        # update new nr and dr
        nr = x * nr - dr
        dr = dr * x

    # printing vals
    for i in range(len(er)):
        if i != len(er) - 1:
            print(" 1/{0} +".
                    format(er[i]), end=" ")
        else:
            print(" 1/{0} ".
                    format(er[i]), end=" ")
    print()

if __name__=='__main__':
    egyptianfraction(6, 14)
