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
    [BindTable("DomainSubjectIndicator", Description = "", ConnName = "Rselect", DbType = DatabaseType.SqlServer, IsView = true)]
    public partial class DomainSubjectIndicator : IDomainSubjectIndicator
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

        private String _Indicator;
        /// <summary></summary>
        [DisplayName("Indicator")]
        [Description("")]
        [DataObjectField(false, false, true, 50)]
        [BindColumn(3, "Indicator", "", null, "nvarchar(50)", 0, 0, true)]
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
        [BindColumn(4, "Value", "", null, "float", 53, 0, false)]
        public virtual Double Value
        {
            get { return _Value; }
            set { if (OnPropertyChanging(__.Value, value)) { _Value = value; OnPropertyChanged(__.Value); } }
        }

        private String _Years;
        /// <summary></summary>
        [DisplayName("Years")]
        [Description("")]
        [DataObjectField(false, false, true, 50)]
        [BindColumn(5, "Years", "", null, "nvarchar(50)", 0, 0, true)]
        public virtual String Years
        {
            get { return _Years; }
            set { if (OnPropertyChanging(__.Years, value)) { _Years = value; OnPropertyChanged(__.Years); } }
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
                    case __.Indicator : return _Indicator;
                    case __.Value : return _Value;
                    case __.Years : return _Years;
                    default: return base[name];
                }
            }
            set
            {
                switch (name)
                {
                    case __.Domain : _Domain = Convert.ToString(value); break;
                    case __.Subject : _Subject = Convert.ToString(value); break;
                    case __.Indicator : _Indicator = Convert.ToString(value); break;
                    case __.Value : _Value = Convert.ToDouble(value); break;
                    case __.Years : _Years = Convert.ToString(value); break;
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
            public static readonly Field Indicator = FindByName(__.Indicator);

            ///<summary></summary>
            public static readonly Field Value = FindByName(__.Value);

            ///<summary></summary>
            public static readonly Field Years = FindByName(__.Years);

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
            public const String Indicator = "Indicator";

            ///<summary></summary>
            public const String Value = "Value";

            ///<summary></summary>
            public const String Years = "Years";

        }
        #endregion
    }

    /// <summary>接口</summary>
    public partial interface IDomainSubjectIndicator
    {
        #region 属性
        /// <summary></summary>
        String Domain { get; set; }

        /// <summary></summary>
        String Subject { get; set; }

        /// <summary></summary>
        String Indicator { get; set; }

        /// <summary></summary>
        Double Value { get; set; }

        /// <summary></summary>
        String Years { get; set; }
        #endregion

        #region 获取/设置 字段值
        /// <summary>获取/设置 字段值。</summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        Object this[String name] { get; set; }
        #endregion
    }
}