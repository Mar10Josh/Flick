#Flick for Console Apps.
#GUI is not supported.

import sys
import time
import yachalk

args = sys.argv

args.pop(0)

def tfe(test, yes, no):
   if (test):
     return yes
   else:
     return no





packages = ['flick']

with open(tfe(args == [], "app.fk", ' '.join(args))) as f:
 count = 0
 while 1:
   line = f.readline()
   if not line:
     input("Press Enter to exit.")
     break
   if (line.startswith("Text(")):
     # Provide console text.
     newline = line
     newline = newline.replace("\\n", "\n")
     newline = newline.replace("\\\\", "\\")
     newline = newline.replace("\\escape|space", "")
     start = newline.find("(") + 1
     end = newline.find(")")
     print(newline[start:end])
   if (line.startswith("wait(")):
      # Wait for anything
      newline = line
      newline = newline.replace("\\n", "\n")
      newline = newline.replace("\\\\", "\\")
      newline = newline.replace("\\escape|space", "")
      start = newline.find("(") + 1
      end = newline.find(")")
      args = newline[start:end].split(',')
      if (not args == []):
        if (args[0] == "seconds" and len(args) == 3):
           print(args[2])
           time.sleep(args[1])
        else:
           if (args[0] == "enter" and len(args) == 2):
             input(args[1])
           else:
             print(newline + " does not have " + tfe(args[0] == "enter", "2","3") + " args! Usage: wait(enter/seconds, prompt(enter)/seconds(seconds),prompt(seconds))")
      if (newline.startswith("get ") and newline.split(' ')[0] == "get"):
        args = newline.split(" ")
        args.remove(0)
        for i in args:
          if (not i == "rlse"):
            packages.append(i)
          if (packages[len(packages)-1] == "rlse"): #RLSE means Release
            print(i + "was added")
      if (newline.startswith("dofor")):
        # TODO: MAKE FUNCTIONS
        print(yachalk.yellow("MustDo Warning:\n\nDoFor is not done, so you cannot use DoFor."))