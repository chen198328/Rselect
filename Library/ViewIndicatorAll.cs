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
    [BindIndex("PK_ViewIndicatorAll_IndicatorName", false, "IndicatorName")]
    [BindRelation("IndicatorName", false, "Indicator", "Name")]
    [BindTable("ViewIndicatorAll", Description = "", ConnName = "Rselect", DbType = DatabaseType.SqlServer, IsView = true)]
    public partial class ViewIndicatorAll : IViewIndicatorAll
    {
        #region 属性
        private String _Domain;
        /// <summary></summary>
        [DisplayName("Domain")]
        [Description("")]
        [DataObjectField(false, false, true, 100)]
        [BindColumn(1, "Domain", "", null, "nvarchar(100)", 0, 0, true)]
        public virtual String Domain
        {
            get { return _Domain; }
            set { if (OnPropertyChanging(__.Domain, value)) { _Domain = value; OnPropertyChanged(__.Domain); } }
        }

        private String _Subject;
        /// <summary></summary>
        [DisplayName("Subject")]
        [Description("")]
        [DataObjectField(false, false, true, 500)]
        [BindColumn(2, "Subject", "", null, "nvarchar(500)", 0, 0, true)]
        public virtual String Subject
        {
            get { return _Subject; }
            set { if (OnPropertyChanging(__.Subject, value)) { _Subject = value; OnPropertyChanged(__.Subject); } }
        }

        private String _IndicatorName;
        /// <summary></summary>
        [DisplayName("IndicatorName")]
        [Description("")]
        [DataObjectField(true, false, true, 50)]
        [BindColumn(3, "IndicatorName", "", null, "nvarchar(50)", 0, 0, true)]
        public virtual String IndicatorName
        {
            get { return _IndicatorName; }
            set { if (OnPropertyChanging(__.IndicatorName, value)) { _IndicatorName = value; OnPropertyChanged(__.IndicatorName); } }
        }

        private Double _Value;
        /// <summary></summary>
        [DisplayName("Value")]
        [Description("")]
        [DataObjectField(false, false, true, 53)]
        [BindColumn(4, "Value", "", null, "float", 53, 0, false)]
        public virtual Double Value
        {
            get { return _Value; }
            set { if (OnPropertyChanging(__.Value, value)) { _Value = value; OnPropertyChanged(__.Value); } }
        }

        private String _Year;
        /// <summary></summary>
        [DisplayName("Year")]
        [Description("")]
        [DataObjectField(false, false, true, 50)]
        [BindColumn(5, "Year", "", null, "nvarchar(50)", 0, 0, true)]
        public virtual String Year
        {
            get { return _Year; }
            set { if (OnPropertyChanging(__.Year, value)) { _Year = value; OnPropertyChanged(__.Year); } }
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
                    case __.Domain : return _Domain;
                    case __.Subject : return _Subject;
                    case __.IndicatorName : return _IndicatorName;
                    case __.Value : return _Value;
                    case __.Year : return _Year;
                    default: return base[name];
                }
            }
            set
            {
                switch (name)
                {
                    case __.Domain : _Domain = Convert.ToString(value); break;
                    case __.Subject : _Subject = Convert.ToString(value); break;
                    case __.IndicatorName : _IndicatorName = Convert.ToString(value); break;
                    case __.Value : _Value = Convert.ToDouble(value); break;
                    case __.Year : _Year = Convert.ToString(value); break;
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
            public static readonly Field Domain = FindByName(__.Domain);

            ///<summary></summary>
            public static readonly Field Subject = FindByName(__.Subject);

            ///<summary></summary>
            public static readonly Field IndicatorName = FindByName(__.IndicatorName);

            ///<summary></summary>
            public static readonly Field Value = FindByName(__.Value);

            ///<summary></summary>
            public static readonly Field Year = FindByName(__.Year);

            static Field FindByName(String name) { return Meta.Table.FindByName(name); }
        }

        /// <summary>取得字段名称的快捷方式</summary>
        partial class __
        {
            ///<summary></summary>
            public const String Domain = "Domain";

            ///<summary></summary>
            public const String Subject = "Subject";

            ///<summary></summary>
            public const String IndicatorName = "IndicatorName";

            ///<summary></summary>
            public const String Value = "Value";

            ///<summary></summary>
            public const String Year = "Year";

        }
        #endregion
    }

    /// <summary>接口</summary>
    public partial interface IViewIndicatorAll
    {
        #region 属性
        /// <summary></summary>
        String Domain { get; set; }

        /// <summary></summary>
        String Subject { get; set; }

        /// <summary></summary>
        String IndicatorName { get; set; }

        /// <summary></summary>
        Double Value { get; set; }

        /// <summary></summary>
        String Year { get; set; }
        #endregion

        #region 获取/设置 字段值
        /// <summary>获取/设置 字段值。</summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        Object this[String name] { get; set; }
        #endregion
    }
}