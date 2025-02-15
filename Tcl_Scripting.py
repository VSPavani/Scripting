#!/usr/bin/env python
# coding: utf-8

# Importing Libraries needed to run script

# In[65]:


import os
import numpy as np
import pandas as pd1
import shutil
import csv


# In[66]:


models = os.listdir("scripting-and-automation/Modules") #modules list as array 
print(models)


# In[67]:


top_modules = []
for mod in models:
    if (mod[:3]=='top'):
        top_modules.append(mod[:-2])
    print(mod)
print(top_modules)


# In[52]:





# In[68]:


os.system("vivado -mode batch -source scripting-and-automation/tcl_create.tcl")   #creating new project


# In[69]:


for mod in models:
    os.system("vivado -mode batch -source  scripting-and-automation/tcl_add.tcl -tclargs {}".format(mod))


# In[70]:


os.mkdir("results2")


# In[71]:


for filename in models:
    os.mkdir("results2/"+filename[:-2])
    os.system("vivado -mode batch -source  scripting-and-automation/tcl_run.tcl -tclargs {}".format(filename))
    print("{} reported".format(filename)) 


# Generating Result.csv file 
# The approach is to search for certain text in the generated reports and extract out the numerical values needed.

# In[72]:


data_files = os.listdir("results2")  
print(data_files)


# In[87]:


file_types = ['power.txt','timing.txt','utilization.txt']

req_data = ['Total On-Chip Power','Data Path Delay','Slice LUTs']

Power = []
Delay = []
LUTs = []


# In[88]:



for data in data_files :
    for file in file_types:
        with open("results2/{}/{}".format(data,file),'r') as File:
             content = File.read()

        words = content.split('\n')   

        for req_word in words:
            if file_types[0] in file:
                if req_data[0] in req_word:
                    pwr = float(req_word.split()[6])
                    print(pwr)
                    Power.append(pwr)
  

        for req_word in words:
            if file_types[1] in file:
                if req_data[1] in req_word:
                    delay = float(req_word.split()[3][:-2])
                    print(delay)
                    Delay.append(delay)


        for req_word in words:
            if file_types[2] in file:
                if req_data[2] in req_word:
                    luts = float(req_word.split()[4])
                    print(luts) 
                    LUTs.append(luts) 
                    print("_____")          

             



# In[91]:


Final_results = [Power,Delay,LUTs]
row_name = ['Power','Delay','LUTs']

df = pd1.DataFrame(Final_results, index = row_name)
df.columns = data_files

df.to_csv('Final_results.csv', index = row_name)
print(df)

