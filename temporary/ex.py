import sys
sys.stdout = sys.stderr = open("temporary/ex.txt","w")
print("hello python")
