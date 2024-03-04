#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY����  d_� }�����������P�P   ��z�� �  20����@h0�#LL��#@�La4�ѣ�b4�ɉ��4�d��@h0�#LL��#@�L�   � 
z!�aDy��=<Q�N����:�Ggu�|���K���
N�V-�u��t_��,�r�U{�U��S]�&��,D�֥�6�N��(_�!����ׂ@p���3�b�|&@�:hF5(c�'S�y�1[��dԨ���\������=函:�m=r��[�TZt���l��Vq�GRG����mLDYQ'�I�	(I>�g�aԶt7
�^I�1���=���ycX���'N��(�c]&��/��������/��W��w��n���籬�04(R�����,>�~�޵�l	Ǆz�U���T++P�>��8Φ:Xz�]������#����������c��Iv��+e���MZ���}+��.+Y����TgP�cz�9���p�Z�v5��ew�5��ڸթS��Nu!��a�]���2�eP��M�a�)#B�Ԭ�^=�w��j�(F5�⺨���9���;�+��()T�Z�]_���V�ڱ>���Z�Z��\ަ��~%������VR�0���fWu�$bi#��K�l$��4y��L1��qd�ښ,q��	&?�93�bQ8߇7�m�7H��y\J,s�l-7jVīB٬������"�y(�dn�3��|䛺��vH�0D��2F�\p�"�uJ�)��Mb��0�.6��ƫ}S�m�u��N��:�2��if.$EH�sm��#I"5ZJHt��k��k�a�23�bD�Dޒ��e�2�Yd�s��[:�V�k2-�Z,|���d.��(���L�jQ���=���Ko�'2J�qM����s�8��fTR����Rk֓m)FN�!44��2��R-E�%�+&�l�"��iKx�0"��rQl��"��R�Spv$a)a_&u�ԑ��o��:W�Q�̓ɸϰ���H�
�?2`