using System;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment_1;
using System.Collections.Generic;
using System.Collections;

namespace Assignment_1.shopping {
    public partial class Cart : UserControl {
        public dynamic Profile;
        protected void Page_Load(object sender, EventArgs e) {
            if (Context.User.IsInRole("Admin") || Context.User.IsInRole("Dealer") || Context.User.IsInRole("Member")) {
                Profile = ProfileBase.Create(Membership.GetUser().UserName);
            } else {
                Profile = ProfileBase.Create("Guest");
            }
            if (!Page.IsPostBack) {
                BindGrid();
            }
            if (Profile.Cart == null) {
                Profile.Cart = new SCart();
            }
            Profile.Save();
        }
        protected void CartGrid_RowEditing(object sender, GridViewEditEventArgs e) {
            CartGrid.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void CartGrid_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            TextBox QuantityTextBox = (TextBox)CartGrid.Rows[e.RowIndex].Cells[3].Controls[0];
            int Quantity = Convert.ToInt32(QuantityTextBox.Text);
            if (Quantity == 0) {
                Profile.Cart.Items.RemoveAt(e.RowIndex);
                Profile.Save();
            } else {
                Profile.Cart.Items[e.RowIndex].qty = Quantity;
                CartGrid.EditIndex = -1;
                Profile.Save();
                BindGrid();
            }
        }

        protected void CartGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            CartGrid.EditIndex = -1;
            BindGrid();
        }

        protected void CartGrid_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            Profile.Cart.Items.RemoveAt(e.RowIndex);
            Profile.Save();
            BindGrid();
        }

        void BindGrid() {
            CartGrid.DataSource = Profile.Cart.Items;
            Profile.Save();
            DataBind();
            TotalLabel.Text = String.Format("Your Shopping Cart Total is : {0,19:C}", Profile.Cart.Total);
        }
    }
}
namespace Assignment_1.shopping {
    [Serializable]
    public class SItem {
        private int _id;
        private string _name;
        private string _image;
        private int _qty;
        private double _price;
        private double _subTotal;

        public SItem() { }
        public SItem(int id, string name, string image, int qty, double price) {
            _id = id;
            _name = name;
            _image = image;
            _qty = qty;
            _price = price;
            _subTotal = qty * price;
        }
        public int id {
            get { return _id; }
            set { _id = value; }
        }
        public string name {
            get { return _name; }
            set { _name = value; }
        }
        public string image {
            get { return _image; }
            set { _image = value; }
        }
        public int qty {
            get { return _qty; }
            set { _qty = value; }
        }
        public double price {
            get { return _price; }
            set { _price = value; }
        }
        public double SubTotal {
            get { return _qty * _price; }
        }
    }

    [Serializable]
    public class SCart {
        private DateTime _dateCreated;
        private DateTime _lastUpdate;
        private List<SItem> _items;

        public SCart() {
            if (this._items == null) {
                this._items = new List<SItem>();
                this._dateCreated = DateTime.Now;
            }
        }

        public List<SItem> Items {
            get { return _items; }
            set { _items = value; }
        }

        public void Insert(int id, double price, int qty, string name, string image) {
            int ItemIndex = ItemIndexOfID(id);
            if (ItemIndex == -1) {
                SItem NewItem = new SItem();
                NewItem.id = id;
                NewItem.qty = qty;
                NewItem.price = price;
                NewItem.name = name;
                NewItem.image = image;
                _items.Add(NewItem);
            } else {
                _items[ItemIndex].qty += 1;
            }
            _lastUpdate = DateTime.Now;
        }
        public bool isEmpty() {
            if (this._items.Count == 0) {
                return true;
            } else {
                return false;
            }
        }
        public void Update(int RowID, int id, int qty, double price) {
            SItem Item = _items[RowID];
            Item.id = id;
            Item.qty = qty;
            Item.price = price;
            _lastUpdate = DateTime.Now;
        }

        public void DeleteItem(int rowID) {
            _items.RemoveAt(rowID);
            _lastUpdate = DateTime.Now;
        }

        private int ItemIndexOfID(int id) {
            int index = 0;
            foreach (SItem item in _items) {
                if (item.id == id) {
                    return index;
                }
                index += 1;
            }
            return -1;
        }
        public double Total {
            get {
                double t = 0;
                if (_items == null) {
                    return 0;
                }
                foreach (SItem Item in _items) {
                    t += Item.SubTotal;
                }
                return t;
            }
        }
    }
}