package models

import (
	"errors"
	"fmt"
	"reflect"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
)

type Interface struct {
	Id           int       `orm:"column(id);auto"`
	ProjectId    *Project  `orm:"column(project_id);rel(fk)"`
	Name         string    `orm:"column(name);size(24);null"`
	Describe     string    `orm:"column(describe);size(255);null"`
	Url          string    `orm:"column(url);size(255)"`
	RequestType  string    `orm:"column(request_type);size(24)"`
	Protocol     string    `orm:"column(protocol);size(10)"`
	ResponseType string    `orm:"column(response_type);size(24)"`
	Status       int       `orm:"column(status)"`
	Createdate   time.Time `orm:"column(createdate);type(date)"`
	Updatedate   time.Time `orm:"column(updatedate);type(date)"`
}

func (t *Interface) TableName() string {
	return "interface"
}

func init() {
	orm.RegisterModel(new(Interface))
}

// AddInterface insert a new Interface into database and returns
// last inserted Id on success.
func AddInterface(m *Interface) (id int64, err error) {
	o := orm.NewOrm()
	id, err = o.Insert(m)
	return
}

// GetInterfaceById retrieves Interface by Id. Returns error if
// Id doesn't exist
func GetInterfaceById(id int) (v *Interface, err error) {
	o := orm.NewOrm()
	v = &Interface{Id: id}
	if err = o.Read(v); err == nil {
		return v, nil
	}
	return nil, err
}

// GetAllInterface retrieves all Interface matches certain condition. Returns empty list if
// no records exist
func GetAllInterface(query map[string]string, fields []string, sortby []string, order []string,
	offset int64, limit int64) (ml []interface{}, err error) {
	o := orm.NewOrm()
	qs := o.QueryTable(new(Interface))
	// query k=v
	for k, v := range query {
		// rewrite dot-notation to Object__Attribute
		k = strings.Replace(k, ".", "__", -1)
		if strings.Contains(k, "isnull") {
			qs = qs.Filter(k, (v == "true" || v == "1"))
		} else {
			qs = qs.Filter(k, v)
		}
	}
	// order by:
	var sortFields []string
	if len(sortby) != 0 {
		if len(sortby) == len(order) {
			// 1) for each sort field, there is an associated order
			for i, v := range sortby {
				orderby := ""
				if order[i] == "desc" {
					orderby = "-" + v
				} else if order[i] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
			qs = qs.OrderBy(sortFields...)
		} else if len(sortby) != len(order) && len(order) == 1 {
			// 2) there is exactly one order, all the sorted fields will be sorted by this order
			for _, v := range sortby {
				orderby := ""
				if order[0] == "desc" {
					orderby = "-" + v
				} else if order[0] == "asc" {
					orderby = v
				} else {
					return nil, errors.New("Error: Invalid order. Must be either [asc|desc]")
				}
				sortFields = append(sortFields, orderby)
			}
		} else if len(sortby) != len(order) && len(order) != 1 {
			return nil, errors.New("Error: 'sortby', 'order' sizes mismatch or 'order' size is not 1")
		}
	} else {
		if len(order) != 0 {
			return nil, errors.New("Error: unused 'order' fields")
		}
	}

	var l []Interface
	qs = qs.OrderBy(sortFields...)
	if _, err = qs.Limit(limit, offset).All(&l, fields...); err == nil {
		if len(fields) == 0 {
			for _, v := range l {
				ml = append(ml, v)
			}
		} else {
			// trim unused fields
			for _, v := range l {
				m := make(map[string]interface{})
				val := reflect.ValueOf(v)
				for _, fname := range fields {
					m[fname] = val.FieldByName(fname).Interface()
				}
				ml = append(ml, m)
			}
		}
		return ml, nil
	}
	return nil, err
}

// UpdateInterface updates Interface by Id and returns error if
// the record to be updated doesn't exist
func UpdateInterfaceById(m *Interface) (err error) {
	o := orm.NewOrm()
	v := Interface{Id: m.Id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Update(m); err == nil {
			fmt.Println("Number of records updated in database:", num)
		}
	}
	return
}

// DeleteInterface deletes Interface by Id and returns error if
// the record to be deleted doesn't exist
func DeleteInterface(id int) (err error) {
	o := orm.NewOrm()
	v := Interface{Id: id}
	// ascertain id exists in the database
	if err = o.Read(&v); err == nil {
		var num int64
		if num, err = o.Delete(&Interface{Id: id}); err == nil {
			fmt.Println("Number of records deleted in database:", num)
		}
	}
	return
}
