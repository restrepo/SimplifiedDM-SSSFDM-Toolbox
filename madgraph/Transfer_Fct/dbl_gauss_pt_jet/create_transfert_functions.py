#!/usr/bin/env python

#Extension
import string
import os
import sys
import re

###dico:
dico={"j":"p_jet","b":"p_bjet","g":"p_gjet","e":"p_elec","m":"p_muon"}
###f77 forbiden term
forbiden=["goto","return","stop","call","write","read","do","while","end ","continue","asign","pause","print","rewind","backspace","endfile","open","close","inquire","entry","optional","save","equivalence","intent","target","rule","compute","system","enddo"]


def create_TF_main():
    print "start main program"
    TF_tag,TF_replace,list_var=get_TF_input()
    create_ordering_file(TF_tag,TF_replace)
    print "ordering_file.inc created"
    create_transfer_functions(TF_tag,TF_replace)
    print "transfer_functions.f created"
    create_transfer_card(list_var)
    print "transfer_card.dat created"
    create_param_inc(list_var)
    print "TF_param created"
    create_ident_card(list_var)
    print "ident_card created"
#    create_rw(list_var)
#    print "rw_tf.f created"    
    print "end"



def get_TF_input():
    "read TF_input.dat and create variable in different file"
    
    #READ/WRITE FILES
    in_data=open("./TF_input.dat",'r') 

    begin_re=re.compile(r'''^BEGIN\s*(\w*)''')
    end_re=re.compile(r'''^END\s*(\w*)''')
    
    tag=[]
    replace=[]
    list_var=[]
    
    while 1:
        line=in_data.readline()
        if line=="":
            break
        while line[0]==" ":
            line=line[1:]
            if len(line)==0:
                break
        if len(line)==0:
            continue     
        if line[0]=="#":
            continue #skipping comment

        if begin_re.search(line):
            
            name=begin_re.search(line).groups()[0].lower()
            tag.append("$$"+name+"$$")
            info=name.split('_')

            text=''
            while 1:
                line=in_data.readline()
                if line=="":
                    break
                if end_re.search(line):
                    if name!=end_re.search(line).groups()[0].lower():
                        print " syntax error in TF_param.dat"
                        sys.exit()
                    break
                text+=line
            text,list_var=create_functions(text,list_var,info)
            check_valid(text)
            replace.append(text)

    
    return tag,replace,list_var

def create_ordering_file(TF_tag2,TF_replace2):
    """ take input form TF_input.dat and insert in ordering_file.inc"""

    TF_tag=list(TF_tag2)
    TF_replace=list(TF_replace2)
    #detect delta functions
    ff=open('./TF_input.dat')
    pattern=re.compile(r'''sigma_e_(?P<type>\w*)=0''')
    delta=[]
    delta_text=''
    while 1:
        line=ff.readline()
        if line=='':
            break
        if pattern.search(line):
            type=pattern.search(line).group('type')
            delta.append(type)
            if delta_text:
                delta_text+=','+type
            else:
                delta_text=type
                
    TF_tag.append('$$order_delta$$')
    TF_replace.append(delta_text)

    in_prog=open("./../new_transfer/input/ordering_file.inc",'r')
    out_prog=open("ordering_file.inc",'w')




    Pattern1=re.compile(r'''^\$\$name_TF''')
    Pattern2=re.compile(r'''\$\$(\w*)\$\$''')
    Pattern3=re.compile(r''',|\s''')
    while 1:
        line=in_prog.readline()
        if line=="":
            break
        if(Pattern1.search(line)):
            pos=os.getcwd().split('/')[-1]
            line="##\tTransfert functions type : "+pos+"\t\t ##\n"


        if(Pattern2.search(line)):
            value=Pattern2.split(line)
            line=value[0]
            for i in range(0,len(TF_tag)):
                if "$$"+value[1]+"$$"==TF_tag[i]:
                    if "$$"+value[1]+"$$"=="$$order_delta$$":
                        line+=TF_replace[i]
                        break
                    part_list=Pattern3.split(TF_replace[i])
                    i=0
                    for i in range(0,len(part_list)):
                        if part_list[i] in delta_text:
                            part_list[i]=''
                    text=''
                    for part in part_list:
                        if text and part:
                            text+=','+part
                        elif part:
                            text=part
                    line+=text
                    TF_tag.pop(i)
                    TF_replace.pop(i)
                    break
            for i in range(2,len(value)):
                line+=value[i]
        out_prog.writelines(line)

    return
                                                                                                                                                  
def create_transfer_functions(TF_tag,TF_replace):
    """ take input form TF_input.dat and insert in TF_default.f"""

    in_prog=open("./../new_transfer/input/transfer_functions_generic.f",'r')
    out_prog=open("transfer_functions.f",'w')

    while 1:
        line=in_prog.readline()
        if line=="":
            break
        Pattern=re.compile(r'''\$\$(\w*)\$\$''')
        if(Pattern.search(line)):
            value=Pattern.split(line)
            line=value[0]
            for i in range(0,len(TF_tag)):
                if "$$"+value[1]+"$$"==TF_tag[i]:
                    line+=TF_replace[i]
                    TF_tag.pop(i)
                    TF_replace.pop(i)
                    break
            for i in range(2,len(value)):
                line+=value[i]
        
        line=put_in_fortran_format(line)
        out_prog.writelines(line)
    return

     

def create_functions(text,list_var,info):
    """ replace all #1,#2 by fortran name """
    output=''

    Pattern=re.compile(r'''#(\d*)''')
