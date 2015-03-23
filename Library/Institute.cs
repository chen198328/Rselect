﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Xml.Serialization;
using XCode;
using XCode.Configuration;
using XCode.DataAccessLayer;

namespace Rselect
{
    /// <summary>Institute</summary>
    /// <remarks></remarks>
    [Serializable]
    [DataObject]
    [Description("")]
    [BindIndex("PK_Institute", true, "id")]
    [BindTable("Institute", Description = "", ConnName = "Rselect", DbType = DatabaseType.SqlServer)]
    public partial class Institute : IInstitute
    {
        #region 属性
        private Int32 _id;
        /// <summary></summary>
        [DisplayName("ID")]
        [Description("")]
        [DataObjectField(true, true, false, 10)]
        [BindColumn(1, "id", "", null, "int", 10, 0, false)]
        public virtual Int32 id
        {
            get { return _id; }
            set { if (OnPropertyChanging(__.id, value)) { _id = value; OnPropertyChanged(__.id); } }
        }

        private String _Name;
        /// <summary></summary>
        [DisplayName("Name")]
        [Description("")]
        [DataObjectField(false, false, true, 100)]
        [BindColumn(2, "Name", "", null, "nvarchar(100)", 0, 0, true)]
        public virtual String Name
        {
            get { return _Name; }
            set { if (OnPropertyChanging(__.Name, value)) { _Name = value; OnPropertyChanged(__.Name); } }
        }

        private String _Country;
        /// <summary></summary>
        [DisplayName("Country")]
        [Description("")]
        [DataObjectField(false, false, true, 50)]
        [BindColumn(3, "Country", "", null, "nvarchar(50)", 0, 0, true)]
        public virtual String Country
        {
            get { return _Country; }
            set { if (OnPropertyChanging(__.Country, value)) { _Country = value; OnPropertyChanged(__.Country); } }
        }

        private String _Indicator;
        /// <summary></summary>
        [DisplayName("Indicator")]
        [Description("")]
        [DataObjectField(false, false, true, 50)]
        [BindColumn(4, "Indicator", "", null, "nvarchar(50)", 0, 0, true)]
        public virtual String Indicator
        {
            get { return _Indicator; }
            set { if (OnPropertyChanging(__.Indicator, value)) { _Indicator = value; OnPropertyChanged(__.Indicator); } }
        }

        private Double _Value;
        /// <summary></summary>
        [DisplayName("Value")]
        [Description("")]
        [DataObjectField(false, false, true, 53)]
        [BindColumn(5, "Value", "", null, "float", 53, 0, false)]
        public virtual Double Value
        {
            get { return _Value; }
            set { if (OnPropertyChanging(__.Value, value)) { _Value = value; OnPropertyChanged(__.Value); } }
        }
        #endregion

        #region 获取/设置 字段值
        /// <summary>
        /// 获取/设置 字段值。
        /// 一个索引，基类使用反射实现。
        /// 派生实体类可重写该索引，以避免反射带来的性能损耗
        /// </summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        public override Object this[String name]
        {
            get
            {
                switch (name)
                {
                    case __.id : return _id;
                    case __.Name : return _Name;
                    case __.Country : return _Country;
                    case __.Indicator : return _Indicator;
                    case __.Value : return _Value;
                    default: return base[name];
                }
            }
            set
            {
                switch (name)
                {
                    case __.id : _id = Convert.ToInt32(value); break;
                    case __.Name : _Name = Convert.ToString(value); break;
                    case __.Country : _Country = Convert.ToString(value); break;
                    case __.Indicator : _Indicator = Convert.ToString(value); break;
                    case __.Value : _Value = Convert.ToDouble(value); break;
                    default: base[name] = value; break;
                }
            }
        }
        #endregion

        #region 字段名
        /// <summary>取得Institute字段信息的快捷方式</summary>
        public partial class _
        {
            ///<summary></summary>
            public static readonly Field id = FindByName(__.id);

            ///<summary></summary>
            public static readonly Field Name = FindByName(__.Name);

            ///<summary></summary>
            public static readonly Field Country = FindByName(__.Country);

            ///<summary></summary>
            public static readonly Field Indicator = FindByName(__.Indicator);

            ///<summary></summary>
            public static readonly Field Value = FindByName(__.Value);

            static Field FindByName(String name) { return Meta.Table.FindByName(name); }
        }

        /// <summary>取得Institute字段名称的快捷方式</summary>
        partial class __
        {
            ///<summary></summary>
            public const String id = "id";

            ///<summary></summary>
            public const String Name = "Name";

            ///<summary></summary>
            public const String Country = "Country";

            ///<summary></summary>
            public const String Indicator = "Indicator";

            ///<summary></summary>
            public const String Value = "Value";

        }
        #endregion
    }

    /// <summary>Institute接口</summary>
    /// <remarks></remarks>
    public partial interface IInstitute
    {
        #region 属性
        /// <summary></summary>
        Int32 id { get; set; }

        /// <summary></summary>
        String Name { get; set; }

        /// <summary></summary>
        String Country { get; set; }

        /// <summary></summary>
        String Indicator { get; set; }

        /// <summary></summary>
        Double Value { get; set; }
        #endregion

        #region 获取/设置 字段值
        /// <summary>获取/设置 字段值。</summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        Object this[String name] { get; set; }
        #endregion
    }
}