/*
 * XCoder v6.1.5367.21625
 * 作者：Administrator/SDWM-20140605GJ
 * 时间：2014-11-23 12:40:48
 * 版权：版权所有 (C) 新生命开发团队 2002~2014
*/
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Xml.Serialization;
using XCode;
using XCode.Configuration;
using XCode.DataAccessLayer;

namespace Rselect
{
    /// <summary>Year</summary>
    /// <remarks></remarks>
    [Serializable]
    [DataObject]
    [Description("")]
    [BindIndex("PK_Year", true, "id")]
    [BindRelation("id", true, "Indicator", "YearId")]
    [BindTable("Year", Description = "", ConnName = "Reslect", DbType = DatabaseType.SqlServer)]
    public partial class Year : IYear
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
        [DataObjectField(false, false, true, 50)]
        [BindColumn(2, "Name", "", null, "nvarchar(50)", 0, 0, true)]
        public virtual String Name
        {
            get { return _Name; }
            set { if (OnPropertyChanging(__.Name, value)) { _Name = value; OnPropertyChanged(__.Name); } }
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
                    case __.id: return _id;
                    case __.Name: return _Name;
                    default: return base[name];
                }
            }
            set
            {
                switch (name)
                {
                    case __.id: _id = Convert.ToInt32(value); break;
                    case __.Name: _Name = Convert.ToString(value); break;
                    default: base[name] = value; break;
                }
            }
        }
        #endregion

        #region 字段名
        /// <summary>取得Year字段信息的快捷方式</summary>
        public partial class _
        {
            ///<summary></summary>
            public static readonly Field id = FindByName(__.id);

            ///<summary></summary>
            public static readonly Field Name = FindByName(__.Name);

            static Field FindByName(String name) { return Meta.Table.FindByName(name); }
        }

        /// <summary>取得Year字段名称的快捷方式</summary>
        partial class __
        {
            ///<summary></summary>
            public const String id = "id";

            ///<summary></summary>
            public const String Name = "Name";

        }
        #endregion
    }

    /// <summary>Year接口</summary>
    /// <remarks></remarks>
    public partial interface IYear
    {
        #region 属性
        /// <summary></summary>
        Int32 id { get; set; }

        /// <summary></summary>
        String Name { get; set; }
        #endregion

        #region 获取/设置 字段值
        /// <summary>获取/设置 字段值。</summary>
        /// <param name="name">字段名</param>
        /// <returns></returns>
        Object this[String name] { get; set; }
        #endregion
    }
}