#    number=Pattern.findall(text)
    prov=Pattern.split(text)
    i=0
    while i<len(prov)-1:
        output+=prov[i]
        i+=1
        if not(dico[info[2]]+"_"+info[1]+"_"+prov[i] in list_var):
            list_var.append(dico[info[2]]+"_"+info[1]+"_"+prov[i])
        output+=dico[info[2]]+"_"+info[1]+"_"+prov[i]
        i+=1
    output+=prov[-1]
    return output,list_var

def create_transfer_card(list_var):
    out=open("transfer_card.dat",'w')
    in_card=open("./../new_transfer/input/transfer_card_generic.dat",'r')

    #init
    block=[]
    var=[]
    number=[]
    pattern=re.compile(r'''^\$\$name_TF''')

    for name  in list_var:
        input=name.split("_")
        block.append(input[1])
        var.append(input[2])
        number.append(input[3])

    while 1:
        line=in_card.readline()
        if(line==""):
            break
        if(pattern.search(line)):
            pos=os.getcwd().split('/')[-1]
            out.writelines("# Transfert functions type : "+pos+"\n")
        else:
            out.writelines(line)
        if(len(line)<5):
            continue
        if(line[:5]!="Block"):
            continue
        name=line[6:]
        while name[0]==" ":
            name=name[1:]
        try:
            name=name[0:name.index(' ')].split('_')
        except:
            if name[-1]=="\n":
                name=name[0:name.index("\n")].split('_')
            else:
               name=name.split('_')
        if(name[0]!="TF" and name[0]!="tf"):
            continue
        block2=name[1].lower()
        var2  =name[2].lower()

        for i in range(0,len(block)):
            if block2==block[i] and var2==var[i]:
                out.writelines("     "+str(number[i])+"       1.0    # put a comment\n")

    return




def create_param_inc(list_var):
    
    out=open("TF_param.inc",'w')
    file_in=open("../new_transfer/input/TF_param_generic.inc",'r')
    out.writelines(file_in.read())
    file_in.close()


    if list_var==[]:
        print "TF_param created (no input)"
        return
    
    common_text=''
    for name in list_var:
        line="        double precision  "+name+"\n"
        out.writelines(line)
        common_text+=name+','
    common_text=common_text[:-1] #suppress last coma

    line="       Common/to_TF_param/"+common_text
    line=put_in_fortran_format(line)
    out.writelines(line)
    out.close()
    return

def create_ident_card(list_var):

     ff=open("./../new_transfer/input/ident_mw_card_generic.dat",'r')
     out=open("ident_mw_card.dat",'w')
     #copy generic file
     out.writelines(ff.read())

     for name in list_var:
         data=name.split('_')
         line="TF_"+data[1].upper()+'_'+data[2].upper()
         line+='             '+data[3]+"       "+name+" real  \n" 
         out.writelines(line)

     return
def put_in_fortran_format(text):
    out=''
    if text.count('\n')>1:
        part=text.split('\n')
        for line in part:
    #        print "line",[line]
            if len(line)>0:
                out+=put_line_in_fortran_format(line)+"\n"
    else:
        out=put_line_in_fortran_format(text)
        
    return out

def put_line_in_fortran_format(text,max_size=77):
    "take formula and split in 50-70 columns"


    #take car of special begin with fortran
    if text[0]=="c" or text[0]=="C":
        return text
    if(text[:6].count('&')):
       return text
    if(text[:6]!="      "):
        try:
            a=int(text[:6]) #test for tag
        except:                  
            text="       "+text
 
    #delete final space
    while (text[-1]==" "):
        text=text[:-1]
        if len(text)==0:
            break
#    print "pass here: len " ,len(text)
    out=""
    while(len(text)>max_size):
        tag=len(text)
        list_split=["\n",",","+","-"," ",'=',':']
        i=0
        while 1:
            if text[50:max_size].count(list_split[i]):
                out+=text[:50]
                text=text[50:]
                tag=text.index(list_split[i])+1
                break
            elif(i==len(list_split)-1):
                print 'WARNING unsplit line'
                print text
                i+=1
                break
            i+=1
        if(i==len(list_split)):
            tag=len(text)
            
        out+=text[:tag]+"\n"
        if(tag<len(text)):
            text="     &"+text[tag:]
        
    out+=text

    return out  
    
def  create_rw(list_var):

    file_in=open("./../new_transfer/input/rw_tf_generic.f","r")
    file_out=open("./rw_tf.f","w")

    Pattern=re.compile(r'''\$\$ADD_HERE\$\$''')
    while 1:
        line=file_in.readline()
        if line=="":
            break
        if not(Pattern.search(line)):
            file_out.writelines(line)
        else:
            #We are in position to put data info
            for name in list_var:
               file_out.writelines("      call get_real_t(npara,param,value,\""+name+"\"    ,"+name+",   1d0)\n")
            file_out.writelines(file_in.read())
            break
    file_in.close()
    file_out.close()

    return

def check_valid(text):
    for name in forbiden:
        Pattern=re.compile(name,re.I)
        if Pattern.search(text):
            print "ERROR: invalid usage of statement: ",name
            print "for security reason transfer functions can't use this statement"
            sys.exit()
    return
    

    
    
###########################   TEST   #################################
if(__name__=="__main__"):

    create_TF_main()
    
##    file=raw_input("file: ")
##    ff=open(file,'r')
##    gg=open(file+'_70.f','w')
##    text=ff.read()
##    text=put_in_fortran_format(text)
##    gg.writelines(text)
