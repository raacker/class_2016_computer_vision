classdef dlnode < handle
   % dlnode A class to represent a doubly-linked node.
   % Link multiple dlnode objects together to create linked lists.
   properties
      Data;
      Pixel;
      Code;
   end
   properties
      left = dlnode.empty;
      right = dlnode.empty;
   end
   
   methods
      function node = dlnode(Data, Pixel)
         % Construct a dlnode object
         if nargin > 0
            node.Data = Data;
            node.Pixel = Pixel;
         end
      end
      
      function insertLeft(rootNode, leftNode)
         rootNode.left = leftNode;
      end
      
      function insertRight(rootNode, rightNode)
          rootNode.right = rightNode;
      end
   end
end