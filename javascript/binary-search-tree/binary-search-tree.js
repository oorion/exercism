function Bst(data) {
  this.data = data; // head node
  this.left = null;
  this.right = null;
}

Bst.prototype.insert = function(data) {
  this.findLeafNode(this, data);
};

Bst.prototype.findLeafNode = function(node, data) {
  if (data <= node.data) {
    if (!node.left) {
      node.left = new Bst(data);
    } else {
      this.findLeafNode(node.left, data);
    }
  } else {
    if (!node.right) {
      node.right = new Bst(data);
    } else {
      this.findLeafNode(node.right, data);
    }
  }
}

Bst.prototype.each = function(callback) {

  callback(this.data);
};




module.exports = Bst;
