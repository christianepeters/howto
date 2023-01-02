# Download Matterport 3D models

#### Problem
Archive Matterport 3D model in the form of https://my.matterport.com/show/?m=[model_id]

#### Solution
Original [Reddit post](https://www.reddit.com/r/DataHoarder/comments/nycjj4/release_matterportdl_a_tool_for_archiving/)
pointing to [matterport-dl](https://github.com/rebane2001/matterport-dl)
which fails for me with 
[Issue #55](https://github.com/rebane2001/matterport-dl/issues/55#issuecomment-1368720145).

This forked version works for me:
https://github.com/mu-ramadan/matterport-dl

#### How to run
```
git clone https://github.com/mu-ramadan/matterport-dl
cd matterport-dl
python3 --version 	# check python version, here: Python 3.8.10
pip install tqdm 	# install missing libraries, in my case tqdm
python3 matterport-dl.py https://my.matterport.com/show/?m=[model_id]
python3 matterport-dl.py [model_id] 127.0.0.1 8080 # open http://127.0.0.1:8080 in a browser
```

Tested successfully on 2-Jan-2023.
