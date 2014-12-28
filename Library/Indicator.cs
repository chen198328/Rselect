﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Xml.Serialization;
using XCode;
using XCode.Configuration;
using XCode.DataAccessLayer;

namespace Rselect
{
    /// <summary></summary>
    [Serializable]
    [DataObject]
    [Description("")]
    [BindIndex("PK_Indicator", true, "id")]
    [BindIndex("IX_Indicator_SubjectId", false, "SubjectId")]
    [BindIndex("IX_Indicator_YearId", false, "YearId")]
    [BindIndex("IX_Indicator_Name", false, "Name")]
    [BindRelation("SubjectId", false, "Subject", "id")]
    [BindRelation("YearId", false, "Year", "id")]
    [BindRelation("Name", false, "ViewIndicatorAll", "IndicatorName")]
    [BindTable("Indicator", Description = "", ConnName = "Rselect", DbType = DatabaseType.SqlServer)]
    public partial class Indicator : IIndicator
    {
        #region 属性
        private Int32 _id;
        /// <summary></summary>
        [DisplayName("id")]
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
        [DataObjectField(false, false, true, 50)]
        [BindColumn(2, "Name", "", null, "nvarchar(50)", 0, 0, true)]
        public virtual String Name
        {
            get { return _Name; }
            set { if (OnPropertyChanging(__.Name, value)) { _Name = value; OnPropertyChanged(__.Name); } }
        }

        private Double _Value;
        /// <summary></summary>
        [DisplayName("Value")]
        [Description("")]
        [DataObjectField(false, false, true, 53)]
        [BindColumn(3, "Value", "", null, "float", 53, 0, false)]
        public virtual Double Value
        {
            get { return _Value; }
            set { if (OnPropertyChanging(__.Value, value)) { _Value = value; OnPropertyChanged(__.Value); } }
        }

        private Int32 _YearId;
        /// <summary></summary>
        [DisplayName("YearId")]
        [Description("")]
        [DataObjectField(false, false, true, 10)]
        [BindColumn(4, "YearId", "", null, "int", 10, 0, false)]
        public virtual Int32 YearId
        {
            get { return _YearId; }
            set { if (OnPropertyChanging(__.YearId, value)) { _YearId = value; OnPropertyChanged(__.YearId); } }
        }

        private Int32 _SubjectId;
        /// <summary></summary>
        [DisplayName("SubjectId")]
        [Description("")]
        [DataObjectField(false, false, true, 10)]
        [BindColumn(5, "SubjectId", "", null, "int", 10, 0, false)]
        public virtual Int32 SubjectId
        {
            get { return _SubjectId; }
            set { if (OnPropertyChanging(__.SubjectId, value)) { _SubjectId = value; OnPropertyChanged(__.SubjectId); } }
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
                    case __.Value : return _Value;
                    case __.YearId : return _YearId;
                    case __.SubjectId : return _SubjectId;
                    default: return base[name];
                }
            }
            set
            {
                switch (name)
                {
                    case __.id : _id = Convert.ToInt32(value); break;
                    case __.Name : _Name = Convert.ToString(value); break;
                    case __.Value : _Value = Convert.ToDouble(value); break;
                    case __.YearId : _YearId = Convert.ToInt32(value); break;
                    case __.SubjectId : _SubjectId = Convert.ToInt32(value); break;
                    default: base[name] = value; break;
                }
            }
        }
        #endregion

        #region 字段名
        /// <summary>取得字段信息的快捷方式</summary>
        public partial class _
        {
            ///<summary></summary>
            public static readonly Field id = FindByName(__.id);

            ///<summary></summary>
            public static readonly Field Name = FindByName(__.Name);

            ///<summary></summary>
            public static readonly Field Value = FindByName(__.Value);

            ///<summary></summary>
            public static readonly Field YearId = FindByName(__.YearId);

            ///<summary></summary>
            public static readonly Field SubjectId = FindByName(__.SubjectId);

            static Field FindByName(String name) { return Meta.Table.FindByName(name); }
        }

        /// <summary>取得字段名称的快捷方式</summary>
        partial class __
        {
            ///<summary></summary>
            public const String id = "id";

            ///<summary></summary>
            public const String Name = "Name";

            ///<summary></summary>
            public const String Value = "Value";

            ///<summary></summary>
            public const String YearId = "YearId";

            ///<summary></summary>
            public const String SubjectId = "SubjectId";

        }
        #endregion
    }

    /// <summary>接口</summary>
    public partial interface IIndicator
    {
        #region 属性
        /// <summary></summary>
        Int32 id { get; set; }

        /// <summary></summary>
        String Name { get; set; }

        /// <summary></summary>
        Double Value { get; set; }

        /// <summary></summary>
        Int32 YearId { get; set; }

        /// <summary></summary>
        Int32 SubjectId { get; set; }
        #endregion

        #region 获取/设置 字段值
        /// <summary>获取/设置 字段值。</summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        Object this[String name] { get; set; }
        #endregion
    }
}